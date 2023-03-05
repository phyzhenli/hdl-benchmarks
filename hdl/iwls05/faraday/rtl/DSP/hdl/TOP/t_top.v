






`include "x_def.v"


module TOP (/* -------- Inputs : --------- */
X_CLKI,
X_RSTn,
X_ICE_RSTn,
X_BMODE,
X_MMAP,
X_TMODE,
X_PLLsel,
X_GOICE,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQE1n,
X_IRQE0n,
X_BRn,
X_RD0,
X_RD1,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
X_ICK,
X_IMS,
`ifdef FD_DFT
X_DFT_en,
`endif

X_CLKO,
X_PWDACK,
X_BGn,
X_EA_U,
X_EA,
X_PMSn,
X_DMSn,
X_IOSn,
X_RDn,
X_WRn,
X_ECMSn,
X_ECMA_EN,
X_TD0,
X_TD1,
X_IACKn,
X_BMSn,


`ifdef FD_EVB
`else
XTAL,
`endif
X_ED,
X_SCLK0,
X_RFS0,
X_TFS0,
X_SCLK1,
X_RFS1,
X_TFS1,
X_IAD,
X_PIO,
X_ID
);

input [3:0] X_PLLsel;
input [1:0] X_TMODE;

input X_RSTn,
X_ICE_RSTn,
X_GOICE,
X_BMODE,
X_MMAP,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQE1n,
X_IRQE0n,
X_BRn,
X_RD0,
X_RD1,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
X_ICK,
X_IMS;

`ifdef FD_DFT
input X_DFT_en;
`endif

output [14:8] X_EA_U;
inout [7:0] X_EA;
output X_CLKO,
X_PWDACK,
X_BGn,
X_PMSn,
X_DMSn,
X_IOSn,
X_BMSn,
X_ECMSn,
X_ECMA_EN,
X_RDn,
X_WRn,
X_TD0,
X_TD1,
X_IACKn;

input X_CLKI;
`ifdef FD_EVB
`else
inout XTAL;
`endif

inout [15:0] X_ED,
X_IAD;
inout [7:0] X_PIO;
inout X_SCLK0, X_SCLK1,
X_RFS0, X_RFS1,
X_TFS0, X_TFS1,
X_ID;


wire [15:0] D_IAD_do,
IAD_do,
T_IAD,
ED_do,
D_IAD_di,
T_ED;
wire [14:0] EA_do;
wire [11:0] PIO_oe,
PIO_out,
T_PIOin;
wire [1:0] T_TMODE;
wire [3:0] T_PLLsel;
wire [7:0] T_EA;

wire [7:0] VC_SI, VC_SO;

wire [13:0] PMAinx;
wire [15:0] PM_rd0,
PM_rd1,
PM_rd2,
PM_rd3,
PM_rd4,
PM_rd5,
PM_rd6,
PM_rd7,
PM_wd;

wire [13:0] CMAinx;
wire [23:0] CM_rdm,
CM_rd0,
CM_rd1,
CM_rd2,
CM_rd3,
CM_rd4,
CM_rd5,
CM_rd6,
CM_rd7,
CM_wd;

wire [13:0] DMAinx;
wire [15:0] DM_rdm,
DM_rd0,
DM_rd1,
DM_rd2,
DM_rd3,
DM_rd4,
DM_rd5,
DM_rd6,
DM_rd7,
DM_wd;

wire T_CLKI_SRC;

PINs pins (/* ------- Inputs : --------- */
X_CLKI,
X_RSTn,
X_ICE_RSTn,
X_BMODE,
X_TMODE[1:0],
X_PLLsel[3:0],
X_MMAP,
X_GOICE,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQE1n,
X_IRQE0n,
X_BRn,
X_RD0,
X_RD1,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
X_ICK,
X_IMS,
`ifdef FD_DFT
X_DFT_en,
`endif

X_CLKO,
X_PWDACK,
X_BGn,
X_EA_U[14:8],
X_EA[7:0],
X_PMSn,
X_DMSn,
X_IOSn,
X_RDn,
X_WRn,
X_ECMSn,
X_ECMA_EN,
X_TD0,
X_TD1,
X_IACKn,
X_BMSn,


`ifdef FD_EVB
`else
XTAL,
`endif
X_ED[15:0],
X_SCLK0,
X_RFS0,
X_TFS0,
X_SCLK1,
X_RFS1,
X_TFS1,
X_IAD[15:0],
X_PIO[7:0],
X_ID,





D_RSTn,
T_ICE_RSTn,
T_BMODE,
T_MMAP,
T_TMODE,
D_CLKI_OSC,
T_PLLsel,
T_ED,
T_EA,
T_PWDn,
D_IRQ2n,
T_IRQ1n,
T_IRQ0n,
D_IRQL1n,
D_IRQE1n,
D_IRQE0n,
T_BRn,
D_RD0,
D_RD1,
T_SCLK0,
T_SCLK1,
T_RFS0,
T_TFS0,
T_RFS1,
T_TFS1,
T_IRDn,
T_IWRn,
T_ISn,
T_IAL,
D_IAD_di[15:0],
T_PIOin,
D_ICK,
T_IMS,
T_ID,
T_GOICE,
`ifdef FD_DFT
D_DFT_en,
`endif

