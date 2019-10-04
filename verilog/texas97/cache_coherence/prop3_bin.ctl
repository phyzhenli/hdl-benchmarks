##
###### Property for three processor verification
##
AG(pcacheA.bus_req = 1 -> AX(pcacheA.bus_ack = 1));
#Whenever processor A requests the bus, it gets the bus in the next clock cycle. 
# Property passes

AG(pcacheB.bus_req = 1 -> EF(pcacheB.bus_ack = 1));
AG(pcacheC.bus_req = 1 -> EF(pcacheC.bus_ack = 1));
# Whenever processor B or C requests the bus, it gets the bus only when Processor A 
# did not request the bus. No fairness is included in the arbiter. The fairness can
# be implemented as a Round Robin scheme
# Property passes

EF(is_sharedA=1);
AG((is_sharedA=1)->((is_sharedB=1) + (is_sharedC=1)));
EF(is_sharedB=1);
AG((is_sharedB=1)->((is_sharedA=1) + (is_sharedC=1)));
EF(is_sharedC=1);
AG((is_sharedC=1)->((is_sharedB=1) + (is_sharedA=1)));
#Will processor A ever go to shared state? If it does then either processor B has to 
#be in shared state. The same property can be applied to processor B.
# EF(is_shared..) passes, but the sharing property fails

AG((invalidate=1)->AX((pcacheA.state=00)+(pcacheB.state=00)+(pcacheC.state=00)));
#On an invalidate, in the next clock cycle either processor A
# or processor B has to be invalidated. 
####Above property should fail...and it DOES FAIL#####
#...as the invalidate could go to the memory

#
## Some of the properties that were not checked on the new design (in this directory)
## are given below
#

AG((pcacheA.state=01 * pcacheA.t_info_avail = 1) -> ((pcacheB.t_info_avail=1)+(pcacheC.t_info_avail=1)));
#If the processors A and B are in shared state, and if processor A claims the information is 
#available, then the information is also available in processor B or C or both.

AG(((pcacheA.state=01)*(pcacheA.hit=1))->((pcacheB.t_info_avail=1) + (pcacheC.t_info_avail=1)));
# A variant of the above property

AG(((pcacheA.write=1) && (pcacheB.t_info_avail=1))->AF(pcacheB.state = 10));
#If processor A gets an acknowledge on it's write request, then processor B 
#is invalidated on it's claim of information availability.

AG(((pcacheA.write=1)*(bus_ackA=1)*(pcacheA.hit=1)*(is_snoop=0))->(AX(pcacheA.state= 00))); 
# On an write hit signal, the processor should update it's state to Dirty

#AG(((shared_snoop=001)*(pcacheA.state=01)*(is_snoop=1)*(bus_ackA=0))->((pcacheA.t_info_avail=1)));
#On a Shared Hit Write generated by the processor B, with processor A in shared state, 
#the processor A should claim that the information is available.

AG(((pcacheA.state=00)*(is_snoop=1)*(pcacheA.info_avail=1)*(bus_reqA=0))->(pcacheA.next_state=01 + pcacheA.state=10));
# On processor A being in a Dirty state, a snoop would change its state to Shared or Dirty, provided the
# information is available and the request is not the native request

##
### There are other interesting properties like transition properties
### for each state and snoop transitions that can be verified
##
