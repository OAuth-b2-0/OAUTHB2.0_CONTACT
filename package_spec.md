# IN THIS FILE WE DISSCUES THE PACKAGE MECH...
we are using the bytes array to make outlife easy each package is of 16 bytes or 128 bits and
for request limiting we are using a leacking bucket mech for protecting contact.our contract use
four queues
-  #### cli_qu
-  #### use_qu
-  #### se_use_qu (only send the first data)
-  #### se_cli_qu (this dict with containt the response queue so to complete the process we have to use this so each system can work individually)

## Client Packets
we know that packet size is  17 bytes 

0xFFFF|- Identification Bytes

0xFFFF|0xFFFF|0xFFFF|0xFFFF|----|0xFFFF|0xFFFF|0xFFFF|0xFFFF|
0xFFFF|0xFFFF|0xFFFF|0xFFFF|----|0xFFFF|0xFFFF|0xFFFF|0xFFFF|

### types of packates (Identification Bytes 0xFFFF)
- 0x0001 : for request
- 0x0002 : for encripted packet
- 0x0003 : 