CLKO,
PWDACK,
XTALoffn,
BGn,
EA_oe,
EA_do[14:0],
PMSn,
DMSn,
BMSn,
IOSn,
RDn,
WRn,
ED_oe_15,
ED_oe_14_8,
ED_oe_7_0,
ED_do[15:0],
ECMSn,
ECMA_EN,
D_TD0,
D_TD1,
SCLK0,
ISCLK0,
SCLK1,
ISCLK1,
RFS0,
IRFS0,
TFS0,
ITFS0,
RFS1,
IRFS1,
TFS1,
ITFS1,
IACKn,
IAD_oex,
D_IAD_do[15:0],
PIO_oe[11:0],
PIO_out[11:0],
IDo,
IDoe
);


MUX_IO mux_io(

D_CLKI_OSC,
D_RSTn,
D_ICK,
D_IRQ2n,
D_IRQL1n,
D_IRQE1n,
D_IRQE0n,
D_RD0,
D_RD1,
D_IAD_di,
`ifdef FD_DFT
D_DFT_en,
`endif

`ifdef FD_DFT
WP_SO,
TC_SO,
VC_SO,
`endif
TD0,
TD1,
IAD_oe,
IAD_do,


D_TD0,
D_TD1,
D_IAD_do,
IAD_oex,

T_CLKI_OSC,
T_RSTn,
T_ICK,
T_IRQ2n,
T_IRQL1n,
T_IRQE1n,
T_IRQE0n,
T_RD0,
T_RD1,
PM_bdry_sel,
T_IAD
`ifdef FD_DFT
,
TEST_CLK,
TEST_RST,
TCLK,
VC_SHIFT,
TC_UPDATE,
TC_SHIFT,
TC_SI,
WP_SI,
WP_CLK,
TC_RESET,
VC_SI
`endif
);


`ifdef FD_DFT
DSP_CORE_top
`else
DSP_CORE
`endif
dsp (
.T_RSTn(T_RSTn),
.T_ICE_RSTn(T_ICE_RSTn),
.T_BMODE(T_BMODE),
.T_MMAP(T_MMAP),
.T_TMODE(T_TMODE[1:0]),
.T_CLKI_PLL(T_CLKI_PLL),
.T_CLKI_OSC(T_CLKI_OSC),
.T_Sel_PLL(T_Sel_PLL),
`ifdef FD_FPGA
`else
.DSPCLK_insert_buf_i(DSPCLK_insert_buf_o),
`endif
.T_ED(T_ED[15:0]),
.T_EA(T_EA[7:0]),
.T_PWDn(T_PWDn),
.T_IRQ2n(T_IRQ2n),
.T_IRQ1n(T_IRQ1n),
.T_IRQ0n(T_IRQ0n),
.T_IRQL1n(T_IRQL1n),
.T_IRQE1n(T_IRQE1n),
.T_IRQE0n(T_IRQE0n),
.T_BRn(T_BRn),
.T_RD0(T_RD0),
.T_RD1(T_RD1),
.T_SCLK0(T_SCLK0),
.T_SCLK1(T_SCLK1),
.T_RFS0(T_RFS0),
.T_TFS0(T_TFS0),
.T_RFS1(T_RFS1),
.T_TFS1(T_TFS1),
.T_IRDn(T_IRDn),
.T_IWRn(T_IWRn),
.T_ISn(T_ISn),
.T_IAL(T_IAL),
.T_IAD(T_IAD),
.T_PIOin(T_PIOin[11:0]),
.T_ICK(T_ICK),
.T_IMS(T_IMS),
.T_ID(T_ID),
.T_GOICE(T_GOICE),
.PM_bdry_sel(PM_bdry_sel),
.PM_rd0(PM_rd0[15:0]),
.PM_rd1(PM_rd1[15:0]),
.PM_rd2(PM_rd2[15:0]),
.PM_rd3(PM_rd3[15:0]),
.PM_rd4(PM_rd4[15:0]),
.PM_rd5(PM_rd5[15:0]),
.PM_rd6(PM_rd6[15:0]),
.PM_rd7(PM_rd7[15:0]),
.DM_rdm(DM_rdm[15:0]),
.DM_rd0(DM_rd0[15:0]),
.DM_rd1(DM_rd1[15:0]),
.DM_rd2(DM_rd2[15:0]),
.DM_rd3(DM_rd3[15:0]),
.DM_rd4(DM_rd4[15:0]),
.DM_rd5(DM_rd5[15:0]),
.DM_rd6(DM_rd6[15:0]),
.DM_rd7(DM_rd7[15:0]),
.CM_rdm(CM_rdm[23:0]),
.CM_rd0(CM_rd0[23:0]),
.CM_rd1(CM_rd1[23:0]),
.CM_rd2(CM_rd2[23:0]),
.CM_rd3(CM_rd3[23:0]),
.CM_rd4(CM_rd4[23:0]),
.CM_rd5(CM_rd5[23:0]),
.CM_rd6(CM_rd6[23:0]),
.CM_rd7(CM_rd7[23:0]),
`ifdef FD_DFT
.VC_SI(VC_SI[7:0]),
.TCLK(TCLK),
.TC_UPDATE(TC_UPDATE),
.TC_SHIFT(TC_SHIFT),
.TC_RESET(TC_RESET),
.VC_SHIFT(VC_SHIFT),
.TC_SI(TC_SI),
.TEST_CLK(TEST_CLK),
.TEST_RST(TEST_RST),
.WP_SI(WP_SI),
.WP_CLK(WP_CLK),
`endif

