//*******************************************************************************
//  S Y N T H E Z I A B L E      S D R A M     C O N T R O L L E R    C O R E
//
//  This core adheres to the GNU Public License  
// 
//  This is a synthesizable Synchronous DRAM controller Core.  As it stands,
//  it is ready to work with 8Mbyte SDRAMs, organized as 2M x 32 at 100MHz
//  and 125MHz. For example: Samsung KM432S2030CT,  Fujitsu MB81F643242B.
//
//  The core has been carefully coded so as to be "platform-independent".  
//  It has been successfully compiled and simulated under three separate
//  FPGA/CPLD platforms:
//      Xilinx Foundation Base Express V2.1i
//      Altera Max+PlusII V9.21
//      Lattice ispExpert V7.0
//  
//  The interface to the host (i.e. microprocessor, DSP, etc) is synchronous
//  and supports ony one transfer at a time.  That is, burst-mode transfers
//  are not yet supported.  In may ways, the interface to this core is much
//  like that of a typical SRAM.  The hand-shaking between the host and the 
//  SDRAM core is done through the "sdram_busy_l" signal generated by the 
//  core.  Whenever this signal is active low, the host must hold the address,
//  data (if doing a write), size and the controls (cs, rd/wr).  
//
//  Connection Diagram:
//  SDRAM side:
//  sd_wr_l                     connect to -WR pin of SDRAM
//  sd_cs_l                     connect to -CS pin of SDRAM
//  sd_ras_l                    connect to -RAS pin of SDRAM
//  sd_cas_l                    connect to -CAS pin of SDRAM
//  sd_dqm[3:0]                 connect to the DQM3,DQM2,DQM1,DQM0 pins
//  sd_addx[10:0]               connect to the Address bus [10:0]
//  sd_data[31:0]               connect to the data bus [31:0]
//  sd_ba[1:0]                  connect to BA1, BA0 pins of SDRAM
//   
//  HOST side:
//  mp_addx[22:0]               connect to the address bus of the host. 
//                              23 bit address bus give access to 8Mbyte
//                              of the SDRAM, as byte, half-word (16bit)
//                              or word (32bit)
//  mp_data_in[31:0]            Unidirectional bus connected to the data out
//                              of the host. To use this, enable 
//                              "databus_is_unidirectional" in INC.H
//  mp_data_out[31:0]           Unidirectional bus connected to the data in 
//                              of the host.  To use this, enable
//                              "databus_is_unidirectional" in INC.H
//  mp_data[31:0]               Bi-directional bus connected to the host's
//                              data bus.  To use the bi-directionla bus,
//                              disable "databus_is_unidirectional" in INC.H
//  mp_rd_l                     Connect to the -RD output of the host
//  mp_wr_l                     Connect to the -WR output of the host
//  mp_cs_l                     Connect to the -CS of the host
//  mp_size[1:0]                Connect to the size output of the host
//                              if there is one.  When set to 0
//                              all trasnfers are 32 bits, when set to 1
//                              all transfers are 8 bits, and when set to
//                              2 all xfers are 16 bits.  If you want the
//                              data to be lower order aligned, turn on
//                              "align_data_bus" option in INC.H
//  sdram_busy_l                Connect this to the wait or hold equivalent
//                              input of the host.  The host, must hold the
//                              bus if it samples this signal as low.
//  sdram_mode_set_l            When a write occurs with this set low,
//                              the SDRAM's mode set register will be programmed
//                              with the data supplied on the data_bus[10:0].
//
//
//  Author:  Jeung Joon Lee  joon.lee@quantum.com,  cmosexod@ix.netcom.com
//  
//*******************************************************************************
//
//  Hierarchy:
//
//  SDRAM.V         Top Level Module
//  HOSTCONT.V      Controls the interfacing between the micro and the SDRAM
//  SDRAMCNT.V      This is the SDRAM controller.  All data passed to and from
//                  is with the HOSTCONT.
//  optional
//  MICRO.V         This is the built in SDRAM tester.  This module generates 
//                  a number of test logics which is used to test the SDRAM
//                  It is basically a Micro bus generator. 
//  
/*
*/ 


/*
** SELECT TEST TO PERFORM
** Select only one of the below comment
**
*/

// ***************************************************************
// This test does a one time  burst write, followed by a delay (enough to
// fit a few refresh cycles) then burst read of the same memory
// areas.  The burst reads are repeating.
// ***************************************************************
`define do_single_burst_write_read_test



//  C  O  M  M  O  N       S  T  U  F  F   
`define     HI                  1'b1
`define     LO                  1'b0