`ifdef FD_FPGA
`else
.DSPCLK_insert_buf_o(DSPCLK_insert_buf_o),
`endif
.DSPCLK_cm0(DSPCLK_cm0),
.DSPCLK_cm1(DSPCLK_cm1),
.DSPCLK_cm2(DSPCLK_cm2),
.DSPCLK_pm0(DSPCLK_pm0),
.DSPCLK_pm1(DSPCLK_pm1),
.DSPCLK_pm2(DSPCLK_pm2),
.DSPCLK_dm0(DSPCLK_dm0),
.DSPCLK_dm1(DSPCLK_dm1),
.DSPCLK_dm2(DSPCLK_dm2),
.CLKO(CLKO),
.PWDACK(PWDACK),
.XTALoffn(XTALoffn),
.BGn(BGn),
.EA_oe(EA_oe),
.EA_do(EA_do[14:0]),
.PMSn(PMSn),
.DMSn(DMSn),
.BMSn(BMSn),
.IOSn(IOSn),
.CMSn(CMSn),
.RDn(RDn),
.WRn(WRn),
.ED_oe_15(ED_oe_15),
.ED_oe_14_8(ED_oe_14_8),
.ED_oe_7_0(ED_oe_7_0),
.ED_do(ED_do[15:0]),
.ECMSn(ECMSn),
.ECMA_EN(ECMA_EN),
.TD0(TD0),
.TD1(TD1),
.SCLK0(SCLK0),
.ISCLK0(ISCLK0),
.SCLK1(SCLK1),
.ISCLK1(ISCLK1),
.RFS0(RFS0),
.IRFS0(IRFS0),
.TFS0(TFS0),
.ITFS0(ITFS0),
.RFS1(RFS1),
.IRFS1(IRFS1),
.TFS1(TFS1),
.ITFS1(ITFS1),
.IACKn(IACKn),
.IAD_oe(IAD_oe),
.IAD_do(IAD_do[15:0]),
.PIO_oe(PIO_oe[11:0]),
.PIO_out(PIO_out[11:0]),
.IDo(IDo),
.IDoe(IDoe),
.PMo_cs0(PMo_cs0),
.PMo_cs1(PMo_cs1),
.PMo_cs2(PMo_cs2),
.PMo_cs3(PMo_cs3),
.PMo_cs4(PMo_cs4),
.PMo_cs5(PMo_cs5),
.PMo_cs6(PMo_cs6),
.PMo_cs7(PMo_cs7),
.PMo_web(PMo_web),
.PMo_oe0(PMo_oe0),
.PMo_oe1(PMo_oe1),
.PMo_oe2(PMo_oe2),
.PMo_oe3(PMo_oe3),
.PMo_oe4(PMo_oe4),
.PMo_oe5(PMo_oe5),
.PMo_oe6(PMo_oe6),
.PMo_oe7(PMo_oe7),
.PM_wd(PM_wd[15:0]),
.PMAinx(PMAinx[13:0]),
.DM_cs(DM_cs),
.DMo_cs0(DMo_cs0),
.DMo_cs1(DMo_cs1),
.DMo_cs2(DMo_cs2),
.DMo_cs3(DMo_cs3),
.DMo_cs4(DMo_cs4),
.DMo_cs5(DMo_cs5),
.DMo_cs6(DMo_cs6),
.DMo_cs7(DMo_cs7),
.DMo_web(DMo_web),
.DM_oe(DM_oe),
.DMo_oe0(DMo_oe0),
.DMo_oe1(DMo_oe1),
.DMo_oe2(DMo_oe2),
.DMo_oe3(DMo_oe3),
.DMo_oe4(DMo_oe4),
.DMo_oe5(DMo_oe5),
.DMo_oe6(DMo_oe6),
.DMo_oe7(DMo_oe7),
.DM_wd(DM_wd[15:0]),
.DMAinx(DMAinx[13:0]),
.CM_cs(CM_cs),
.CMo_cs0(CMo_cs0),
.CMo_cs1(CMo_cs1),
.CMo_cs2(CMo_cs2),
.CMo_cs3(CMo_cs3),
.CMo_cs4(CMo_cs4),
.CMo_cs5(CMo_cs5),
.CMo_cs6(CMo_cs6),
.CMo_cs7(CMo_cs7),
.CM_web(CM_web),
.CM_oe(CM_oe),
.CMo_oe0(CMo_oe0),
.CMo_oe1(CMo_oe1),
.CMo_oe2(CMo_oe2),
.CMo_oe3(CMo_oe3),
.CMo_oe4(CMo_oe4),
.CMo_oe5(CMo_oe5),
.CMo_oe6(CMo_oe6),
.CMo_oe7(CMo_oe7),
.CM_wd(CM_wd[23:0]),
.CMAinx(CMAinx[13:0])
`ifdef FD_DFT
,
.VC_SO(VC_SO[7:0]),
.WP_SO(WP_SO),
.TC_SO(TC_SO)
`endif
);




`ifdef FD_EVB
`else
PLL pll (
.T_PLLsel(T_PLLsel[0]),
.CLKI(T_CLKI_OSC),
.CLKO(T_CLKI_PLL),
.PDN(XTALoffn),
.Sel_PLL(T_Sel_PLL)
);
`endif

`ifdef FD_EVB

CM8K
cmm (.addr(CMAinx[12:0]),
.wd(CM_wd[23:0]),
.cs(CM_cs),
.oe(1'b1),
.rd(CM_rdm[23:0]),
.web(CM_web),
.clk(DSPCLK_cm0)
);


CMo4K
cm0 (.addr(CMAinx[11:0]),
.wd(CM_wd[23:0]),
.cs(CMo_cs0),
.oe(1'b1),
.rd(CM_rd0[23:0]),
.web(CM_web),
.clk(DSPCLK_cm0)
);

CMo4K
cm1 (.addr(CMAinx[11:0]),
.wd(CM_wd[23:0]),
.cs(CMo_cs1),
.oe(1'b1),
.rd(CM_rd1[23:0]),
.web(CM_web),
.clk(DSPCLK_cm1)
);

CMo4K
cm2 (.addr(CMAinx[11:0]),
.wd(CM_wd[23:0]),
.cs(CMo_cs2),
.oe(1'b1),
.rd(CM_rd2[23:0]),
.web(CM_web),
.clk(DSPCLK_cm1)
);

CMo4K
cm3 (.addr(CMAinx[11:0]),
.wd(CM_wd[23:0]),
.cs(CMo_cs3),
.oe(1'b1),
.rd(CM_rd3[23:0]),
.web(CM_web),
.clk(DSPCLK_cm2)
);


PMo4K
pm0 (.addr(PMAinx[11:0]),
.wd(PM_wd[15:0]),
.cs(PMo_cs0),
.oe(1'b1),
.rd(PM_rd0[15:0]),
.web(PMo_web),
.clk(DSPCLK_pm0)
);

PMo4K
pm1 (.addr(PMAinx[11:0]),
.wd(PM_wd[15:0]),
.cs(PMo_cs1),
.oe(1'b1),
.rd(PM_rd1[15:0]),
.web(PMo_web),
.clk(DSPCLK_pm1)
);

DMo8K
dm0 (.addr(DMAinx[12:0]),
.wd(DM_wd[15:0]),
.cs(DMo_cs0),
.oe(1'b1),
.rd(DM_rd0[15:0]),
.web(DMo_web),
.clk(DSPCLK_dm0)
);
`endif


`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm0 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd0[0]),
.DO1(PM_rd0[1]),
.DO2(PM_rd0[2]),
.DO3(PM_rd0[3]),
.DO4(PM_rd0[4]),
.DO5(PM_rd0[5]),
.DO6(PM_rd0[6]),
.DO7(PM_rd0[7]),
.DO8(PM_rd0[8]),
.DO9(PM_rd0[9]),
.DO10(PM_rd0[10]),
.DO11(PM_rd0[11]),
.DO12(PM_rd0[12]),
.DO13(PM_rd0[13]),
.DO14(PM_rd0[14]),
.DO15(PM_rd0[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm0),
.WEB(PMo_web),
.CS(PMo_cs0),
.OE(1'b1)
);


`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm1 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd1[0]),
.DO1(PM_rd1[1]),
.DO2(PM_rd1[2]),
.DO3(PM_rd1[3]),
.DO4(PM_rd1[4]),
.DO5(PM_rd1[5]),
.DO6(PM_rd1[6]),
.DO7(PM_rd1[7]),
.DO8(PM_rd1[8]),
.DO9(PM_rd1[9]),
.DO10(PM_rd1[10]),
.DO11(PM_rd1[11]),
.DO12(PM_rd1[12]),
.DO13(PM_rd1[13]),
.DO14(PM_rd1[14]),
.DO15(PM_rd1[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm0),
.WEB(PMo_web),
.CS(PMo_cs1),
.OE(PMo_oe1)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm2 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd2[0]),
.DO1(PM_rd2[1]),
.DO2(PM_rd2[2]),
.DO3(PM_rd2[3]),
.DO4(PM_rd2[4]),
.DO5(PM_rd2[5]),
.DO6(PM_rd2[6]),
.DO7(PM_rd2[7]),
.DO8(PM_rd2[8]),
.DO9(PM_rd2[9]),
.DO10(PM_rd2[10]),
.DO11(PM_rd2[11]),
.DO12(PM_rd2[12]),
.DO13(PM_rd2[13]),
.DO14(PM_rd2[14]),
.DO15(PM_rd2[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm0),
.WEB(PMo_web),
.CS(PMo_cs2),
.OE(PMo_oe2)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm3 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd3[0]),
.DO1(PM_rd3[1]),
.DO2(PM_rd3[2]),
.DO3(PM_rd3[3]),
.DO4(PM_rd3[4]),
.DO5(PM_rd3[5]),
.DO6(PM_rd3[6]),
.DO7(PM_rd3[7]),
.DO8(PM_rd3[8]),
.DO9(PM_rd3[9]),
.DO10(PM_rd3[10]),
.DO11(PM_rd3[11]),
.DO12(PM_rd3[12]),
.DO13(PM_rd3[13]),
.DO14(PM_rd3[14]),
.DO15(PM_rd3[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm1),
.WEB(PMo_web),
.CS(PMo_cs3),
.OE(PMo_oe3)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm4 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd4[0]),
.DO1(PM_rd4[1]),
.DO2(PM_rd4[2]),
.DO3(PM_rd4[3]),
.DO4(PM_rd4[4]),
.DO5(PM_rd4[5]),
.DO6(PM_rd4[6]),
.DO7(PM_rd4[7]),
.DO8(PM_rd4[8]),
.DO9(PM_rd4[9]),
.DO10(PM_rd4[10]),
.DO11(PM_rd4[11]),
.DO12(PM_rd4[12]),
.DO13(PM_rd4[13]),
.DO14(PM_rd4[14]),
.DO15(PM_rd4[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm1),
.WEB(PMo_web),
.CS(PMo_cs4),
.OE(PMo_oe4)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm5 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd5[0]),
.DO1(PM_rd5[1]),
.DO2(PM_rd5[2]),
.DO3(PM_rd5[3]),
.DO4(PM_rd5[4]),
.DO5(PM_rd5[5]),
.DO6(PM_rd5[6]),
.DO7(PM_rd5[7]),
.DO8(PM_rd5[8]),
.DO9(PM_rd5[9]),
.DO10(PM_rd5[10]),
.DO11(PM_rd5[11]),
.DO12(PM_rd5[12]),
.DO13(PM_rd5[13]),
.DO14(PM_rd5[14]),
.DO15(PM_rd5[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm1),
.WEB(PMo_web),
.CS(PMo_cs5),
.OE(PMo_oe5)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm6 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd6[0]),
.DO1(PM_rd6[1]),
.DO2(PM_rd6[2]),
.DO3(PM_rd6[3]),
.DO4(PM_rd6[4]),
.DO5(PM_rd6[5]),
.DO6(PM_rd6[6]),
.DO7(PM_rd6[7]),
.DO8(PM_rd6[8]),
.DO9(PM_rd6[9]),
.DO10(PM_rd6[10]),
.DO11(PM_rd6[11]),
.DO12(PM_rd6[12]),
.DO13(PM_rd6[13]),
.DO14(PM_rd6[14]),
.DO15(PM_rd6[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm2),
.WEB(PMo_web),
.CS(PMo_cs6),
.OE(PMo_oe6)
);

`ifdef FD_PM8K
SU210010
`else
SU208010
`endif
pm7 (.A0(PMAinx[0]),
.A1(PMAinx[1]),
.A2(PMAinx[2]),
.A3(PMAinx[3]),
.A4(PMAinx[4]),
.A5(PMAinx[5]),
.A6(PMAinx[6]),
.A7(PMAinx[7]),
.A8(PMAinx[8]),
.A9(PMAinx[9]),
.A10(PMAinx[10]),
.A11(PMAinx[11]),
`ifdef FD_PM8K
.A12(PMAinx[12]),
`endif
.DO0(PM_rd7[0]),
.DO1(PM_rd7[1]),
.DO2(PM_rd7[2]),
.DO3(PM_rd7[3]),
.DO4(PM_rd7[4]),
.DO5(PM_rd7[5]),
.DO6(PM_rd7[6]),
.DO7(PM_rd7[7]),
.DO8(PM_rd7[8]),
.DO9(PM_rd7[9]),
.DO10(PM_rd7[10]),
.DO11(PM_rd7[11]),
.DO12(PM_rd7[12]),
.DO13(PM_rd7[13]),
.DO14(PM_rd7[14]),
.DO15(PM_rd7[15]),
.DI0(PM_wd[0]),
.DI1(PM_wd[1]),
.DI2(PM_wd[2]),
.DI3(PM_wd[3]),
.DI4(PM_wd[4]),
.DI5(PM_wd[5]),
.DI6(PM_wd[6]),
.DI7(PM_wd[7]),
.DI8(PM_wd[8]),
.DI9(PM_wd[9]),
.DI10(PM_wd[10]),
.DI11(PM_wd[11]),
.DI12(PM_wd[12]),
.DI13(PM_wd[13]),
.DI14(PM_wd[14]),
.DI15(PM_wd[15]),
.CK(DSPCLK_pm2),
.WEB(PMo_web),
.CS(PMo_cs7),
.OE(PMo_oe7)
);




`ifdef FD_PM8K
SU208018
`else
SU210018
`endif
cmm (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
`ifdef FD_PM8K
`else
.A12(CMAinx[12]),
`endif
.DO0(CM_rdm[0]),
.DO1(CM_rdm[1]),
.DO2(CM_rdm[2]),
.DO3(CM_rdm[3]),
.DO4(CM_rdm[4]),
.DO5(CM_rdm[5]),
.DO6(CM_rdm[6]),
.DO7(CM_rdm[7]),
.DO8(CM_rdm[8]),
.DO9(CM_rdm[9]),
.DO10(CM_rdm[10]),
.DO11(CM_rdm[11]),
.DO12(CM_rdm[12]),
.DO13(CM_rdm[13]),
.DO14(CM_rdm[14]),
.DO15(CM_rdm[15]),
.DO16(CM_rdm[16]),
.DO17(CM_rdm[17]),
.DO18(CM_rdm[18]),
.DO19(CM_rdm[19]),
.DO20(CM_rdm[20]),
.DO21(CM_rdm[21]),
.DO22(CM_rdm[22]),
.DO23(CM_rdm[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm0),
.WEB(CM_web),
.CS(CM_cs),
.OE(1'b1)
);


SU208018
cm0 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd0[0]),
.DO1(CM_rd0[1]),
.DO2(CM_rd0[2]),
.DO3(CM_rd0[3]),
.DO4(CM_rd0[4]),
.DO5(CM_rd0[5]),
.DO6(CM_rd0[6]),
.DO7(CM_rd0[7]),
.DO8(CM_rd0[8]),
.DO9(CM_rd0[9]),
.DO10(CM_rd0[10]),
.DO11(CM_rd0[11]),
.DO12(CM_rd0[12]),
.DO13(CM_rd0[13]),
.DO14(CM_rd0[14]),
.DO15(CM_rd0[15]),
.DO16(CM_rd0[16]),
.DO17(CM_rd0[17]),
.DO18(CM_rd0[18]),
.DO19(CM_rd0[19]),
.DO20(CM_rd0[20]),
.DO21(CM_rd0[21]),
.DO22(CM_rd0[22]),
.DO23(CM_rd0[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm0),
.WEB(CM_web),
.CS(CMo_cs0),
.OE(CMo_oe0)
);

SU208018
cm1 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd1[0]),
.DO1(CM_rd1[1]),
.DO2(CM_rd1[2]),
.DO3(CM_rd1[3]),
.DO4(CM_rd1[4]),
.DO5(CM_rd1[5]),
.DO6(CM_rd1[6]),
.DO7(CM_rd1[7]),
.DO8(CM_rd1[8]),
.DO9(CM_rd1[9]),
.DO10(CM_rd1[10]),
.DO11(CM_rd1[11]),
.DO12(CM_rd1[12]),
.DO13(CM_rd1[13]),
.DO14(CM_rd1[14]),
.DO15(CM_rd1[15]),
.DO16(CM_rd1[16]),
.DO17(CM_rd1[17]),
.DO18(CM_rd1[18]),
.DO19(CM_rd1[19]),
.DO20(CM_rd1[20]),
.DO21(CM_rd1[21]),
.DO22(CM_rd1[22]),
.DO23(CM_rd1[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm0),
.WEB(CM_web),
.CS(CMo_cs1),
.OE(CMo_oe1)
);

SU208018
cm2 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd2[0]),
.DO1(CM_rd2[1]),
.DO2(CM_rd2[2]),
.DO3(CM_rd2[3]),
.DO4(CM_rd2[4]),
.DO5(CM_rd2[5]),
.DO6(CM_rd2[6]),
.DO7(CM_rd2[7]),
.DO8(CM_rd2[8]),
.DO9(CM_rd2[9]),
.DO10(CM_rd2[10]),
.DO11(CM_rd2[11]),
.DO12(CM_rd2[12]),
.DO13(CM_rd2[13]),
.DO14(CM_rd2[14]),
.DO15(CM_rd2[15]),
.DO16(CM_rd2[16]),
.DO17(CM_rd2[17]),
.DO18(CM_rd2[18]),
.DO19(CM_rd2[19]),
.DO20(CM_rd2[20]),
.DO21(CM_rd2[21]),
.DO22(CM_rd2[22]),
.DO23(CM_rd2[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm1),
.WEB(CM_web),
.CS(CMo_cs2),
.OE(CMo_oe2)
);

SU208018
cm3 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd3[0]),
.DO1(CM_rd3[1]),
.DO2(CM_rd3[2]),
.DO3(CM_rd3[3]),
.DO4(CM_rd3[4]),
.DO5(CM_rd3[5]),
.DO6(CM_rd3[6]),
.DO7(CM_rd3[7]),
.DO8(CM_rd3[8]),
.DO9(CM_rd3[9]),
.DO10(CM_rd3[10]),
.DO11(CM_rd3[11]),
.DO12(CM_rd3[12]),
.DO13(CM_rd3[13]),
.DO14(CM_rd3[14]),
.DO15(CM_rd3[15]),
.DO16(CM_rd3[16]),
.DO17(CM_rd3[17]),
.DO18(CM_rd3[18]),
.DO19(CM_rd3[19]),
.DO20(CM_rd3[20]),
.DO21(CM_rd3[21]),
.DO22(CM_rd3[22]),
.DO23(CM_rd3[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm1),
.WEB(CM_web),
.CS(CMo_cs3),
.OE(CMo_oe3)
);

SU208018
cm4 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd4[0]),
.DO1(CM_rd4[1]),
.DO2(CM_rd4[2]),
.DO3(CM_rd4[3]),
.DO4(CM_rd4[4]),
.DO5(CM_rd4[5]),
.DO6(CM_rd4[6]),
.DO7(CM_rd4[7]),
.DO8(CM_rd4[8]),
.DO9(CM_rd4[9]),
.DO10(CM_rd4[10]),
.DO11(CM_rd4[11]),
.DO12(CM_rd4[12]),
.DO13(CM_rd4[13]),
.DO14(CM_rd4[14]),
.DO15(CM_rd4[15]),
.DO16(CM_rd4[16]),
.DO17(CM_rd4[17]),
.DO18(CM_rd4[18]),
.DO19(CM_rd4[19]),
.DO20(CM_rd4[20]),
.DO21(CM_rd4[21]),
.DO22(CM_rd4[22]),
.DO23(CM_rd4[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm1),
.WEB(CM_web),
.CS(CMo_cs4),
.OE(CMo_oe4)
);

SU208018
cm5 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd5[0]),
.DO1(CM_rd5[1]),
.DO2(CM_rd5[2]),
.DO3(CM_rd5[3]),
.DO4(CM_rd5[4]),
.DO5(CM_rd5[5]),
.DO6(CM_rd5[6]),
.DO7(CM_rd5[7]),
.DO8(CM_rd5[8]),
.DO9(CM_rd5[9]),
.DO10(CM_rd5[10]),
.DO11(CM_rd5[11]),
.DO12(CM_rd5[12]),
.DO13(CM_rd5[13]),
.DO14(CM_rd5[14]),
.DO15(CM_rd5[15]),
.DO16(CM_rd5[16]),
.DO17(CM_rd5[17]),
.DO18(CM_rd5[18]),
.DO19(CM_rd5[19]),
.DO20(CM_rd5[20]),
.DO21(CM_rd5[21]),
.DO22(CM_rd5[22]),
.DO23(CM_rd5[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm2),
.WEB(CM_web),
.CS(CMo_cs5),
.OE(CMo_oe5)
);

SU208018
cm6 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd6[0]),
.DO1(CM_rd6[1]),
.DO2(CM_rd6[2]),
.DO3(CM_rd6[3]),
.DO4(CM_rd6[4]),
.DO5(CM_rd6[5]),
.DO6(CM_rd6[6]),
.DO7(CM_rd6[7]),
.DO8(CM_rd6[8]),
.DO9(CM_rd6[9]),
.DO10(CM_rd6[10]),
.DO11(CM_rd6[11]),
.DO12(CM_rd6[12]),
.DO13(CM_rd6[13]),
.DO14(CM_rd6[14]),
.DO15(CM_rd6[15]),
.DO16(CM_rd6[16]),
.DO17(CM_rd6[17]),
.DO18(CM_rd6[18]),
.DO19(CM_rd6[19]),
.DO20(CM_rd6[20]),
.DO21(CM_rd6[21]),
.DO22(CM_rd6[22]),
.DO23(CM_rd6[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm2),
.WEB(CM_web),
.CS(CMo_cs6),
.OE(CMo_oe6)
);

SU208018
cm7 (.A0(CMAinx[0]),
.A1(CMAinx[1]),
.A2(CMAinx[2]),
.A3(CMAinx[3]),
.A4(CMAinx[4]),
.A5(CMAinx[5]),
.A6(CMAinx[6]),
.A7(CMAinx[7]),
.A8(CMAinx[8]),
.A9(CMAinx[9]),
.A10(CMAinx[10]),
.A11(CMAinx[11]),
.DO0(CM_rd7[0]),
.DO1(CM_rd7[1]),
.DO2(CM_rd7[2]),
.DO3(CM_rd7[3]),
.DO4(CM_rd7[4]),
.DO5(CM_rd7[5]),
.DO6(CM_rd7[6]),
.DO7(CM_rd7[7]),
.DO8(CM_rd7[8]),
.DO9(CM_rd7[9]),
.DO10(CM_rd7[10]),
.DO11(CM_rd7[11]),
.DO12(CM_rd7[12]),
.DO13(CM_rd7[13]),
.DO14(CM_rd7[14]),
.DO15(CM_rd7[15]),
.DO16(CM_rd7[16]),
.DO17(CM_rd7[17]),
.DO18(CM_rd7[18]),
.DO19(CM_rd7[19]),
.DO20(CM_rd7[20]),
.DO21(CM_rd7[21]),
.DO22(CM_rd7[22]),
.DO23(CM_rd7[23]),
.DI0(CM_wd[0]),
.DI1(CM_wd[1]),
.DI2(CM_wd[2]),
.DI3(CM_wd[3]),
.DI4(CM_wd[4]),
.DI5(CM_wd[5]),
.DI6(CM_wd[6]),
.DI7(CM_wd[7]),
.DI8(CM_wd[8]),
.DI9(CM_wd[9]),
.DI10(CM_wd[10]),
.DI11(CM_wd[11]),
.DI12(CM_wd[12]),
.DI13(CM_wd[13]),
.DI14(CM_wd[14]),
.DI15(CM_wd[15]),
.DI16(CM_wd[16]),
.DI17(CM_wd[17]),
.DI18(CM_wd[18]),
.DI19(CM_wd[19]),
.DI20(CM_wd[20]),
.DI21(CM_wd[21]),
.DI22(CM_wd[22]),
.DI23(CM_wd[23]),
.CK(DSPCLK_cm2),
.WEB(CM_web),
.CS(CMo_cs7),
.OE(CMo_oe7)
);




SU20E010
dmm (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rdm[0]),
.DO1(DM_rdm[1]),
.DO2(DM_rdm[2]),
.DO3(DM_rdm[3]),
.DO4(DM_rdm[4]),
.DO5(DM_rdm[5]),
.DO6(DM_rdm[6]),
.DO7(DM_rdm[7]),
.DO8(DM_rdm[8]),
.DO9(DM_rdm[9]),
.DO10(DM_rdm[10]),
.DO11(DM_rdm[11]),
.DO12(DM_rdm[12]),
.DO13(DM_rdm[13]),
.DO14(DM_rdm[14]),
.DO15(DM_rdm[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm0),
.WEB(DMo_web),
.CS(DM_cs),
.OE(DM_oe)
);


SU210010
dm0 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd0[0]),
.DO1(DM_rd0[1]),
.DO2(DM_rd0[2]),
.DO3(DM_rd0[3]),
.DO4(DM_rd0[4]),
.DO5(DM_rd0[5]),
.DO6(DM_rd0[6]),
.DO7(DM_rd0[7]),
.DO8(DM_rd0[8]),
.DO9(DM_rd0[9]),
.DO10(DM_rd0[10]),
.DO11(DM_rd0[11]),
.DO12(DM_rd0[12]),
.DO13(DM_rd0[13]),
.DO14(DM_rd0[14]),
.DO15(DM_rd0[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm0),
.WEB(DMo_web),
.CS(DMo_cs0),
.OE(1'b1)
);


SU210010
dm1 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd1[0]),
.DO1(DM_rd1[1]),
.DO2(DM_rd1[2]),
.DO3(DM_rd1[3]),
.DO4(DM_rd1[4]),
.DO5(DM_rd1[5]),
.DO6(DM_rd1[6]),
.DO7(DM_rd1[7]),
.DO8(DM_rd1[8]),
.DO9(DM_rd1[9]),
.DO10(DM_rd1[10]),
.DO11(DM_rd1[11]),
.DO12(DM_rd1[12]),
.DO13(DM_rd1[13]),
.DO14(DM_rd1[14]),
.DO15(DM_rd1[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm0),
.WEB(DMo_web),
.CS(DMo_cs1),
.OE(DMo_oe1)
);


SU210010
dm2 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd2[0]),
.DO1(DM_rd2[1]),
.DO2(DM_rd2[2]),
.DO3(DM_rd2[3]),
.DO4(DM_rd2[4]),
.DO5(DM_rd2[5]),
.DO6(DM_rd2[6]),
.DO7(DM_rd2[7]),
.DO8(DM_rd2[8]),
.DO9(DM_rd2[9]),
.DO10(DM_rd2[10]),
.DO11(DM_rd2[11]),
.DO12(DM_rd2[12]),
.DO13(DM_rd2[13]),
.DO14(DM_rd2[14]),
.DO15(DM_rd2[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm1),
.WEB(DMo_web),
.CS(DMo_cs2),
.OE(DMo_oe2)
);


SU210010
dm3 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd3[0]),
.DO1(DM_rd3[1]),
.DO2(DM_rd3[2]),
.DO3(DM_rd3[3]),
.DO4(DM_rd3[4]),
.DO5(DM_rd3[5]),
.DO6(DM_rd3[6]),
.DO7(DM_rd3[7]),
.DO8(DM_rd3[8]),
.DO9(DM_rd3[9]),
.DO10(DM_rd3[10]),
.DO11(DM_rd3[11]),
.DO12(DM_rd3[12]),
.DO13(DM_rd3[13]),
.DO14(DM_rd3[14]),
.DO15(DM_rd3[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm1),
.WEB(DMo_web),
.CS(DMo_cs3),
.OE(DMo_oe3)
);


SU210010
dm4 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd4[0]),
.DO1(DM_rd4[1]),
.DO2(DM_rd4[2]),
.DO3(DM_rd4[3]),
.DO4(DM_rd4[4]),
.DO5(DM_rd4[5]),
.DO6(DM_rd4[6]),
.DO7(DM_rd4[7]),
.DO8(DM_rd4[8]),
.DO9(DM_rd4[9]),
.DO10(DM_rd4[10]),
.DO11(DM_rd4[11]),
.DO12(DM_rd4[12]),
.DO13(DM_rd4[13]),
.DO14(DM_rd4[14]),
.DO15(DM_rd4[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm1),
.WEB(DMo_web),
.CS(DMo_cs4),
.OE(DMo_oe4)
);


SU210010
dm5 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd5[0]),
.DO1(DM_rd5[1]),
.DO2(DM_rd5[2]),
.DO3(DM_rd5[3]),
.DO4(DM_rd5[4]),
.DO5(DM_rd5[5]),
.DO6(DM_rd5[6]),
.DO7(DM_rd5[7]),
.DO8(DM_rd5[8]),
.DO9(DM_rd5[9]),
.DO10(DM_rd5[10]),
.DO11(DM_rd5[11]),
.DO12(DM_rd5[12]),
.DO13(DM_rd5[13]),
.DO14(DM_rd5[14]),
.DO15(DM_rd5[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm2),
.WEB(DMo_web),
.CS(DMo_cs5),
.OE(DMo_oe5)
);


SU210010
dm6 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd6[0]),
.DO1(DM_rd6[1]),
.DO2(DM_rd6[2]),
.DO3(DM_rd6[3]),
.DO4(DM_rd6[4]),
.DO5(DM_rd6[5]),
.DO6(DM_rd6[6]),
.DO7(DM_rd6[7]),
.DO8(DM_rd6[8]),
.DO9(DM_rd6[9]),
.DO10(DM_rd6[10]),
.DO11(DM_rd6[11]),
.DO12(DM_rd6[12]),
.DO13(DM_rd6[13]),
.DO14(DM_rd6[14]),
.DO15(DM_rd6[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm2),
.WEB(DMo_web),
.CS(DMo_cs6),
.OE(DMo_oe6)
);

SU210010
dm7 (.A0(DMAinx[0]),
.A1(DMAinx[1]),
.A2(DMAinx[2]),
.A3(DMAinx[3]),
.A4(DMAinx[4]),
.A5(DMAinx[5]),
.A6(DMAinx[6]),
.A7(DMAinx[7]),
.A8(DMAinx[8]),
.A9(DMAinx[9]),
.A10(DMAinx[10]),
.A11(DMAinx[11]),
.A12(DMAinx[12]),
.DO0(DM_rd7[0]),
.DO1(DM_rd7[1]),
.DO2(DM_rd7[2]),
.DO3(DM_rd7[3]),
.DO4(DM_rd7[4]),
.DO5(DM_rd7[5]),
.DO6(DM_rd7[6]),
.DO7(DM_rd7[7]),
.DO8(DM_rd7[8]),
.DO9(DM_rd7[9]),
.DO10(DM_rd7[10]),
.DO11(DM_rd7[11]),
.DO12(DM_rd7[12]),
.DO13(DM_rd7[13]),
.DO14(DM_rd7[14]),
.DO15(DM_rd7[15]),
.DI0(DM_wd[0]),
.DI1(DM_wd[1]),
.DI2(DM_wd[2]),
.DI3(DM_wd[3]),
.DI4(DM_wd[4]),
.DI5(DM_wd[5]),
.DI6(DM_wd[6]),
.DI7(DM_wd[7]),
.DI8(DM_wd[8]),
.DI9(DM_wd[9]),
.DI10(DM_wd[10]),
.DI11(DM_wd[11]),
.DI12(DM_wd[12]),
.DI13(DM_wd[13]),
.DI14(DM_wd[14]),
.DI15(DM_wd[15]),
.CK(DSPCLK_dm2),
.WEB(DMo_web),
.CS(DMo_cs7),
.OE(DMo_oe7)
);





endmodule

module PLL( T_PLLsel, CLKI, CLKO, PDN, Sel_PLL);

input T_PLLsel;
input CLKI;
output CLKO;
input PDN;
input Sel_PLL;

endmodule // PLL
