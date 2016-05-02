
test.dxe:     file format elf32-bfin


Disassembly of section .text:

ffa00000 <start>:
ffa00000:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00000(-4194304) */
ffa00004:	08 e1 10 00 	P0.L = 0x10;		/* ( 16)	P0=0xffc00010(-4194288) */
ffa00008:	80 e1 00 03 	R0 = 0x300 (Z);		/*		R0=0x300(768) */
ffa0000c:	00 8a       	W[P0] = R0.L;
ffa0000e:	24 00       	SSYNC;
ffa00010:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00000(-4194304) */
ffa00014:	0a e1 10 0a 	P2.L = 0xa10;		/* (2576)	P2=0xffc00a10(-4191728) */
ffa00018:	10 91       	R0 = [P2];
ffa0001a:	c0 4a       	BITSET (R0, 0x18);		/* bit 24 */
ffa0001c:	10 93       	[P2] = R0;
ffa0001e:	24 00       	SSYNC;
ffa00020:	28 60       	R0 = 0x5 (X);		/*		R0=0x5(  5) */
ffa00022:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00010(-4194288) */
ffa00026:	08 e1 04 00 	P0.L = 0x4;		/* (  4)	P0=0xffc00004(-4194300) */
ffa0002a:	00 8a       	W[P0] = R0.L;
ffa0002c:	24 00       	SSYNC;
ffa0002e:	c0 60       	R0 = 0x18 (X);		/*		R0=0x18( 24) */
ffa00030:	82 c6 48 80 	R0 = R0 << 0x9;
ffa00034:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00036:	01 56       	R0 = R1 | R0;
ffa00038:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0003a:	82 c6 41 82 	R1 = R1 << 0x8;
ffa0003e:	01 56       	R0 = R1 | R0;
ffa00040:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00004(-4194300) */
ffa00044:	08 e1 00 00 	P0.L = 0x0;		/* (  0)	P0=0xffc00000(-4194304) */
ffa00048:	32 00       	CLI R2;
ffa0004a:	24 00       	SSYNC;
ffa0004c:	00 8a       	W[P0] = R0.L;
ffa0004e:	20 00       	IDLE;
ffa00050:	42 00       	STI R2;

ffa00052 <check_again>:
ffa00052:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00000(-4194304) */
ffa00056:	08 e1 0c 00 	P0.L = 0xc;		/* ( 12)	P0=0xffc0000c(-4194292) */
ffa0005a:	00 95       	R0 = W[P0] (Z);
ffa0005c:	28 49       	CC = BITTST (R0, 0x5);		/* bit  5 */
ffa0005e:	fa 13       	IF !CC JUMP 0xffa00052 <check_again>;
ffa00060:	08 e1 18 0a 	P0.L = 0xa18;		/* (2584)	P0=0xffc00a18(-4191720) */
ffa00064:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00a18(-4191720) */
ffa00068:	80 e1 d0 03 	R0 = 0x3d0 (Z);		/*		R0=0x3d0(976) */
ffa0006c:	00 8a       	W[P0] = R0.L;
ffa0006e:	24 00       	SSYNC;
ffa00070:	08 e1 14 0a 	P0.L = 0xa14;		/* (2580)	P0=0xffc00a14(-4191724) */
ffa00074:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00a14(-4191724) */
ffa00078:	98 60       	R0 = 0x13 (X);		/*		R0=0x13( 19) */
ffa0007a:	00 8a       	W[P0] = R0.L;
ffa0007c:	24 00       	SSYNC;
ffa0007e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00a10(-4191728) */
ffa00082:	0a e1 10 0a 	P2.L = 0xa10;		/* (2576)	P2=0xffc00a10(-4191728) */
ffa00086:	40 e1 b1 e0 	R0.H = 0xe0b1;		/* (-8015)	R0=0xe0b10013(-525271021) */
ffa0008a:	00 e1 49 11 	R0.L = 0x1149;		/* (4425)	R0=0xe0b11149(-525266615) */
ffa0008e:	10 93       	[P2] = R0;
ffa00090:	24 00       	SSYNC;
ffa00092:	00 00       	NOP;
ffa00094:	00 00       	NOP;
ffa00096:	8a e1 00 00 	P2 = 0x0 (Z);		/*		P2=0x0(  0) */
ffa0009a:	12 82       	R0.L = W[P2];
ffa0009c:	00 00       	NOP;
ffa0009e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa000a0:	30 3c       	CYCLES = R0;
ffa000a2:	38 3c       	CYCLES2 = R0;
ffa000a4:	90 61       	R0 = 0x32 (X);		/*		R0=0x32( 50) */
ffa000a6:	10 3e       	SYSCFG = R0;
ffa000a8:	24 00       	SSYNC;
ffa000aa:	08 e1 04 21 	P0.L = 0x2104;		/* (8452)	P0=0xffc02104(-4185852) */
ffa000ae:	48 e1 e0 ff 	P0.H = 0xffe0;		/* (-32)	P0=0xffe02104(-2088700) */
ffa000b2:	00 e1 8a 01 	R0.L = 0x18a;		/* (394)	R0=0x18a(394) */
ffa000b6:	40 e1 a0 ff 	R0.H = 0xffa0;		/* (-96)	R0=0xffa0018a <_isr_mstimer>(-6291062) */
ffa000ba:	00 e6 cb ff 	[P0 + -0xd4] = R0;
ffa000be:	00 91       	R0 = [P0];
ffa000c0:	60 4a       	BITSET (R0, 0xc);		/* bit 12 */
ffa000c2:	00 93       	[P0] = R0;
ffa000c4:	08 e1 50 01 	P0.L = 0x150;		/* (336)	P0=0xffe00150(-2096816) */
ffa000c8:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00150(-4193968) */
ffa000cc:	40 e1 55 55 	R0.H = 0x5555;		/* (21845)	R0=0x5555018a(1431634314) */
ffa000d0:	00 e1 55 55 	R0.L = 0x5555;		/* (21845)	R0=0x55555555(1431655765) */
ffa000d4:	00 93       	[P0] = R0;
ffa000d6:	08 e1 4c 01 	P0.L = 0x14c;		/* (332)	P0=0xffc0014c(-4193972) */
ffa000da:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc0014c(-4193972) */
ffa000de:	00 91       	R0 = [P0];
ffa000e0:	28 4a       	BITSET (R0, 0x5);		/* bit  5 */
ffa000e2:	00 93       	[P0] = R0;
ffa000e4:	80 e1 9f 90 	R0 = 0x909f (Z);		/*		R0=0x909f(37023) */
ffa000e8:	40 00       	STI R0;
ffa000ea:	9f 00       	RAISE 0xf;
ffa000ec:	08 e1 02 01 	P0.L = 0x102;		/* (258)	P0=0xffc00102(-4194046) */
ffa000f0:	48 e1 a0 ff 	P0.H = 0xffa0;		/* (-96)	P0=0xffa00102 <wait> */
ffa000f4:	09 e1 3c 20 	P1.L = 0x203c;		/* (8252)	P1=0x203c */
ffa000f8:	49 e1 e0 ff 	P1.H = 0xffe0;		/* (-32)	P1=0xffe0203c(-2088900) */
ffa000fc:	48 93       	[P1] = P0;
ffa000fe:	58 3e       	RETI = P0;
ffa00100:	11 00       	RTI;

ffa00102 <wait>:
ffa00102:	7b 01       	[--SP] = RETI;
ffa00104:	00 00       	NOP;
ffa00106:	9c 00       	RAISE 0xc;
ffa00108:	08 e1 40 07 	P0.L = 0x740;		/* (1856)	P0=0xffa00740 */
ffa0010c:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00740(-4192448) */
ffa00110:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00112:	00 97       	W[P0] = R0;
ffa00114:	08 e1 30 07 	P0.L = 0x730;		/* (1840)	P0=0xffc00730(-4192464) */
ffa00118:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00730(-4192464) */
ffa0011c:	00 91       	R0 = [P0];
ffa0011e:	21 e1 ff 00 	R1 = 0xff (X);		/*		R1=0xff(255) */
ffa00122:	08 56       	R0 = R0 | R1;
ffa00124:	00 97       	W[P0] = R0;
ffa00126:	08 e1 00 32 	P0.L = 0x3200;		/* (12800)	P0=0xffc03200(-4181504) */
ffa0012a:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc03200(-4181504) */
ffa0012e:	00 91       	R0 = [P0];
ffa00130:	81 e1 00 ff 	R1 = 0xff00 (Z);		/*		R1=0xff00(65280) */
ffa00134:	08 54       	R0 = R0 & R1;
ffa00136:	00 97       	W[P0] = R0;
ffa00138:	08 e1 40 15 	P0.L = 0x1540;		/* (5440)	P0=0xffc01540(-4188864) */
ffa0013c:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc01540(-4188864) */
ffa00140:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00142:	00 97       	W[P0] = R0;
ffa00144:	08 e1 30 15 	P0.L = 0x1530;		/* (5424)	P0=0xffc01530(-4188880) */
ffa00148:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc01530(-4188880) */
ffa0014c:	00 91       	R0 = [P0];
ffa0014e:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00150:	08 56       	R0 = R0 | R1;
ffa00152:	00 97       	W[P0] = R0;
ffa00154:	08 e1 04 32 	P0.L = 0x3204;		/* (12804)	P0=0xffc03204(-4181500) */
ffa00158:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc03204(-4181500) */
ffa0015c:	00 91       	R0 = [P0];
ffa0015e:	81 e1 fe ff 	R1 = 0xfffe (Z);		/*		R1=0xfffe(65534) */
ffa00162:	08 54       	R0 = R0 & R1;
ffa00164:	00 97       	W[P0] = R0;

ffa00166 <_test_loop>:
ffa00166:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc03204(-4181500) */
ffa0016a:	08 e1 0c 07 	P0.L = 0x70c;		/* (1804)	P0=0xffc0070c(-4192500) */
ffa0016e:	80 e1 ff 00 	R0 = 0xff (Z);		/*		R0=0xff(255) */
ffa00172:	00 8a       	W[P0] = R0.L;
ffa00174:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc0070c(-4192500) */
ffa00178:	08 e1 0c 15 	P0.L = 0x150c;		/* (5388)	P0=0xffc0150c(-4188916) */
ffa0017c:	80 e1 01 00 	R0 = 0x1 (Z);		/*		R0=0x1(  1) */
ffa00180:	00 8a       	W[P0] = R0.L;
ffa00182:	24 00       	SSYNC;
ffa00184:	6c 27       	JUMP.S 0xffa0105c <_main>;
ffa00186:	00 00       	NOP;
ffa00188:	ef 2f       	JUMP.S 0xffa00166 <_test_loop>;

ffa0018a <_isr_mstimer>:
ffa0018a:	66 01       	[--SP] = ASTAT;
ffa0018c:	fd 05       	[--SP] = (R7:7, P5:5);
ffa0018e:	0d e1 88 06 	P5.L = 0x688;		/* (1672)	P5=0x688 */
ffa00192:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00688(-4192632) */
ffa00196:	07 e1 00 00 	R7.L = 0x0;		/* (  0)	R7=0x0(  0) */
ffa0019a:	47 e1 02 00 	R7.H = 0x2;		/* (  2)	R7=0x20000(131072) */
ffa0019e:	2f 93       	[P5] = R7;
ffa001a0:	24 00       	SSYNC;
ffa001a2:	bd 05       	(R7:7, P5:5) = [SP++];
ffa001a4:	26 01       	ASTAT = [SP++];
ffa001a6:	11 00       	RTI;

ffa001a8 <_ustimer>:
ffa001a8:	86 31       	R0 = CYCLES;
ffa001aa:	8f 31       	R1 = CYCLES2;
ffa001ac:	82 c6 81 82 	R1 = R1 << 0x10;
ffa001b0:	82 c6 80 81 	R0 = R0 >> 0x10;
ffa001b4:	08 50       	R0 = R0 + R1;
ffa001b6:	10 00       	RTS;

ffa001b8 <_spi_delay>:
ffa001b8:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00000(-4194304) */
ffa001bc:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa001c0:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa001c4:	42 34       	I0 = P2;
ffa001c6:	00 00       	NOP;
ffa001c8:	20 9d       	R0.L = W[I0];
ffa001ca:	c0 42       	R0 = R0.L (Z);
ffa001cc:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa001ce:	fc 17       	IF !CC JUMP 0xffa001c6 <_spi_delay+0xe> (BP);
ffa001d0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa001d2:	0c 10       	IF !CC JUMP 0xffa001ea <_spi_delay+0x32>;
ffa001d4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa001d8:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa001dc:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa001de:	42 34       	I0 = P2;
ffa001e0:	00 00       	NOP;
ffa001e2:	20 9d       	R0.L = W[I0];
ffa001e4:	01 54       	R0 = R1 & R0;
ffa001e6:	00 0c       	CC = R0 == 0x0;
ffa001e8:	fc 1f       	IF CC JUMP 0xffa001e0 <_spi_delay+0x28> (BP);
ffa001ea:	01 e8 00 00 	UNLINK;
ffa001ee:	10 00       	RTS;

ffa001f0 <_spi_write_register>:
ffa001f0:	78 05       	[--SP] = (R7:7);
ffa001f2:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa001f6:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa001fa:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa001fe:	38 30       	R7 = R0;
ffa00200:	10 97       	W[P2] = R0;
ffa00202:	24 00       	SSYNC;
ffa00204:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa00208:	29 4a       	BITSET (R1, 0x5);		/* bit  5 */
ffa0020a:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa0020e:	49 43       	R1 = R1.B (Z);
ffa00210:	11 97       	W[P2] = R1;
ffa00212:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa00214:	42 34       	I0 = P2;
ffa00216:	00 00       	NOP;
ffa00218:	20 9d       	R0.L = W[I0];
ffa0021a:	c0 42       	R0 = R0.L (Z);
ffa0021c:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa0021e:	fc 17       	IF !CC JUMP 0xffa00216 <_spi_write_register+0x26> (BP);
ffa00220:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa00222:	0c 10       	IF !CC JUMP 0xffa0023a <_spi_write_register+0x4a>;
ffa00224:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa00228:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa0022c:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa0022e:	42 34       	I0 = P2;
ffa00230:	00 00       	NOP;
ffa00232:	20 9d       	R0.L = W[I0];
ffa00234:	01 54       	R0 = R1 & R0;
ffa00236:	00 0c       	CC = R0 == 0x0;
ffa00238:	fc 1f       	IF CC JUMP 0xffa00230 <_spi_write_register+0x40> (BP);
ffa0023a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa0023e:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa00242:	13 95       	R3 = W[P2] (Z);
ffa00244:	a2 6f       	P2 += -0xc;		/* (-12) */
ffa00246:	50 43       	R0 = R2.B (Z);
ffa00248:	10 97       	W[P2] = R0;
ffa0024a:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0024c:	42 34       	I0 = P2;
ffa0024e:	00 00       	NOP;
ffa00250:	20 9d       	R0.L = W[I0];
ffa00252:	c0 42       	R0 = R0.L (Z);
ffa00254:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa00256:	fc 17       	IF !CC JUMP 0xffa0024e <_spi_write_register+0x5e> (BP);
ffa00258:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0025a:	0c 10       	IF !CC JUMP 0xffa00272 <_spi_write_register+0x82>;
ffa0025c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa00260:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa00264:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00266:	42 34       	I0 = P2;
ffa00268:	00 00       	NOP;
ffa0026a:	20 9d       	R0.L = W[I0];
ffa0026c:	01 54       	R0 = R1 & R0;
ffa0026e:	00 0c       	CC = R0 == 0x0;
ffa00270:	fc 1f       	IF CC JUMP 0xffa00268 <_spi_write_register+0x78> (BP);
ffa00272:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa00276:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa0027a:	17 97       	W[P2] = R7;
ffa0027c:	24 00       	SSYNC;
ffa0027e:	01 e8 00 00 	UNLINK;
ffa00282:	03 30       	R0 = R3;
ffa00284:	38 05       	(R7:7) = [SP++];
ffa00286:	10 00       	RTS;

ffa00288 <_spi_read_register>:
ffa00288:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa0028c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa00290:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00294:	10 30       	R2 = R0;
ffa00296:	10 97       	W[P2] = R0;
ffa00298:	24 00       	SSYNC;
ffa0029a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa0029e:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa002a2:	49 43       	R1 = R1.B (Z);
ffa002a4:	11 97       	W[P2] = R1;
ffa002a6:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa002a8:	42 34       	I0 = P2;
ffa002aa:	00 00       	NOP;
ffa002ac:	20 9d       	R0.L = W[I0];
ffa002ae:	c0 42       	R0 = R0.L (Z);
ffa002b0:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa002b2:	fc 17       	IF !CC JUMP 0xffa002aa <_spi_read_register+0x22> (BP);
ffa002b4:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa002b6:	0c 10       	IF !CC JUMP 0xffa002ce <_spi_read_register+0x46>;
ffa002b8:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa002bc:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa002c0:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa002c2:	42 34       	I0 = P2;
ffa002c4:	00 00       	NOP;
ffa002c6:	20 9d       	R0.L = W[I0];
ffa002c8:	01 54       	R0 = R1 & R0;
ffa002ca:	00 0c       	CC = R0 == 0x0;
ffa002cc:	fc 1f       	IF CC JUMP 0xffa002c4 <_spi_read_register+0x3c> (BP);
ffa002ce:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa002d2:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa002d6:	10 95       	R0 = W[P2] (Z);
ffa002d8:	a2 6f       	P2 += -0xc;		/* (-12) */
ffa002da:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa002dc:	10 97       	W[P2] = R0;
ffa002de:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa002e0:	42 34       	I0 = P2;
ffa002e2:	00 00       	NOP;
ffa002e4:	20 9d       	R0.L = W[I0];
ffa002e6:	c0 42       	R0 = R0.L (Z);
ffa002e8:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa002ea:	fc 17       	IF !CC JUMP 0xffa002e2 <_spi_read_register+0x5a> (BP);
ffa002ec:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa002ee:	0c 10       	IF !CC JUMP 0xffa00306 <_spi_read_register+0x7e>;
ffa002f0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa002f4:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa002f8:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa002fa:	42 34       	I0 = P2;
ffa002fc:	00 00       	NOP;
ffa002fe:	20 9d       	R0.L = W[I0];
ffa00300:	01 54       	R0 = R1 & R0;
ffa00302:	00 0c       	CC = R0 == 0x0;
ffa00304:	fc 1f       	IF CC JUMP 0xffa002fc <_spi_read_register+0x74> (BP);
ffa00306:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa0030a:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa0030e:	10 95       	R0 = W[P2] (Z);
ffa00310:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa00314:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00318:	12 97       	W[P2] = R2;
ffa0031a:	24 00       	SSYNC;
ffa0031c:	01 e8 00 00 	UNLINK;
ffa00320:	10 00       	RTS;
	...

ffa00324 <_spi_read_register_status>:
ffa00324:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa00328:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0032c:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00330:	0a 32       	P1 = R2;
ffa00332:	18 30       	R3 = R0;
ffa00334:	10 97       	W[P2] = R0;
ffa00336:	24 00       	SSYNC;
ffa00338:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa0033c:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa00340:	49 43       	R1 = R1.B (Z);
ffa00342:	11 97       	W[P2] = R1;
ffa00344:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa00346:	42 34       	I0 = P2;
ffa00348:	00 00       	NOP;
ffa0034a:	20 9d       	R0.L = W[I0];
ffa0034c:	c0 42       	R0 = R0.L (Z);
ffa0034e:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa00350:	fc 17       	IF !CC JUMP 0xffa00348 <_spi_read_register_status+0x24> (BP);
ffa00352:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa00354:	0c 10       	IF !CC JUMP 0xffa0036c <_spi_read_register_status+0x48>;
ffa00356:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa0035a:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa0035e:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00360:	42 34       	I0 = P2;
ffa00362:	00 00       	NOP;
ffa00364:	20 9d       	R0.L = W[I0];
ffa00366:	01 54       	R0 = R1 & R0;
ffa00368:	00 0c       	CC = R0 == 0x0;
ffa0036a:	fc 1f       	IF CC JUMP 0xffa00362 <_spi_read_register_status+0x3e> (BP);
ffa0036c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa00370:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa00374:	12 95       	R2 = W[P2] (Z);
ffa00376:	a2 6f       	P2 += -0xc;		/* (-12) */
ffa00378:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0037a:	10 97       	W[P2] = R0;
ffa0037c:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0037e:	42 34       	I0 = P2;
ffa00380:	00 00       	NOP;
ffa00382:	20 9d       	R0.L = W[I0];
ffa00384:	c0 42       	R0 = R0.L (Z);
ffa00386:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa00388:	fc 17       	IF !CC JUMP 0xffa00380 <_spi_read_register_status+0x5c> (BP);
ffa0038a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0038c:	0c 10       	IF !CC JUMP 0xffa003a4 <_spi_read_register_status+0x80>;
ffa0038e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa00392:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa00396:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00398:	42 34       	I0 = P2;
ffa0039a:	00 00       	NOP;
ffa0039c:	20 9d       	R0.L = W[I0];
ffa0039e:	01 54       	R0 = R1 & R0;
ffa003a0:	00 0c       	CC = R0 == 0x0;
ffa003a2:	fc 1f       	IF CC JUMP 0xffa0039a <_spi_read_register_status+0x76> (BP);
ffa003a4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa003a8:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa003ac:	10 95       	R0 = W[P2] (Z);
ffa003ae:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa003b2:	08 9b       	B[P1] = R0;
ffa003b4:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa003b8:	13 97       	W[P2] = R3;
ffa003ba:	24 00       	SSYNC;
ffa003bc:	02 30       	R0 = R2;
ffa003be:	01 e8 00 00 	UNLINK;
ffa003c2:	10 00       	RTS;

ffa003c4 <_spi_write_byte>:
ffa003c4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa003c8:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa003cc:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa003d0:	10 30       	R2 = R0;
ffa003d2:	10 97       	W[P2] = R0;
ffa003d4:	24 00       	SSYNC;
ffa003d6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa003da:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa003de:	49 43       	R1 = R1.B (Z);
ffa003e0:	11 97       	W[P2] = R1;
ffa003e2:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa003e4:	42 34       	I0 = P2;
ffa003e6:	00 00       	NOP;
ffa003e8:	20 9d       	R0.L = W[I0];
ffa003ea:	c0 42       	R0 = R0.L (Z);
ffa003ec:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa003ee:	fc 17       	IF !CC JUMP 0xffa003e6 <_spi_write_byte+0x22> (BP);
ffa003f0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa003f2:	0c 10       	IF !CC JUMP 0xffa0040a <_spi_write_byte+0x46>;
ffa003f4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa003f8:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa003fc:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa003fe:	42 34       	I0 = P2;
ffa00400:	00 00       	NOP;
ffa00402:	20 9d       	R0.L = W[I0];
ffa00404:	01 54       	R0 = R1 & R0;
ffa00406:	00 0c       	CC = R0 == 0x0;
ffa00408:	fc 1f       	IF CC JUMP 0xffa00400 <_spi_write_byte+0x3c> (BP);
ffa0040a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa0040e:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa00412:	10 95       	R0 = W[P2] (Z);
ffa00414:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa00418:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa0041c:	12 97       	W[P2] = R2;
ffa0041e:	24 00       	SSYNC;
ffa00420:	01 e8 00 00 	UNLINK;
ffa00424:	10 00       	RTS;
	...

ffa00428 <_radio_set_rx>:
ffa00428:	ed 05       	[--SP] = (R7:5, P5:5);
ffa0042a:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00688(-4192632) */
ffa0042e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00432:	0d e1 04 07 	P5.L = 0x704;		/* (1796)	P5=0xffc00704(-4192508) */
ffa00436:	38 30       	R7 = R0;
ffa00438:	29 30       	R5 = R1;
ffa0043a:	29 97       	W[P5] = R1;
ffa0043c:	24 00       	SSYNC;
ffa0043e:	c6 42       	R6 = R0.L (Z);
ffa00440:	06 30       	R0 = R6;
ffa00442:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00444:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa00446:	ff e3 d5 fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa0044a:	2f 97       	W[P5] = R7;
ffa0044c:	24 00       	SSYNC;
ffa0044e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa00452:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa00456:	20 e1 e2 00 	R0 = 0xe2 (X);		/*		R0=0xe2(226) */
ffa0045a:	10 97       	W[P2] = R0;
ffa0045c:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0045e:	42 34       	I0 = P2;
ffa00460:	00 00       	NOP;
ffa00462:	20 9d       	R0.L = W[I0];
ffa00464:	c0 42       	R0 = R0.L (Z);
ffa00466:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa00468:	fc 17       	IF !CC JUMP 0xffa00460 <_radio_set_rx+0x38> (BP);
ffa0046a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0046c:	0c 10       	IF !CC JUMP 0xffa00484 <_radio_set_rx+0x5c>;
ffa0046e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa00472:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa00476:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00478:	42 34       	I0 = P2;
ffa0047a:	00 00       	NOP;
ffa0047c:	20 9d       	R0.L = W[I0];
ffa0047e:	01 54       	R0 = R1 & R0;
ffa00480:	00 0c       	CC = R0 == 0x0;
ffa00482:	fc 1f       	IF CC JUMP 0xffa0047a <_radio_set_rx+0x52> (BP);
ffa00484:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa00488:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa0048c:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00704(-4192508) */
ffa00490:	10 95       	R0 = W[P2] (Z);
ffa00492:	0d e1 08 07 	P5.L = 0x708;		/* (1800)	P5=0xffc00708(-4192504) */
ffa00496:	2f 97       	W[P5] = R7;
ffa00498:	24 00       	SSYNC;
ffa0049a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0049c:	06 30       	R0 = R6;
ffa0049e:	fa 60       	R2 = 0x1f (X);		/*		R2=0x1f( 31) */
ffa004a0:	ff e3 a8 fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa004a4:	06 30       	R0 = R6;
ffa004a6:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa004a8:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa004ac:	ff e3 a2 fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa004b0:	24 00       	SSYNC;
ffa004b2:	2d 97       	W[P5] = R5;
ffa004b4:	24 00       	SSYNC;
ffa004b6:	01 e8 00 00 	UNLINK;
ffa004ba:	ad 05       	(R7:5, P5:5) = [SP++];
ffa004bc:	10 00       	RTS;
	...

ffa004c0 <_radio_set_tx>:
ffa004c0:	f5 05       	[--SP] = (R7:6, P5:5);
ffa004c2:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00708(-4192504) */
ffa004c6:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa004ca:	0d e1 04 07 	P5.L = 0x704;		/* (1796)	P5=0xffc00704(-4192508) */
ffa004ce:	38 30       	R7 = R0;
ffa004d0:	29 97       	W[P5] = R1;
ffa004d2:	24 00       	SSYNC;
ffa004d4:	c6 42       	R6 = R0.L (Z);
ffa004d6:	06 30       	R0 = R6;
ffa004d8:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa004da:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa004dc:	ff e3 8a fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa004e0:	2f 97       	W[P5] = R7;
ffa004e2:	24 00       	SSYNC;
ffa004e4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa004e8:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa004ec:	20 e1 e1 00 	R0 = 0xe1 (X);		/*		R0=0xe1(225) */
ffa004f0:	10 97       	W[P2] = R0;
ffa004f2:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa004f4:	42 34       	I0 = P2;
ffa004f6:	00 00       	NOP;
ffa004f8:	20 9d       	R0.L = W[I0];
ffa004fa:	c0 42       	R0 = R0.L (Z);
ffa004fc:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa004fe:	fc 17       	IF !CC JUMP 0xffa004f6 <_radio_set_tx+0x36> (BP);
ffa00500:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa00502:	0c 10       	IF !CC JUMP 0xffa0051a <_radio_set_tx+0x5a>;
ffa00504:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa00508:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa0050c:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa0050e:	42 34       	I0 = P2;
ffa00510:	00 00       	NOP;
ffa00512:	20 9d       	R0.L = W[I0];
ffa00514:	01 54       	R0 = R1 & R0;
ffa00516:	00 0c       	CC = R0 == 0x0;
ffa00518:	fc 1f       	IF CC JUMP 0xffa00510 <_radio_set_tx+0x50> (BP);
ffa0051a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa0051e:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa00522:	10 95       	R0 = W[P2] (Z);
ffa00524:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa00528:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa0052c:	17 97       	W[P2] = R7;
ffa0052e:	24 00       	SSYNC;
ffa00530:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa00532:	06 30       	R0 = R6;
ffa00534:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa00538:	ff e3 5c fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa0053c:	06 30       	R0 = R6;
ffa0053e:	01 e8 00 00 	UNLINK;
ffa00542:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00544:	f2 60       	R2 = 0x1e (X);		/*		R2=0x1e( 30) */
ffa00546:	b5 05       	(R7:6, P5:5) = [SP++];
ffa00548:	ff e2 54 fe 	JUMP.L 0xffa001f0 <_spi_write_register>;

ffa0054c <_spi_write_register_ver>:
ffa0054c:	60 05       	[--SP] = (R7:4);
ffa0054e:	c7 42       	R7 = R0.L (Z);
ffa00550:	4e 43       	R6 = R1.B (Z);
ffa00552:	55 43       	R5 = R2.B (Z);
ffa00554:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00558:	07 30       	R0 = R7;
ffa0055a:	0e 30       	R1 = R6;
ffa0055c:	15 30       	R2 = R5;
ffa0055e:	ff e3 49 fe 	CALL 0xffa001f0 <_spi_write_register>;
ffa00562:	07 30       	R0 = R7;
ffa00564:	0e 30       	R1 = R6;
ffa00566:	ff e3 91 fe 	CALL 0xffa00288 <_spi_read_register>;
ffa0056a:	47 43       	R7 = R0.B (Z);
ffa0056c:	20 30       	R4 = R0;
ffa0056e:	3d 08       	CC = R5 == R7;
ffa00570:	28 18       	IF CC JUMP 0xffa005c0 <_spi_write_register_ver+0x74>;
ffa00572:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000e1(-7339807) */
ffa00576:	0e 30       	R1 = R6;
ffa00578:	00 e1 00 00 	R0.L = 0x0;		/* (  0)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa0057c:	00 e3 42 0a 	CALL 0xffa01a00 <_printf_int>;
ffa00580:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa00584:	00 e1 f0 05 	R0.L = 0x5f0;		/* (1520)	R0=0xff9005f0(-7338512) */
ffa00588:	00 e3 a0 08 	CALL 0xffa016c8 <_uart_str>;
ffa0058c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005f0(-7338512) */
ffa00590:	0d 30       	R1 = R5;
ffa00592:	00 e1 14 00 	R0.L = 0x14;		/* ( 20)	R0=0xff900014(-7340012) */
ffa00596:	00 e3 83 09 	CALL 0xffa0189c <_printf_hex_byte>;
ffa0059a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900014(-7340012) */
ffa0059e:	00 e1 f0 05 	R0.L = 0x5f0;		/* (1520)	R0=0xff9005f0(-7338512) */
ffa005a2:	00 e3 93 08 	CALL 0xffa016c8 <_uart_str>;
ffa005a6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005f0(-7338512) */
ffa005aa:	00 e1 20 00 	R0.L = 0x20;		/* ( 32)	R0=0xff900020(-7340000) */
ffa005ae:	0f 30       	R1 = R7;
ffa005b0:	00 e3 76 09 	CALL 0xffa0189c <_printf_hex_byte>;
ffa005b4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900020(-7340000) */
ffa005b8:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa005bc:	00 e3 86 08 	CALL 0xffa016c8 <_uart_str>;
ffa005c0:	04 30       	R0 = R4;
ffa005c2:	01 e8 00 00 	UNLINK;
ffa005c6:	20 05       	(R7:4) = [SP++];
ffa005c8:	10 00       	RTS;
	...

ffa005cc <_radio_init>:
ffa005cc:	68 05       	[--SP] = (R7:5);
ffa005ce:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc0203c(-4186052) */
ffa005d2:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa005d6:	09 e1 00 05 	P1.L = 0x500;		/* (1280)	P1=0xffc00500(-4193024) */
ffa005da:	03 60       	R3 = 0x0 (X);		/*		R3=0x0(  0) */
ffa005dc:	82 ce 02 cc 	R6 = ROT R2 BY 0x0 || W[P1] = R3 || NOP;
ffa005e0:	0b 97 00 00 
ffa005e4:	28 30       	R5 = R0;
ffa005e6:	24 00       	SSYNC;
ffa005e8:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa005ec:	2a 60       	R2 = 0x5 (X);		/*		R2=0x5(  5) */
ffa005ee:	0a e1 14 05 	P2.L = 0x514;		/* (1300)	P2=0xffc00514(-4193004) */
ffa005f2:	12 97       	W[P2] = R2;
ffa005f4:	22 e1 2d 50 	R2 = 0x502d (X);		/*		R2=0x502d(20525) */
ffa005f8:	0a 97       	W[P1] = R2;
ffa005fa:	82 6f       	P2 += -0x10;		/* (-16) */
ffa005fc:	13 97       	W[P2] = R3;
ffa005fe:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00514(-4193004) */
ffa00602:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00606:	10 97       	W[P2] = R0;
ffa00608:	c2 6d       	P2 += 0x38;		/* ( 56) */
ffa0060a:	12 95       	R2 = W[P2] (Z);
ffa0060c:	91 56       	R2 = R1 | R2;
ffa0060e:	12 97       	W[P2] = R2;
ffa00610:	82 6f       	P2 += -0x10;		/* (-16) */
ffa00612:	12 95       	R2 = W[P2] (Z);
ffa00614:	c9 43       	R1 =~ R1;
ffa00616:	51 54       	R1 = R1 & R2;
ffa00618:	11 97       	W[P2] = R1;
ffa0061a:	11 95       	R1 = W[P2] (Z);
ffa0061c:	51 4a       	BITSET (R1, 0xa);		/* bit 10 */
ffa0061e:	41 56       	R1 = R1 | R0;
ffa00620:	11 97       	W[P2] = R1;
ffa00622:	70 43       	R0 = R6.B (Z);
ffa00624:	21 e1 7c 00 	R1 = 0x7c (X);		/*		R1=0x7c(124) */
ffa00628:	08 0a       	CC = R0 <= R1 (IU);
ffa0062a:	20 e1 7c 00 	R0 = 0x7c (X);		/*		R0=0x7c(124) */
ffa0062e:	30 06       	IF !CC R6 = R0;
ffa00630:	76 43       	R6 = R6.B (Z);
ffa00632:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90007c(-7339908) */
ffa00636:	0e 30       	R1 = R6;
ffa00638:	00 e1 2c 00 	R0.L = 0x2c;		/* ( 44)	R0=0xff90002c(-7339988) */
ffa0063c:	00 e3 e2 09 	CALL 0xffa01a00 <_printf_int>;
ffa00640:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002c(-7339988) */
ffa00644:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa00648:	ef 42       	R7 = R5.L (Z);
ffa0064a:	00 e3 3f 08 	CALL 0xffa016c8 <_uart_str>;
ffa0064e:	07 30       	R0 = R7;
ffa00650:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00652:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa00654:	ff e3 ce fd 	CALL 0xffa001f0 <_spi_write_register>;
ffa00658:	07 30       	R0 = R7;
ffa0065a:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa0065c:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0065e:	ff e3 77 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa00662:	07 30       	R0 = R7;
ffa00664:	11 60       	R1 = 0x2 (X);		/*		R1=0x2(  2) */
ffa00666:	0a 60       	R2 = 0x1 (X);		/*		R2=0x1(  1) */
ffa00668:	ff e3 72 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa0066c:	07 30       	R0 = R7;
ffa0066e:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa00670:	0a 60       	R2 = 0x1 (X);		/*		R2=0x1(  1) */
ffa00672:	ff e3 6d ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa00676:	07 30       	R0 = R7;
ffa00678:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa0067a:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0067c:	ff e3 68 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa00680:	16 30       	R2 = R6;
ffa00682:	07 30       	R0 = R7;
ffa00684:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa00686:	ff e3 63 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa0068a:	07 30       	R0 = R7;
ffa0068c:	31 60       	R1 = 0x6 (X);		/*		R1=0x6(  6) */
ffa0068e:	7a 60       	R2 = 0xf (X);		/*		R2=0xf( 15) */
ffa00690:	ff e3 5e ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa00694:	07 30       	R0 = R7;
ffa00696:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa00698:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa0069c:	ff e3 58 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa006a0:	07 30       	R0 = R7;
ffa006a2:	89 60       	R1 = 0x11 (X);		/*		R1=0x11( 17) */
ffa006a4:	02 61       	R2 = 0x20 (X);		/*		R2=0x20( 32) */
ffa006a6:	ff e3 53 ff 	CALL 0xffa0054c <_spi_write_register_ver>;
ffa006aa:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa006ae:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa006b2:	15 97       	W[P2] = R5;
ffa006b4:	24 00       	SSYNC;
ffa006b6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa006ba:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa006be:	20 e1 e2 00 	R0 = 0xe2 (X);		/*		R0=0xe2(226) */
ffa006c2:	10 97       	W[P2] = R0;
ffa006c4:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa006c6:	42 34       	I0 = P2;
ffa006c8:	00 00       	NOP;
ffa006ca:	20 9d       	R0.L = W[I0];
ffa006cc:	c0 42       	R0 = R0.L (Z);
ffa006ce:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa006d0:	fc 17       	IF !CC JUMP 0xffa006c8 <_radio_init+0xfc> (BP);
ffa006d2:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa006d4:	0c 10       	IF !CC JUMP 0xffa006ec <_radio_init+0x120>;
ffa006d6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa006da:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa006de:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa006e0:	42 34       	I0 = P2;
ffa006e2:	00 00       	NOP;
ffa006e4:	20 9d       	R0.L = W[I0];
ffa006e6:	01 54       	R0 = R1 & R0;
ffa006e8:	00 0c       	CC = R0 == 0x0;
ffa006ea:	fc 1f       	IF CC JUMP 0xffa006e2 <_radio_init+0x116> (BP);
ffa006ec:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa006f0:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa006f4:	10 95       	R0 = W[P2] (Z);
ffa006f6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa006fa:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa006fe:	15 97       	W[P2] = R5;
ffa00700:	24 00       	SSYNC;
ffa00702:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa00704:	15 97       	W[P2] = R5;
ffa00706:	24 00       	SSYNC;
ffa00708:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa0070c:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa00710:	20 e1 e1 00 	R0 = 0xe1 (X);		/*		R0=0xe1(225) */
ffa00714:	10 97       	W[P2] = R0;
ffa00716:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa00718:	42 34       	I0 = P2;
ffa0071a:	00 00       	NOP;
ffa0071c:	20 9d       	R0.L = W[I0];
ffa0071e:	c0 42       	R0 = R0.L (Z);
ffa00720:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa00722:	fc 17       	IF !CC JUMP 0xffa0071a <_radio_init+0x14e> (BP);
ffa00724:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa00726:	0c 10       	IF !CC JUMP 0xffa0073e <_radio_init+0x172>;
ffa00728:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa0072c:	0a e1 08 05 	P2.L = 0x508;		/* (1288)	P2=0xffc00508(-4193016) */
ffa00730:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00732:	42 34       	I0 = P2;
ffa00734:	00 00       	NOP;
ffa00736:	20 9d       	R0.L = W[I0];
ffa00738:	01 54       	R0 = R1 & R0;
ffa0073a:	00 0c       	CC = R0 == 0x0;
ffa0073c:	fc 1f       	IF CC JUMP 0xffa00734 <_radio_init+0x168> (BP);
ffa0073e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00508(-4193016) */
ffa00742:	0a e1 18 05 	P2.L = 0x518;		/* (1304)	P2=0xffc00518(-4193000) */
ffa00746:	10 95       	R0 = W[P2] (Z);
ffa00748:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00518(-4193000) */
ffa0074c:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00750:	15 97       	W[P2] = R5;
ffa00752:	24 00       	SSYNC;
ffa00754:	01 e8 00 00 	UNLINK;
ffa00758:	28 05       	(R7:5) = [SP++];
ffa0075a:	10 00       	RTS;

ffa0075c <_audio_out>:
ffa0075c:	66 01       	[--SP] = ASTAT;
ffa0075e:	c4 05       	[--SP] = (R7:0, P5:4);
ffa00760:	48 01       	[--SP] = P0;
ffa00762:	49 01       	[--SP] = P1;
ffa00764:	4a 01       	[--SP] = P2;
ffa00766:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa0076a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0076e:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa00770:	0a e1 30 09 	P2.L = 0x930;		/* (2352)	P2=0xffc00930(-4191952) */
ffa00774:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900704 */
ffa00778:	10 97       	W[P2] = R0;
ffa0077a:	0d e1 b8 0c 	P5.L = 0xcb8;		/* (3256)	P5=0xff900cb8 <_g_sampCh> */
ffa0077e:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff90150c */
ffa00782:	6e 99       	R6 = B[P5] (X);
ffa00784:	08 e1 c0 0c 	P0.L = 0xcc0;		/* (3264)	P0=0xff900cc0 <_g_sampR> */
ffa00788:	75 43       	R5 = R6.B (Z);
ffa0078a:	04 91       	R4 = [P0];
ffa0078c:	22 e1 ff 01 	R2 = 0x1ff (X);		/*		R2=0x1ff(511) */
ffa00790:	65 50       	R1 = R5 + R4;
ffa00792:	11 54       	R0 = R1 & R2;
ffa00794:	20 32       	P4 = R0;
ffa00796:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900500 */
ffa0079a:	09 e1 ec 0c 	P1.L = 0xcec;		/* (3308)	P1=0xff900cec <_g_samples> */
ffa0079e:	11 64       	R1 += 0x2;		/* (  2) */
ffa007a0:	51 54       	R1 = R1 & R2;
ffa007a2:	a1 5a       	P2 = P1 + P4;
ffa007a4:	53 99       	R3 = B[P2] (X);
ffa007a6:	11 32       	P2 = R1;
ffa007a8:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa007ac:	0c e1 c8 0c 	P4.L = 0xcc8;		/* (3272)	P4=0xff900cc8 <_g_sampOff> */
ffa007b0:	06 4b       	BITTGL (R6, 0x0);		/* bit  0 */
ffa007b2:	72 43       	R2 = R6.B (Z);
ffa007b4:	51 5a       	P1 = P1 + P2;
ffa007b6:	49 99       	R1 = B[P1] (X);
ffa007b8:	61 91       	P1 = [P4];
ffa007ba:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa007bc:	98 4f       	R0 <<= 0x13;
ffa007be:	82 4f       	R2 <<= 0x10;
ffa007c0:	82 56       	R2 = R2 | R0;
ffa007c2:	20 e1 80 ff 	R0 = -0x80 (X);		/*		R0=0xffffff80(-128) */
ffa007c6:	41 58       	R1 = R1 ^ R0;
ffa007c8:	c3 58       	R3 = R3 ^ R0;
ffa007ca:	79 30       	R7 = P1;
ffa007cc:	a7 4e       	R7 >>= 0x14;
ffa007ce:	20 e1 ff 00 	R0 = 0xff (X);		/*		R0=0xff(255) */
ffa007d2:	49 43       	R1 = R1.B (Z);
ffa007d4:	5b 43       	R3 = R3.B (Z);
ffa007d6:	38 52       	R0 = R0 - R7;
ffa007d8:	f9 40       	R1 *= R7;
ffa007da:	c3 40       	R3 *= R0;
ffa007dc:	59 50       	R1 = R1 + R3;
ffa007de:	c9 42       	R1 = R1.L (Z);
ffa007e0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00930(-4191952) */
ffa007e4:	8a 56       	R2 = R2 | R1;
ffa007e6:	0a e1 10 09 	P2.L = 0x910;		/* (2320)	P2=0xffc00910(-4191984) */
ffa007ea:	12 93       	[P2] = R2;
ffa007ec:	0d 0c       	CC = R5 == 0x1;
ffa007ee:	0a 18       	IF CC JUMP 0xffa00802 <_audio_out+0xa6>;
ffa007f0:	01 e8 00 00 	UNLINK;
ffa007f4:	2e 9b       	B[P5] = R6;
ffa007f6:	72 90       	P2 = [SP++];
ffa007f8:	71 90       	P1 = [SP++];
ffa007fa:	70 90       	P0 = [SP++];
ffa007fc:	84 05       	(R7:0, P5:4) = [SP++];
ffa007fe:	26 01       	ASTAT = [SP++];
ffa00800:	11 00       	RTI;
ffa00802:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900910 */
ffa00806:	0a e1 a4 0c 	P2.L = 0xca4;		/* (3236)	P2=0xff900ca4 <_g_sampW> */
ffa0080a:	10 91       	R0 = [P2];
ffa0080c:	04 0a       	CC = R4 <= R0 (IU);
ffa0080e:	3b 14       	IF !CC JUMP 0xffa00884 <_audio_out+0x128> (BP);
ffa00810:	20 52       	R0 = R0 - R4;
ffa00812:	21 e1 d4 01 	R1 = 0x1d4 (X);		/*		R1=0x1d4(468) */
ffa00816:	08 0a       	CC = R0 <= R1 (IU);
ffa00818:	61 18       	IF CC JUMP 0xffa008da <_audio_out+0x17e>;
ffa0081a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca4 <_g_sampW> */
ffa0081e:	0a e1 98 0c 	P2.L = 0xc98;		/* (3224)	P2=0xff900c98 <_g_sampMode> */
ffa00822:	10 99       	R0 = B[P2] (Z);
ffa00824:	08 0c       	CC = R0 == 0x1;
ffa00826:	40 18       	IF CC JUMP 0xffa008a6 <_audio_out+0x14a>;
ffa00828:	10 0c       	CC = R0 == 0x2;
ffa0082a:	3a 18       	IF CC JUMP 0xffa0089e <_audio_out+0x142>;
ffa0082c:	22 60       	R2 = 0x4 (X);		/*		R2=0x4(  4) */
ffa0082e:	10 99       	R0 = B[P2] (Z);
ffa00830:	10 08       	CC = R0 == R2;
ffa00832:	3c 18       	IF CC JUMP 0xffa008aa <_audio_out+0x14e>;
ffa00834:	10 0c       	CC = R0 == 0x2;
ffa00836:	44 18       	IF CC JUMP 0xffa008be <_audio_out+0x162>;
ffa00838:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c98 <_g_sampMode> */
ffa0083c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0083e:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xff900ca8 <_g_sampInc> */
ffa00842:	e0 4f       	R0 <<= 0x1c;
ffa00844:	10 93       	[P2] = R0;
ffa00846:	10 91       	R0 = [P2];
ffa00848:	51 30       	R2 = P1;
ffa0084a:	42 50       	R1 = R2 + R0;
ffa0084c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0084e:	e0 4f       	R0 <<= 0x1c;
ffa00850:	01 0a       	CC = R1 <= R0 (IU);
ffa00852:	13 18       	IF CC JUMP 0xffa00878 <_audio_out+0x11c>;
ffa00854:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa00856:	40 e1 ff ef 	R0.H = 0xefff;		/* (-4097)	R0=0xefffffff(-268435457) */
ffa0085a:	01 50       	R0 = R1 + R0;
ffa0085c:	e0 4e       	R0 >>= 0x1c;
ffa0085e:	42 91       	P2 = [P0];
ffa00860:	08 32       	P1 = R0;
ffa00862:	fa 63       	R2 = -0x1 (X);		/*		R2=0xffffffff( -1) */
ffa00864:	e2 4f       	R2 <<= 0x1c;
ffa00866:	91 50       	R2 = R1 + R2;
ffa00868:	12 6c       	P2 += 0x2;		/* (  2) */
ffa0086a:	82 c6 e0 82 	R1 = R0 << 0x1c;
ffa0086e:	8a 5c       	P2 = P2 + (P1 << 0x1);
ffa00870:	04 cc 11 42 	R1 = R2 - R1 (NS) || [P0] = P2 || NOP;
ffa00874:	42 93 00 00 
ffa00878:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa0087a:	40 e1 ff 0f 	R0.H = 0xfff;		/* (4095)	R0=0xfffffff(268435455) */
ffa0087e:	01 54       	R0 = R1 & R0;
ffa00880:	20 93       	[P4] = R0;
ffa00882:	b7 2f       	JUMP.S 0xffa007f0 <_audio_out+0x94>;
ffa00884:	00 93       	[P0] = R0;
ffa00886:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca8 <_g_sampInc> */
ffa0088a:	0a e1 98 0c 	P2.L = 0xc98;		/* (3224)	P2=0xff900c98 <_g_sampMode> */
ffa0088e:	10 99       	R0 = B[P2] (Z);
ffa00890:	08 0c       	CC = R0 == 0x1;
ffa00892:	20 18       	IF CC JUMP 0xffa008d2 <_audio_out+0x176>;
ffa00894:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa00896:	08 08       	CC = R0 == R1;
ffa00898:	03 18       	IF CC JUMP 0xffa0089e <_audio_out+0x142>;
ffa0089a:	10 99       	R0 = B[P2] (Z);
ffa0089c:	cc 2f       	JUMP.S 0xffa00834 <_audio_out+0xd8>;
ffa0089e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa008a0:	10 9b       	B[P2] = R0;
ffa008a2:	10 99       	R0 = B[P2] (Z);
ffa008a4:	c8 2f       	JUMP.S 0xffa00834 <_audio_out+0xd8>;
ffa008a6:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa008a8:	10 9b       	B[P2] = R0;
ffa008aa:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c98 <_g_sampMode> */
ffa008ae:	40 e1 13 10 	R0.H = 0x1013;		/* (4115)	R0=0x10130004(269680644) */
ffa008b2:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xff900ca8 <_g_sampInc> */
ffa008b6:	00 e1 cd ab 	R0.L = 0xabcd;		/* (-21555)	R0=0x1013abcd(269724621) */
ffa008ba:	10 93       	[P2] = R0;
ffa008bc:	c5 2f       	JUMP.S 0xffa00846 <_audio_out+0xea>;
ffa008be:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca8 <_g_sampInc> */
ffa008c2:	40 e1 f1 0f 	R0.H = 0xff1;		/* (4081)	R0=0xff1abcd(267496397) */
ffa008c6:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xff900ca8 <_g_sampInc> */
ffa008ca:	00 e1 21 43 	R0.L = 0x4321;		/* (17185)	R0=0xff14321(267469601) */
ffa008ce:	10 93       	[P2] = R0;
ffa008d0:	bb 2f       	JUMP.S 0xffa00846 <_audio_out+0xea>;
ffa008d2:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa008d4:	10 9b       	B[P2] = R0;
ffa008d6:	10 99       	R0 = B[P2] (Z);
ffa008d8:	ae 2f       	JUMP.S 0xffa00834 <_audio_out+0xd8>;
ffa008da:	22 e1 63 00 	R2 = 0x63 (X);		/*		R2=0x63( 99) */
ffa008de:	10 0a       	CC = R0 <= R2 (IU);
ffa008e0:	d3 1b       	IF CC JUMP 0xffa00886 <_audio_out+0x12a>;
ffa008e2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca8 <_g_sampInc> */
ffa008e6:	0a e1 98 0c 	P2.L = 0xc98;		/* (3224)	P2=0xff900c98 <_g_sampMode> */
ffa008ea:	a1 2f       	JUMP.S 0xffa0082c <_audio_out+0xd0>;

ffa008ec <_oled_delay>:
ffa008ec:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa008f0:	92 69       	P2 = 0x32 (X);		/*		P2=0x32( 50) */
ffa008f2:	b2 e0 03 20 	LSETUP(0xffa008f6 <_oled_delay+0xa>, 0xffa008f8 <_oled_delay+0xc>) LC1 = P2;
ffa008f6:	00 00       	NOP;
ffa008f8:	00 00       	NOP;
ffa008fa:	01 e8 00 00 	UNLINK;
ffa008fe:	10 00       	RTS;

ffa00900 <_oled_write>:
ffa00900:	60 05       	[--SP] = (R7:4);
ffa00902:	08 30       	R1 = R0;
ffa00904:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00032(-4194254) */
ffa00908:	0a e1 04 15 	P2.L = 0x1504;		/* (5380)	P2=0xffc01504(-4188924) */
ffa0090c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa00910:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa00914:	10 97       	W[P2] = R0;
ffa00916:	92 69       	P2 = 0x32 (X);		/*		P2=0x32( 50) */
ffa00918:	b2 e0 03 20 	LSETUP(0xffa0091c <_oled_write+0x1c>, 0xffa0091e <_oled_write+0x1e>) LC1 = P2;
ffa0091c:	00 00       	NOP;
ffa0091e:	00 00       	NOP;
ffa00920:	cb 42       	R3 = R1.L (Z);
ffa00922:	50 e1 c0 ff 	I0.H = 0xffc0;		/* (-64)	I0=0xffc00000(-4194304) */
ffa00926:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00cc0(-4191040) */
ffa0092a:	49 60       	R1 = 0x9 (X);		/*		R1=0x9(  9) */
ffa0092c:	10 e1 04 15 	I0.L = 0x1504;		/* (5380)	I0=0xffc01504(-4188924) */
ffa00930:	22 e1 00 10 	R2 = 0x1000 (X);		/*		R2=0x1000(4096) */
ffa00934:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa00936:	26 e1 00 02 	R6 = 0x200 (X);		/*		R6=0x200(512) */
ffa0093a:	08 e1 08 15 	P0.L = 0x1508;		/* (5384)	P0=0xffc01508(-4188920) */
ffa0093e:	51 68       	P1 = 0xa (X);		/*		P1=0xa( 10) */
ffa00940:	94 61       	R4 = 0x32 (X);		/*		R4=0x32( 50) */
ffa00942:	a2 e0 16 10 	LSETUP(0xffa00946 <_oled_write+0x46>, 0xffa0096e <_oled_write+0x6e>) LC0 = P1;
ffa00946:	82 ce 03 c0 	R0 = ROT R3 BY 0x0 || W[I0] = R2.L || NOP;
ffa0094a:	22 9f 00 00 
ffa0094e:	08 40       	R0 >>>= R1;
ffa00950:	38 54       	R0 = R0 & R7;
ffa00952:	00 0c       	CC = R0 == 0x0;
ffa00954:	24 1c       	IF CC JUMP 0xffa0099c <_oled_write+0x9c> (BP);
ffa00956:	06 97       	W[P0] = R6;
ffa00958:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0095a:	00 00       	NOP;
ffa0095c:	08 64       	R0 += 0x1;		/* (  1) */
ffa0095e:	20 08       	CC = R0 == R4;
ffa00960:	fd 17       	IF !CC JUMP 0xffa0095a <_oled_write+0x5a> (BP);
ffa00962:	02 97       	W[P0] = R2;
ffa00964:	92 69       	P2 = 0x32 (X);		/*		P2=0x32( 50) */
ffa00966:	b2 e0 03 20 	LSETUP(0xffa0096a <_oled_write+0x6a>, 0xffa0096c <_oled_write+0x6c>) LC1 = P2;
ffa0096a:	00 00       	NOP;
ffa0096c:	00 00       	NOP;
ffa0096e:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa00970:	26 e1 00 02 	R6 = 0x200 (X);		/*		R6=0x200(512) */
ffa00974:	4b 48       	CC = !BITTST (R3, 0x9);		/* bit  9 */
ffa00976:	16 1c       	IF CC JUMP 0xffa009a2 <_oled_write+0xa2> (BP);
ffa00978:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0097a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00032(-4194254) */
ffa0097e:	0a e1 08 15 	P2.L = 0x1508;		/* (5384)	P2=0xffc01508(-4188920) */
ffa00982:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa00986:	10 97       	W[P2] = R0;
ffa00988:	92 69       	P2 = 0x32 (X);		/*		P2=0x32( 50) */
ffa0098a:	b2 e0 03 20 	LSETUP(0xffa0098e <_oled_write+0x8e>, 0xffa00990 <_oled_write+0x90>) LC1 = P2;
ffa0098e:	00 00       	NOP;
ffa00990:	00 00       	NOP;
ffa00992:	01 e8 00 00 	UNLINK;
ffa00996:	01 30       	R0 = R1;
ffa00998:	20 05       	(R7:4) = [SP++];
ffa0099a:	10 00       	RTS;
ffa0099c:	26 9f       	W[I0] = R6.L;
ffa0099e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa009a0:	dd 2f       	JUMP.S 0xffa0095a <_oled_write+0x5a>;
ffa009a2:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00032(-4194254) */
ffa009a6:	0a e1 04 15 	P2.L = 0x1504;		/* (5380)	P2=0xffc01504(-4188924) */
ffa009aa:	50 e1 c0 ff 	I0.H = 0xffc0;		/* (-64)	I0=0xffc01504(-4188924) */
ffa009ae:	51 e1 c0 ff 	I1.H = 0xffc0;		/* (-64)	I1=0xffc00000(-4194304) */
ffa009b2:	16 97       	W[P2] = R6;
ffa009b4:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa009b6:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa009b8:	27 e1 00 10 	R7 = 0x1000 (X);		/*		R7=0x1000(4096) */
ffa009bc:	25 e1 00 01 	R5 = 0x100 (X);		/*		R5=0x100(256) */
ffa009c0:	0b 60       	R3 = 0x1 (X);		/*		R3=0x1(  1) */
ffa009c2:	10 e1 08 15 	I0.L = 0x1508;		/* (5384)	I0=0xffc01508(-4188920) */
ffa009c6:	11 e1 00 15 	I1.L = 0x1500;		/* (5376)	I1=0xffc01500(-4188928) */
ffa009ca:	50 68       	P0 = 0xa (X);		/*		P0=0xa( 10) */
ffa009cc:	94 61       	R4 = 0x32 (X);		/*		R4=0x32( 50) */
ffa009ce:	a2 e0 1b 00 	LSETUP(0xffa009d2 <_oled_write+0xd2>, 0xffa00a04 <_oled_write+0x104>) LC0 = P0;
ffa009d2:	82 ce 05 c0 	R0 = ROT R5 BY 0x0 || W[P2] = R7 || NOP;
ffa009d6:	17 97 00 00 
ffa009da:	10 40       	R0 >>>= R2;
ffa009dc:	18 54       	R0 = R0 & R3;
ffa009de:	00 0c       	CC = R0 == 0x0;
ffa009e0:	14 1c       	IF CC JUMP 0xffa00a08 <_oled_write+0x108> (BP);
ffa009e2:	26 9f       	W[I0] = R6.L;
ffa009e4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa009e6:	00 00       	NOP;
ffa009e8:	08 64       	R0 += 0x1;		/* (  1) */
ffa009ea:	20 08       	CC = R0 == R4;
ffa009ec:	fd 17       	IF !CC JUMP 0xffa009e6 <_oled_write+0xe6> (BP);
ffa009ee:	27 9f       	W[I0] = R7.L;
ffa009f0:	28 9d       	R0.L = W[I1];
ffa009f2:	58 4e       	R0 >>= 0xb;
ffa009f4:	09 4f       	R1 <<= 0x1;
ffa009f6:	18 54       	R0 = R0 & R3;
ffa009f8:	41 56       	R1 = R1 | R0;
ffa009fa:	91 69       	P1 = 0x32 (X);		/*		P1=0x32( 50) */
ffa009fc:	b2 e0 03 10 	LSETUP(0xffa00a00 <_oled_write+0x100>, 0xffa00a02 <_oled_write+0x102>) LC1 = P1;
ffa00a00:	00 00       	NOP;
ffa00a02:	00 00       	NOP;
ffa00a04:	fa 67       	R2 += -0x1;		/* ( -1) */
ffa00a06:	ba 2f       	JUMP.S 0xffa0097a <_oled_write+0x7a>;
ffa00a08:	16 97       	W[P2] = R6;
ffa00a0a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00a0c:	ed 2f       	JUMP.S 0xffa009e6 <_oled_write+0xe6>;
	...

ffa00a10 <_oled_waitbusy>:
ffa00a10:	78 05       	[--SP] = (R7:7);
ffa00a12:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00a16:	20 e1 01 01 	R0 = 0x101 (X);		/*		R0=0x101(257) */
ffa00a1a:	ff e3 73 ff 	CALL 0xffa00900 <_oled_write>;
ffa00a1e:	00 43       	R0 = R0.B (X);
ffa00a20:	80 0c       	CC = R0 < 0x0;
ffa00a22:	10 10       	IF !CC JUMP 0xffa00a42 <_oled_waitbusy+0x32>;
ffa00a24:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa00a26:	07 20       	JUMP.S 0xffa00a34 <_oled_waitbusy+0x24>;
ffa00a28:	0f 64       	R7 += 0x1;		/* (  1) */
ffa00a2a:	f8 42       	R0 = R7.L (Z);
ffa00a2c:	21 e1 d0 07 	R1 = 0x7d0 (X);		/*		R1=0x7d0(2000) */
ffa00a30:	08 08       	CC = R0 == R1;
ffa00a32:	08 18       	IF CC JUMP 0xffa00a42 <_oled_waitbusy+0x32>;
ffa00a34:	20 e1 00 01 	R0 = 0x100 (X);		/*		R0=0x100(256) */
ffa00a38:	ff e3 64 ff 	CALL 0xffa00900 <_oled_write>;
ffa00a3c:	00 43       	R0 = R0.B (X);
ffa00a3e:	80 0c       	CC = R0 < 0x0;
ffa00a40:	f4 1f       	IF CC JUMP 0xffa00a28 <_oled_waitbusy+0x18> (BP);
ffa00a42:	01 e8 00 00 	UNLINK;
ffa00a46:	38 05       	(R7:7) = [SP++];
ffa00a48:	10 00       	RTS;
	...

ffa00a4c <_wait_flash>:
ffa00a4c:	ec 05       	[--SP] = (R7:5, P5:4);
ffa00a4e:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc00cc8(-4191032) */
ffa00a52:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00cb8(-4191048) */
ffa00a56:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00a5a:	0c e1 04 07 	P4.L = 0x704;		/* (1796)	P4=0xffc00704(-4192508) */
ffa00a5e:	15 60       	R5 = 0x2 (X);		/*		R5=0x2(  2) */
ffa00a60:	16 60       	R6 = 0x2 (X);		/*		R6=0x2(  2) */
ffa00a62:	0d e1 08 15 	P5.L = 0x1508;		/* (5384)	P5=0xffc01508(-4188920) */
ffa00a66:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa00a68:	26 97       	W[P4] = R6;
ffa00a6a:	24 00       	SSYNC;
ffa00a6c:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa00a6e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00a70:	ff e3 aa fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00a74:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00a76:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00a78:	ff e3 a6 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00a7c:	2d 97       	W[P5] = R5;
ffa00a7e:	24 00       	SSYNC;
ffa00a80:	07 54       	R0 = R7 & R0;
ffa00a82:	00 0c       	CC = R0 == 0x0;
ffa00a84:	f2 17       	IF !CC JUMP 0xffa00a68 <_wait_flash+0x1c> (BP);
ffa00a86:	01 e8 00 00 	UNLINK;
ffa00a8a:	ac 05       	(R7:5, P5:4) = [SP++];
ffa00a8c:	10 00       	RTS;
	...

ffa00a90 <_write_enable_flash>:
ffa00a90:	fc 05       	[--SP] = (R7:7, P5:4);
ffa00a92:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc00704(-4192508) */
ffa00a96:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00a9a:	0c e1 04 15 	P4.L = 0x1504;		/* (5380)	P4=0xffc01504(-4188924) */
ffa00a9e:	17 60       	R7 = 0x2 (X);		/*		R7=0x2(  2) */
ffa00aa0:	27 97       	W[P4] = R7;
ffa00aa2:	24 00       	SSYNC;
ffa00aa4:	21 e1 50 00 	R1 = 0x50 (X);		/*		R1=0x50( 80) */
ffa00aa8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00aaa:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc01508(-4188920) */
ffa00aae:	ff e3 8b fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ab2:	0d e1 08 15 	P5.L = 0x1508;		/* (5384)	P5=0xffc01508(-4188920) */
ffa00ab6:	2f 97       	W[P5] = R7;
ffa00ab8:	24 00       	SSYNC;
ffa00aba:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01504(-4188924) */
ffa00abe:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00ac2:	17 97       	W[P2] = R7;
ffa00ac4:	24 00       	SSYNC;
ffa00ac6:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa00ac8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00aca:	ff e3 7d fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ace:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00ad0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00ad2:	ff e3 79 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ad6:	2f 97       	W[P5] = R7;
ffa00ad8:	24 00       	SSYNC;
ffa00ada:	27 97       	W[P4] = R7;
ffa00adc:	24 00       	SSYNC;
ffa00ade:	31 60       	R1 = 0x6 (X);		/*		R1=0x6(  6) */
ffa00ae0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00ae2:	ff e3 71 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ae6:	2f 97       	W[P5] = R7;
ffa00ae8:	24 00       	SSYNC;
ffa00aea:	01 e8 00 00 	UNLINK;
ffa00aee:	bc 05       	(R7:7, P5:4) = [SP++];
ffa00af0:	10 00       	RTS;
	...

ffa00af4 <_read_flash_u32>:
ffa00af4:	70 05       	[--SP] = (R7:6);
ffa00af6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa00afa:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00afe:	16 60       	R6 = 0x2 (X);		/*		R6=0x2(  2) */
ffa00b00:	0a e1 04 15 	P2.L = 0x1504;		/* (5380)	P2=0xffc01504(-4188924) */
ffa00b04:	82 ce 00 ce 	R7 = ROT R0 BY 0x0 || W[P2] = R6 || NOP;
ffa00b08:	16 97 00 00 
ffa00b0c:	24 00       	SSYNC;
ffa00b0e:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa00b10:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b12:	ff e3 59 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b16:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa00b1a:	49 43       	R1 = R1.B (Z);
ffa00b1c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b1e:	ff e3 53 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b22:	82 c6 c7 83 	R1 = R7 >> 0x8;
ffa00b26:	49 43       	R1 = R1.B (Z);
ffa00b28:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b2a:	ff e3 4d fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b2e:	79 43       	R1 = R7.B (Z);
ffa00b30:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b32:	ff e3 49 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b36:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00b38:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b3a:	ff e3 45 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b3e:	47 43       	R7 = R0.B (Z);
ffa00b40:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00b42:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b44:	ff e3 40 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b48:	40 43       	R0 = R0.B (Z);
ffa00b4a:	47 4f       	R7 <<= 0x8;
ffa00b4c:	c7 51       	R7 = R7 + R0;
ffa00b4e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00b50:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b52:	ff e3 39 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b56:	40 43       	R0 = R0.B (Z);
ffa00b58:	47 4f       	R7 <<= 0x8;
ffa00b5a:	c7 51       	R7 = R7 + R0;
ffa00b5c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00b5e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b60:	ff e3 32 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00b64:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01504(-4188924) */
ffa00b68:	0a e1 08 15 	P2.L = 0x1508;		/* (5384)	P2=0xffc01508(-4188920) */
ffa00b6c:	47 4f       	R7 <<= 0x8;
ffa00b6e:	16 97       	W[P2] = R6;
ffa00b70:	24 00       	SSYNC;
ffa00b72:	40 43       	R0 = R0.B (Z);
ffa00b74:	c7 51       	R7 = R7 + R0;
ffa00b76:	07 30       	R0 = R7;
ffa00b78:	01 e8 00 00 	UNLINK;
ffa00b7c:	30 05       	(R7:6) = [SP++];
ffa00b7e:	10 00       	RTS;

ffa00b80 <_read_flash_u8>:
ffa00b80:	70 05       	[--SP] = (R7:6);
ffa00b82:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01508(-4188920) */
ffa00b86:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa00b8a:	16 60       	R6 = 0x2 (X);		/*		R6=0x2(  2) */
ffa00b8c:	0a e1 04 15 	P2.L = 0x1504;		/* (5380)	P2=0xffc01504(-4188924) */
ffa00b90:	82 ce 00 ce 	R7 = ROT R0 BY 0x0 || W[P2] = R6 || NOP;
ffa00b94:	16 97 00 00 
ffa00b98:	24 00       	SSYNC;
ffa00b9a:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa00b9c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00b9e:	ff e3 13 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ba2:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa00ba6:	49 43       	R1 = R1.B (Z);
ffa00ba8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00baa:	ff e3 0d fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00bae:	82 c6 c7 83 	R1 = R7 >> 0x8;
ffa00bb2:	49 43       	R1 = R1.B (Z);
ffa00bb4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00bb6:	ff e3 07 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00bba:	79 43       	R1 = R7.B (Z);
ffa00bbc:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00bbe:	ff e3 03 fc 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00bc2:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00bc4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00bc6:	ff e3 ff fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00bca:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01504(-4188924) */
ffa00bce:	0a e1 08 15 	P2.L = 0x1508;		/* (5384)	P2=0xffc01508(-4188920) */
ffa00bd2:	16 97       	W[P2] = R6;
ffa00bd4:	24 00       	SSYNC;
ffa00bd6:	01 e8 00 00 	UNLINK;
ffa00bda:	30 05       	(R7:6) = [SP++];
ffa00bdc:	10 00       	RTS;
	...

ffa00be0 <_write_flash>:
ffa00be0:	e3 05       	[--SP] = (R7:4, P5:3);
ffa00be2:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa00be6:	82 ce 00 c8 	R4 = ROT R0 BY 0x0 || [FP -0x4] = R1 || NOP;
ffa00bea:	f1 bb 00 00 
ffa00bee:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc00000(-4194304) */
ffa00bf2:	ff e3 4f ff 	CALL 0xffa00a90 <_write_enable_flash>;
ffa00bf6:	0b e1 04 15 	P3.L = 0x1504;		/* (5380)	P3=0xffc01504(-4188924) */
ffa00bfa:	17 60       	R7 = 0x2 (X);		/*		R7=0x2(  2) */
ffa00bfc:	1f 97       	W[P3] = R7;
ffa00bfe:	24 00       	SSYNC;
ffa00c00:	01 61       	R1 = 0x20 (X);		/*		R1=0x20( 32) */
ffa00c02:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c04:	ff e3 e0 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c08:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa00c0a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c0c:	ff e3 dc fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c10:	21 e1 f0 00 	R1 = 0xf0 (X);		/*		R1=0xf0(240) */
ffa00c14:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c16:	ff e3 d7 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c1a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00c1c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c1e:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc01504(-4188924) */
ffa00c22:	ff e3 d1 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c26:	0c e1 08 15 	P4.L = 0x1508;		/* (5384)	P4=0xffc01508(-4188920) */
ffa00c2a:	27 97       	W[P4] = R7;
ffa00c2c:	24 00       	SSYNC;
ffa00c2e:	ff e3 0f ff 	CALL 0xffa00a4c <_wait_flash>;
ffa00c32:	04 0c       	CC = R4 == 0x0;
ffa00c34:	56 18       	IF CC JUMP 0xffa00ce0 <_write_flash+0x100>;
ffa00c36:	fd b9       	P5 = [FP -0x4];
ffa00c38:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa00c3a:	15 60       	R5 = 0x2 (X);		/*		R5=0x2(  2) */
ffa00c3c:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa00c3e:	18 97       	W[P3] = R0;
ffa00c40:	24 00       	SSYNC;
ffa00c42:	31 60       	R1 = 0x6 (X);		/*		R1=0x6(  6) */
ffa00c44:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c46:	ff e3 bf fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c4a:	25 97       	W[P4] = R5;
ffa00c4c:	24 00       	SSYNC;
ffa00c4e:	20 e1 7f 00 	R0 = 0x7f (X);		/*		R0=0x7f(127) */
ffa00c52:	60 4f       	R0 <<= 0xc;
ffa00c54:	04 cc 30 0e 	R7 = R6 + R0 (NS) || W[P3] = R5 || NOP;
ffa00c58:	1d 97 00 00 
ffa00c5c:	24 00       	SSYNC;
ffa00c5e:	11 60       	R1 = 0x2 (X);		/*		R1=0x2(  2) */
ffa00c60:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c62:	ff e3 b1 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c66:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa00c6a:	49 43       	R1 = R1.B (Z);
ffa00c6c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c6e:	47 4e       	R7 >>= 0x8;
ffa00c70:	ff e3 aa fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c74:	7f 43       	R7 = R7.B (Z);
ffa00c76:	0f 30       	R1 = R7;
ffa00c78:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c7a:	ff e3 a5 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c7e:	71 43       	R1 = R6.B (Z);
ffa00c80:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c82:	ff e3 a1 fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c86:	29 98       	R1 = B[P5++] (Z);
ffa00c88:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00c8a:	ff e3 9d fb 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00c8e:	25 97       	W[P4] = R5;
ffa00c90:	24 00       	SSYNC;
ffa00c92:	ff e3 dd fe 	CALL 0xffa00a4c <_wait_flash>;
ffa00c96:	0e 64       	R6 += 0x1;		/* (  1) */
ffa00c98:	a6 09       	CC = R6 < R4 (IU);
ffa00c9a:	d1 1f       	IF CC JUMP 0xffa00c3c <_write_flash+0x5c> (BP);
ffa00c9c:	25 e1 7f 00 	R5 = 0x7f (X);		/*		R5=0x7f(127) */
ffa00ca0:	fd b9       	P5 = [FP -0x4];
ffa00ca2:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa00ca4:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa00ca6:	65 4f       	R5 <<= 0xc;
ffa00ca8:	02 20       	JUMP.S 0xffa00cac <_write_flash+0xcc>;
ffa00caa:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa00cac:	2f 50       	R0 = R7 + R5;
ffa00cae:	ff e3 69 ff 	CALL 0xffa00b80 <_read_flash_u8>;
ffa00cb2:	41 43       	R1 = R0.B (Z);
ffa00cb4:	28 99       	R0 = B[P5] (Z);
ffa00cb6:	01 08       	CC = R1 == R0;
ffa00cb8:	0f 1c       	IF CC JUMP 0xffa00cd6 <_write_flash+0xf6> (BP);
ffa00cba:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa00cbe:	00 e1 44 00 	R0.L = 0x44;		/* ( 68)	R0=0xff900044(-7339964) */
ffa00cc2:	00 e3 ed 05 	CALL 0xffa0189c <_printf_hex_byte>;
ffa00cc6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900044(-7339964) */
ffa00cca:	29 99       	R1 = B[P5] (Z);
ffa00ccc:	00 e1 54 00 	R0.L = 0x54;		/* ( 84)	R0=0xff900054(-7339948) */
ffa00cd0:	00 e3 e6 05 	CALL 0xffa0189c <_printf_hex_byte>;
ffa00cd4:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa00cd6:	0f 64       	R7 += 0x1;		/* (  1) */
ffa00cd8:	a7 09       	CC = R7 < R4 (IU);
ffa00cda:	e8 1f       	IF CC JUMP 0xffa00caa <_write_flash+0xca> (BP);
ffa00cdc:	06 48       	CC = !BITTST (R6, 0x0);		/* bit  0 */
ffa00cde:	05 18       	IF CC JUMP 0xffa00ce8 <_write_flash+0x108>;
ffa00ce0:	01 e8 00 00 	UNLINK;
ffa00ce4:	a3 05       	(R7:4, P5:3) = [SP++];
ffa00ce6:	10 00       	RTS;
ffa00ce8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900054(-7339948) */
ffa00cec:	01 e8 00 00 	UNLINK;
ffa00cf0:	00 e1 60 00 	R0.L = 0x60;		/* ( 96)	R0=0xff900060(-7339936) */
ffa00cf4:	a3 05       	(R7:4, P5:3) = [SP++];
ffa00cf6:	00 e2 2d 07 	JUMP.L 0xffa01b50 <_printf_str>;
	...

ffa00cfc <_eth_listen>:
ffa00cfc:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa00d00:	00 0c       	CC = R0 == 0x0;
ffa00d02:	04 18       	IF CC JUMP 0xffa00d0a <_eth_listen+0xe>;
ffa00d04:	01 e8 00 00 	UNLINK;
ffa00d08:	10 00       	RTS;
ffa00d0a:	47 30       	R0 = FP;
ffa00d0c:	e0 67       	R0 += -0x4;		/* ( -4) */
ffa00d0e:	00 e3 25 15 	CALL 0xffa03758 <_bfin_EMAC_recv>;
ffa00d12:	00 0d       	CC = R0 <= 0x0;
ffa00d14:	f8 1b       	IF CC JUMP 0xffa00d04 <_eth_listen+0x8>;
ffa00d16:	f9 b9       	P1 = [FP -0x4];
ffa00d18:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901508 */
ffa00d1c:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa00d20:	11 91       	R1 = [P2];
ffa00d22:	c8 a1       	R0 = [P1 + 0x1c];
ffa00d24:	08 08       	CC = R0 == R1;
ffa00d26:	ef 17       	IF !CC JUMP 0xffa00d04 <_eth_listen+0x8> (BP);
ffa00d28:	48 e4 13 00 	R0 = W[P1 + 0x26] (Z);
ffa00d2c:	00 e3 4e 0a 	CALL 0xffa021c8 <_htons>;
ffa00d30:	c0 42       	R0 = R0.L (Z);
ffa00d32:	21 e1 f6 10 	R1 = 0x10f6 (X);		/*		R1=0x10f6(4342) */
ffa00d36:	08 08       	CC = R0 == R1;
ffa00d38:	e6 17       	IF !CC JUMP 0xffa00d04 <_eth_listen+0x8> (BP);
ffa00d3a:	f0 b9       	R0 = [FP -0x4];
ffa00d3c:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff9010f6(-7335690) */
ffa00d40:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa00d42:	01 e1 cc 0c 	R1.L = 0xccc;		/* (3276)	R1=0xff900ccc <_g_outpkt>(-7336756) */
ffa00d46:	02 61       	R2 = 0x20 (X);		/*		R2=0x20( 32) */
ffa00d48:	00 e3 52 07 	CALL 0xffa01bec <_memcpy_>;
ffa00d4c:	dc 2f       	JUMP.S 0xffa00d04 <_eth_listen+0x8>;
	...

ffa00d50 <_getRadioPacket>:
ffa00d50:	e3 05       	[--SP] = (R7:4, P5:3);
ffa00d52:	00 e8 0c 00 	LINK 0x30;		/* (48) */
ffa00d56:	78 e6 fa ff 	W[FP + -0xc] = R0;
ffa00d5a:	c0 bb       	[FP -0x10] = R0;
ffa00d5c:	b8 e5 30 00 	R0 = B[FP + 0x30] (X);
ffa00d60:	a1 bb       	[FP -0x18] = R1;
ffa00d62:	79 e6 f6 ff 	W[FP + -0x14] = R1;
ffa00d66:	79 e4 fa ff 	R1 = W[FP + -0xc] (Z);
ffa00d6a:	b8 e6 e7 ff 	B[FP + -0x19] = R0;
ffa00d6e:	e1 bb       	[FP -0x8] = R1;
ffa00d70:	3a 30       	R7 = R2;
ffa00d72:	01 30       	R0 = R1;
ffa00d74:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa00d76:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa00d7a:	ff e3 3b fa 	CALL 0xffa001f0 <_spi_write_register>;
ffa00d7e:	24 00       	SSYNC;
ffa00d80:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00f74(-4190348) */
ffa00d84:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00d88:	7b e5 fa ff 	R3 = W[FP + -0xc] (X);
ffa00d8c:	13 97       	W[P2] = R3;
ffa00d8e:	24 00       	SSYNC;
ffa00d90:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa00d94:	20 e1 61 00 	R0 = 0x61 (X);		/*		R0=0x61( 97) */
ffa00d98:	0a e1 0c 05 	P2.L = 0x50c;		/* (1292)	P2=0xffc0050c(-4193012) */
ffa00d9c:	10 97       	W[P2] = R0;
ffa00d9e:	ff e3 0d fa 	CALL 0xffa001b8 <_spi_delay>;
ffa00da2:	7f 43       	R7 = R7.B (Z);
ffa00da4:	87 bb       	[FP -0x20] = R7;
ffa00da6:	07 0c       	CC = R7 == 0x0;
ffa00da8:	f2 10       	IF !CC JUMP 0xffa00f8c <_getRadioPacket+0x23c>;
ffa00daa:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff90000a */
ffa00dae:	08 e1 a0 0c 	P0.L = 0xca0;		/* (3232)	P0=0xff900ca0 <_wrptr> */
ffa00db2:	78 bb       	[FP -0x24] = P0;
ffa00db4:	78 b9       	P0 = [FP -0x24];
ffa00db6:	80 b9       	R0 = [FP -0x20];
ffa00db8:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc01508(-4188920) */
ffa00dbc:	00 0c       	CC = R0 == 0x0;
ffa00dbe:	44 e1 c0 ff 	R4.H = 0xffc0;		/* (-64)	R4=0xffc00032(-4194254) */
ffa00dc2:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff901504 */
ffa00dc6:	45 91       	P5 = [P0];
ffa00dc8:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa00dca:	0c e1 0c 05 	P4.L = 0x50c;		/* (1292)	P4=0xffc0050c(-4193012) */
ffa00dce:	05 60       	R5 = 0x0 (X);		/*		R5=0x0(  0) */
ffa00dd0:	06 02       	R6 = CC;
ffa00dd2:	04 e1 18 05 	R4.L = 0x518;		/* (1304)	R4=0xffc00518(-4193000) */
ffa00dd6:	0b e1 a4 0c 	P3.L = 0xca4;		/* (3236)	P3=0xff900ca4 <_g_sampW> */
ffa00dda:	25 97       	W[P4] = R5;
ffa00ddc:	ff e3 ee f9 	CALL 0xffa001b8 <_spi_delay>;
ffa00de0:	0e 02       	CC = R6;
ffa00de2:	1c 1c       	IF CC JUMP 0xffa00e1a <_getRadioPacket+0xca> (BP);
ffa00de4:	04 32       	P0 = R4;
ffa00de6:	b9 60       	R1 = 0x17 (X);		/*		R1=0x17( 23) */
ffa00de8:	00 95       	R0 = W[P0] (Z);
ffa00dea:	10 30       	R2 = R0;
ffa00dec:	28 9a       	B[P5++] = R0;
ffa00dee:	f8 42       	R0 = R7.L (Z);
ffa00df0:	08 0a       	CC = R0 <= R1 (IU);
ffa00df2:	14 14       	IF !CC JUMP 0xffa00e1a <_getRadioPacket+0xca> (BP);
ffa00df4:	1b 60       	R3 = 0x3 (X);		/*		R3=0x3(  3) */
ffa00df6:	1f 54       	R0 = R7 & R3;
ffa00df8:	00 0c       	CC = R0 == 0x0;
ffa00dfa:	03 1c       	IF CC JUMP 0xffa00e00 <_getRadioPacket+0xb0> (BP);
ffa00dfc:	08 0c       	CC = R0 == 0x1;
ffa00dfe:	0e 10       	IF !CC JUMP 0xffa00e1a <_getRadioPacket+0xca>;
ffa00e00:	23 e1 ff 01 	R3 = 0x1ff (X);		/*		R3=0x1ff(511) */
ffa00e04:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900ca0 <_wrptr> */
ffa00e08:	08 e1 ec 0c 	P0.L = 0xcec;		/* (3308)	P0=0xff900cec <_g_samples> */
ffa00e0c:	18 91       	R0 = [P3];
ffa00e0e:	58 54       	R1 = R0 & R3;
ffa00e10:	09 32       	P1 = R1;
ffa00e12:	08 64       	R0 += 0x1;		/* (  1) */
ffa00e14:	18 93       	[P3] = R0;
ffa00e16:	88 5a       	P2 = P0 + P1;
ffa00e18:	12 9b       	B[P2] = R2;
ffa00e1a:	0f 64       	R7 += 0x1;		/* (  1) */
ffa00e1c:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa00e1e:	07 08       	CC = R7 == R0;
ffa00e20:	dd 17       	IF !CC JUMP 0xffa00dda <_getRadioPacket+0x8a> (BP);
ffa00e22:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0050c(-4193012) */
ffa00e26:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00e2a:	79 e5 fa ff 	R1 = W[FP + -0xc] (X);
ffa00e2e:	11 97       	W[P2] = R1;
ffa00e30:	24 00       	SSYNC;
ffa00e32:	83 b9       	R3 = [FP -0x20];
ffa00e34:	03 0c       	CC = R3 == 0x0;
ffa00e36:	3a 1c       	IF CC JUMP 0xffa00eaa <_getRadioPacket+0x15a> (BP);
ffa00e38:	78 b9       	P0 = [FP -0x24];
ffa00e3a:	20 e1 ff 0f 	R0 = 0xfff (X);		/*		R0=0xfff(4095) */
ffa00e3e:	12 60       	R2 = 0x2 (X);		/*		R2=0x2(  2) */
ffa00e40:	01 91       	R1 = [P0];
ffa00e42:	01 65       	R1 += 0x20;		/* ( 32) */
ffa00e44:	01 54       	R0 = R1 & R0;
ffa00e46:	01 67       	R1 += -0x20;		/* (-32) */
ffa00e48:	09 32       	P1 = R1;
ffa00e4a:	00 93       	[P0] = R0;
ffa00e4c:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa00e4e:	89 a1       	R1 = [P1 + 0x18];
ffa00e50:	82 c6 21 87 	R3 = R1 >> 0x1c;
ffa00e54:	c3 54       	R3 = R3 & R0;
ffa00e56:	82 c6 91 81 	R0 = R1 >> 0xe;
ffa00e5a:	39 49       	CC = BITTST (R1, 0x7);		/* bit  7 */
ffa00e5c:	10 54       	R0 = R0 & R2;
ffa00e5e:	02 02       	R2 = CC;
ffa00e60:	10 56       	R0 = R0 | R2;
ffa00e62:	22 60       	R2 = 0x4 (X);		/*		R2=0x4(  4) */
ffa00e64:	a9 4e       	R1 >>= 0x15;
ffa00e66:	51 54       	R1 = R1 & R2;
ffa00e68:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900032 */
ffa00e6c:	08 56       	R0 = R0 | R1;
ffa00e6e:	09 e1 94 0c 	P1.L = 0xc94;		/* (3220)	P1=0xff900c94 <_g_nextFlag> */
ffa00e72:	58 56       	R1 = R0 | R3;
ffa00e74:	0a 91       	R2 = [P1];
ffa00e76:	0a 08       	CC = R2 == R1;
ffa00e78:	11 18       	IF CC JUMP 0xffa00e9a <_getRadioPacket+0x14a>;
ffa00e7a:	91 09       	CC = R1 < R2 (IU);
ffa00e7c:	96 1c       	IF CC JUMP 0xffa00fa8 <_getRadioPacket+0x258> (BP);
ffa00e7e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900708 */
ffa00e82:	0a e1 bc 0c 	P2.L = 0xcbc;		/* (3260)	P2=0xff900cbc <_g_dropped> */
ffa00e86:	10 91       	R0 = [P2];
ffa00e88:	10 52       	R0 = R0 - R2;
ffa00e8a:	08 50       	R0 = R0 + R1;
ffa00e8c:	10 93       	[P2] = R0;
ffa00e8e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cbc(-4191044) */
ffa00e92:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa00e94:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00e98:	10 97       	W[P2] = R0;
ffa00e9a:	09 64       	R1 += 0x1;		/* (  1) */
ffa00e9c:	78 60       	R0 = 0xf (X);		/*		R0=0xf( 15) */
ffa00e9e:	01 54       	R0 = R1 & R0;
ffa00ea0:	08 93       	[P1] = R0;
ffa00ea2:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa00ea4:	78 60       	R0 = 0xf (X);		/*		R0=0xf( 15) */
ffa00ea6:	01 08       	CC = R1 == R0;
ffa00ea8:	8a 18       	IF CC JUMP 0xffa00fbc <_getRadioPacket+0x26c>;
ffa00eaa:	78 b9       	P0 = [FP -0x24];
ffa00eac:	21 e1 3f 02 	R1 = 0x23f (X);		/*		R1=0x23f(575) */
ffa00eb0:	00 91       	R0 = [P0];
ffa00eb2:	08 0a       	CC = R0 <= R1 (IU);
ffa00eb4:	60 18       	IF CC JUMP 0xffa00f74 <_getRadioPacket+0x224>;
ffa00eb6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa00eba:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa00ebe:	20 e1 00 40 	R0 = 0x4000 (X);		/*		R0=0x4000(16384) */
ffa00ec2:	10 97       	W[P2] = R0;
ffa00ec4:	21 e1 e2 00 	R1 = 0xe2 (X);		/*		R1=0xe2(226) */
ffa00ec8:	e0 b9       	R0 = [FP -0x8];
ffa00eca:	ff e3 7d fa 	CALL 0xffa003c4 <_spi_write_byte>;
ffa00ece:	78 b9       	P0 = [FP -0x24];
ffa00ed0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900708 */
ffa00ed4:	0a e1 8c 0c 	P2.L = 0xc8c;		/* (3212)	P2=0xff900c8c <_g_radioChan> */
ffa00ed8:	12 91       	R2 = [P2];
ffa00eda:	21 e1 f4 10 	R1 = 0x10f4 (X);		/*		R1=0x10f4(4340) */
ffa00ede:	04 cc 11 04 	R2 = R2 + R1 (NS) || R0 = [P0] || NOP;
ffa00ee2:	00 91 00 00 
ffa00ee6:	4f 30       	R1 = FP;
ffa00ee8:	20 64       	R0 += 0x4;		/* (  4) */
ffa00eea:	d2 42       	R2 = R2.L (Z);
ffa00eec:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa00eee:	00 e3 63 0f 	CALL 0xffa02db4 <_udp_packet_setup>;
ffa00ef2:	08 32       	P1 = R0;
ffa00ef4:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa00ef8:	00 0d       	CC = R0 <= 0x0;
ffa00efa:	41 18       	IF CC JUMP 0xffa00f7c <_getRadioPacket+0x22c>;
ffa00efc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c8c <_g_radioChan> */
ffa00f00:	0a e1 bc 0c 	P2.L = 0xcbc;		/* (3260)	P2=0xff900cbc <_g_dropped> */
ffa00f04:	10 91       	R0 = [P2];
ffa00f06:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cbc <_g_dropped> */
ffa00f0a:	08 93       	[P1] = R0;
ffa00f0c:	0a e1 a0 0c 	P2.L = 0xca0;		/* (3232)	P2=0xff900ca0 <_wrptr> */
ffa00f10:	10 91       	R0 = [P2];
ffa00f12:	10 4e       	R0 >>= 0x2;
ffa00f14:	00 0c       	CC = R0 == 0x0;
ffa00f16:	a0 18       	IF CC JUMP 0xffa01056 <_getRadioPacket+0x306>;
ffa00f18:	51 32       	P2 = P1;
ffa00f1a:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa00f1c:	22 6c       	P2 += 0x4;		/* (  4) */
ffa00f1e:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa00f20:	44 34       	I0 = P4;
ffa00f22:	79 b9       	P1 = [FP -0x24];
ffa00f24:	00 9c       	R0 = [I0++];
ffa00f26:	10 92       	[P2++] = R0;
ffa00f28:	0a 64       	R2 += 0x1;		/* (  1) */
ffa00f2a:	08 91       	R0 = [P1];
ffa00f2c:	d1 42       	R1 = R2.L (Z);
ffa00f2e:	10 4e       	R0 >>= 0x2;
ffa00f30:	81 09       	CC = R1 < R0 (IU);
ffa00f32:	f8 1f       	IF CC JUMP 0xffa00f22 <_getRadioPacket+0x1d2> (BP);
ffa00f34:	a0 32       	P4 = I0;
ffa00f36:	6c 32       	P5 = P4;
ffa00f38:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca0 <_wrptr> */
ffa00f3c:	0a e1 9c 0c 	P2.L = 0xc9c;		/* (3228)	P2=0xff900c9c <_trptr> */
ffa00f40:	10 91       	R0 = [P2];
ffa00f42:	08 64       	R0 += 0x1;		/* (  1) */
ffa00f44:	10 93       	[P2] = R0;
ffa00f46:	00 e3 5d 0a 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa00f4a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00f4c:	20 93       	[P4] = R0;
ffa00f4e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa00f50:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa00f52:	23 e1 90 00 	R3 = 0x90 (X);		/*		R3=0x90(144) */
ffa00f56:	09 64       	R1 += 0x1;		/* (  1) */
ffa00f58:	c8 42       	R0 = R1.L (Z);
ffa00f5a:	2a 92       	[P5++] = R2;
ffa00f5c:	18 08       	CC = R0 == R3;
ffa00f5e:	fc 17       	IF !CC JUMP 0xffa00f56 <_getRadioPacket+0x206> (BP);
ffa00f60:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c9c(-4191076) */
ffa00f64:	78 b9       	P0 = [FP -0x24];
ffa00f66:	20 e1 04 40 	R0 = 0x4004 (X);		/*		R0=0x4004(16388) */
ffa00f6a:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00f6e:	10 97       	W[P2] = R0;
ffa00f70:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa00f72:	00 93       	[P0] = R0;
ffa00f74:	01 e8 00 00 	UNLINK;
ffa00f78:	a3 05       	(R7:4, P5:3) = [SP++];
ffa00f7a:	10 00       	RTS;
ffa00f7c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900704 */
ffa00f80:	0a e1 9c 0c 	P2.L = 0xc9c;		/* (3228)	P2=0xff900c9c <_trptr> */
ffa00f84:	10 91       	R0 = [P2];
ffa00f86:	08 64       	R0 += 0x1;		/* (  1) */
ffa00f88:	10 93       	[P2] = R0;
ffa00f8a:	eb 2f       	JUMP.S 0xffa00f60 <_getRadioPacket+0x210>;
ffa00f8c:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900c94 <_g_nextFlag> */
ffa00f90:	09 e1 a0 0c 	P1.L = 0xca0;		/* (3232)	P1=0xff900ca0 <_wrptr> */
ffa00f94:	4d 91       	P5 = [P1];
ffa00f96:	79 bb       	[FP -0x24] = P1;
ffa00f98:	ff e3 08 f9 	CALL 0xffa001a8 <_ustimer>;
ffa00f9c:	7a b9       	P2 = [FP -0x24];
ffa00f9e:	28 93       	[P5] = R0;
ffa00fa0:	10 91       	R0 = [P2];
ffa00fa2:	20 64       	R0 += 0x4;		/* (  4) */
ffa00fa4:	10 93       	[P2] = R0;
ffa00fa6:	07 2f       	JUMP.S 0xffa00db4 <_getRadioPacket+0x64>;
ffa00fa8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c9c <_trptr> */
ffa00fac:	0a e1 bc 0c 	P2.L = 0xcbc;		/* (3260)	P2=0xff900cbc <_g_dropped> */
ffa00fb0:	10 91       	R0 = [P2];
ffa00fb2:	80 64       	R0 += 0x10;		/* ( 16) */
ffa00fb4:	10 52       	R0 = R0 - R2;
ffa00fb6:	08 50       	R0 = R0 + R1;
ffa00fb8:	10 93       	[P2] = R0;
ffa00fba:	6a 2f       	JUMP.S 0xffa00e8e <_getRadioPacket+0x13e>;
ffa00fbc:	b8 e4 e7 ff 	R0 = B[FP + -0x19] (Z);
ffa00fc0:	00 0c       	CC = R0 == 0x0;
ffa00fc2:	74 1f       	IF CC JUMP 0xffa00eaa <_getRadioPacket+0x15a> (BP);
ffa00fc4:	e0 b9       	R0 = [FP -0x8];
ffa00fc6:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa00fca:	ff e3 7b fa 	CALL 0xffa004c0 <_radio_set_tx>;
ffa00fce:	24 00       	SSYNC;
ffa00fd0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cbc(-4191044) */
ffa00fd4:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00fd8:	79 e5 fa ff 	R1 = W[FP + -0xc] (X);
ffa00fdc:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc01508(-4188920) */
ffa00fe0:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa00fe4:	11 97       	W[P2] = R1;
ffa00fe6:	20 e1 a0 00 	R0 = 0xa0 (X);		/*		R0=0xa0(160) */
ffa00fea:	0d e1 0c 05 	P5.L = 0x50c;		/* (1292)	P5=0xffc0050c(-4193012) */
ffa00fee:	0c e1 cc 0c 	P4.L = 0xccc;		/* (3276)	P4=0xff900ccc <_g_outpkt> */
ffa00ff2:	28 97       	W[P5] = R0;
ffa00ff4:	5c 32       	P3 = P4;
ffa00ff6:	ff e3 e1 f8 	CALL 0xffa001b8 <_spi_delay>;
ffa00ffa:	03 6d       	P3 += 0x20;		/* ( 32) */
ffa00ffc:	00 00       	NOP;
ffa00ffe:	20 98       	R0 = B[P4++] (Z);
ffa01000:	28 97       	W[P5] = R0;
ffa01002:	ff e3 db f8 	CALL 0xffa001b8 <_spi_delay>;
ffa01006:	5c 08       	CC = P4 == P3;
ffa01008:	fa 17       	IF !CC JUMP 0xffa00ffc <_getRadioPacket+0x2ac> (BP);
ffa0100a:	c0 b9       	R0 = [FP -0x10];
ffa0100c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa01010:	50 4a       	BITSET (R0, 0xa);		/* bit 10 */
ffa01012:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa01016:	10 97       	W[P2] = R0;
ffa01018:	24 00       	SSYNC;
ffa0101a:	c2 6f       	P2 += -0x8;		/* ( -8) */
ffa0101c:	10 95       	R0 = W[P2] (Z);
ffa0101e:	a3 b9       	R3 = [FP -0x18];
ffa01020:	03 54       	R0 = R3 & R0;
ffa01022:	c0 42       	R0 = R0.L (Z);
ffa01024:	00 0c       	CC = R0 == 0x0;
ffa01026:	0c 18       	IF CC JUMP 0xffa0103e <_getRadioPacket+0x2ee>;
ffa01028:	6a 32       	P5 = P2;
ffa0102a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0102c:	ff e3 68 fe 	CALL 0xffa00cfc <_eth_listen>;
ffa01030:	28 95       	R0 = W[P5] (Z);
ffa01032:	79 e5 f6 ff 	R1 = W[FP + -0x14] (X);
ffa01036:	01 54       	R0 = R1 & R0;
ffa01038:	c0 42       	R0 = R0.L (Z);
ffa0103a:	00 0c       	CC = R0 == 0x0;
ffa0103c:	f7 17       	IF !CC JUMP 0xffa0102a <_getRadioPacket+0x2da> (BP);
ffa0103e:	e0 b9       	R0 = [FP -0x8];
ffa01040:	39 60       	R1 = 0x7 (X);		/*		R1=0x7(  7) */
ffa01042:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa01046:	ff e3 d5 f8 	CALL 0xffa001f0 <_spi_write_register>;
ffa0104a:	e0 b9       	R0 = [FP -0x8];
ffa0104c:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa01050:	ff e3 ec f9 	CALL 0xffa00428 <_radio_set_rx>;
ffa01054:	31 2f       	JUMP.S 0xffa00eb6 <_getRadioPacket+0x166>;
ffa01056:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa01058:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa0105a:	6f 2f       	JUMP.S 0xffa00f38 <_getRadioPacket+0x1e8>;

ffa0105c <_main>:
ffa0105c:	e3 05       	[--SP] = (R7:4, P5:3);
ffa0105e:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc00000(-4194304) */
ffa01062:	00 e8 05 00 	LINK 0x14;		/* (20) */
ffa01066:	0c e1 04 32 	P4.L = 0x3204;		/* (12804)	P4=0xffc03204(-4181500) */
ffa0106a:	20 e1 9c c1 	R0 = -0x3e64 (X);		/*		R0=0xffffc19c(-15972) */
ffa0106e:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00cec(-4190996) */
ffa01072:	20 97       	W[P4] = R0;
ffa01074:	08 e1 30 15 	P0.L = 0x1530;		/* (5424)	P0=0xffc01530(-4188880) */
ffa01078:	1a 60       	R2 = 0x3 (X);		/*		R2=0x3(  3) */
ffa0107a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa0107e:	02 97       	W[P0] = R2;
ffa01080:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa01082:	0a e1 14 32 	P2.L = 0x3214;		/* (12820)	P2=0xffc03214(-4181484) */
ffa01086:	10 97       	W[P2] = R0;
ffa01088:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03214(-4181484) */
ffa0108c:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa0108e:	0a e1 14 05 	P2.L = 0x514;		/* (1300)	P2=0xffc00514(-4193004) */
ffa01092:	10 97       	W[P2] = R0;
ffa01094:	20 e1 56 00 	R0 = 0x56 (X);		/*		R0=0x56( 86) */
ffa01098:	a2 6f       	P2 += -0xc;		/* (-12) */
ffa0109a:	10 97       	W[P2] = R0;
ffa0109c:	20 e1 2d 50 	R0 = 0x502d (X);		/*		R0=0x502d(20525) */
ffa010a0:	c2 6f       	P2 += -0x8;		/* ( -8) */
ffa010a2:	10 97       	W[P2] = R0;
ffa010a4:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa010a6:	22 6c       	P2 += 0x4;		/* (  4) */
ffa010a8:	11 97       	W[P2] = R1;
ffa010aa:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00000(-4194304) */
ffa010ae:	0d e1 04 04 	P5.L = 0x404;		/* (1028)	P5=0xffc00404(-4193276) */
ffa010b2:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00514(-4193004) */
ffa010b6:	29 97       	W[P5] = R1;
ffa010b8:	0a e1 10 04 	P2.L = 0x410;		/* (1040)	P2=0xffc00410(-4193264) */
ffa010bc:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00ca0(-4191072) */
ffa010c0:	09 e1 0c 04 	P1.L = 0x40c;		/* (1036)	P1=0xffc0040c(-4193268) */
ffa010c4:	11 97       	W[P2] = R1;
ffa010c6:	20 e1 80 00 	R0 = 0x80 (X);		/*		R0=0x80(128) */
ffa010ca:	08 97       	W[P1] = R0;
ffa010cc:	20 e1 88 00 	R0 = 0x88 (X);		/*		R0=0x88(136) */
ffa010d0:	82 6f       	P2 += -0x10;		/* (-16) */
ffa010d2:	10 97       	W[P2] = R0;
ffa010d4:	29 97       	W[P5] = R1;
ffa010d6:	0a 97       	W[P1] = R2;
ffa010d8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa010da:	22 6d       	P2 += 0x24;		/* ( 36) */
ffa010dc:	10 97       	W[P2] = R0;
ffa010de:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa010e0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900410 */
ffa010e4:	b8 4f       	R0 <<= 0x17;
ffa010e6:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_printf_temp> */
ffa010ea:	10 93       	[P2] = R0;
ffa010ec:	20 e1 01 e0 	R0 = -0x1fff (X);		/*		R0=0xffffe001(-8191) */
ffa010f0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_printf_temp> */
ffa010f4:	50 4f       	R0 <<= 0xa;
ffa010f6:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_printf_out> */
ffa010fa:	10 93       	[P2] = R0;
ffa010fc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ef0(-4190480) */
ffa01100:	0a e1 40 15 	P2.L = 0x1540;		/* (5440)	P2=0xffc01540(-4188864) */
ffa01104:	10 95       	R0 = W[P2] (Z);
ffa01106:	58 4c       	BITCLR (R0, 0xb);		/* bit 11 */
ffa01108:	10 97       	W[P2] = R0;
ffa0110a:	01 95       	R1 = W[P0] (Z);
ffa0110c:	20 e1 00 16 	R0 = 0x1600 (X);		/*		R0=0x1600(5632) */
ffa01110:	08 56       	R0 = R0 | R1;
ffa01112:	00 97       	W[P0] = R0;
ffa01114:	00 95       	R0 = W[P0] (Z);
ffa01116:	58 4c       	BITCLR (R0, 0xb);		/* bit 11 */
ffa01118:	00 97       	W[P0] = R0;
ffa0111a:	21 95       	R1 = W[P4] (Z);
ffa0111c:	20 e1 ff e1 	R0 = -0x1e01 (X);		/*		R0=0xffffe1ff(-7681) */
ffa01120:	08 54       	R0 = R0 & R1;
ffa01122:	20 97       	W[P4] = R0;
ffa01124:	42 6e       	P2 += -0x38;		/* (-56) */
ffa01126:	20 e1 00 14 	R0 = 0x1400 (X);		/*		R0=0x1400(5120) */
ffa0112a:	10 97       	W[P2] = R0;
ffa0112c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0112e:	00 e3 3f 07 	CALL 0xffa01fac <_udelay>;
ffa01132:	c0 61       	R0 = 0x38 (X);		/*		R0=0x38( 56) */
ffa01134:	ff e3 e6 fb 	CALL 0xffa00900 <_oled_write>;
ffa01138:	ff e3 6c fc 	CALL 0xffa00a10 <_oled_waitbusy>;
ffa0113c:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa0113e:	ff e3 e1 fb 	CALL 0xffa00900 <_oled_write>;
ffa01142:	ff e3 67 fc 	CALL 0xffa00a10 <_oled_waitbusy>;
ffa01146:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01148:	ff e3 dc fb 	CALL 0xffa00900 <_oled_write>;
ffa0114c:	ff e3 62 fc 	CALL 0xffa00a10 <_oled_waitbusy>;
ffa01150:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa01152:	ff e3 d7 fb 	CALL 0xffa00900 <_oled_write>;
ffa01156:	ff e3 5d fc 	CALL 0xffa00a10 <_oled_waitbusy>;
ffa0115a:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa0115c:	ff e3 d2 fb 	CALL 0xffa00900 <_oled_write>;
ffa01160:	ff e3 58 fc 	CALL 0xffa00a10 <_oled_waitbusy>;
ffa01164:	78 60       	R0 = 0xf (X);		/*		R0=0xf( 15) */
ffa01166:	ff e3 cd fb 	CALL 0xffa00900 <_oled_write>;
ffa0116a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000f(-7340017) */
ffa0116e:	21 e1 c4 02 	R1 = 0x2c4 (X);		/*		R1=0x2c4(708) */
ffa01172:	00 e1 7c 00 	R0.L = 0x7c;		/* (124)	R0=0xff90007c(-7339908) */
ffa01176:	00 e3 45 04 	CALL 0xffa01a00 <_printf_int>;
ffa0117a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90007c(-7339908) */
ffa0117e:	00 e1 84 00 	R0.L = 0x84;		/* (132)	R0=0xff900084(-7339900) */
ffa01182:	00 e3 e7 04 	CALL 0xffa01b50 <_printf_str>;
ffa01186:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900084(-7339900) */
ffa0118a:	00 e1 88 00 	R0.L = 0x88;		/* (136)	R0=0xff900088(-7339896) */
ffa0118e:	00 e3 e1 04 	CALL 0xffa01b50 <_printf_str>;
ffa01192:	49 e1 40 00 	P1.H = 0x40;		/* ( 64)	P1=0x40040c */
ffa01196:	02 68       	P2 = 0x0 (X);		/*		P2=0x0(  0) */
ffa01198:	22 e1 ca de 	R2 = -0x2136 (X);		/*		R2=0xffffdeca(-8502) */
ffa0119c:	23 e1 ad fb 	R3 = -0x453 (X);		/*		R3=0xfffffbad(-1107) */
ffa011a0:	20 e1 ed c0 	R0 = -0x3f13 (X);		/*		R0=0xffffc0ed(-16147) */
ffa011a4:	21 e1 be ba 	R1 = -0x4542 (X);		/*		R1=0xffffbabe(-17730) */
ffa011a8:	09 e1 00 00 	P1.L = 0x0;		/* (  0)	P1=0x400000 */
ffa011ac:	b2 e0 06 10 	LSETUP(0xffa011b0 <_main+0x154>, 0xffa011b8 <_main+0x15c>) LC1 = P1;
ffa011b0:	12 97       	W[P2] = R2;
ffa011b2:	53 b4       	W[P2 + 0x2] = R3;
ffa011b4:	90 b4       	W[P2 + 0x4] = R0;
ffa011b6:	d1 b4       	W[P2 + 0x6] = R1;
ffa011b8:	42 6c       	P2 += 0x8;		/* (  8) */
ffa011ba:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90c0ed(-7290643) */
ffa011be:	00 e1 9c 00 	R0.L = 0x9c;		/* (156)	R0=0xff90009c(-7339876) */
ffa011c2:	00 e3 c7 04 	CALL 0xffa01b50 <_printf_str>;
ffa011c6:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa011c8:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa011ca:	02 20       	JUMP.S 0xffa011ce <_main+0x172>;
ffa011cc:	45 6c       	P5 += 0x8;		/* (  8) */
ffa011ce:	2f 95       	R7 = W[P5] (Z);
ffa011d0:	80 e1 ca de 	R0 = 0xdeca (Z);		/*		R0=0xdeca(57034) */
ffa011d4:	07 08       	CC = R7 == R0;
ffa011d6:	15 1c       	IF CC JUMP 0xffa01200 <_main+0x1a4> (BP);
ffa011d8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90deca(-7282998) */
ffa011dc:	0e 30       	R1 = R6;
ffa011de:	00 e1 ac 00 	R0.L = 0xac;		/* (172)	R0=0xff9000ac(-7339860) */
ffa011e2:	00 e3 b3 03 	CALL 0xffa01948 <_printf_hex>;
ffa011e6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ac(-7339860) */
ffa011ea:	00 e1 b8 00 	R0.L = 0xb8;		/* (184)	R0=0xff9000b8(-7339848) */
ffa011ee:	0f 30       	R1 = R7;
ffa011f0:	00 e3 ac 03 	CALL 0xffa01948 <_printf_hex>;
ffa011f4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000b8(-7339848) */
ffa011f8:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa011fc:	00 e3 aa 04 	CALL 0xffa01b50 <_printf_str>;
ffa01200:	81 e1 ad fb 	R1 = 0xfbad (Z);		/*		R1=0xfbad(64429) */
ffa01204:	68 a4       	R0 = W[P5 + 0x2] (Z);
ffa01206:	08 08       	CC = R0 == R1;
ffa01208:	08 1c       	IF CC JUMP 0xffa01218 <_main+0x1bc> (BP);
ffa0120a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900820(-7337952) */
ffa0120e:	00 e1 ac 00 	R0.L = 0xac;		/* (172)	R0=0xff9000ac(-7339860) */
ffa01212:	0e 30       	R1 = R6;
ffa01214:	00 e3 9a 03 	CALL 0xffa01948 <_printf_hex>;
ffa01218:	81 e1 ed c0 	R1 = 0xc0ed (Z);		/*		R1=0xc0ed(49389) */
ffa0121c:	a8 a4       	R0 = W[P5 + 0x4] (Z);
ffa0121e:	08 08       	CC = R0 == R1;
ffa01220:	08 1c       	IF CC JUMP 0xffa01230 <_main+0x1d4> (BP);
ffa01222:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ac(-7339860) */
ffa01226:	00 e1 ac 00 	R0.L = 0xac;		/* (172)	R0=0xff9000ac(-7339860) */
ffa0122a:	0e 30       	R1 = R6;
ffa0122c:	00 e3 8e 03 	CALL 0xffa01948 <_printf_hex>;
ffa01230:	81 e1 be ba 	R1 = 0xbabe (Z);		/*		R1=0xbabe(47806) */
ffa01234:	e8 a4       	R0 = W[P5 + 0x6] (Z);
ffa01236:	08 08       	CC = R0 == R1;
ffa01238:	08 1c       	IF CC JUMP 0xffa01248 <_main+0x1ec> (BP);
ffa0123a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ac(-7339860) */
ffa0123e:	00 e1 ac 00 	R0.L = 0xac;		/* (172)	R0=0xff9000ac(-7339860) */
ffa01242:	0e 30       	R1 = R6;
ffa01244:	00 e3 82 03 	CALL 0xffa01948 <_printf_hex>;
ffa01248:	4a e1 ff 01 	P2.H = 0x1ff;		/* (511)	P2=0x1ff0000 */
ffa0124c:	0a e1 f8 ff 	P2.L = 0xfff8;		/* ( -8)	P2=0x1fffff8 */
ffa01250:	0e 64       	R6 += 0x1;		/* (  1) */
ffa01252:	55 08       	CC = P5 == P2;
ffa01254:	bc 17       	IF !CC JUMP 0xffa011cc <_main+0x170> (BP);
ffa01256:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ac(-7339860) */
ffa0125a:	00 e1 c0 00 	R0.L = 0xc0;		/* (192)	R0=0xff9000c0(-7339840) */
ffa0125e:	00 e3 79 04 	CALL 0xffa01b50 <_printf_str>;
ffa01262:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000c0(-7339840) */
ffa01266:	00 e1 d0 00 	R0.L = 0xd0;		/* (208)	R0=0xff9000d0(-7339824) */
ffa0126a:	00 e3 73 04 	CALL 0xffa01b50 <_printf_str>;
ffa0126e:	00 e3 71 0f 	CALL 0xffa03150 <_bfin_EMAC_init>;
ffa01272:	f0 bb       	[FP -0x4] = R0;
ffa01274:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000d0(-7339824) */
ffa01278:	00 e1 e0 00 	R0.L = 0xe0;		/* (224)	R0=0xff9000e0(-7339808) */
ffa0127c:	00 e3 6a 04 	CALL 0xffa01b50 <_printf_str>;
ffa01280:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000e0(-7339808) */
ffa01284:	00 e1 ec 00 	R0.L = 0xec;		/* (236)	R0=0xff9000ec(-7339796) */
ffa01288:	f1 b9       	R1 = [FP -0x4];
ffa0128a:	00 e3 bb 03 	CALL 0xffa01a00 <_printf_int>;
ffa0128e:	f0 b9       	R0 = [FP -0x4];
ffa01290:	00 0c       	CC = R0 == 0x0;
ffa01292:	95 19       	IF CC JUMP 0xffa015bc <_main+0x560>;
ffa01294:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ec(-7339796) */
ffa01298:	00 e1 f0 00 	R0.L = 0xf0;		/* (240)	R0=0xff9000f0(-7339792) */
ffa0129c:	00 e3 5a 04 	CALL 0xffa01b50 <_printf_str>;
ffa012a0:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa012a4:	0d e1 70 0f 	P5.L = 0xf70;		/* (3952)	P5=0xff900f70 <_NetOurIP> */
ffa012a8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000f0(-7339792) */
ffa012ac:	29 99       	R1 = B[P5] (Z);
ffa012ae:	00 e1 ec 00 	R0.L = 0xec;		/* (236)	R0=0xff9000ec(-7339796) */
ffa012b2:	00 e3 a7 03 	CALL 0xffa01a00 <_printf_int>;
ffa012b6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000ec(-7339796) */
ffa012ba:	a9 e4 01 00 	R1 = B[P5 + 0x1] (Z);
ffa012be:	00 e1 00 01 	R0.L = 0x100;		/* (256)	R0=0xff900100(-7339776) */
ffa012c2:	00 e3 9f 03 	CALL 0xffa01a00 <_printf_int>;
ffa012c6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900100(-7339776) */
ffa012ca:	a9 e4 02 00 	R1 = B[P5 + 0x2] (Z);
ffa012ce:	00 e1 00 01 	R0.L = 0x100;		/* (256)	R0=0xff900100(-7339776) */
ffa012d2:	00 e3 97 03 	CALL 0xffa01a00 <_printf_int>;
ffa012d6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900100(-7339776) */
ffa012da:	a9 e4 03 00 	R1 = B[P5 + 0x3] (Z);
ffa012de:	00 e1 00 01 	R0.L = 0x100;		/* (256)	R0=0xff900100(-7339776) */
ffa012e2:	00 e3 8f 03 	CALL 0xffa01a00 <_printf_int>;
ffa012e6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900100(-7339776) */
ffa012ea:	00 e1 04 01 	R0.L = 0x104;		/* (260)	R0=0xff900104(-7339772) */
ffa012ee:	00 e3 31 04 	CALL 0xffa01b50 <_printf_str>;
ffa012f2:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0fff8(-4128776) */
ffa012f6:	20 e1 83 38 	R0 = 0x3883 (X);		/*		R0=0x3883(14467) */
ffa012fa:	0a e1 00 32 	P2.L = 0x3200;		/* (12800)	P2=0xffc03200(-4181504) */
ffa012fe:	10 97       	W[P2] = R0;
ffa01300:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03200(-4181504) */
ffa01304:	20 e1 56 fe 	R0 = -0x1aa (X);		/*		R0=0xfffffe56(-426) */
ffa01308:	0a e1 30 07 	P2.L = 0x730;		/* (1840)	P2=0xffc00730(-4192464) */
ffa0130c:	10 97       	W[P2] = R0;
ffa0130e:	20 e1 ab 01 	R0 = 0x1ab (X);		/*		R0=0x1ab(427) */
ffa01312:	82 6c       	P2 += 0x10;		/* ( 16) */
ffa01314:	10 97       	W[P2] = R0;
ffa01316:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00730(-4192464) */
ffa0131a:	20 e1 40 01 	R0 = 0x140 (X);		/*		R0=0x140(320) */
ffa0131e:	0a e1 10 32 	P2.L = 0x3210;		/* (12816)	P2=0xffc03210(-4181488) */
ffa01322:	10 97       	W[P2] = R0;
ffa01324:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03210(-4181488) */
ffa01328:	0a e1 40 15 	P2.L = 0x1540;		/* (5440)	P2=0xffc01540(-4188864) */
ffa0132c:	10 95       	R0 = W[P2] (Z);
ffa0132e:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa01330:	10 97       	W[P2] = R0;
ffa01332:	82 6f       	P2 += -0x10;		/* (-16) */
ffa01334:	10 95       	R0 = W[P2] (Z);
ffa01336:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa01338:	10 97       	W[P2] = R0;
ffa0133a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01540(-4188864) */
ffa0133e:	0a e1 04 32 	P2.L = 0x3204;		/* (12804)	P2=0xffc03204(-4181500) */
ffa01342:	10 95       	R0 = W[P2] (Z);
ffa01344:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa01346:	10 97       	W[P2] = R0;
ffa01348:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00000(-4194304) */
ffa0134c:	09 e1 00 09 	P1.L = 0x900;		/* (2304)	P1=0xffc00900(-4192000) */
ffa01350:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01352:	08 97       	W[P1] = R0;
ffa01354:	24 00       	SSYNC;
ffa01356:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903204 */
ffa0135a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0135c:	0a e1 c0 0c 	P2.L = 0xcc0;		/* (3264)	P2=0xff900cc0 <_g_sampR> */
ffa01360:	10 93       	[P2] = R0;
ffa01362:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cc0 <_g_sampR> */
ffa01366:	0a e1 a4 0c 	P2.L = 0xca4;		/* (3236)	P2=0xff900ca4 <_g_sampW> */
ffa0136a:	10 93       	[P2] = R0;
ffa0136c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca4 <_g_sampW> */
ffa01370:	0a e1 c8 0c 	P2.L = 0xcc8;		/* (3272)	P2=0xff900cc8 <_g_sampOff> */
ffa01374:	10 93       	[P2] = R0;
ffa01376:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cc8 <_g_sampOff> */
ffa0137a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0137c:	0a e1 98 0c 	P2.L = 0xc98;		/* (3224)	P2=0xff900c98 <_g_sampMode> */
ffa01380:	10 9b       	B[P2] = R0;
ffa01382:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01384:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c98 <_g_sampMode> */
ffa01388:	d8 4f       	R0 <<= 0x1b;
ffa0138a:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xff900ca8 <_g_sampInc> */
ffa0138e:	10 93       	[P2] = R0;
ffa01390:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca8 <_g_sampInc> */
ffa01394:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01396:	0a e1 b8 0c 	P2.L = 0xcb8;		/* (3256)	P2=0xff900cb8 <_g_sampCh> */
ffa0139a:	10 9b       	B[P2] = R0;
ffa0139c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cb8(-4191048) */
ffa013a0:	e8 60       	R0 = 0x1d (X);		/*		R0=0x1d( 29) */
ffa013a2:	0a e1 08 09 	P2.L = 0x908;		/* (2312)	P2=0xffc00908(-4191992) */
ffa013a6:	10 97       	W[P2] = R0;
ffa013a8:	f8 60       	R0 = 0x1f (X);		/*		R0=0x1f( 31) */
ffa013aa:	22 6c       	P2 += 0x4;		/* (  4) */
ffa013ac:	10 97       	W[P2] = R0;
ffa013ae:	b8 60       	R0 = 0x17 (X);		/*		R0=0x17( 23) */
ffa013b0:	c2 6f       	P2 += -0x8;		/* ( -8) */
ffa013b2:	10 97       	W[P2] = R0;
ffa013b4:	20 e1 03 4e 	R0 = 0x4e03 (X);		/*		R0=0x4e03(19971) */
ffa013b8:	08 97       	W[P1] = R0;
ffa013ba:	40 e1 a0 ff 	R0.H = 0xffa0;		/* (-96)	R0=0xffa04e03(-6271485) */
ffa013be:	4a e1 e0 ff 	P2.H = 0xffe0;		/* (-32)	P2=0xffe00908(-2094840) */
ffa013c2:	00 e1 5c 07 	R0.L = 0x75c;		/* (1884)	R0=0xffa0075c <_audio_out>(-6289572) */
ffa013c6:	0a e1 1c 20 	P2.L = 0x201c;		/* (8220)	P2=0xffe0201c(-2088932) */
ffa013ca:	10 93       	[P2] = R0;
ffa013cc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0201c(-4186084) */
ffa013d0:	0a e1 0c 01 	P2.L = 0x10c;		/* (268)	P2=0xffc0010c(-4194036) */
ffa013d4:	10 91       	R0 = [P2];
ffa013d6:	48 4a       	BITSET (R0, 0x9);		/* bit  9 */
ffa013d8:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f70 <_NetOurIP> */
ffa013dc:	10 93       	[P2] = R0;
ffa013de:	0d e1 8c 0c 	P5.L = 0xc8c;		/* (3212)	P5=0xff900c8c <_g_radioChan> */
ffa013e2:	24 e1 00 01 	R4 = 0x100 (X);		/*		R4=0x100(256) */
ffa013e6:	2c e1 00 80 	P4 = -0x8000 (X);		/*		P4=0xffff8000(-32768) */
ffa013ea:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90075c(-7338148) */
ffa013ee:	00 e1 08 01 	R0.L = 0x108;		/* (264)	R0=0xff900108(-7339768) */
ffa013f2:	00 e3 af 03 	CALL 0xffa01b50 <_printf_str>;
ffa013f6:	00 e3 05 10 	CALL 0xffa03400 <_bridge_publish>;
ffa013fa:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90010c */
ffa013fe:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa01400:	0a e1 a0 0c 	P2.L = 0xca0;		/* (3232)	P2=0xff900ca0 <_wrptr> */
ffa01404:	16 93       	[P2] = R6;
ffa01406:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca0 <_wrptr> */
ffa0140a:	0a e1 9c 0c 	P2.L = 0xc9c;		/* (3228)	P2=0xff900c9c <_trptr> */
ffa0140e:	16 93       	[P2] = R6;
ffa01410:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c9c <_trptr> */
ffa01414:	0a e1 bc 0c 	P2.L = 0xcbc;		/* (3260)	P2=0xff900cbc <_g_dropped> */
ffa01418:	16 93       	[P2] = R6;
ffa0141a:	40 43       	R0 = R0.B (Z);
ffa0141c:	28 93       	[P5] = R0;
ffa0141e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cbc <_g_dropped> */
ffa01422:	0a e1 94 0c 	P2.L = 0xc94;		/* (3220)	P2=0xff900c94 <_g_nextFlag> */
ffa01426:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900108(-7339768) */
ffa0142a:	16 93       	[P2] = R6;
ffa0142c:	00 e1 1c 01 	R0.L = 0x11c;		/* (284)	R0=0xff90011c(-7339748) */
ffa01430:	00 e3 90 03 	CALL 0xffa01b50 <_printf_str>;
ffa01434:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c94(-4191084) */
ffa01438:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa0143c:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa01440:	10 97       	W[P2] = R0;
ffa01442:	20 e1 50 02 	R0 = 0x250 (X);		/*		R0=0x250(592) */
ffa01446:	22 6c       	P2 += 0x4;		/* (  4) */
ffa01448:	10 97       	W[P2] = R0;
ffa0144a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa0144e:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa01450:	0a e1 08 15 	P2.L = 0x1508;		/* (5384)	P2=0xffc01508(-4188920) */
ffa01454:	10 97       	W[P2] = R0;
ffa01456:	24 00       	SSYNC;
ffa01458:	27 e1 7f 00 	R7 = 0x7f (X);		/*		R7=0x7f(127) */
ffa0145c:	2a 99       	R2 = B[P5] (Z);
ffa0145e:	ba 54       	R2 = R2 & R7;
ffa01460:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa01462:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa01464:	ff e3 b4 f8 	CALL 0xffa005cc <_radio_init>;
ffa01468:	2a 99       	R2 = B[P5] (Z);
ffa0146a:	ba 54       	R2 = R2 & R7;
ffa0146c:	01 61       	R1 = 0x20 (X);		/*		R1=0x20( 32) */
ffa0146e:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa01472:	ff e3 ad f8 	CALL 0xffa005cc <_radio_init>;
ffa01476:	2a 99       	R2 = B[P5] (Z);
ffa01478:	ba 54       	R2 = R2 & R7;
ffa0147a:	21 e1 00 01 	R1 = 0x100 (X);		/*		R1=0x100(256) */
ffa0147e:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa01482:	ff e3 a5 f8 	CALL 0xffa005cc <_radio_init>;
ffa01486:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901508 */
ffa0148a:	0a e1 c0 0c 	P2.L = 0xcc0;		/* (3264)	P2=0xff900cc0 <_g_sampR> */
ffa0148e:	16 93       	[P2] = R6;
ffa01490:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cc0 <_g_sampR> */
ffa01494:	0a e1 a4 0c 	P2.L = 0xca4;		/* (3236)	P2=0xff900ca4 <_g_sampW> */
ffa01498:	16 93       	[P2] = R6;
ffa0149a:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa0149c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0149e:	ff e3 c5 f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa014a2:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa014a6:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa014a8:	ff e3 c0 f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa014ac:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa014b0:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa014b4:	ff e3 ba f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa014b8:	28 91       	R0 = [P5];
ffa014ba:	38 4e       	R0 >>= 0x7;
ffa014bc:	00 4b       	BITTGL (R0, 0x0);		/* bit  0 */
ffa014be:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc00ca4(-4191068) */
ffa014c2:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa014c4:	05 60       	R5 = 0x0 (X);		/*		R5=0x0(  0) */
ffa014c6:	46 43       	R6 = R0.B (Z);
ffa014c8:	0b e1 0c 07 	P3.L = 0x70c;		/* (1804)	P3=0xffc0070c(-4192500) */
ffa014cc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ca4 <_g_sampW> */
ffa014d0:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa014d4:	10 99       	R0 = B[P2] (Z);
ffa014d6:	00 0c       	CC = R0 == 0x0;
ffa014d8:	89 1f       	IF CC JUMP 0xffa013ea <_main+0x38e> (BP);
ffa014da:	f0 b9       	R0 = [FP -0x4];
ffa014dc:	ff e3 10 fc 	CALL 0xffa00cfc <_eth_listen>;
ffa014e0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cc4(-4191036) */
ffa014e4:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014e8:	10 95       	R0 = W[P2] (Z);
ffa014ea:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa014ec:	01 54       	R0 = R1 & R0;
ffa014ee:	00 0c       	CC = R0 == 0x0;
ffa014f0:	3f 18       	IF CC JUMP 0xffa0156e <_main+0x512>;
ffa014f2:	00 00       	NOP;
ffa014f4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa014f8:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014fc:	10 95       	R0 = W[P2] (Z);
ffa014fe:	28 48       	CC = !BITTST (R0, 0x5);		/* bit  5 */
ffa01500:	44 18       	IF CC JUMP 0xffa01588 <_main+0x52c>;
ffa01502:	00 00       	NOP;
ffa01504:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa01508:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa0150c:	10 95       	R0 = W[P2] (Z);
ffa0150e:	04 54       	R0 = R4 & R0;
ffa01510:	00 0c       	CC = R0 == 0x0;
ffa01512:	4b 18       	IF CC JUMP 0xffa015a8 <_main+0x54c>;
ffa01514:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa01518:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa0151c:	21 e1 28 01 	R1 = 0x128 (X);		/*		R1=0x128(296) */
ffa01520:	10 95       	R0 = W[P2] (Z);
ffa01522:	01 54       	R0 = R1 & R0;
ffa01524:	08 08       	CC = R0 == R1;
ffa01526:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01528:	38 07       	IF CC R7 = R0;
ffa0152a:	20 e1 50 02 	R0 = 0x250 (X);		/*		R0=0x250(592) */
ffa0152e:	42 6c       	P2 += 0x8;		/* (  8) */
ffa01530:	10 97       	W[P2] = R0;
ffa01532:	ff e3 3b f6 	CALL 0xffa001a8 <_ustimer>;
ffa01536:	08 4e       	R0 >>= 0x1;
ffa01538:	21 e1 81 f7 	R1 = -0x87f (X);		/*		R1=0xfffff781(-2175) */
ffa0153c:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa01540:	41 e1 0b e5 	R1.H = 0xe50b;		/* (-6901)	R1=0xe50bf781(-452200575) */
ffa01544:	01 e1 81 f7 	R1.L = 0xf781;		/* (-2175)	R1=0xe50bf781(-452200575) */
ffa01548:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0154c:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa01550:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa01554:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa01558:	0b c4 3f 80 	A0 += A1;
ffa0155c:	8b c0 00 38 	R0 = A0 (FU);
ffa01560:	58 4e       	R0 >>= 0xb;
ffa01562:	28 08       	CC = R0 == R5;
ffa01564:	b4 1b       	IF CC JUMP 0xffa014cc <_main+0x470>;
ffa01566:	4c 30       	R1 = P4;
ffa01568:	19 97       	W[P3] = R1;
ffa0156a:	28 30       	R5 = R0;
ffa0156c:	b0 2f       	JUMP.S 0xffa014cc <_main+0x470>;
ffa0156e:	7a 43       	R2 = R7.B (Z);
ffa01570:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa01572:	f6 b0       	[SP + 0xc] = R6;
ffa01574:	ff e3 ee fb 	CALL 0xffa00d50 <_getRadioPacket>;
ffa01578:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa0157c:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa01580:	10 95       	R0 = W[P2] (Z);
ffa01582:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa01584:	28 48       	CC = !BITTST (R0, 0x5);		/* bit  5 */
ffa01586:	bf 17       	IF !CC JUMP 0xffa01504 <_main+0x4a8> (BP);
ffa01588:	7a 43       	R2 = R7.B (Z);
ffa0158a:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa0158e:	f6 b0       	[SP + 0xc] = R6;
ffa01590:	01 61       	R1 = 0x20 (X);		/*		R1=0x20( 32) */
ffa01592:	ff e3 df fb 	CALL 0xffa00d50 <_getRadioPacket>;
ffa01596:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa0159a:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa0159e:	10 95       	R0 = W[P2] (Z);
ffa015a0:	04 54       	R0 = R4 & R0;
ffa015a2:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa015a4:	00 0c       	CC = R0 == 0x0;
ffa015a6:	b7 17       	IF !CC JUMP 0xffa01514 <_main+0x4b8> (BP);
ffa015a8:	7a 43       	R2 = R7.B (Z);
ffa015aa:	f6 b0       	[SP + 0xc] = R6;
ffa015ac:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa015b0:	21 e1 00 01 	R1 = 0x100 (X);		/*		R1=0x100(256) */
ffa015b4:	ff e3 ce fb 	CALL 0xffa00d50 <_getRadioPacket>;
ffa015b8:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa015ba:	ad 2f       	JUMP.S 0xffa01514 <_main+0x4b8>;
ffa015bc:	00 e3 64 10 	CALL 0xffa03684 <_DHCP_req>;
ffa015c0:	6a 2e       	JUMP.S 0xffa01294 <_main+0x238>;
	...

ffa015c4 <___divsi3>:
ffa015c4:	c8 58       	R3 = R0 ^ R1;
ffa015c6:	07 c4 00 80 	R0 = ABS R0;
ffa015ca:	18 03       	CC = V;
ffa015cc:	82 c6 fb c7 	R3 = ROT R3 BY -0x1;
ffa015d0:	07 c4 08 82 	R1 = ABS R1;
ffa015d4:	88 08       	CC = R0 < R1;
ffa015d6:	76 18       	IF CC JUMP 0xffa016c2 <___divsi3+0xfe>;
ffa015d8:	82 c6 89 85 	R2 = R1 >> 0xf;
ffa015dc:	0a 02       	CC = R2;
ffa015de:	1e 18       	IF CC JUMP 0xffa0161a <___divsi3+0x56>;
ffa015e0:	82 c6 81 84 	R2 = R1 << 0x10;
ffa015e4:	02 09       	CC = R2 <= R0;
ffa015e6:	1a 18       	IF CC JUMP 0xffa0161a <___divsi3+0x56>;
ffa015e8:	48 42       	DIVS (R0, R1);
ffa015ea:	08 42       	DIVQ (R0, R1);
ffa015ec:	08 42       	DIVQ (R0, R1);
ffa015ee:	08 42       	DIVQ (R0, R1);
ffa015f0:	08 42       	DIVQ (R0, R1);
ffa015f2:	08 42       	DIVQ (R0, R1);
ffa015f4:	08 42       	DIVQ (R0, R1);
ffa015f6:	08 42       	DIVQ (R0, R1);
ffa015f8:	08 42       	DIVQ (R0, R1);
ffa015fa:	08 42       	DIVQ (R0, R1);
ffa015fc:	08 42       	DIVQ (R0, R1);
ffa015fe:	08 42       	DIVQ (R0, R1);
ffa01600:	08 42       	DIVQ (R0, R1);
ffa01602:	08 42       	DIVQ (R0, R1);
ffa01604:	08 42       	DIVQ (R0, R1);
ffa01606:	08 42       	DIVQ (R0, R1);
ffa01608:	08 42       	DIVQ (R0, R1);
ffa0160a:	c0 42       	R0 = R0.L (Z);
ffa0160c:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa01610:	08 50       	R0 = R0 + R1;
ffa01612:	81 43       	R1 = -R0;
ffa01614:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa01616:	01 07       	IF CC R0 = R1;
ffa01618:	10 00       	RTS;
ffa0161a:	01 0c       	CC = R1 == 0x0;
ffa0161c:	34 18       	IF CC JUMP 0xffa01684 <___divsi3+0xc0>;
ffa0161e:	00 0c       	CC = R0 == 0x0;
ffa01620:	3f 18       	IF CC JUMP 0xffa0169e <___divsi3+0xda>;
ffa01622:	08 08       	CC = R0 == R1;
ffa01624:	30 18       	IF CC JUMP 0xffa01684 <___divsi3+0xc0>;
ffa01626:	09 0c       	CC = R1 == 0x1;
ffa01628:	2e 18       	IF CC JUMP 0xffa01684 <___divsi3+0xc0>;
ffa0162a:	06 c6 01 c4 	R2.L = ONES R1;
ffa0162e:	d2 42       	R2 = R2.L (Z);
ffa01630:	0a 0c       	CC = R2 == 0x1;
ffa01632:	37 18       	IF CC JUMP 0xffa016a0 <___divsi3+0xdc>;
ffa01634:	f9 68       	P1 = 0x1f (X);		/*		P1=0x1f( 31) */
ffa01636:	68 05       	[--SP] = (R7:5);
ffa01638:	8a 43       	R2 = -R1;
ffa0163a:	42 01       	[--SP] = R2;
ffa0163c:	82 c6 08 84 	R2 = R0 << 0x1;
ffa01640:	88 59       	R6 = R0 ^ R1;
ffa01642:	82 c6 0e 8b 	R5 = R6 >> 0x1f;
ffa01646:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01648:	aa 56       	R2 = R2 | R5;
ffa0164a:	88 59       	R6 = R0 ^ R1;
ffa0164c:	a2 e0 12 10 	LSETUP(0xffa01650 <___divsi3+0x8c>, 0xffa01670 <___divsi3+0xac>) LC0 = P1;
ffa01650:	82 c6 0a 8f 	R7 = R2 >> 0x1f;
ffa01654:	82 c6 0a 84 	R2 = R2 << 0x1;
ffa01658:	82 ce 08 80 	R0 = R0 << 0x1 || R5 = [SP] || NOP;
ffa0165c:	35 91 00 00 
ffa01660:	38 56       	R0 = R0 | R7;
ffa01662:	86 0c       	CC = R6 < 0x0;
ffa01664:	29 07       	IF CC R5 = R1;
ffa01666:	28 50       	R0 = R0 + R5;
ffa01668:	88 59       	R6 = R0 ^ R1;
ffa0166a:	82 c6 0e 8b 	R5 = R6 >> 0x1f;
ffa0166e:	05 4b       	BITTGL (R5, 0x0);		/* bit  0 */
ffa01670:	aa 50       	R2 = R2 + R5;
ffa01672:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa01676:	8a 50       	R2 = R2 + R1;
ffa01678:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa0167a:	90 43       	R0 = -R2;
ffa0167c:	02 06       	IF !CC R0 = R2;
ffa0167e:	26 6c       	SP += 0x4;		/* (  4) */
ffa01680:	28 05       	(R7:5) = [SP++];
ffa01682:	10 00       	RTS;
ffa01684:	01 0c       	CC = R1 == 0x0;
ffa01686:	fa 63       	R2 = -0x1 (X);		/*		R2=0xffffffff( -1) */
ffa01688:	0a 4e       	R2 >>= 0x1;
ffa0168a:	06 18       	IF CC JUMP 0xffa01696 <___divsi3+0xd2>;
ffa0168c:	08 08       	CC = R0 == R1;
ffa0168e:	82 e1 01 00 	R2 = 0x1 (Z);		/*		R2=0x1(  1) */
ffa01692:	02 18       	IF CC JUMP 0xffa01696 <___divsi3+0xd2>;
ffa01694:	10 30       	R2 = R0;
ffa01696:	02 30       	R0 = R2;
ffa01698:	92 43       	R2 = -R2;
ffa0169a:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa0169c:	02 07       	IF CC R0 = R2;
ffa0169e:	10 00       	RTS;
ffa016a0:	82 c6 08 85 	R2 = R0 >> 0x1f;
ffa016a4:	81 0c       	CC = R1 < 0x0;
ffa016a6:	f8 1b       	IF CC JUMP 0xffa01696 <___divsi3+0xd2>;
ffa016a8:	05 c6 01 02 	R1.L = SIGNBITS R1;
ffa016ac:	c9 42       	R1 = R1.L (Z);
ffa016ae:	11 67       	R1 += -0x1e;		/* (-30) */
ffa016b0:	02 c6 08 80 	R0 = LSHIFT R0 BY R1.L;
ffa016b4:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa016b8:	08 50       	R0 = R0 + R1;
ffa016ba:	82 43       	R2 = -R0;
ffa016bc:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa016be:	02 07       	IF CC R0 = R2;
ffa016c0:	10 00       	RTS;
ffa016c2:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa016c4:	10 00       	RTS;
	...

ffa016c8 <_uart_str>:
ffa016c8:	e3 05       	[--SP] = (R7:4, P5:3);
ffa016ca:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa016ce:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa016d2:	20 32       	P4 = R0;
ffa016d4:	0a e1 24 04 	P2.L = 0x424;		/* (1060)	P2=0xffc00424(-4193244) */
ffa016d8:	10 95       	R0 = W[P2] (Z);
ffa016da:	c0 42       	R0 = R0.L (Z);
ffa016dc:	08 0c       	CC = R0 == 0x1;
ffa016de:	71 18       	IF CC JUMP 0xffa017c0 <_uart_str+0xf8>;
ffa016e0:	00 00       	NOP;
ffa016e2:	00 00       	NOP;
ffa016e4:	00 00       	NOP;
ffa016e6:	63 99       	R3 = B[P4] (X);
ffa016e8:	08 61       	R0 = 0x21 (X);		/*		R0=0x21( 33) */
ffa016ea:	03 08       	CC = R3 == R0;
ffa016ec:	07 18       	IF CC JUMP 0xffa016fa <_uart_str+0x32>;
ffa016ee:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa016f0:	06 30       	R0 = R6;
ffa016f2:	01 e8 00 00 	UNLINK;
ffa016f6:	a3 05       	(R7:4, P5:3) = [SP++];
ffa016f8:	10 00       	RTS;
ffa016fa:	a2 e5 01 00 	R2 = B[P4 + 0x1] (X);
ffa016fe:	17 43       	R7 = R2.B (X);
ffa01700:	07 0c       	CC = R7 == 0x0;
ffa01702:	f6 1b       	IF CC JUMP 0xffa016ee <_uart_str+0x26>;
ffa01704:	6c 32       	P5 = P4;
ffa01706:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff908000 */
ffa0170a:	15 6c       	P5 += 0x2;		/* (  2) */
ffa0170c:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa0170e:	24 e1 bf ff 	R4 = -0x41 (X);		/*		R4=0xffffffbf(-65) */
ffa01712:	25 e1 9f ff 	R5 = -0x61 (X);		/*		R5=0xffffff9f(-97) */
ffa01716:	0c e1 90 0c 	P4.L = 0xc90;		/* (3216)	P4=0xff900c90 <__bss_start> */
ffa0171a:	2b e1 80 ff 	P3 = -0x80 (X);		/*		P3=0xffffff80(-128) */
ffa0171e:	2c 20       	JUMP.S 0xffa01776 <_uart_str+0xae>;
ffa01720:	68 60       	R0 = 0xd (X);		/*		R0=0xd( 13) */
ffa01722:	07 08       	CC = R7 == R0;
ffa01724:	35 18       	IF CC JUMP 0xffa0178e <_uart_str+0xc6>;
ffa01726:	22 50       	R0 = R2 + R4;
ffa01728:	40 43       	R0 = R0.B (Z);
ffa0172a:	c9 60       	R1 = 0x19 (X);		/*		R1=0x19( 25) */
ffa0172c:	08 0a       	CC = R0 <= R1 (IU);
ffa0172e:	37 1c       	IF CC JUMP 0xffa0179c <_uart_str+0xd4> (BP);
ffa01730:	03 61       	R3 = 0x20 (X);		/*		R3=0x20( 32) */
ffa01732:	15 50       	R0 = R5 + R2;
ffa01734:	40 43       	R0 = R0.B (Z);
ffa01736:	c9 60       	R1 = 0x19 (X);		/*		R1=0x19( 25) */
ffa01738:	08 0a       	CC = R0 <= R1 (IU);
ffa0173a:	02 30       	R0 = R2;
ffa0173c:	11 43       	R1 = R2.B (X);
ffa0173e:	80 66       	R0 += -0x30;		/* (-48) */
ffa01740:	19 07       	IF CC R3 = R1;
ffa01742:	40 43       	R0 = R0.B (Z);
ffa01744:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01746:	10 0a       	CC = R0 <= R2 (IU);
ffa01748:	19 07       	IF CC R3 = R1;
ffa0174a:	60 61       	R0 = 0x2c (X);		/*		R0=0x2c( 44) */
ffa0174c:	07 08       	CC = R7 == R0;
ffa0174e:	2f 18       	IF CC JUMP 0xffa017ac <_uart_str+0xe4>;
ffa01750:	09 61       	R1 = 0x21 (X);		/*		R1=0x21( 33) */
ffa01752:	0f 08       	CC = R7 == R1;
ffa01754:	26 18       	IF CC JUMP 0xffa017a0 <_uart_str+0xd8>;
ffa01756:	fa 61       	R2 = 0x3f (X);		/*		R2=0x3f( 63) */
ffa01758:	17 08       	CC = R7 == R2;
ffa0175a:	88 10       	IF !CC JUMP 0xffa0186a <_uart_str+0x1a2>;
ffa0175c:	20 e1 3f 02 	R0 = 0x23f (X);		/*		R0=0x23f(575) */
ffa01760:	ff e3 d0 f8 	CALL 0xffa00900 <_oled_write>;
ffa01764:	6a 98       	R2 = B[P5++] (X);
ffa01766:	17 43       	R7 = R2.B (X);
ffa01768:	0e 64       	R6 += 0x1;		/* (  1) */
ffa0176a:	07 0c       	CC = R7 == 0x0;
ffa0176c:	c2 1b       	IF CC JUMP 0xffa016f0 <_uart_str+0x28>;
ffa0176e:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa01772:	06 08       	CC = R6 == R0;
ffa01774:	be 1b       	IF CC JUMP 0xffa016f0 <_uart_str+0x28>;
ffa01776:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01778:	0f 08       	CC = R7 == R1;
ffa0177a:	d3 17       	IF !CC JUMP 0xffa01720 <_uart_str+0x58> (BP);
ffa0177c:	20 99       	R0 = B[P4] (Z);
ffa0177e:	30 48       	CC = !BITTST (R0, 0x6);		/* bit  6 */
ffa01780:	18 1c       	IF CC JUMP 0xffa017b0 <_uart_str+0xe8> (BP);
ffa01782:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900424 */
ffa01786:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01788:	0a e1 90 0c 	P2.L = 0xc90;		/* (3216)	P2=0xff900c90 <__bss_start> */
ffa0178c:	10 9b       	B[P2] = R0;
ffa0178e:	60 99       	R0 = B[P4] (X);
ffa01790:	4b 30       	R1 = P3;
ffa01792:	08 56       	R0 = R0 | R1;
ffa01794:	40 43       	R0 = R0.B (Z);
ffa01796:	ff e3 b5 f8 	CALL 0xffa00900 <_oled_write>;
ffa0179a:	e5 2f       	JUMP.S 0xffa01764 <_uart_str+0x9c>;
ffa0179c:	13 43       	R3 = R2.B (X);
ffa0179e:	ca 2f       	JUMP.S 0xffa01732 <_uart_str+0x6a>;
ffa017a0:	0b 61       	R3 = 0x21 (X);		/*		R3=0x21( 33) */
ffa017a2:	22 e1 00 02 	R2 = 0x200 (X);		/*		R2=0x200(512) */
ffa017a6:	13 50       	R0 = R3 + R2;
ffa017a8:	c0 42       	R0 = R0.L (Z);
ffa017aa:	db 2f       	JUMP.S 0xffa01760 <_uart_str+0x98>;
ffa017ac:	63 61       	R3 = 0x2c (X);		/*		R3=0x2c( 44) */
ffa017ae:	fa 2f       	JUMP.S 0xffa017a2 <_uart_str+0xda>;
ffa017b0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c90 <__bss_start> */
ffa017b4:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa017b8:	0a e1 90 0c 	P2.L = 0xc90;		/* (3216)	P2=0xff900c90 <__bss_start> */
ffa017bc:	10 9b       	B[P2] = R0;
ffa017be:	e8 2f       	JUMP.S 0xffa0178e <_uart_str+0xc6>;
ffa017c0:	63 99       	R3 = B[P4] (X);
ffa017c2:	08 61       	R0 = 0x21 (X);		/*		R0=0x21( 33) */
ffa017c4:	03 08       	CC = R3 == R0;
ffa017c6:	58 18       	IF CC JUMP 0xffa01876 <_uart_str+0x1ae>;
ffa017c8:	00 00       	NOP;
ffa017ca:	00 00       	NOP;
ffa017cc:	54 32       	P2 = P4;
ffa017ce:	50 99       	R0 = B[P2] (X);
ffa017d0:	01 43       	R1 = R0.B (X);
ffa017d2:	01 0c       	CC = R1 == 0x0;
ffa017d4:	8a 1b       	IF CC JUMP 0xffa016e8 <_uart_str+0x20>;
ffa017d6:	42 32       	P0 = P2;
ffa017d8:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00c8c(-4191092) */
ffa017dc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c90(-4191088) */
ffa017e0:	08 6c       	P0 += 0x1;		/* (  1) */
ffa017e2:	0d e1 00 04 	P5.L = 0x400;		/* (1024)	P5=0xffc00400(-4193280) */
ffa017e6:	0a e1 14 04 	P2.L = 0x414;		/* (1044)	P2=0xffc00414(-4193260) */
ffa017ea:	02 61       	R2 = 0x20 (X);		/*		R2=0x20( 32) */
ffa017ec:	57 60       	R7 = 0xa (X);		/*		R7=0xa( 10) */
ffa017ee:	6e 60       	R6 = 0xd (X);		/*		R6=0xd( 13) */
ffa017f0:	29 e1 00 04 	P1 = 0x400 (X);		/*		P1=0x400(1024) */
ffa017f4:	55 60       	R5 = 0xa (X);		/*		R5=0xa( 10) */
ffa017f6:	b2 e0 19 10 	LSETUP(0xffa017fa <_uart_str+0x132>, 0xffa01828 <_uart_str+0x160>) LC1 = P1;
ffa017fa:	29 08       	CC = R1 == R5;
ffa017fc:	18 18       	IF CC JUMP 0xffa0182c <_uart_str+0x164>;
ffa017fe:	00 00       	NOP;
ffa01800:	00 43       	R0 = R0.B (X);
ffa01802:	28 97       	W[P5] = R0;
ffa01804:	10 95       	R0 = W[P2] (Z);
ffa01806:	02 54       	R0 = R2 & R0;
ffa01808:	00 0c       	CC = R0 == 0x0;
ffa0180a:	0b 10       	IF !CC JUMP 0xffa01820 <_uart_str+0x158>;
ffa0180c:	00 00       	NOP;
ffa0180e:	00 00       	NOP;
ffa01810:	42 34       	I0 = P2;
ffa01812:	00 00       	NOP;
ffa01814:	00 00       	NOP;
ffa01816:	20 9d       	R0.L = W[I0];
ffa01818:	02 54       	R0 = R2 & R0;
ffa0181a:	00 0c       	CC = R0 == 0x0;
ffa0181c:	fb 1f       	IF CC JUMP 0xffa01812 <_uart_str+0x14a> (BP);
ffa0181e:	90 32       	P2 = I0;
ffa01820:	40 98       	R0 = B[P0++] (X);
ffa01822:	01 43       	R1 = R0.B (X);
ffa01824:	01 0c       	CC = R1 == 0x0;
ffa01826:	61 1b       	IF CC JUMP 0xffa016e8 <_uart_str+0x20>;
ffa01828:	00 00       	NOP;
ffa0182a:	5f 2f       	JUMP.S 0xffa016e8 <_uart_str+0x20>;
ffa0182c:	2f 97       	W[P5] = R7;
ffa0182e:	10 95       	R0 = W[P2] (Z);
ffa01830:	02 54       	R0 = R2 & R0;
ffa01832:	00 0c       	CC = R0 == 0x0;
ffa01834:	0b 10       	IF !CC JUMP 0xffa0184a <_uart_str+0x182>;
ffa01836:	00 00       	NOP;
ffa01838:	00 00       	NOP;
ffa0183a:	42 34       	I0 = P2;
ffa0183c:	00 00       	NOP;
ffa0183e:	00 00       	NOP;
ffa01840:	20 9d       	R0.L = W[I0];
ffa01842:	02 54       	R0 = R2 & R0;
ffa01844:	00 0c       	CC = R0 == 0x0;
ffa01846:	fb 1f       	IF CC JUMP 0xffa0183c <_uart_str+0x174> (BP);
ffa01848:	90 32       	P2 = I0;
ffa0184a:	2e 97       	W[P5] = R6;
ffa0184c:	10 95       	R0 = W[P2] (Z);
ffa0184e:	02 54       	R0 = R2 & R0;
ffa01850:	00 0c       	CC = R0 == 0x0;
ffa01852:	e7 13       	IF !CC JUMP 0xffa01820 <_uart_str+0x158>;
ffa01854:	00 00       	NOP;
ffa01856:	00 00       	NOP;
ffa01858:	42 34       	I0 = P2;
ffa0185a:	00 00       	NOP;
ffa0185c:	00 00       	NOP;
ffa0185e:	20 9d       	R0.L = W[I0];
ffa01860:	02 54       	R0 = R2 & R0;
ffa01862:	00 0c       	CC = R0 == 0x0;
ffa01864:	fb 1f       	IF CC JUMP 0xffa0185a <_uart_str+0x192> (BP);
ffa01866:	90 32       	P2 = I0;
ffa01868:	dc 2f       	JUMP.S 0xffa01820 <_uart_str+0x158>;
ffa0186a:	d0 61       	R0 = 0x3a (X);		/*		R0=0x3a( 58) */
ffa0186c:	07 08       	CC = R7 == R0;
ffa0186e:	07 10       	IF !CC JUMP 0xffa0187c <_uart_str+0x1b4>;
ffa01870:	20 e1 3a 02 	R0 = 0x23a (X);		/*		R0=0x23a(570) */
ffa01874:	76 2f       	JUMP.S 0xffa01760 <_uart_str+0x98>;
ffa01876:	54 32       	P2 = P4;
ffa01878:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa0187a:	aa 2f       	JUMP.S 0xffa017ce <_uart_str+0x106>;
ffa0187c:	71 61       	R1 = 0x2e (X);		/*		R1=0x2e( 46) */
ffa0187e:	0f 08       	CC = R7 == R1;
ffa01880:	91 13       	IF !CC JUMP 0xffa017a2 <_uart_str+0xda>;
ffa01882:	20 e1 2e 02 	R0 = 0x22e (X);		/*		R0=0x22e(558) */
ffa01886:	6d 2f       	JUMP.S 0xffa01760 <_uart_str+0x98>;

ffa01888 <_printf_newline>:
ffa01888:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0188c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90022e(-7339474) */
ffa01890:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa01894:	01 e8 00 00 	UNLINK;
ffa01898:	ff e2 18 ff 	JUMP.L 0xffa016c8 <_uart_str>;

ffa0189c <_printf_hex_byte>:
ffa0189c:	fc 05       	[--SP] = (R7:7, P5:4);
ffa0189e:	39 30       	R7 = R1;
ffa018a0:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa018a4:	28 32       	P5 = R0;
ffa018a6:	00 e3 c1 01 	CALL 0xffa01c28 <_strlen_>;
ffa018aa:	08 30       	R1 = R0;
ffa018ac:	20 e1 fb 03 	R0 = 0x3fb (X);		/*		R0=0x3fb(1019) */
ffa018b0:	01 09       	CC = R1 <= R0;
ffa018b2:	3d 10       	IF !CC JUMP 0xffa0192c <_printf_hex_byte+0x90>;
ffa018b4:	01 0d       	CC = R1 <= 0x0;
ffa018b6:	44 18       	IF CC JUMP 0xffa0193e <_printf_hex_byte+0xa2>;
ffa018b8:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900c90 <__bss_start> */
ffa018bc:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa018be:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_printf_out> */
ffa018c2:	09 32       	P1 = R1;
ffa018c4:	b2 e0 06 10 	LSETUP(0xffa018c8 <_printf_hex_byte+0x2c>, 0xffa018d0 <_printf_hex_byte+0x34>) LC1 = P1;
ffa018c8:	62 91       	P2 = [P4];
ffa018ca:	68 98       	R0 = B[P5++] (X);
ffa018cc:	82 5a       	P2 = P2 + P0;
ffa018ce:	10 9b       	B[P2] = R0;
ffa018d0:	08 6c       	P0 += 0x1;		/* (  1) */
ffa018d2:	09 32       	P1 = R1;
ffa018d4:	62 91       	P2 = [P4];
ffa018d6:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa018d8:	79 43       	R1 = R7.B (Z);
ffa018da:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa018dc:	8a 5a       	P2 = P2 + P1;
ffa018de:	10 9b       	B[P2] = R0;
ffa018e0:	62 91       	P2 = [P4];
ffa018e2:	09 6c       	P1 += 0x1;		/* (  1) */
ffa018e4:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa018e8:	8a 5a       	P2 = P2 + P1;
ffa018ea:	10 9b       	B[P2] = R0;
ffa018ec:	82 c6 e1 81 	R0 = R1 >> 0x4;
ffa018f0:	09 6c       	P1 += 0x1;		/* (  1) */
ffa018f2:	10 09       	CC = R0 <= R2;
ffa018f4:	23 14       	IF !CC JUMP 0xffa0193a <_printf_hex_byte+0x9e> (BP);
ffa018f6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa018f8:	62 91       	P2 = [P4];
ffa018fa:	8a 5a       	P2 = P2 + P1;
ffa018fc:	10 9b       	B[P2] = R0;
ffa018fe:	78 60       	R0 = 0xf (X);		/*		R0=0xf( 15) */
ffa01900:	01 54       	R0 = R1 & R0;
ffa01902:	49 60       	R1 = 0x9 (X);		/*		R1=0x9(  9) */
ffa01904:	08 09       	CC = R0 <= R1;
ffa01906:	18 1c       	IF CC JUMP 0xffa01936 <_printf_hex_byte+0x9a> (BP);
ffa01908:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa0190a:	62 91       	P2 = [P4];
ffa0190c:	8a 5a       	P2 = P2 + P1;
ffa0190e:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa01912:	62 91       	P2 = [P4];
ffa01914:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01916:	8a 5a       	P2 = P2 + P1;
ffa01918:	90 e6 02 00 	B[P2 + 0x2] = R0;
ffa0191c:	20 91       	R0 = [P4];
ffa0191e:	ff e3 d5 fe 	CALL 0xffa016c8 <_uart_str>;
ffa01922:	01 e8 00 00 	UNLINK;
ffa01926:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01928:	bc 05       	(R7:7, P5:4) = [SP++];
ffa0192a:	10 00       	RTS;
ffa0192c:	01 e8 00 00 	UNLINK;
ffa01930:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa01932:	bc 05       	(R7:7, P5:4) = [SP++];
ffa01934:	10 00       	RTS;
ffa01936:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01938:	e9 2f       	JUMP.S 0xffa0190a <_printf_hex_byte+0x6e>;
ffa0193a:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa0193c:	de 2f       	JUMP.S 0xffa018f8 <_printf_hex_byte+0x5c>;
ffa0193e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ef0 <_printf_out> */
ffa01942:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_printf_out> */
ffa01946:	c6 2f       	JUMP.S 0xffa018d2 <_printf_hex_byte+0x36>;

ffa01948 <_printf_hex>:
ffa01948:	fb 05       	[--SP] = (R7:7, P5:3);
ffa0194a:	39 30       	R7 = R1;
ffa0194c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01950:	28 32       	P5 = R0;
ffa01952:	00 e3 6b 01 	CALL 0xffa01c28 <_strlen_>;
ffa01956:	08 30       	R1 = R0;
ffa01958:	20 e1 f5 03 	R0 = 0x3f5 (X);		/*		R0=0x3f5(1013) */
ffa0195c:	01 09       	CC = R1 <= R0;
ffa0195e:	46 10       	IF !CC JUMP 0xffa019ea <_printf_hex+0xa2>;
ffa01960:	01 0d       	CC = R1 <= 0x0;
ffa01962:	49 18       	IF CC JUMP 0xffa019f4 <_printf_hex+0xac>;
ffa01964:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ef0 <_printf_out> */
ffa01968:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa0196a:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_printf_out> */
ffa0196e:	09 32       	P1 = R1;
ffa01970:	b2 e0 06 10 	LSETUP(0xffa01974 <_printf_hex+0x2c>, 0xffa0197c <_printf_hex+0x34>) LC1 = P1;
ffa01974:	62 91       	P2 = [P4];
ffa01976:	68 98       	R0 = B[P5++] (X);
ffa01978:	82 5a       	P2 = P2 + P0;
ffa0197a:	10 9b       	B[P2] = R0;
ffa0197c:	08 6c       	P0 += 0x1;		/* (  1) */
ffa0197e:	09 32       	P1 = R1;
ffa01980:	62 91       	P2 = [P4];
ffa01982:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01984:	29 32       	P5 = R1;
ffa01986:	e1 60       	R1 = 0x1c (X);		/*		R1=0x1c( 28) */
ffa01988:	8a 5a       	P2 = P2 + P1;
ffa0198a:	10 9b       	B[P2] = R0;
ffa0198c:	62 91       	P2 = [P4];
ffa0198e:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01990:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa01994:	15 6c       	P5 += 0x2;		/* (  2) */
ffa01996:	8a 5a       	P2 = P2 + P1;
ffa01998:	10 9b       	B[P2] = R0;
ffa0199a:	7a 60       	R2 = 0xf (X);		/*		R2=0xf( 15) */
ffa0199c:	40 68       	P0 = 0x8 (X);		/*		P0=0x8(  8) */
ffa0199e:	4b 60       	R3 = 0x9 (X);		/*		R3=0x9(  9) */
ffa019a0:	b2 e0 10 00 	LSETUP(0xffa019a4 <_printf_hex+0x5c>, 0xffa019c0 <_printf_hex+0x78>) LC1 = P0;
ffa019a4:	07 30       	R0 = R7;
ffa019a6:	08 40       	R0 >>>= R1;
ffa019a8:	10 54       	R0 = R0 & R2;
ffa019aa:	18 09       	CC = R0 <= R3;
ffa019ac:	1d 1c       	IF CC JUMP 0xffa019e6 <_printf_hex+0x9e> (BP);
ffa019ae:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa019b0:	62 91       	P2 = [P4];
ffa019b2:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff90ff80 */
ffa019b6:	0b e1 f0 0e 	P3.L = 0xef0;		/* (3824)	P3=0xff900ef0 <_printf_out> */
ffa019ba:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa019bc:	aa 5a       	P2 = P2 + P5;
ffa019be:	10 9b       	B[P2] = R0;
ffa019c0:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa019c2:	5a 91       	P2 = [P3];
ffa019c4:	49 6c       	P1 += 0x9;		/* (  9) */
ffa019c6:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa019c8:	8a 5a       	P2 = P2 + P1;
ffa019ca:	10 9b       	B[P2] = R0;
ffa019cc:	5a 91       	P2 = [P3];
ffa019ce:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa019d0:	8a 5a       	P2 = P2 + P1;
ffa019d2:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa019d6:	18 91       	R0 = [P3];
ffa019d8:	ff e3 78 fe 	CALL 0xffa016c8 <_uart_str>;
ffa019dc:	01 e8 00 00 	UNLINK;
ffa019e0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa019e2:	bb 05       	(R7:7, P5:3) = [SP++];
ffa019e4:	10 00       	RTS;
ffa019e6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa019e8:	e4 2f       	JUMP.S 0xffa019b0 <_printf_hex+0x68>;
ffa019ea:	01 e8 00 00 	UNLINK;
ffa019ee:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa019f0:	bb 05       	(R7:7, P5:3) = [SP++];
ffa019f2:	10 00       	RTS;
ffa019f4:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ef0 <_printf_out> */
ffa019f8:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_printf_out> */
ffa019fc:	c1 2f       	JUMP.S 0xffa0197e <_printf_hex+0x36>;
	...

ffa01a00 <_printf_int>:
ffa01a00:	eb 05       	[--SP] = (R7:5, P5:3);
ffa01a02:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01a06:	28 30       	R5 = R0;
ffa01a08:	39 30       	R7 = R1;
ffa01a0a:	01 0c       	CC = R1 == 0x0;
ffa01a0c:	45 14       	IF !CC JUMP 0xffa01a96 <_printf_int+0x96> (BP);
ffa01a0e:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff90000d(-7340019) */
ffa01a12:	06 e1 ec 0e 	R6.L = 0xeec;		/* (3820)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01a16:	06 32       	P0 = R6;
ffa01a18:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01a1a:	0c 68       	P4 = 0x1 (X);		/*		P4=0x1(  1) */
ffa01a1c:	42 91       	P2 = [P0];
ffa01a1e:	10 9b       	B[P2] = R0;
ffa01a20:	05 30       	R0 = R5;
ffa01a22:	00 e3 03 01 	CALL 0xffa01c28 <_strlen_>;
ffa01a26:	08 30       	R1 = R0;
ffa01a28:	44 30       	R0 = P4;
ffa01a2a:	81 50       	R2 = R1 + R0;
ffa01a2c:	20 e1 ff 03 	R0 = 0x3ff (X);		/*		R0=0x3ff(1023) */
ffa01a30:	02 09       	CC = R2 <= R0;
ffa01a32:	50 10       	IF !CC JUMP 0xffa01ad2 <_printf_int+0xd2>;
ffa01a34:	01 0d       	CC = R1 <= 0x0;
ffa01a36:	7d 18       	IF CC JUMP 0xffa01b30 <_printf_int+0x130>;
ffa01a38:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900ef0 <_printf_out> */
ffa01a3c:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa01a3e:	0b e1 f0 0e 	P3.L = 0xef0;		/* (3824)	P3=0xff900ef0 <_printf_out> */
ffa01a42:	09 32       	P1 = R1;
ffa01a44:	b2 e0 08 10 	LSETUP(0xffa01a48 <_printf_int+0x48>, 0xffa01a54 <_printf_int+0x54>) LC1 = P1;
ffa01a48:	2d 32       	P5 = R5;
ffa01a4a:	5a 91       	P2 = [P3];
ffa01a4c:	0d 64       	R5 += 0x1;		/* (  1) */
ffa01a4e:	82 5a       	P2 = P2 + P0;
ffa01a50:	68 98       	R0 = B[P5++] (X);
ffa01a52:	10 9b       	B[P2] = R0;
ffa01a54:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01a56:	44 32       	P0 = P4;
ffa01a58:	29 32       	P5 = R1;
ffa01a5a:	f8 6f       	P0 += -0x1;		/* ( -1) */
ffa01a5c:	26 32       	P4 = R6;
ffa01a5e:	5a 91       	P2 = [P3];
ffa01a60:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff90001c(-7340004) */
ffa01a64:	01 e1 f0 0e 	R1.L = 0xef0;		/* (3824)	R1=0xff900ef0 <_printf_out>(-7336208) */
ffa01a68:	61 91       	P1 = [P4];
ffa01a6a:	aa 5a       	P2 = P2 + P5;
ffa01a6c:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01a6e:	41 5a       	P1 = P1 + P0;
ffa01a70:	48 99       	R0 = B[P1] (X);
ffa01a72:	f8 6f       	P0 += -0x1;		/* ( -1) */
ffa01a74:	10 9b       	B[P2] = R0;
ffa01a76:	78 0c       	CC = P0 == -0x1;
ffa01a78:	f2 17       	IF !CC JUMP 0xffa01a5c <_printf_int+0x5c> (BP);
ffa01a7a:	29 32       	P5 = R1;
ffa01a7c:	02 32       	P0 = R2;
ffa01a7e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01a80:	6a 91       	P2 = [P5];
ffa01a82:	82 5a       	P2 = P2 + P0;
ffa01a84:	10 9b       	B[P2] = R0;
ffa01a86:	28 91       	R0 = [P5];
ffa01a88:	ff e3 20 fe 	CALL 0xffa016c8 <_uart_str>;
ffa01a8c:	01 e8 00 00 	UNLINK;
ffa01a90:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01a92:	ab 05       	(R7:5, P5:3) = [SP++];
ffa01a94:	10 00       	RTS;
ffa01a96:	01 0d       	CC = R1 <= 0x0;
ffa01a98:	22 18       	IF CC JUMP 0xffa01adc <_printf_int+0xdc>;
ffa01a9a:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01a9e:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa01aa0:	06 e1 ec 0e 	R6.L = 0xeec;		/* (3820)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01aa4:	05 20       	JUMP.S 0xffa01aae <_printf_int+0xae>;
ffa01aa6:	2a e1 80 00 	P2 = 0x80 (X);		/*		P2=0x80(128) */
ffa01aaa:	54 08       	CC = P4 == P2;
ffa01aac:	ba 1b       	IF CC JUMP 0xffa01a20 <_printf_int+0x20>;
ffa01aae:	07 30       	R0 = R7;
ffa01ab0:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01ab2:	00 e3 8b 00 	CALL 0xffa01bc8 <_mod>;
ffa01ab6:	0e 32       	P1 = R6;
ffa01ab8:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01aba:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01abc:	4a 91       	P2 = [P1];
ffa01abe:	a2 5a       	P2 = P2 + P4;
ffa01ac0:	10 9b       	B[P2] = R0;
ffa01ac2:	07 30       	R0 = R7;
ffa01ac4:	00 e3 74 00 	CALL 0xffa01bac <_div_>;
ffa01ac8:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa01aca:	38 30       	R7 = R0;
ffa01acc:	00 0d       	CC = R0 <= 0x0;
ffa01ace:	ec 17       	IF !CC JUMP 0xffa01aa6 <_printf_int+0xa6> (BP);
ffa01ad0:	a8 2f       	JUMP.S 0xffa01a20 <_printf_int+0x20>;
ffa01ad2:	01 e8 00 00 	UNLINK;
ffa01ad6:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa01ad8:	ab 05       	(R7:5, P5:3) = [SP++];
ffa01ada:	10 00       	RTS;
ffa01adc:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa01ade:	ff 4c       	BITCLR (R7, 0x1f);		/* bit 31 */
ffa01ae0:	f8 4f       	R0 <<= 0x1f;
ffa01ae2:	f8 53       	R7 = R0 - R7;
ffa01ae4:	07 0d       	CC = R7 <= 0x0;
ffa01ae6:	2e 18       	IF CC JUMP 0xffa01b42 <_printf_int+0x142>;
ffa01ae8:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01aec:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa01aee:	06 e1 ec 0e 	R6.L = 0xeec;		/* (3820)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01af2:	05 20       	JUMP.S 0xffa01afc <_printf_int+0xfc>;
ffa01af4:	28 e1 80 00 	P0 = 0x80 (X);		/*		P0=0x80(128) */
ffa01af8:	45 08       	CC = P5 == P0;
ffa01afa:	20 18       	IF CC JUMP 0xffa01b3a <_printf_int+0x13a>;
ffa01afc:	26 32       	P4 = R6;
ffa01afe:	07 30       	R0 = R7;
ffa01b00:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01b02:	00 e3 63 00 	CALL 0xffa01bc8 <_mod>;
ffa01b06:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01b08:	62 91       	P2 = [P4];
ffa01b0a:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01b0c:	aa 5a       	P2 = P2 + P5;
ffa01b0e:	10 9b       	B[P2] = R0;
ffa01b10:	07 30       	R0 = R7;
ffa01b12:	00 e3 4d 00 	CALL 0xffa01bac <_div_>;
ffa01b16:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01b18:	38 30       	R7 = R0;
ffa01b1a:	00 0d       	CC = R0 <= 0x0;
ffa01b1c:	ec 17       	IF !CC JUMP 0xffa01af4 <_printf_int+0xf4> (BP);
ffa01b1e:	65 32       	P4 = P5;
ffa01b20:	4d 32       	P1 = P5;
ffa01b22:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa01b24:	2e 32       	P5 = R6;
ffa01b26:	68 61       	R0 = 0x2d (X);		/*		R0=0x2d( 45) */
ffa01b28:	6a 91       	P2 = [P5];
ffa01b2a:	8a 5a       	P2 = P2 + P1;
ffa01b2c:	10 9b       	B[P2] = R0;
ffa01b2e:	79 2f       	JUMP.S 0xffa01a20 <_printf_int+0x20>;
ffa01b30:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900ef0 <_printf_out> */
ffa01b34:	0b e1 f0 0e 	P3.L = 0xef0;		/* (3824)	P3=0xff900ef0 <_printf_out> */
ffa01b38:	8f 2f       	JUMP.S 0xffa01a56 <_printf_int+0x56>;
ffa01b3a:	48 32       	P1 = P0;
ffa01b3c:	2c e1 81 00 	P4 = 0x81 (X);		/*		P4=0x81(129) */
ffa01b40:	f2 2f       	JUMP.S 0xffa01b24 <_printf_int+0x124>;
ffa01b42:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01b46:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa01b48:	0c 68       	P4 = 0x1 (X);		/*		P4=0x1(  1) */
ffa01b4a:	06 e1 ec 0e 	R6.L = 0xeec;		/* (3820)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01b4e:	eb 2f       	JUMP.S 0xffa01b24 <_printf_int+0x124>;

ffa01b50 <_printf_str>:
ffa01b50:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01b54:	01 e8 00 00 	UNLINK;
ffa01b58:	ff e2 b8 fd 	JUMP.L 0xffa016c8 <_uart_str>;

ffa01b5c <_printf_ip>:
ffa01b5c:	70 05       	[--SP] = (R7:6);
ffa01b5e:	39 30       	R7 = R1;
ffa01b60:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01b64:	49 43       	R1 = R1.B (Z);
ffa01b66:	ff e3 4d ff 	CALL 0xffa01a00 <_printf_int>;
ffa01b6a:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900eec <_printf_temp>(-7336212) */
ffa01b6e:	06 e1 2c 01 	R6.L = 0x12c;		/* (300)	R6=0xff90012c(-7339732) */
ffa01b72:	82 c6 c7 83 	R1 = R7 >> 0x8;
ffa01b76:	49 43       	R1 = R1.B (Z);
ffa01b78:	06 30       	R0 = R6;
ffa01b7a:	ff e3 43 ff 	CALL 0xffa01a00 <_printf_int>;
ffa01b7e:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa01b82:	49 43       	R1 = R1.B (Z);
ffa01b84:	06 30       	R0 = R6;
ffa01b86:	ff e3 3d ff 	CALL 0xffa01a00 <_printf_int>;
ffa01b8a:	c7 4e       	R7 >>= 0x18;
ffa01b8c:	0f 30       	R1 = R7;
ffa01b8e:	06 30       	R0 = R6;
ffa01b90:	ff e3 38 ff 	CALL 0xffa01a00 <_printf_int>;
ffa01b94:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002d(-7339987) */
ffa01b98:	00 e1 f0 05 	R0.L = 0x5f0;		/* (1520)	R0=0xff9005f0(-7338512) */
ffa01b9c:	ff e3 96 fd 	CALL 0xffa016c8 <_uart_str>;
ffa01ba0:	01 e8 00 00 	UNLINK;
ffa01ba4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01ba6:	30 05       	(R7:6) = [SP++];
ffa01ba8:	10 00       	RTS;
	...

ffa01bac <_div_>:
ffa01bac:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bb0:	08 4f       	R0 <<= 0x1;
ffa01bb2:	48 42       	DIVS (R0, R1);
ffa01bb4:	7a 68       	P2 = 0xf (X);		/*		P2=0xf( 15) */
ffa01bb6:	b2 e0 03 20 	LSETUP(0xffa01bba <_div_+0xe>, 0xffa01bbc <_div_+0x10>) LC1 = P2;
ffa01bba:	08 42       	DIVQ (R0, R1);
ffa01bbc:	00 00       	NOP;
ffa01bbe:	80 42       	R0 = R0.L (X);
ffa01bc0:	01 e8 00 00 	UNLINK;
ffa01bc4:	10 00       	RTS;
	...

ffa01bc8 <_mod>:
ffa01bc8:	18 30       	R3 = R0;
ffa01bca:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bce:	08 4f       	R0 <<= 0x1;
ffa01bd0:	11 30       	R2 = R1;
ffa01bd2:	50 42       	DIVS (R0, R2);
ffa01bd4:	7a 68       	P2 = 0xf (X);		/*		P2=0xf( 15) */
ffa01bd6:	b2 e0 03 20 	LSETUP(0xffa01bda <_mod+0x12>, 0xffa01bdc <_mod+0x14>) LC1 = P2;
ffa01bda:	10 42       	DIVQ (R0, R2);
ffa01bdc:	00 00       	NOP;
ffa01bde:	80 42       	R0 = R0.L (X);
ffa01be0:	c8 40       	R0 *= R1;
ffa01be2:	01 e8 00 00 	UNLINK;
ffa01be6:	03 52       	R0 = R3 - R0;
ffa01be8:	10 00       	RTS;
	...

ffa01bec <_memcpy_>:
ffa01bec:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bf0:	00 32       	P0 = R0;
ffa01bf2:	09 32       	P1 = R1;
ffa01bf4:	02 0d       	CC = R2 <= 0x0;
ffa01bf6:	07 18       	IF CC JUMP 0xffa01c04 <_memcpy_+0x18>;
ffa01bf8:	00 00       	NOP;
ffa01bfa:	12 32       	P2 = R2;
ffa01bfc:	b2 e0 03 20 	LSETUP(0xffa01c00 <_memcpy_+0x14>, 0xffa01c02 <_memcpy_+0x16>) LC1 = P2;
ffa01c00:	40 98       	R0 = B[P0++] (X);
ffa01c02:	08 9a       	B[P1++] = R0;
ffa01c04:	01 e8 00 00 	UNLINK;
ffa01c08:	10 00       	RTS;
	...

ffa01c0c <_memset_>:
ffa01c0c:	08 32       	P1 = R0;
ffa01c0e:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c12:	01 30       	R0 = R1;
ffa01c14:	02 0d       	CC = R2 <= 0x0;
ffa01c16:	05 18       	IF CC JUMP 0xffa01c20 <_memset_+0x14>;
ffa01c18:	12 32       	P2 = R2;
ffa01c1a:	b2 e0 02 20 	LSETUP(0xffa01c1e <_memset_+0x12>, 0xffa01c1e <_memset_+0x12>) LC1 = P2;
ffa01c1e:	08 9a       	B[P1++] = R0;
ffa01c20:	01 e8 00 00 	UNLINK;
ffa01c24:	10 00       	RTS;
	...

ffa01c28 <_strlen_>:
ffa01c28:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c2c:	08 32       	P1 = R0;
ffa01c2e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01c30:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01c34:	b2 e0 05 20 	LSETUP(0xffa01c38 <_strlen_+0x10>, 0xffa01c3e <_strlen_+0x16>) LC1 = P2;
ffa01c38:	48 98       	R0 = B[P1++] (X);
ffa01c3a:	00 0c       	CC = R0 == 0x0;
ffa01c3c:	03 18       	IF CC JUMP 0xffa01c42 <_strlen_+0x1a>;
ffa01c3e:	09 64       	R1 += 0x1;		/* (  1) */
ffa01c40:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01c42:	01 30       	R0 = R1;
ffa01c44:	01 e8 00 00 	UNLINK;
ffa01c48:	10 00       	RTS;
	...

ffa01c4c <_strcpy_>:
ffa01c4c:	12 32       	P2 = R2;
ffa01c4e:	c5 04       	[--SP] = (P5:5);
ffa01c50:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c54:	29 32       	P5 = R1;
ffa01c56:	00 32       	P0 = R0;
ffa01c58:	51 99       	R1 = B[P2] (X);
ffa01c5a:	08 43       	R0 = R1.B (X);
ffa01c5c:	00 0c       	CC = R0 == 0x0;
ffa01c5e:	19 18       	IF CC JUMP 0xffa01c90 <_strcpy_+0x44>;
ffa01c60:	0a 32       	P1 = R2;
ffa01c62:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01c64:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01c68:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01c6a:	b2 e0 0a 20 	LSETUP(0xffa01c6e <_strcpy_+0x22>, 0xffa01c7e <_strcpy_+0x32>) LC1 = P2;
ffa01c6e:	01 9a       	B[P0++] = R1;
ffa01c70:	49 98       	R1 = B[P1++] (X);
ffa01c72:	08 43       	R0 = R1.B (X);
ffa01c74:	0a 64       	R2 += 0x1;		/* (  1) */
ffa01c76:	00 0c       	CC = R0 == 0x0;
ffa01c78:	04 18       	IF CC JUMP 0xffa01c80 <_strcpy_+0x34>;
ffa01c7a:	00 00       	NOP;
ffa01c7c:	00 00       	NOP;
ffa01c7e:	00 00       	NOP;
ffa01c80:	28 91       	R0 = [P5];
ffa01c82:	10 50       	R0 = R0 + R2;
ffa01c84:	28 93       	[P5] = R0;
ffa01c86:	01 e8 00 00 	UNLINK;
ffa01c8a:	40 30       	R0 = P0;
ffa01c8c:	85 04       	(P5:5) = [SP++];
ffa01c8e:	10 00       	RTS;
ffa01c90:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01c92:	f7 2f       	JUMP.S 0xffa01c80 <_strcpy_+0x34>;

ffa01c94 <_strprepend>:
ffa01c94:	c5 04       	[--SP] = (P5:5);
ffa01c96:	02 32       	P0 = R2;
ffa01c98:	0a 32       	P1 = R2;
ffa01c9a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c9e:	18 30       	R3 = R0;
ffa01ca0:	29 32       	P5 = R1;
ffa01ca2:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01ca4:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01ca8:	b2 e0 07 20 	LSETUP(0xffa01cac <_strprepend+0x18>, 0xffa01cb6 <_strprepend+0x22>) LC1 = P2;
ffa01cac:	48 98       	R0 = B[P1++] (X);
ffa01cae:	00 0c       	CC = R0 == 0x0;
ffa01cb0:	0c 18       	IF CC JUMP 0xffa01cc8 <_strprepend+0x34>;
ffa01cb2:	00 00       	NOP;
ffa01cb4:	00 00       	NOP;
ffa01cb6:	0a 64       	R2 += 0x1;		/* (  1) */
ffa01cb8:	28 91       	R0 = [P5];
ffa01cba:	c3 52       	R3 = R3 - R0;
ffa01cbc:	0b 32       	P1 = R3;
ffa01cbe:	01 e8 00 00 	UNLINK;
ffa01cc2:	41 30       	R0 = P1;
ffa01cc4:	85 04       	(P5:5) = [SP++];
ffa01cc6:	10 00       	RTS;
ffa01cc8:	28 91       	R0 = [P5];
ffa01cca:	03 52       	R0 = R3 - R0;
ffa01ccc:	08 32       	P1 = R0;
ffa01cce:	02 0c       	CC = R2 == 0x0;
ffa01cd0:	f7 1b       	IF CC JUMP 0xffa01cbe <_strprepend+0x2a>;
ffa01cd2:	00 00       	NOP;
ffa01cd4:	12 32       	P2 = R2;
ffa01cd6:	b2 e0 03 20 	LSETUP(0xffa01cda <_strprepend+0x46>, 0xffa01cdc <_strprepend+0x48>) LC1 = P2;
ffa01cda:	40 98       	R0 = B[P0++] (X);
ffa01cdc:	08 9a       	B[P1++] = R0;
ffa01cde:	ed 2f       	JUMP.S 0xffa01cb8 <_strprepend+0x24>;

ffa01ce0 <_strcmp>:
ffa01ce0:	10 32       	P2 = R0;
ffa01ce2:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01ce6:	09 32       	P1 = R1;
ffa01ce8:	51 99       	R1 = B[P2] (X);
ffa01cea:	01 0c       	CC = R1 == 0x0;
ffa01cec:	20 18       	IF CC JUMP 0xffa01d2c <_strcmp+0x4c>;
ffa01cee:	00 00       	NOP;
ffa01cf0:	00 00       	NOP;
ffa01cf2:	00 00       	NOP;
ffa01cf4:	48 99       	R0 = B[P1] (X);
ffa01cf6:	00 0c       	CC = R0 == 0x0;
ffa01cf8:	1a 18       	IF CC JUMP 0xffa01d2c <_strcmp+0x4c>;
ffa01cfa:	01 08       	CC = R1 == R0;
ffa01cfc:	1c 10       	IF !CC JUMP 0xffa01d34 <_strcmp+0x54>;
ffa01cfe:	42 32       	P0 = P2;
ffa01d00:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01d02:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01d04:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01d08:	b3 e0 11 20 	LSETUP(0xffa01d0e <_strcmp+0x2e>, 0xffa01d2a <_strcmp+0x4a>) LC1 = P2;
ffa01d0c:	06 20       	JUMP.S 0xffa01d18 <_strcmp+0x38>;
ffa01d0e:	01 08       	CC = R1 == R0;
ffa01d10:	12 10       	IF !CC JUMP 0xffa01d34 <_strcmp+0x54>;
ffa01d12:	00 00       	NOP;
ffa01d14:	00 00       	NOP;
ffa01d16:	00 00       	NOP;
ffa01d18:	41 98       	R1 = B[P0++] (X);
ffa01d1a:	01 0c       	CC = R1 == 0x0;
ffa01d1c:	08 18       	IF CC JUMP 0xffa01d2c <_strcmp+0x4c>;
ffa01d1e:	00 00       	NOP;
ffa01d20:	00 00       	NOP;
ffa01d22:	00 00       	NOP;
ffa01d24:	48 98       	R0 = B[P1++] (X);
ffa01d26:	00 0c       	CC = R0 == 0x0;
ffa01d28:	02 18       	IF CC JUMP 0xffa01d2c <_strcmp+0x4c>;
ffa01d2a:	00 00       	NOP;
ffa01d2c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01d2e:	01 e8 00 00 	UNLINK;
ffa01d32:	10 00       	RTS;
ffa01d34:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01d36:	01 e8 00 00 	UNLINK;
ffa01d3a:	10 00       	RTS;

ffa01d3c <_substr>:
ffa01d3c:	f4 05       	[--SP] = (R7:6, P5:4);
ffa01d3e:	20 32       	P4 = R0;
ffa01d40:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01d44:	32 30       	R6 = R2;
ffa01d46:	11 32       	P2 = R1;
ffa01d48:	62 99       	R2 = B[P4] (X);
ffa01d4a:	02 0c       	CC = R2 == 0x0;
ffa01d4c:	1a 18       	IF CC JUMP 0xffa01d80 <_substr+0x44>;
ffa01d4e:	00 00       	NOP;
ffa01d50:	00 00       	NOP;
ffa01d52:	00 00       	NOP;
ffa01d54:	50 99       	R0 = B[P2] (X);
ffa01d56:	00 0c       	CC = R0 == 0x0;
ffa01d58:	14 18       	IF CC JUMP 0xffa01d80 <_substr+0x44>;
ffa01d5a:	06 0d       	CC = R6 <= 0x0;
ffa01d5c:	12 18       	IF CC JUMP 0xffa01d80 <_substr+0x44>;
ffa01d5e:	29 32       	P5 = R1;
ffa01d60:	7c 30       	R7 = P4;
ffa01d62:	08 68       	P0 = 0x1 (X);		/*		P0=0x1(  1) */
ffa01d64:	17 64       	R7 += 0x2;		/* (  2) */
ffa01d66:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01d68:	02 08       	CC = R2 == R0;
ffa01d6a:	10 18       	IF CC JUMP 0xffa01d8a <_substr+0x4e>;
ffa01d6c:	00 00       	NOP;
ffa01d6e:	00 00       	NOP;
ffa01d70:	48 30       	R1 = P0;
ffa01d72:	68 99       	R0 = B[P5] (X);
ffa01d74:	00 0c       	CC = R0 == 0x0;
ffa01d76:	05 18       	IF CC JUMP 0xffa01d80 <_substr+0x44>;
ffa01d78:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01d7a:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01d7c:	0e 09       	CC = R6 <= R1;
ffa01d7e:	f5 17       	IF !CC JUMP 0xffa01d68 <_substr+0x2c> (BP);
ffa01d80:	01 e8 00 00 	UNLINK;
ffa01d84:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01d86:	b4 05       	(R7:6, P5:4) = [SP++];
ffa01d88:	10 00       	RTS;
ffa01d8a:	0f 32       	P1 = R7;
ffa01d8c:	55 32       	P2 = P5;
ffa01d8e:	40 30       	R0 = P0;
ffa01d90:	a1 e5 01 00 	R1 = B[P4 + 0x1] (X);
ffa01d94:	00 00       	NOP;
ffa01d96:	53 98       	R3 = B[P2++] (X);
ffa01d98:	0b 08       	CC = R3 == R1;
ffa01d9a:	eb 13       	IF !CC JUMP 0xffa01d70 <_substr+0x34>;
ffa01d9c:	03 0c       	CC = R3 == 0x0;
ffa01d9e:	e9 1b       	IF CC JUMP 0xffa01d70 <_substr+0x34>;
ffa01da0:	00 00       	NOP;
ffa01da2:	00 00       	NOP;
ffa01da4:	08 64       	R0 += 0x1;		/* (  1) */
ffa01da6:	49 98       	R1 = B[P1++] (X);
ffa01da8:	01 0c       	CC = R1 == 0x0;
ffa01daa:	f5 17       	IF !CC JUMP 0xffa01d94 <_substr+0x58> (BP);
ffa01dac:	01 e8 00 00 	UNLINK;
ffa01db0:	b4 05       	(R7:6, P5:4) = [SP++];
ffa01db2:	10 00       	RTS;

ffa01db4 <_sprintf_int>:
ffa01db4:	f3 05       	[--SP] = (R7:6, P5:3);
ffa01db6:	29 32       	P5 = R1;
ffa01db8:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01dbc:	30 30       	R6 = R0;
ffa01dbe:	45 0c       	CC = P5 == 0x0;
ffa01dc0:	1a 14       	IF !CC JUMP 0xffa01df4 <_sprintf_int+0x40> (BP);
ffa01dc2:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900001 */
ffa01dc6:	0c e1 ec 0e 	P4.L = 0xeec;		/* (3820)	P4=0xff900eec <_printf_temp> */
ffa01dca:	62 91       	P2 = [P4];
ffa01dcc:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01dce:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa01dd0:	10 9b       	B[P2] = R0;
ffa01dd2:	0f 32       	P1 = R7;
ffa01dd4:	06 32       	P0 = R6;
ffa01dd6:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01dd8:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa01dda:	09 64       	R1 += 0x1;		/* (  1) */
ffa01ddc:	62 91       	P2 = [P4];
ffa01dde:	b9 08       	CC = R1 < R7;
ffa01de0:	8a 5a       	P2 = P2 + P1;
ffa01de2:	50 99       	R0 = B[P2] (X);
ffa01de4:	00 9a       	B[P0++] = R0;
ffa01de6:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa01de8:	f9 1f       	IF CC JUMP 0xffa01dda <_sprintf_int+0x26> (BP);
ffa01dea:	07 30       	R0 = R7;
ffa01dec:	01 e8 00 00 	UNLINK;
ffa01df0:	b3 05       	(R7:6, P5:3) = [SP++];
ffa01df2:	10 00       	RTS;
ffa01df4:	45 0d       	CC = P5 <= 0x0;
ffa01df6:	21 18       	IF CC JUMP 0xffa01e38 <_sprintf_int+0x84>;
ffa01df8:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eec <_printf_temp> */
ffa01dfc:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa01dfe:	0c e1 ec 0e 	P4.L = 0xeec;		/* (3820)	P4=0xff900eec <_printf_temp> */
ffa01e02:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01e04:	45 30       	R0 = P5;
ffa01e06:	ff e3 df fb 	CALL 0xffa015c4 <___divsi3>;
ffa01e0a:	17 32       	P2 = R7;
ffa01e0c:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || P1 = [P4] || NOP;
ffa01e10:	61 91 00 00 
ffa01e14:	e8 4f       	R0 <<= 0x1d;
ffa01e16:	08 52       	R0 = R0 - R1;
ffa01e18:	10 4f       	R0 <<= 0x2;
ffa01e1a:	51 5a       	P1 = P1 + P2;
ffa01e1c:	08 52       	R0 = R0 - R1;
ffa01e1e:	10 32       	P2 = R0;
ffa01e20:	0f 64       	R7 += 0x1;		/* (  1) */
ffa01e22:	01 0c       	CC = R1 == 0x0;
ffa01e24:	95 5c       	P2 = P5 + (P2 << 0x1);
ffa01e26:	42 30       	R0 = P2;
ffa01e28:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01e2a:	08 9b       	B[P1] = R0;
ffa01e2c:	d3 1b       	IF CC JUMP 0xffa01dd2 <_sprintf_int+0x1e>;
ffa01e2e:	58 60       	R0 = 0xb (X);		/*		R0=0xb( 11) */
ffa01e30:	29 32       	P5 = R1;
ffa01e32:	07 08       	CC = R7 == R0;
ffa01e34:	e7 17       	IF !CC JUMP 0xffa01e02 <_sprintf_int+0x4e> (BP);
ffa01e36:	ce 2f       	JUMP.S 0xffa01dd2 <_sprintf_int+0x1e>;
ffa01e38:	01 30       	R0 = R1;
ffa01e3a:	f8 4c       	BITCLR (R0, 0x1f);		/* bit 31 */
ffa01e3c:	28 32       	P5 = R0;
ffa01e3e:	4a e1 00 80 	P2.H = 0x8000;		/* (-32768)	P2=0x80000500 */
ffa01e42:	0a e1 00 00 	P2.L = 0x0;		/* (  0)	P2=0x80000000 */
ffa01e46:	5a 32       	P3 = P2;
ffa01e48:	2b 44       	P3 -= P5;
ffa01e4a:	43 0d       	CC = P3 <= 0x0;
ffa01e4c:	2a 18       	IF CC JUMP 0xffa01ea0 <_sprintf_int+0xec>;
ffa01e4e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eec <_printf_temp> */
ffa01e52:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa01e54:	0c e1 ec 0e 	P4.L = 0xeec;		/* (3820)	P4=0xff900eec <_printf_temp> */
ffa01e58:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01e5a:	43 30       	R0 = P3;
ffa01e5c:	ff e3 b4 fb 	CALL 0xffa015c4 <___divsi3>;
ffa01e60:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || P1 = [P4] || NOP;
ffa01e64:	61 91 00 00 
ffa01e68:	e8 4f       	R0 <<= 0x1d;
ffa01e6a:	08 52       	R0 = R0 - R1;
ffa01e6c:	10 4f       	R0 <<= 0x2;
ffa01e6e:	08 52       	R0 = R0 - R1;
ffa01e70:	10 32       	P2 = R0;
ffa01e72:	69 5a       	P1 = P1 + P5;
ffa01e74:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01e76:	01 0c       	CC = R1 == 0x0;
ffa01e78:	93 5c       	P2 = P3 + (P2 << 0x1);
ffa01e7a:	42 30       	R0 = P2;
ffa01e7c:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01e7e:	08 9b       	B[P1] = R0;
ffa01e80:	0c 18       	IF CC JUMP 0xffa01e98 <_sprintf_int+0xe4>;
ffa01e82:	5a 68       	P2 = 0xb (X);		/*		P2=0xb( 11) */
ffa01e84:	19 32       	P3 = R1;
ffa01e86:	55 08       	CC = P5 == P2;
ffa01e88:	e8 17       	IF !CC JUMP 0xffa01e58 <_sprintf_int+0xa4> (BP);
ffa01e8a:	59 68       	P1 = 0xb (X);		/*		P1=0xb( 11) */
ffa01e8c:	67 60       	R7 = 0xc (X);		/*		R7=0xc( 12) */
ffa01e8e:	62 91       	P2 = [P4];
ffa01e90:	68 61       	R0 = 0x2d (X);		/*		R0=0x2d( 45) */
ffa01e92:	8a 5a       	P2 = P2 + P1;
ffa01e94:	10 9b       	B[P2] = R0;
ffa01e96:	9e 2f       	JUMP.S 0xffa01dd2 <_sprintf_int+0x1e>;
ffa01e98:	7d 30       	R7 = P5;
ffa01e9a:	4d 32       	P1 = P5;
ffa01e9c:	0f 64       	R7 += 0x1;		/* (  1) */
ffa01e9e:	f8 2f       	JUMP.S 0xffa01e8e <_sprintf_int+0xda>;
ffa01ea0:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eec <_printf_temp> */
ffa01ea4:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa01ea6:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa01ea8:	0c e1 ec 0e 	P4.L = 0xeec;		/* (3820)	P4=0xff900eec <_printf_temp> */
ffa01eac:	f1 2f       	JUMP.S 0xffa01e8e <_sprintf_int+0xda>;
	...

ffa01eb0 <_sprintf_hex>:
ffa01eb0:	10 32       	P2 = R0;
ffa01eb2:	78 05       	[--SP] = (R7:7);
ffa01eb4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01eb8:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01eba:	e2 60       	R2 = 0x1c (X);		/*		R2=0x1c( 28) */
ffa01ebc:	10 9b       	B[P2] = R0;
ffa01ebe:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa01ec2:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa01ec6:	12 6c       	P2 += 0x2;		/* (  2) */
ffa01ec8:	7b 60       	R3 = 0xf (X);		/*		R3=0xf( 15) */
ffa01eca:	41 68       	P1 = 0x8 (X);		/*		P1=0x8(  8) */
ffa01ecc:	4f 60       	R7 = 0x9 (X);		/*		R7=0x9(  9) */
ffa01ece:	b2 e0 09 10 	LSETUP(0xffa01ed2 <_sprintf_hex+0x22>, 0xffa01ee0 <_sprintf_hex+0x30>) LC1 = P1;
ffa01ed2:	01 30       	R0 = R1;
ffa01ed4:	10 40       	R0 >>>= R2;
ffa01ed6:	18 54       	R0 = R0 & R3;
ffa01ed8:	38 09       	CC = R0 <= R7;
ffa01eda:	09 1c       	IF CC JUMP 0xffa01eec <_sprintf_hex+0x3c> (BP);
ffa01edc:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa01ede:	10 9a       	B[P2++] = R0;
ffa01ee0:	e2 67       	R2 += -0x4;		/* ( -4) */
ffa01ee2:	01 e8 00 00 	UNLINK;
ffa01ee6:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa01ee8:	38 05       	(R7:7) = [SP++];
ffa01eea:	10 00       	RTS;
ffa01eec:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01eee:	f8 2f       	JUMP.S 0xffa01ede <_sprintf_hex+0x2e>;

ffa01ef0 <_strprintf_int>:
ffa01ef0:	fd 05       	[--SP] = (R7:7, P5:5);
ffa01ef2:	29 32       	P5 = R1;
ffa01ef4:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01ef8:	38 30       	R7 = R0;
ffa01efa:	0a 30       	R1 = R2;
ffa01efc:	ff e3 5c ff 	CALL 0xffa01db4 <_sprintf_int>;
ffa01f00:	29 91       	R1 = [P5];
ffa01f02:	41 50       	R1 = R1 + R0;
ffa01f04:	04 cc 38 0e 	R7 = R7 + R0 (NS) || [P5] = R1 || NOP;
ffa01f08:	29 93 00 00 
ffa01f0c:	07 30       	R0 = R7;
ffa01f0e:	01 e8 00 00 	UNLINK;
ffa01f12:	bd 05       	(R7:7, P5:5) = [SP++];
ffa01f14:	10 00       	RTS;
	...

ffa01f18 <_strprintf_hex>:
ffa01f18:	fd 05       	[--SP] = (R7:7, P5:5);
ffa01f1a:	29 32       	P5 = R1;
ffa01f1c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01f20:	38 30       	R7 = R0;
ffa01f22:	0a 30       	R1 = R2;
ffa01f24:	ff e3 c6 ff 	CALL 0xffa01eb0 <_sprintf_hex>;
ffa01f28:	29 91       	R1 = [P5];
ffa01f2a:	41 50       	R1 = R1 + R0;
ffa01f2c:	04 cc 38 0e 	R7 = R7 + R0 (NS) || [P5] = R1 || NOP;
ffa01f30:	29 93 00 00 
ffa01f34:	07 30       	R0 = R7;
ffa01f36:	01 e8 00 00 	UNLINK;
ffa01f3a:	bd 05       	(R7:7, P5:5) = [SP++];
ffa01f3c:	10 00       	RTS;
	...

ffa01f40 <_atoi_>:
ffa01f40:	10 32       	P2 = R0;
ffa01f42:	68 05       	[--SP] = (R7:5);
ffa01f44:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01f48:	39 30       	R7 = R1;
ffa01f4a:	6a 61       	R2 = 0x2d (X);		/*		R2=0x2d( 45) */
ffa01f4c:	51 99       	R1 = B[P2] (X);
ffa01f4e:	08 43       	R0 = R1.B (X);
ffa01f50:	10 08       	CC = R0 == R2;
ffa01f52:	28 18       	IF CC JUMP 0xffa01fa2 <_atoi_+0x62>;
ffa01f54:	03 60       	R3 = 0x0 (X);		/*		R3=0x0(  0) */
ffa01f56:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa01f58:	11 30       	R2 = R1;
ffa01f5a:	82 66       	R2 += -0x30;		/* (-48) */
ffa01f5c:	50 43       	R0 = R2.B (Z);
ffa01f5e:	4a 32       	P1 = P2;
ffa01f60:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01f62:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01f64:	02 68       	P2 = 0x0 (X);		/*		P2=0x0(  0) */
ffa01f66:	10 0a       	CC = R0 <= R2 (IU);
ffa01f68:	16 10       	IF !CC JUMP 0xffa01f94 <_atoi_+0x54>;
ffa01f6a:	4d 60       	R5 = 0x9 (X);		/*		R5=0x9(  9) */
ffa01f6c:	bb 08       	CC = R3 < R7;
ffa01f6e:	13 10       	IF !CC JUMP 0xffa01f94 <_atoi_+0x54>;
ffa01f70:	42 30       	R0 = P2;
ffa01f72:	80 66       	R0 += -0x30;		/* (-48) */
ffa01f74:	09 43       	R1 = R1.B (X);
ffa01f76:	48 50       	R1 = R0 + R1;
ffa01f78:	11 32       	P2 = R1;
ffa01f7a:	49 98       	R1 = B[P1++] (X);
ffa01f7c:	11 30       	R2 = R1;
ffa01f7e:	82 66       	R2 += -0x30;		/* (-48) */
ffa01f80:	50 43       	R0 = R2.B (Z);
ffa01f82:	28 0a       	CC = R0 <= R5 (IU);
ffa01f84:	03 14       	IF !CC JUMP 0xffa01f8a <_atoi_+0x4a> (BP);
ffa01f86:	92 5e       	P2 = P2 + (P2 << 0x2);
ffa01f88:	92 5a       	P2 = P2 << 0x1;
ffa01f8a:	50 43       	R0 = R2.B (Z);
ffa01f8c:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01f8e:	0b 64       	R3 += 0x1;		/* (  1) */
ffa01f90:	10 0a       	CC = R0 <= R2 (IU);
ffa01f92:	ed 1f       	IF CC JUMP 0xffa01f6c <_atoi_+0x2c> (BP);
ffa01f94:	6a 30       	R5 = P2;
ffa01f96:	f5 40       	R5 *= R6;
ffa01f98:	01 e8 00 00 	UNLINK;
ffa01f9c:	05 30       	R0 = R5;
ffa01f9e:	28 05       	(R7:5) = [SP++];
ffa01fa0:	10 00       	RTS;
ffa01fa2:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa01fa4:	51 99       	R1 = B[P2] (X);
ffa01fa6:	0b 60       	R3 = 0x1 (X);		/*		R3=0x1(  1) */
ffa01fa8:	fe 63       	R6 = -0x1 (X);		/*		R6=0xffffffff( -1) */
ffa01faa:	d7 2f       	JUMP.S 0xffa01f58 <_atoi_+0x18>;

ffa01fac <_udelay>:
ffa01fac:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01fb0:	00 0d       	CC = R0 <= 0x0;
ffa01fb2:	0a 18       	IF CC JUMP 0xffa01fc6 <_udelay+0x1a>;
ffa01fb4:	08 32       	P1 = R0;
ffa01fb6:	a2 e0 07 10 	LSETUP(0xffa01fba <_udelay+0xe>, 0xffa01fc4 <_udelay+0x18>) LC0 = P1;
ffa01fba:	2a e1 a0 00 	P2 = 0xa0 (X);		/*		P2=0xa0(160) */
ffa01fbe:	b2 e0 03 20 	LSETUP(0xffa01fc2 <_udelay+0x16>, 0xffa01fc4 <_udelay+0x18>) LC1 = P2;
ffa01fc2:	00 00       	NOP;
ffa01fc4:	00 00       	NOP;
ffa01fc6:	01 e8 00 00 	UNLINK;
ffa01fca:	10 00       	RTS;

ffa01fcc <_bfin_EMAC_send_check>:
ffa01fcc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc000a0(-4194144) */
ffa01fd0:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01fd4:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa01fd8:	10 95       	R0 = W[P2] (Z);
ffa01fda:	c0 42       	R0 = R0.L (Z);
ffa01fdc:	18 4e       	R0 >>= 0x3;
ffa01fde:	00 4b       	BITTGL (R0, 0x0);		/* bit  0 */
ffa01fe0:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa01fe2:	08 54       	R0 = R0 & R1;
ffa01fe4:	01 e8 00 00 	UNLINK;
ffa01fe8:	10 00       	RTS;
	...

ffa01fec <_FormatIPAddress>:
ffa01fec:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01ff0:	18 30       	R3 = R0;
ffa01ff2:	b8 e4 14 00 	R0 = B[FP + 0x14] (Z);
ffa01ff6:	40 4f       	R0 <<= 0x8;
ffa01ff8:	52 43       	R2 = R2.B (Z);
ffa01ffa:	10 56       	R0 = R0 | R2;
ffa01ffc:	40 4f       	R0 <<= 0x8;
ffa01ffe:	49 43       	R1 = R1.B (Z);
ffa02000:	08 56       	R0 = R0 | R1;
ffa02002:	40 4f       	R0 <<= 0x8;
ffa02004:	5b 43       	R3 = R3.B (Z);
ffa02006:	18 56       	R0 = R0 | R3;
ffa02008:	01 e8 00 00 	UNLINK;
ffa0200c:	10 00       	RTS;
	...

ffa02010 <_bfin_EMAC_halt>:
ffa02010:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ca8(-4191064) */
ffa02014:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02018:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0201a:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa0201e:	10 93       	[P2] = R0;
ffa02020:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa02024:	0a e1 48 0c 	P2.L = 0xc48;		/* (3144)	P2=0xffc00c48(-4191160) */
ffa02028:	10 97       	W[P2] = R0;
ffa0202a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c48(-4191160) */
ffa0202e:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa02032:	10 97       	W[P2] = R0;
ffa02034:	01 e8 00 00 	UNLINK;
ffa02038:	10 00       	RTS;
	...

ffa0203c <_PollMdcDone>:
ffa0203c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa02040:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02044:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02048:	10 91       	R0 = [P2];
ffa0204a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0204c:	09 18       	IF CC JUMP 0xffa0205e <_PollMdcDone+0x22>;
ffa0204e:	00 00       	NOP;
ffa02050:	00 00       	NOP;
ffa02052:	42 34       	I0 = P2;
ffa02054:	00 00       	NOP;
ffa02056:	00 00       	NOP;
ffa02058:	00 9d       	R0 = [I0];
ffa0205a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0205c:	fc 17       	IF !CC JUMP 0xffa02054 <_PollMdcDone+0x18> (BP);
ffa0205e:	01 e8 00 00 	UNLINK;
ffa02062:	10 00       	RTS;

ffa02064 <_WrPHYReg>:
ffa02064:	78 05       	[--SP] = (R7:7);
ffa02066:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa0206a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0206e:	18 30       	R3 = R0;
ffa02070:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02074:	39 30       	R7 = R1;
ffa02076:	10 91       	R0 = [P2];
ffa02078:	0a 30       	R1 = R2;
ffa0207a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0207c:	09 18       	IF CC JUMP 0xffa0208e <_WrPHYReg+0x2a>;
ffa0207e:	00 00       	NOP;
ffa02080:	00 00       	NOP;
ffa02082:	42 34       	I0 = P2;
ffa02084:	00 00       	NOP;
ffa02086:	00 00       	NOP;
ffa02088:	00 9d       	R0 = [I0];
ffa0208a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0208c:	fc 17       	IF !CC JUMP 0xffa02084 <_WrPHYReg+0x20> (BP);
ffa0208e:	c8 42       	R0 = R1.L (Z);
ffa02090:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02094:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02098:	d9 42       	R1 = R3.L (Z);
ffa0209a:	10 93       	[P2] = R0;
ffa0209c:	59 4f       	R1 <<= 0xb;
ffa0209e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa020a0:	c9 42       	R1 = R1.L (Z);
ffa020a2:	41 56       	R1 = R1 | R0;
ffa020a4:	f8 60       	R0 = 0x1f (X);		/*		R0=0x1f( 31) */
ffa020a6:	38 54       	R0 = R0 & R7;
ffa020a8:	30 4f       	R0 <<= 0x6;
ffa020aa:	41 56       	R1 = R1 | R0;
ffa020ac:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa020ae:	11 93       	[P2] = R1;
ffa020b0:	01 e8 00 00 	UNLINK;
ffa020b4:	38 05       	(R7:7) = [SP++];
ffa020b6:	10 00       	RTS;

ffa020b8 <_RdPHYReg>:
ffa020b8:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa020bc:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa020c0:	10 30       	R2 = R0;
ffa020c2:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa020c6:	10 91       	R0 = [P2];
ffa020c8:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020ca:	09 18       	IF CC JUMP 0xffa020dc <_RdPHYReg+0x24>;
ffa020cc:	00 00       	NOP;
ffa020ce:	00 00       	NOP;
ffa020d0:	42 34       	I0 = P2;
ffa020d2:	00 00       	NOP;
ffa020d4:	00 00       	NOP;
ffa020d6:	00 9d       	R0 = [I0];
ffa020d8:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020da:	fc 17       	IF !CC JUMP 0xffa020d2 <_RdPHYReg+0x1a> (BP);
ffa020dc:	cb 42       	R3 = R1.L (Z);
ffa020de:	d0 42       	R0 = R2.L (Z);
ffa020e0:	58 4f       	R0 <<= 0xb;
ffa020e2:	f9 60       	R1 = 0x1f (X);		/*		R1=0x1f( 31) */
ffa020e4:	c0 42       	R0 = R0.L (Z);
ffa020e6:	4b 54       	R1 = R3 & R1;
ffa020e8:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa020ea:	31 4f       	R1 <<= 0x6;
ffa020ec:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa020f0:	08 56       	R0 = R0 | R1;
ffa020f2:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa020f6:	10 93       	[P2] = R0;
ffa020f8:	10 91       	R0 = [P2];
ffa020fa:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020fc:	09 18       	IF CC JUMP 0xffa0210e <_RdPHYReg+0x56>;
ffa020fe:	00 00       	NOP;
ffa02100:	00 00       	NOP;
ffa02102:	42 34       	I0 = P2;
ffa02104:	00 00       	NOP;
ffa02106:	00 00       	NOP;
ffa02108:	00 9d       	R0 = [I0];
ffa0210a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0210c:	fc 17       	IF !CC JUMP 0xffa02104 <_RdPHYReg+0x4c> (BP);
ffa0210e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02112:	0b 32       	P1 = R3;
ffa02114:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02118:	10 91       	R0 = [P2];
ffa0211a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903018 */
ffa0211e:	0a e1 f4 0e 	P2.L = 0xef4;		/* (3828)	P2=0xff900ef4 <_PHYregs> */
ffa02122:	8a 5c       	P2 = P2 + (P1 << 0x1);
ffa02124:	10 97       	W[P2] = R0;
ffa02126:	01 e8 00 00 	UNLINK;
ffa0212a:	10 00       	RTS;

ffa0212c <_SoftResetPHY>:
ffa0212c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ef4(-4190476) */
ffa02130:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02134:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02138:	10 91       	R0 = [P2];
ffa0213a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0213c:	09 18       	IF CC JUMP 0xffa0214e <_SoftResetPHY+0x22>;
ffa0213e:	00 00       	NOP;
ffa02140:	00 00       	NOP;
ffa02142:	42 34       	I0 = P2;
ffa02144:	00 00       	NOP;
ffa02146:	00 00       	NOP;
ffa02148:	00 9d       	R0 = [I0];
ffa0214a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0214c:	fc 17       	IF !CC JUMP 0xffa02144 <_SoftResetPHY+0x18> (BP);
ffa0214e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02152:	80 e1 00 80 	R0 = 0x8000 (Z);		/*		R0=0x8000(32768) */
ffa02156:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa0215a:	10 93       	[P2] = R0;
ffa0215c:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0215e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02160:	10 93       	[P2] = R0;
ffa02162:	10 91       	R0 = [P2];
ffa02164:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02166:	09 18       	IF CC JUMP 0xffa02178 <_SoftResetPHY+0x4c>;
ffa02168:	00 00       	NOP;
ffa0216a:	00 00       	NOP;
ffa0216c:	42 34       	I0 = P2;
ffa0216e:	00 00       	NOP;
ffa02170:	00 00       	NOP;
ffa02172:	00 9d       	R0 = [I0];
ffa02174:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02176:	fc 17       	IF !CC JUMP 0xffa0216e <_SoftResetPHY+0x42> (BP);
ffa02178:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa0217c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0217e:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02182:	10 93       	[P2] = R0;
ffa02184:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02186:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa02188:	10 93       	[P2] = R0;
ffa0218a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0218c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0218e:	ff e3 95 ff 	CALL 0xffa020b8 <_RdPHYReg>;
ffa02192:	80 42       	R0 = R0.L (X);
ffa02194:	80 0c       	CC = R0 < 0x0;
ffa02196:	fa 1f       	IF CC JUMP 0xffa0218a <_SoftResetPHY+0x5e> (BP);
ffa02198:	01 e8 00 00 	UNLINK;
ffa0219c:	10 00       	RTS;
	...

ffa021a0 <_NetCksum>:
ffa021a0:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021a4:	01 0d       	CC = R1 <= 0x0;
ffa021a6:	0f 18       	IF CC JUMP 0xffa021c4 <_NetCksum+0x24>;
ffa021a8:	08 32       	P1 = R0;
ffa021aa:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa021ac:	11 32       	P2 = R1;
ffa021ae:	b2 e0 03 20 	LSETUP(0xffa021b2 <_NetCksum+0x12>, 0xffa021b4 <_NetCksum+0x14>) LC1 = P2;
ffa021b2:	08 94       	R0 = W[P1++] (Z);
ffa021b4:	82 50       	R2 = R2 + R0;
ffa021b6:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa021ba:	02 50       	R0 = R2 + R0;
ffa021bc:	c0 42       	R0 = R0.L (Z);
ffa021be:	01 e8 00 00 	UNLINK;
ffa021c2:	10 00       	RTS;
ffa021c4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa021c6:	fc 2f       	JUMP.S 0xffa021be <_NetCksum+0x1e>;

ffa021c8 <_htons>:
ffa021c8:	c1 42       	R1 = R0.L (Z);
ffa021ca:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021ce:	41 4e       	R1 >>= 0x8;
ffa021d0:	40 4f       	R0 <<= 0x8;
ffa021d2:	08 56       	R0 = R0 | R1;
ffa021d4:	01 e8 00 00 	UNLINK;
ffa021d8:	10 00       	RTS;
	...

ffa021dc <_htonl>:
ffa021dc:	10 30       	R2 = R0;
ffa021de:	41 43       	R1 = R0.B (Z);
ffa021e0:	40 4e       	R0 >>= 0x8;
ffa021e2:	41 4f       	R1 <<= 0x8;
ffa021e4:	40 43       	R0 = R0.B (Z);
ffa021e6:	08 56       	R0 = R0 | R1;
ffa021e8:	82 c6 82 83 	R1 = R2 >> 0x10;
ffa021ec:	40 4f       	R0 <<= 0x8;
ffa021ee:	49 43       	R1 = R1.B (Z);
ffa021f0:	08 56       	R0 = R0 | R1;
ffa021f2:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021f6:	40 4f       	R0 <<= 0x8;
ffa021f8:	c2 4e       	R2 >>= 0x18;
ffa021fa:	10 56       	R0 = R0 | R2;
ffa021fc:	01 e8 00 00 	UNLINK;
ffa02200:	10 00       	RTS;
	...

ffa02204 <_pack4chars>:
ffa02204:	08 32       	P1 = R0;
ffa02206:	10 32       	P2 = R0;
ffa02208:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0220c:	01 e8 00 00 	UNLINK;
ffa02210:	88 e4 01 00 	R0 = B[P1 + 0x1] (Z);
ffa02214:	11 98       	R1 = B[P2++] (Z);
ffa02216:	40 4f       	R0 <<= 0x8;
ffa02218:	08 50       	R0 = R0 + R1;
ffa0221a:	91 e4 01 00 	R1 = B[P2 + 0x1] (Z);
ffa0221e:	81 4f       	R1 <<= 0x10;
ffa02220:	08 50       	R0 = R0 + R1;
ffa02222:	91 e4 02 00 	R1 = B[P2 + 0x2] (Z);
ffa02226:	c1 4f       	R1 <<= 0x18;
ffa02228:	08 50       	R0 = R0 + R1;
ffa0222a:	10 00       	RTS;

ffa0222c <_ip_header_setup>:
ffa0222c:	00 32       	P0 = R0;
ffa0222e:	11 32       	P2 = R1;
ffa02230:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa02234:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02238:	00 9b       	B[P0] = R0;
ffa0223a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0223c:	80 e6 01 00 	B[P0 + 0x1] = R0;
ffa02240:	11 91       	R1 = [P2];
ffa02242:	82 c6 41 80 	R0 = R1 << 0x8;
ffa02246:	93 e4 01 00 	R3 = B[P2 + 0x1] (Z);
ffa0224a:	61 67       	R1 += -0x14;		/* (-20) */
ffa0224c:	11 93       	[P2] = R1;
ffa0224e:	18 56       	R0 = R0 | R3;
ffa02250:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903018 */
ffa02254:	0a e1 3e 0f 	P2.L = 0xf3e;		/* (3902)	P2=0xff900f3e <_NetIPID> */
ffa02258:	40 b4       	W[P0 + 0x2] = R0;
ffa0225a:	10 95       	R0 = W[P2] (Z);
ffa0225c:	08 30       	R1 = R0;
ffa0225e:	09 64       	R1 += 0x1;		/* (  1) */
ffa02260:	11 97       	W[P2] = R1;
ffa02262:	c1 42       	R1 = R0.L (Z);
ffa02264:	41 4e       	R1 >>= 0x8;
ffa02266:	40 4f       	R0 <<= 0x8;
ffa02268:	08 56       	R0 = R0 | R1;
ffa0226a:	80 b4       	W[P0 + 0x4] = R0;
ffa0226c:	82 c6 42 01 	R0 = R2 >>> 0x18;
ffa02270:	c0 4f       	R0 <<= 0x18;
ffa02272:	21 e1 40 00 	R1 = 0x40 (X);		/*		R1=0x40( 64) */
ffa02276:	00 0c       	CC = R0 == 0x0;
ffa02278:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0227a:	c1 b4       	W[P0 + 0x6] = R1;
ffa0227c:	08 07       	IF CC R1 = R0;
ffa0227e:	b8 e5 14 00 	R0 = B[FP + 0x14] (X);
ffa02282:	80 e6 09 00 	B[P0 + 0x9] = R0;
ffa02286:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02288:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3e <_NetIPID> */
ffa0228c:	81 e6 08 00 	B[P0 + 0x8] = R1;
ffa02290:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa02294:	40 b5       	W[P0 + 0xa] = R0;
ffa02296:	10 91       	R0 = [P2];
ffa02298:	02 b1       	[P0 + 0x10] = R2;
ffa0229a:	50 30       	R2 = P0;
ffa0229c:	c0 b0       	[P0 + 0xc] = R0;
ffa0229e:	48 32       	P1 = P0;
ffa022a0:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa022a2:	a2 64       	R2 += 0x14;		/* ( 20) */
ffa022a4:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa022a6:	b2 e0 03 20 	LSETUP(0xffa022aa <_ip_header_setup+0x7e>, 0xffa022ac <_ip_header_setup+0x80>) LC1 = P2;
ffa022aa:	08 94       	R0 = W[P1++] (Z);
ffa022ac:	41 50       	R1 = R1 + R0;
ffa022ae:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa022b2:	01 50       	R0 = R1 + R0;
ffa022b4:	c0 42       	R0 = R0.L (Z);
ffa022b6:	c0 43       	R0 =~ R0;
ffa022b8:	40 b5       	W[P0 + 0xa] = R0;
ffa022ba:	02 30       	R0 = R2;
ffa022bc:	01 e8 00 00 	UNLINK;
ffa022c0:	10 00       	RTS;
	...

ffa022c4 <_ip_header_checksum>:
ffa022c4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa022c8:	08 32       	P1 = R0;
ffa022ca:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa022cc:	a2 68       	P2 = 0x14 (X);		/*		P2=0x14( 20) */
ffa022ce:	b2 e0 03 20 	LSETUP(0xffa022d2 <_ip_header_checksum+0xe>, 0xffa022d4 <_ip_header_checksum+0x10>) LC1 = P2;
ffa022d2:	08 94       	R0 = W[P1++] (Z);
ffa022d4:	41 50       	R1 = R1 + R0;
ffa022d6:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa022da:	01 50       	R0 = R1 + R0;
ffa022dc:	c0 42       	R0 = R0.L (Z);
ffa022de:	08 02       	CC = R0;
ffa022e0:	00 02       	R0 = CC;
ffa022e2:	01 e8 00 00 	UNLINK;
ffa022e6:	10 00       	RTS;

ffa022e8 <_icmp_header_setup>:
ffa022e8:	00 32       	P0 = R0;
ffa022ea:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa022ec:	c5 04       	[--SP] = (P5:5);
ffa022ee:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa022f2:	29 32       	P5 = R1;
ffa022f4:	80 e6 01 00 	B[P0 + 0x1] = R0;
ffa022f8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa022fa:	40 b4       	W[P0 + 0x2] = R0;
ffa022fc:	38 ab       	R0 = W[FP + 0x18] (X);
ffa022fe:	02 9b       	B[P0] = R2;
ffa02300:	80 b4       	W[P0 + 0x4] = R0;
ffa02302:	b8 ab       	R0 = W[FP + 0x1c] (X);
ffa02304:	50 30       	R2 = P0;
ffa02306:	c0 b4       	W[P0 + 0x6] = R0;
ffa02308:	48 32       	P1 = P0;
ffa0230a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0230c:	42 64       	R2 += 0x8;		/* (  8) */
ffa0230e:	22 68       	P2 = 0x4 (X);		/*		P2=0x4(  4) */
ffa02310:	b2 e0 03 20 	LSETUP(0xffa02314 <_icmp_header_setup+0x2c>, 0xffa02316 <_icmp_header_setup+0x2e>) LC1 = P2;
ffa02314:	08 94       	R0 = W[P1++] (Z);
ffa02316:	41 50       	R1 = R1 + R0;
ffa02318:	c8 42       	R0 = R1.L (Z);
ffa0231a:	81 4e       	R1 >>= 0x10;
ffa0231c:	41 50       	R1 = R1 + R0;
ffa0231e:	28 91       	R0 = [P5];
ffa02320:	c0 67       	R0 += -0x8;		/* ( -8) */
ffa02322:	28 93       	[P5] = R0;
ffa02324:	c9 43       	R1 =~ R1;
ffa02326:	01 e8 00 00 	UNLINK;
ffa0232a:	82 ce 02 c0 	R0 = ROT R2 BY 0x0 || W[P0 + 0x2] = R1 || NOP;
ffa0232e:	41 b4 00 00 
ffa02332:	85 04       	(P5:5) = [SP++];
ffa02334:	10 00       	RTS;
	...

ffa02338 <_udp_header_setup>:
ffa02338:	10 32       	P2 = R0;
ffa0233a:	d0 42       	R0 = R2.L (Z);
ffa0233c:	09 32       	P1 = R1;
ffa0233e:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02342:	40 4e       	R0 >>= 0x8;
ffa02344:	42 4f       	R2 <<= 0x8;
ffa02346:	79 a1       	R1 = [FP + 0x14];
ffa02348:	82 56       	R2 = R2 | R0;
ffa0234a:	c8 42       	R0 = R1.L (Z);
ffa0234c:	40 4e       	R0 >>= 0x8;
ffa0234e:	41 4f       	R1 <<= 0x8;
ffa02350:	41 56       	R1 = R1 | R0;
ffa02352:	51 b4       	W[P2 + 0x2] = R1;
ffa02354:	09 91       	R1 = [P1];
ffa02356:	12 97       	W[P2] = R2;
ffa02358:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa0235c:	82 c6 41 80 	R0 = R1 << 0x8;
ffa02360:	10 56       	R0 = R0 | R2;
ffa02362:	90 b4       	W[P2 + 0x4] = R0;
ffa02364:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02366:	d0 b4       	W[P2 + 0x6] = R0;
ffa02368:	c1 67       	R1 += -0x8;		/* ( -8) */
ffa0236a:	42 6c       	P2 += 0x8;		/* (  8) */
ffa0236c:	42 30       	R0 = P2;
ffa0236e:	09 93       	[P1] = R1;
ffa02370:	01 e8 00 00 	UNLINK;
ffa02374:	10 00       	RTS;
	...

ffa02378 <_tcp_header_setup>:
ffa02378:	08 32       	P1 = R0;
ffa0237a:	20 e1 00 50 	R0 = 0x5000 (X);		/*		R0=0x5000(20480) */
ffa0237e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900004 */
ffa02382:	78 05       	[--SP] = (R7:7);
ffa02384:	0a e1 60 10 	P2.L = 0x1060;		/* (4192)	P2=0xff901060 <_TcpClientPort> */
ffa02388:	08 97       	W[P1] = R0;
ffa0238a:	10 95       	R0 = W[P2] (Z);
ffa0238c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02390:	bb a1       	R3 = [FP + 0x18];
ffa02392:	01 32       	P0 = R1;
ffa02394:	48 b4       	W[P1 + 0x2] = R0;
ffa02396:	59 43       	R1 = R3.B (Z);
ffa02398:	82 ce c3 81 	R0 = R3 >> 0x8 || R7 = [FP + 0x1c] || NOP;
ffa0239c:	ff a1 00 00 
ffa023a0:	41 4f       	R1 <<= 0x8;
ffa023a2:	40 43       	R0 = R0.B (Z);
ffa023a4:	08 56       	R0 = R0 | R1;
ffa023a6:	82 c6 83 83 	R1 = R3 >> 0x10;
ffa023aa:	49 43       	R1 = R1.B (Z);
ffa023ac:	40 4f       	R0 <<= 0x8;
ffa023ae:	08 56       	R0 = R0 | R1;
ffa023b0:	40 4f       	R0 <<= 0x8;
ffa023b2:	c3 4e       	R3 >>= 0x18;
ffa023b4:	18 56       	R0 = R0 | R3;
ffa023b6:	48 b0       	[P1 + 0x4] = R0;
ffa023b8:	79 43       	R1 = R7.B (Z);
ffa023ba:	82 c6 c7 81 	R0 = R7 >> 0x8;
ffa023be:	41 4f       	R1 <<= 0x8;
ffa023c0:	40 43       	R0 = R0.B (Z);
ffa023c2:	08 56       	R0 = R0 | R1;
ffa023c4:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa023c8:	40 4f       	R0 <<= 0x8;
ffa023ca:	49 43       	R1 = R1.B (Z);
ffa023cc:	08 56       	R0 = R0 | R1;
ffa023ce:	c7 4e       	R7 >>= 0x18;
ffa023d0:	40 4f       	R0 <<= 0x8;
ffa023d2:	38 56       	R0 = R0 | R7;
ffa023d4:	88 b0       	[P1 + 0x8] = R0;
ffa023d6:	20 e1 50 00 	R0 = 0x50 (X);		/*		R0=0x50( 80) */
ffa023da:	88 e6 0c 00 	B[P1 + 0xc] = R0;
ffa023de:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa023e0:	c8 b5       	W[P1 + 0xe] = R0;
ffa023e2:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa023e4:	8a e6 0d 00 	B[P1 + 0xd] = R2;
ffa023e8:	08 b6       	W[P1 + 0x10] = R0;
ffa023ea:	48 b6       	W[P1 + 0x12] = R0;
ffa023ec:	00 91       	R0 = [P0];
ffa023ee:	60 67       	R0 += -0x14;		/* (-20) */
ffa023f0:	00 93       	[P0] = R0;
ffa023f2:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa023f4:	01 e8 00 00 	UNLINK;
ffa023f8:	41 30       	R0 = P1;
ffa023fa:	38 05       	(R7:7) = [SP++];
ffa023fc:	10 00       	RTS;
	...

ffa02400 <_bfin_EMAC_send_nocopy>:
ffa02400:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01060(-4190112) */
ffa02404:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02408:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa0240a:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa0240e:	10 97       	W[P2] = R0;
ffa02410:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa02414:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa02418:	10 95       	R0 = W[P2] (Z);
ffa0241a:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa0241c:	55 10       	IF !CC JUMP 0xffa024c6 <_bfin_EMAC_send_nocopy+0xc6>;
ffa0241e:	00 00       	NOP;
ffa02420:	00 00       	NOP;
ffa02422:	00 00       	NOP;
ffa02424:	10 95       	R0 = W[P2] (Z);
ffa02426:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa02428:	16 18       	IF CC JUMP 0xffa02454 <_bfin_EMAC_send_nocopy+0x54>;
ffa0242a:	4a 32       	P1 = P2;
ffa0242c:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf0ca8 */
ffa02430:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa02432:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa02436:	41 34       	I0 = P1;
ffa02438:	b2 e0 06 20 	LSETUP(0xffa0243c <_bfin_EMAC_send_nocopy+0x3c>, 0xffa02444 <_bfin_EMAC_send_nocopy+0x44>) LC1 = P2;
ffa0243c:	20 9d       	R0.L = W[I0];
ffa0243e:	01 54       	R0 = R1 & R0;
ffa02440:	00 0c       	CC = R0 == 0x0;
ffa02442:	09 18       	IF CC JUMP 0xffa02454 <_bfin_EMAC_send_nocopy+0x54>;
ffa02444:	00 00       	NOP;
ffa02446:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900020(-7340000) */
ffa0244a:	00 e1 48 01 	R0.L = 0x148;		/* (328)	R0=0xff900148(-7339704) */
ffa0244e:	ff e3 81 fb 	CALL 0xffa01b50 <_printf_str>;
ffa02452:	2d 20       	JUMP.S 0xffa024ac <_bfin_EMAC_send_nocopy+0xac>;
ffa02454:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900001 */
ffa02458:	08 e1 3c 0f 	P0.L = 0xf3c;		/* (3900)	P0=0xff900f3c <_txIdx> */
ffa0245c:	02 95       	R2 = W[P0] (Z);
ffa0245e:	d1 42       	R1 = R2.L (Z);
ffa02460:	09 32       	P1 = R1;
ffa02462:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff904241 */
ffa02466:	0a e1 40 0f 	P2.L = 0xf40;		/* (3904)	P2=0xff900f40 <_txbuf> */
ffa0246a:	11 0d       	CC = R1 <= 0x2;
ffa0246c:	8a 5e       	P2 = P2 + (P1 << 0x2);
ffa0246e:	51 91       	P1 = [P2];
ffa02470:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00f40(-4190400) */
ffa02474:	0a e1 80 0c 	P2.L = 0xc80;		/* (3200)	P2=0xffc00c80(-4191104) */
ffa02478:	88 a1       	R0 = [P1 + 0x18];
ffa0247a:	48 b0       	[P1 + 0x4] = R0;
ffa0247c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0247e:	88 b2       	[P1 + 0x28] = R0;
ffa02480:	51 93       	[P2] = P1;
ffa02482:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c80 */
ffa02486:	0a e1 82 05 	P2.L = 0x582;		/* (1410)	P2=0xff900582 <_txdmacfg> */
ffa0248a:	10 95       	R0 = W[P2] (Z);
ffa0248c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00582(-4192894) */
ffa02490:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa02494:	10 97       	W[P2] = R0;
ffa02496:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa0249a:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa0249e:	10 91       	R0 = [P2];
ffa024a0:	80 4a       	BITSET (R0, 0x10);		/* bit 16 */
ffa024a2:	10 93       	[P2] = R0;
ffa024a4:	0e 10       	IF !CC JUMP 0xffa024c0 <_bfin_EMAC_send_nocopy+0xc0>;
ffa024a6:	02 30       	R0 = R2;
ffa024a8:	08 64       	R0 += 0x1;		/* (  1) */
ffa024aa:	00 97       	W[P0] = R0;
ffa024ac:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa024b0:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa024b2:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa024b6:	10 97       	W[P2] = R0;
ffa024b8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa024ba:	01 e8 00 00 	UNLINK;
ffa024be:	10 00       	RTS;
ffa024c0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa024c2:	00 97       	W[P0] = R0;
ffa024c4:	f4 2f       	JUMP.S 0xffa024ac <_bfin_EMAC_send_nocopy+0xac>;
ffa024c6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa024ca:	00 e1 30 01 	R0.L = 0x130;		/* (304)	R0=0xff900130(-7339728) */
ffa024ce:	ff e3 41 fb 	CALL 0xffa01b50 <_printf_str>;
ffa024d2:	ed 2f       	JUMP.S 0xffa024ac <_bfin_EMAC_send_nocopy+0xac>;

ffa024d4 <_DHCP_tx>:
ffa024d4:	60 05       	[--SP] = (R7:4);
ffa024d6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900704 */
ffa024da:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa024de:	38 30       	R7 = R0;
ffa024e0:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa024e4:	10 95       	R0 = W[P2] (Z);
ffa024e6:	10 32       	P2 = R0;
ffa024e8:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900008 */
ffa024ec:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa024f0:	20 e1 1a 01 	R0 = 0x11a (X);		/*		R0=0x11a(282) */
ffa024f4:	fb 63       	R3 = -0x1 (X);		/*		R3=0xffffffff( -1) */
ffa024f6:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa024f8:	52 91       	P2 = [P2];
ffa024fa:	07 50       	R0 = R7 + R0;
ffa024fc:	19 34       	I3 = R1;
ffa024fe:	90 ad       	P0 = [P2 + 0x18];
ffa02500:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa02504:	0a e1 64 0f 	P2.L = 0xf64;		/* (3940)	P2=0xff900f64 <_NetOurMAC> */
ffa02508:	00 97       	W[P0] = R0;
ffa0250a:	83 e6 02 00 	B[P0 + 0x2] = R3;
ffa0250e:	83 e6 03 00 	B[P0 + 0x3] = R3;
ffa02512:	83 e6 04 00 	B[P0 + 0x4] = R3;
ffa02516:	83 e6 05 00 	B[P0 + 0x5] = R3;
ffa0251a:	83 e6 06 00 	B[P0 + 0x6] = R3;
ffa0251e:	83 e6 07 00 	B[P0 + 0x7] = R3;
ffa02522:	50 99       	R0 = B[P2] (X);
ffa02524:	80 e6 08 00 	B[P0 + 0x8] = R0;
ffa02528:	08 34       	I1 = R0;
ffa0252a:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa0252e:	80 e6 09 00 	B[P0 + 0x9] = R0;
ffa02532:	94 e5 02 00 	R4 = B[P2 + 0x2] (X);
ffa02536:	84 e6 0a 00 	B[P0 + 0xa] = R4;
ffa0253a:	95 e5 03 00 	R5 = B[P2 + 0x3] (X);
ffa0253e:	85 e6 0b 00 	B[P0 + 0xb] = R5;
ffa02542:	96 e5 04 00 	R6 = B[P2 + 0x4] (X);
ffa02546:	86 e6 0c 00 	B[P0 + 0xc] = R6;
ffa0254a:	00 34       	I0 = R0;
ffa0254c:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02550:	80 e6 0d 00 	B[P0 + 0xd] = R0;
ffa02554:	10 34       	I2 = R0;
ffa02556:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02558:	c0 b5       	W[P0 + 0xe] = R0;
ffa0255a:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa0255e:	80 e6 10 00 	B[P0 + 0x10] = R0;
ffa02562:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02564:	80 e6 11 00 	B[P0 + 0x11] = R0;
ffa02568:	20 e1 0c 01 	R0 = 0x10c (X);		/*		R0=0x10c(268) */
ffa0256c:	07 50       	R0 = R7 + R0;
ffa0256e:	c1 42       	R1 = R0.L (Z);
ffa02570:	41 4e       	R1 >>= 0x8;
ffa02572:	40 4f       	R0 <<= 0x8;
ffa02574:	08 56       	R0 = R0 | R1;
ffa02576:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f64 <_NetOurMAC> */
ffa0257a:	0a e1 3e 0f 	P2.L = 0xf3e;		/* (3902)	P2=0xff900f3e <_NetIPID> */
ffa0257e:	40 b6       	W[P0 + 0x12] = R0;
ffa02580:	10 95       	R0 = W[P2] (Z);
ffa02582:	08 30       	R1 = R0;
ffa02584:	09 64       	R1 += 0x1;		/* (  1) */
ffa02586:	11 97       	W[P2] = R1;
ffa02588:	c1 42       	R1 = R0.L (Z);
ffa0258a:	41 4e       	R1 >>= 0x8;
ffa0258c:	40 4f       	R0 <<= 0x8;
ffa0258e:	08 56       	R0 = R0 | R1;
ffa02590:	80 b6       	W[P0 + 0x14] = R0;
ffa02592:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa02596:	c0 b6       	W[P0 + 0x16] = R0;
ffa02598:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa0259a:	80 e6 19 00 	B[P0 + 0x19] = R0;
ffa0259e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa025a0:	40 b7       	W[P0 + 0x1a] = R0;
ffa025a2:	00 cc 00 c0 	R0 = R0 -|- R0 || [P0 + 0x20] = R2 || NOP;
ffa025a6:	02 b2 00 00 
ffa025aa:	48 32       	P1 = P0;
ffa025ac:	83 e6 18 00 	B[P0 + 0x18] = R3;
ffa025b0:	c0 b1       	[P0 + 0x1c] = R0;
ffa025b2:	81 6c       	P1 += 0x10;		/* ( 16) */
ffa025b4:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa025b6:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa025b8:	b2 e0 03 20 	LSETUP(0xffa025bc <_DHCP_tx+0xe8>, 0xffa025be <_DHCP_tx+0xea>) LC1 = P2;
ffa025bc:	08 94       	R0 = W[P1++] (Z);
ffa025be:	41 50       	R1 = R1 + R0;
ffa025c0:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa025c4:	01 50       	R0 = R1 + R0;
ffa025c6:	c0 42       	R0 = R0.L (Z);
ffa025c8:	c0 43       	R0 =~ R0;
ffa025ca:	40 b7       	W[P0 + 0x1a] = R0;
ffa025cc:	20 e1 00 44 	R0 = 0x4400 (X);		/*		R0=0x4400(17408) */
ffa025d0:	40 e6 12 00 	W[P0 + 0x24] = R0;
ffa025d4:	20 e1 00 43 	R0 = 0x4300 (X);		/*		R0=0x4300(17152) */
ffa025d8:	40 e6 13 00 	W[P0 + 0x26] = R0;
ffa025dc:	20 e1 f8 00 	R0 = 0xf8 (X);		/*		R0=0xf8(248) */
ffa025e0:	07 50       	R0 = R7 + R0;
ffa025e2:	c1 42       	R1 = R0.L (Z);
ffa025e4:	41 4e       	R1 >>= 0x8;
ffa025e6:	40 4f       	R0 <<= 0x8;
ffa025e8:	08 56       	R0 = R0 | R1;
ffa025ea:	40 e6 14 00 	W[P0 + 0x28] = R0;
ffa025ee:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa025f0:	80 e6 2c 00 	B[P0 + 0x2c] = R0;
ffa025f4:	80 e6 2d 00 	B[P0 + 0x2d] = R0;
ffa025f8:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa025fa:	80 e6 2e 00 	B[P0 + 0x2e] = R0;
ffa025fe:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02600:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0000a(-4194294) */
ffa02604:	0a e1 04 30 	P2.L = 0x3004;		/* (12292)	P2=0xffc03004(-4182012) */
ffa02608:	80 e6 2f 00 	B[P0 + 0x2f] = R0;
ffa0260c:	10 91       	R0 = [P2];
ffa0260e:	00 b3       	[P0 + 0x30] = R0;
ffa02610:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02612:	80 b3       	[P0 + 0x38] = R0;
ffa02614:	c0 b3       	[P0 + 0x3c] = R0;
ffa02616:	00 e6 10 00 	[P0 + 0x40] = R0;
ffa0261a:	00 e6 11 00 	[P0 + 0x44] = R0;
ffa0261e:	40 e1 53 63 	R0.H = 0x6353;		/* (25427)	R0=0x63530000(1666383872) */
ffa02622:	00 e1 63 82 	R0.L = 0x8263;		/* (-32157)	R0=0x63538263(1666417251) */
ffa02626:	00 e6 46 00 	[P0 + 0x118] = R0;
ffa0262a:	81 30       	R0 = I1;
ffa0262c:	80 e6 48 00 	B[P0 + 0x48] = R0;
ffa02630:	80 30       	R0 = I0;
ffa02632:	80 e6 49 00 	B[P0 + 0x49] = R0;
ffa02636:	82 30       	R0 = I2;
ffa02638:	2a e1 4e 00 	P2 = 0x4e (X);		/*		P2=0x4e( 78) */
ffa0263c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0263e:	80 e6 4d 00 	B[P0 + 0x4d] = R0;
ffa02642:	50 5a       	P1 = P0 + P2;
ffa02644:	41 e6 15 00 	W[P0 + 0x2a] = R1;
ffa02648:	41 e6 1a 00 	W[P0 + 0x34] = R1;
ffa0264c:	41 e6 1b 00 	W[P0 + 0x36] = R1;
ffa02650:	84 e6 4a 00 	B[P0 + 0x4a] = R4;
ffa02654:	85 e6 4b 00 	B[P0 + 0x4b] = R5;
ffa02658:	86 e6 4c 00 	B[P0 + 0x4c] = R6;
ffa0265c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0265e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02660:	b2 e0 02 20 	LSETUP(0xffa02664 <_DHCP_tx+0x190>, 0xffa02664 <_DHCP_tx+0x190>) LC1 = P2;
ffa02664:	08 9a       	B[P1++] = R0;
ffa02666:	2a e1 58 00 	P2 = 0x58 (X);		/*		P2=0x58( 88) */
ffa0266a:	50 5a       	P1 = P0 + P2;
ffa0266c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0266e:	82 68       	P2 = 0x10 (X);		/*		P2=0x10( 16) */
ffa02670:	b2 e0 02 20 	LSETUP(0xffa02674 <_DHCP_tx+0x1a0>, 0xffa02674 <_DHCP_tx+0x1a0>) LC1 = P2;
ffa02674:	08 92       	[P1++] = R0;
ffa02676:	2a e1 98 00 	P2 = 0x98 (X);		/*		P2=0x98(152) */
ffa0267a:	50 5a       	P1 = P0 + P2;
ffa0267c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0267e:	02 69       	P2 = 0x20 (X);		/*		P2=0x20( 32) */
ffa02680:	b2 e0 02 20 	LSETUP(0xffa02684 <_DHCP_tx+0x1b0>, 0xffa02684 <_DHCP_tx+0x1b0>) LC1 = P2;
ffa02684:	08 92       	[P1++] = R0;
ffa02686:	40 30       	R0 = P0;
ffa02688:	21 e1 1c 01 	R1 = 0x11c (X);		/*		R1=0x11c(284) */
ffa0268c:	48 50       	R1 = R0 + R1;
ffa0268e:	17 30       	R2 = R7;
ffa02690:	83 30       	R0 = I3;
ffa02692:	ff e3 ad fa 	CALL 0xffa01bec <_memcpy_>;
ffa02696:	01 e8 00 00 	UNLINK;
ffa0269a:	20 05       	(R7:4) = [SP++];
ffa0269c:	ff e2 b2 fe 	JUMP.L 0xffa02400 <_bfin_EMAC_send_nocopy>;

ffa026a0 <_DHCP_tx_discover>:
ffa026a0:	c5 04       	[--SP] = (P5:5);
ffa026a2:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa026a6:	0d e1 38 0f 	P5.L = 0xf38;		/* (3896)	P5=0xff900f38 <_NetDHCPserv> */
ffa026aa:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa026ac:	28 93       	[P5] = R0;
ffa026ae:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa026b2:	a8 61       	R0 = 0x35 (X);		/*		R0=0x35( 53) */
ffa026b4:	b8 e6 fc ff 	B[FP + -0x4] = R0;
ffa026b8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa026ba:	b8 e6 fd ff 	B[FP + -0x3] = R0;
ffa026be:	b8 e6 fe ff 	B[FP + -0x2] = R0;
ffa026c2:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa026c4:	b8 e6 ff ff 	B[FP + -0x1] = R0;
ffa026c8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90ffff(-7274497) */
ffa026cc:	00 e1 60 01 	R0.L = 0x160;		/* (352)	R0=0xff900160(-7339680) */
ffa026d0:	ff e3 40 fa 	CALL 0xffa01b50 <_printf_str>;
ffa026d4:	4f 30       	R1 = FP;
ffa026d6:	2a 91       	R2 = [P5];
ffa026d8:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa026da:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa026dc:	ff e3 fc fe 	CALL 0xffa024d4 <_DHCP_tx>;
ffa026e0:	01 e8 00 00 	UNLINK;
ffa026e4:	85 04       	(P5:5) = [SP++];
ffa026e6:	10 00       	RTS;

ffa026e8 <_DHCP_parse>:
ffa026e8:	eb 05       	[--SP] = (R7:5, P5:3);
ffa026ea:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f38 <_NetDHCPserv> */
ffa026ee:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eec <_printf_temp> */
ffa026f2:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900ef0 <_printf_out> */
ffa026f6:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa026fa:	10 30       	R2 = R0;
ffa026fc:	0d e1 90 04 	P5.L = 0x490;		/* (1168)	P5=0xff900490 */
ffa02700:	0c e1 38 0f 	P4.L = 0xf38;		/* (3896)	P4=0xff900f38 <_NetDHCPserv> */
ffa02704:	0b e1 6c 0f 	P3.L = 0xf6c;		/* (3948)	P3=0xff900f6c <_NetSubnetMask> */
ffa02708:	09 0d       	CC = R1 <= 0x1;
ffa0270a:	0b 18       	IF CC JUMP 0xffa02720 <_DHCP_parse+0x38>;
ffa0270c:	12 32       	P2 = R2;
ffa0270e:	31 30       	R6 = R1;
ffa02710:	fe 67       	R6 += -0x1;		/* ( -1) */
ffa02712:	11 98       	R1 = B[P2++] (Z);
ffa02714:	01 0c       	CC = R1 == 0x0;
ffa02716:	0d 10       	IF !CC JUMP 0xffa02730 <_DHCP_parse+0x48>;
ffa02718:	0e 32       	P1 = R6;
ffa0271a:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa0271c:	41 0c       	CC = P1 == 0x0;
ffa0271e:	05 10       	IF !CC JUMP 0xffa02728 <_DHCP_parse+0x40>;
ffa02720:	01 e8 00 00 	UNLINK;
ffa02724:	ab 05       	(R7:5, P5:3) = [SP++];
ffa02726:	10 00       	RTS;
ffa02728:	11 98       	R1 = B[P2++] (Z);
ffa0272a:	fe 67       	R6 += -0x1;		/* ( -1) */
ffa0272c:	01 0c       	CC = R1 == 0x0;
ffa0272e:	f6 1f       	IF CC JUMP 0xffa0271a <_DHCP_parse+0x32> (BP);
ffa02730:	20 e1 ff 00 	R0 = 0xff (X);		/*		R0=0xff(255) */
ffa02734:	57 99       	R7 = B[P2] (X);
ffa02736:	01 08       	CC = R1 == R0;
ffa02738:	f4 1b       	IF CC JUMP 0xffa02720 <_DHCP_parse+0x38>;
ffa0273a:	6a 30       	R5 = P2;
ffa0273c:	d8 61       	R0 = 0x3b (X);		/*		R0=0x3b( 59) */
ffa0273e:	0d 64       	R5 += 0x1;		/* (  1) */
ffa02740:	01 0a       	CC = R1 <= R0 (IU);
ffa02742:	19 1c       	IF CC JUMP 0xffa02774 <_DHCP_parse+0x8c> (BP);
ffa02744:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90003b(-7339973) */
ffa02748:	00 e1 1c 02 	R0.L = 0x21c;		/* (540)	R0=0xff90021c(-7339492) */
ffa0274c:	ff e3 5a f9 	CALL 0xffa01a00 <_printf_int>;
ffa02750:	7f 43       	R7 = R7.B (Z);
ffa02752:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90021c(-7339492) */
ffa02756:	00 e1 e0 03 	R0.L = 0x3e0;		/* (992)	R0=0xff9003e0(-7339040) */
ffa0275a:	0f 30       	R1 = R7;
ffa0275c:	ff e3 52 f9 	CALL 0xffa01a00 <_printf_int>;
ffa02760:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003e0(-7339040) */
ffa02764:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa02768:	ff e3 f4 f9 	CALL 0xffa01b50 <_printf_str>;
ffa0276c:	f8 43       	R0 =~ R7;
ffa0276e:	bd 50       	R2 = R5 + R7;
ffa02770:	70 50       	R1 = R0 + R6;
ffa02772:	cb 2f       	JUMP.S 0xffa02708 <_DHCP_parse+0x20>;
ffa02774:	09 32       	P1 = R1;
ffa02776:	8d 5e       	P2 = P5 + (P1 << 0x2);
ffa02778:	52 91       	P2 = [P2];
ffa0277a:	52 00       	JUMP (P2);
ffa0277c:	0d 32       	P1 = R5;
ffa0277e:	15 32       	P2 = R5;
ffa02780:	7f 43       	R7 = R7.B (Z);
ffa02782:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa02786:	10 98       	R0 = B[P2++] (Z);
ffa02788:	42 4f       	R2 <<= 0x8;
ffa0278a:	82 50       	R2 = R2 + R0;
ffa0278c:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02790:	80 4f       	R0 <<= 0x10;
ffa02792:	82 50       	R2 = R2 + R0;
ffa02794:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02798:	c0 4f       	R0 <<= 0x18;
ffa0279a:	82 50       	R2 = R2 + R0;
ffa0279c:	50 43       	R0 = R2.B (Z);
ffa0279e:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa027a2:	40 4f       	R0 <<= 0x8;
ffa027a4:	49 43       	R1 = R1.B (Z);
ffa027a6:	41 56       	R1 = R1 | R0;
ffa027a8:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa027ac:	40 43       	R0 = R0.B (Z);
ffa027ae:	41 4f       	R1 <<= 0x8;
ffa027b0:	41 56       	R1 = R1 | R0;
ffa027b2:	c2 4e       	R2 >>= 0x18;
ffa027b4:	41 4f       	R1 <<= 0x8;
ffa027b6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900820(-7337952) */
ffa027ba:	51 56       	R1 = R1 | R2;
ffa027bc:	00 e1 04 02 	R0.L = 0x204;		/* (516)	R0=0xff900204(-7339516) */
ffa027c0:	ff e3 20 f9 	CALL 0xffa01a00 <_printf_int>;
ffa027c4:	ce 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa027c6:	0d 32       	P1 = R5;
ffa027c8:	15 32       	P2 = R5;
ffa027ca:	7f 43       	R7 = R7.B (Z);
ffa027cc:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa027d0:	10 98       	R0 = B[P2++] (Z);
ffa027d2:	42 4f       	R2 <<= 0x8;
ffa027d4:	82 50       	R2 = R2 + R0;
ffa027d6:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa027da:	80 4f       	R0 <<= 0x10;
ffa027dc:	82 50       	R2 = R2 + R0;
ffa027de:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa027e2:	c0 4f       	R0 <<= 0x18;
ffa027e4:	82 50       	R2 = R2 + R0;
ffa027e6:	50 43       	R0 = R2.B (Z);
ffa027e8:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa027ec:	40 4f       	R0 <<= 0x8;
ffa027ee:	49 43       	R1 = R1.B (Z);
ffa027f0:	41 56       	R1 = R1 | R0;
ffa027f2:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa027f6:	40 43       	R0 = R0.B (Z);
ffa027f8:	41 4f       	R1 <<= 0x8;
ffa027fa:	41 56       	R1 = R1 | R0;
ffa027fc:	c2 4e       	R2 >>= 0x18;
ffa027fe:	41 4f       	R1 <<= 0x8;
ffa02800:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900204(-7339516) */
ffa02804:	51 56       	R1 = R1 | R2;
ffa02806:	00 e1 f0 01 	R0.L = 0x1f0;		/* (496)	R0=0xff9001f0(-7339536) */
ffa0280a:	ff e3 fb f8 	CALL 0xffa01a00 <_printf_int>;
ffa0280e:	a9 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa02810:	0d 32       	P1 = R5;
ffa02812:	15 32       	P2 = R5;
ffa02814:	7f 43       	R7 = R7.B (Z);
ffa02816:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa0281a:	10 98       	R0 = B[P2++] (Z);
ffa0281c:	41 4f       	R1 <<= 0x8;
ffa0281e:	41 50       	R1 = R1 + R0;
ffa02820:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02824:	80 4f       	R0 <<= 0x10;
ffa02826:	41 50       	R1 = R1 + R0;
ffa02828:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa0282c:	c0 4f       	R0 <<= 0x18;
ffa0282e:	41 50       	R1 = R1 + R0;
ffa02830:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001f0(-7339536) */
ffa02834:	21 93       	[P4] = R1;
ffa02836:	00 e1 dc 01 	R0.L = 0x1dc;		/* (476)	R0=0xff9001dc(-7339556) */
ffa0283a:	ff e3 91 f9 	CALL 0xffa01b5c <_printf_ip>;
ffa0283e:	91 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa02840:	15 32       	P2 = R5;
ffa02842:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001dc(-7339556) */
ffa02846:	00 e1 c8 01 	R0.L = 0x1c8;		/* (456)	R0=0xff9001c8(-7339576) */
ffa0284a:	7f 43       	R7 = R7.B (Z);
ffa0284c:	11 99       	R1 = B[P2] (Z);
ffa0284e:	ff e3 d9 f8 	CALL 0xffa01a00 <_printf_int>;
ffa02852:	87 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa02854:	0d 32       	P1 = R5;
ffa02856:	15 32       	P2 = R5;
ffa02858:	7f 43       	R7 = R7.B (Z);
ffa0285a:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa0285e:	10 98       	R0 = B[P2++] (Z);
ffa02860:	42 4f       	R2 <<= 0x8;
ffa02862:	82 50       	R2 = R2 + R0;
ffa02864:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02868:	80 4f       	R0 <<= 0x10;
ffa0286a:	82 50       	R2 = R2 + R0;
ffa0286c:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02870:	c0 4f       	R0 <<= 0x18;
ffa02872:	82 50       	R2 = R2 + R0;
ffa02874:	50 43       	R0 = R2.B (Z);
ffa02876:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa0287a:	40 4f       	R0 <<= 0x8;
ffa0287c:	49 43       	R1 = R1.B (Z);
ffa0287e:	41 56       	R1 = R1 | R0;
ffa02880:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa02884:	40 43       	R0 = R0.B (Z);
ffa02886:	41 4f       	R1 <<= 0x8;
ffa02888:	41 56       	R1 = R1 | R0;
ffa0288a:	c2 4e       	R2 >>= 0x18;
ffa0288c:	41 4f       	R1 <<= 0x8;
ffa0288e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001c8(-7339576) */
ffa02892:	51 56       	R1 = R1 | R2;
ffa02894:	00 e1 b4 01 	R0.L = 0x1b4;		/* (436)	R0=0xff9001b4(-7339596) */
ffa02898:	ff e3 b4 f8 	CALL 0xffa01a00 <_printf_int>;
ffa0289c:	62 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa0289e:	0d 32       	P1 = R5;
ffa028a0:	15 32       	P2 = R5;
ffa028a2:	7f 43       	R7 = R7.B (Z);
ffa028a4:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa028a8:	10 98       	R0 = B[P2++] (Z);
ffa028aa:	41 4f       	R1 <<= 0x8;
ffa028ac:	41 50       	R1 = R1 + R0;
ffa028ae:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa028b2:	80 4f       	R0 <<= 0x10;
ffa028b4:	41 50       	R1 = R1 + R0;
ffa028b6:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa028ba:	c0 4f       	R0 <<= 0x18;
ffa028bc:	41 50       	R1 = R1 + R0;
ffa028be:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001b4(-7339596) */
ffa028c2:	00 e1 a4 01 	R0.L = 0x1a4;		/* (420)	R0=0xff9001a4(-7339612) */
ffa028c6:	ff e3 4b f9 	CALL 0xffa01b5c <_printf_ip>;
ffa028ca:	4b 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa028cc:	0d 32       	P1 = R5;
ffa028ce:	15 32       	P2 = R5;
ffa028d0:	7f 43       	R7 = R7.B (Z);
ffa028d2:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa028d6:	10 98       	R0 = B[P2++] (Z);
ffa028d8:	41 4f       	R1 <<= 0x8;
ffa028da:	41 50       	R1 = R1 + R0;
ffa028dc:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa028e0:	80 4f       	R0 <<= 0x10;
ffa028e2:	41 50       	R1 = R1 + R0;
ffa028e4:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa028e8:	c0 4f       	R0 <<= 0x18;
ffa028ea:	41 50       	R1 = R1 + R0;
ffa028ec:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001a4(-7339612) */
ffa028f0:	00 e1 94 01 	R0.L = 0x194;		/* (404)	R0=0xff900194(-7339628) */
ffa028f4:	ff e3 34 f9 	CALL 0xffa01b5c <_printf_ip>;
ffa028f8:	34 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa028fa:	0d 32       	P1 = R5;
ffa028fc:	15 32       	P2 = R5;
ffa028fe:	7f 43       	R7 = R7.B (Z);
ffa02900:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa02904:	10 98       	R0 = B[P2++] (Z);
ffa02906:	41 4f       	R1 <<= 0x8;
ffa02908:	41 50       	R1 = R1 + R0;
ffa0290a:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa0290e:	80 4f       	R0 <<= 0x10;
ffa02910:	41 50       	R1 = R1 + R0;
ffa02912:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02916:	c0 4f       	R0 <<= 0x18;
ffa02918:	41 50       	R1 = R1 + R0;
ffa0291a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900194(-7339628) */
ffa0291e:	00 e1 84 01 	R0.L = 0x184;		/* (388)	R0=0xff900184(-7339644) */
ffa02922:	ff e3 1d f9 	CALL 0xffa01b5c <_printf_ip>;
ffa02926:	1d 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;
ffa02928:	0d 32       	P1 = R5;
ffa0292a:	15 32       	P2 = R5;
ffa0292c:	7f 43       	R7 = R7.B (Z);
ffa0292e:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa02932:	10 98       	R0 = B[P2++] (Z);
ffa02934:	41 4f       	R1 <<= 0x8;
ffa02936:	41 50       	R1 = R1 + R0;
ffa02938:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa0293c:	80 4f       	R0 <<= 0x10;
ffa0293e:	41 50       	R1 = R1 + R0;
ffa02940:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02944:	c0 4f       	R0 <<= 0x18;
ffa02946:	41 50       	R1 = R1 + R0;
ffa02948:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900184(-7339644) */
ffa0294c:	19 93       	[P3] = R1;
ffa0294e:	00 e1 74 01 	R0.L = 0x174;		/* (372)	R0=0xff900174(-7339660) */
ffa02952:	ff e3 05 f9 	CALL 0xffa01b5c <_printf_ip>;
ffa02956:	05 2f       	JUMP.S 0xffa02760 <_DHCP_parse+0x78>;

ffa02958 <_bfin_EMAC_send>:
ffa02958:	c4 04       	[--SP] = (P5:4);
ffa0295a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa0295e:	18 30       	R3 = R0;
ffa02960:	11 30       	R2 = R1;
ffa02962:	01 0d       	CC = R1 <= 0x0;
ffa02964:	86 18       	IF CC JUMP 0xffa02a70 <_bfin_EMAC_send+0x118>;
ffa02966:	00 00       	NOP;
ffa02968:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00020(-4194272) */
ffa0296c:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa02970:	10 95       	R0 = W[P2] (Z);
ffa02972:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa02974:	72 10       	IF !CC JUMP 0xffa02a58 <_bfin_EMAC_send+0x100>;
ffa02976:	00 00       	NOP;
ffa02978:	00 00       	NOP;
ffa0297a:	00 00       	NOP;
ffa0297c:	10 95       	R0 = W[P2] (Z);
ffa0297e:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa02980:	1b 18       	IF CC JUMP 0xffa029b6 <_bfin_EMAC_send+0x5e>;
ffa02982:	4a 32       	P1 = P2;
ffa02984:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf0ca8 */
ffa02988:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa0298a:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa0298e:	41 34       	I0 = P1;
ffa02990:	b2 e0 06 20 	LSETUP(0xffa02994 <_bfin_EMAC_send+0x3c>, 0xffa0299c <_bfin_EMAC_send+0x44>) LC1 = P2;
ffa02994:	20 9d       	R0.L = W[I0];
ffa02996:	01 54       	R0 = R1 & R0;
ffa02998:	00 0c       	CC = R0 == 0x0;
ffa0299a:	0e 18       	IF CC JUMP 0xffa029b6 <_bfin_EMAC_send+0x5e>;
ffa0299c:	00 00       	NOP;
ffa0299e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900174(-7339660) */
ffa029a2:	00 e1 4c 02 	R0.L = 0x24c;		/* (588)	R0=0xff90024c(-7339444) */
ffa029a6:	ff e3 d5 f8 	CALL 0xffa01b50 <_printf_str>;
ffa029aa:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa029ac:	01 e8 00 00 	UNLINK;
ffa029b0:	01 30       	R0 = R1;
ffa029b2:	84 04       	(P5:4) = [SP++];
ffa029b4:	10 00       	RTS;
ffa029b6:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900f38 <_NetDHCPserv> */
ffa029ba:	0c e1 3c 0f 	P4.L = 0xf3c;		/* (3900)	P4=0xff900f3c <_txIdx> */
ffa029be:	20 95       	R0 = W[P4] (Z);
ffa029c0:	10 32       	P2 = R0;
ffa029c2:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900490 */
ffa029c6:	0d e1 40 0f 	P5.L = 0xf40;		/* (3904)	P5=0xff900f40 <_txbuf> */
ffa029ca:	0b 30       	R1 = R3;
ffa029cc:	95 5e       	P2 = P5 + (P2 << 0x2);
ffa029ce:	52 91       	P2 = [P2];
ffa029d0:	92 ad       	P2 = [P2 + 0x18];
ffa029d2:	12 96       	W[P2++] = R2;
ffa029d4:	42 30       	R0 = P2;
ffa029d6:	ff e3 0b f9 	CALL 0xffa01bec <_memcpy_>;
ffa029da:	23 95       	R3 = W[P4] (Z);
ffa029dc:	da 42       	R2 = R3.L (Z);
ffa029de:	12 32       	P2 = R2;
ffa029e0:	55 5f       	P5 = P5 + (P2 << 0x2);
ffa029e2:	6d 91       	P5 = [P5];
ffa029e4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc04241(-4177343) */
ffa029e8:	0a e1 80 0c 	P2.L = 0xc80;		/* (3200)	P2=0xffc00c80(-4191104) */
ffa029ec:	55 93       	[P2] = P5;
ffa029ee:	a8 a1       	R0 = [P5 + 0x18];
ffa029f0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c80 */
ffa029f4:	0a e1 82 05 	P2.L = 0x582;		/* (1410)	P2=0xff900582 <_txdmacfg> */
ffa029f8:	68 b0       	[P5 + 0x4] = R0;
ffa029fa:	10 95       	R0 = W[P2] (Z);
ffa029fc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00582(-4192894) */
ffa02a00:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa02a04:	10 97       	W[P2] = R0;
ffa02a06:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa02a0a:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa02a0e:	10 91       	R0 = [P2];
ffa02a10:	80 4a       	BITSET (R0, 0x10);		/* bit 16 */
ffa02a12:	10 93       	[P2] = R0;
ffa02a14:	a8 a2       	R0 = [P5 + 0x28];
ffa02a16:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02a18:	13 10       	IF !CC JUMP 0xffa02a3e <_bfin_EMAC_send+0xe6>;
ffa02a1a:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf3000 */
ffa02a1e:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa02a22:	b2 e0 05 20 	LSETUP(0xffa02a26 <_bfin_EMAC_send+0xce>, 0xffa02a2c <_bfin_EMAC_send+0xd4>) LC1 = P2;
ffa02a26:	a8 a2       	R0 = [P5 + 0x28];
ffa02a28:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02a2a:	0a 10       	IF !CC JUMP 0xffa02a3e <_bfin_EMAC_send+0xe6>;
ffa02a2c:	00 00       	NOP;
ffa02a2e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90024c(-7339444) */
ffa02a32:	00 e1 64 02 	R0.L = 0x264;		/* (612)	R0=0xff900264(-7339420) */
ffa02a36:	ff e3 8d f8 	CALL 0xffa01b50 <_printf_str>;
ffa02a3a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02a3c:	09 20       	JUMP.S 0xffa02a4e <_bfin_EMAC_send+0xf6>;
ffa02a3e:	a9 a2       	R1 = [P5 + 0x28];
ffa02a40:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02a42:	a8 b2       	[P5 + 0x28] = R0;
ffa02a44:	12 0d       	CC = R2 <= 0x2;
ffa02a46:	03 10       	IF !CC JUMP 0xffa02a4c <_bfin_EMAC_send+0xf4>;
ffa02a48:	03 30       	R0 = R3;
ffa02a4a:	08 64       	R0 += 0x1;		/* (  1) */
ffa02a4c:	20 97       	W[P4] = R0;
ffa02a4e:	01 e8 00 00 	UNLINK;
ffa02a52:	01 30       	R0 = R1;
ffa02a54:	84 04       	(P5:4) = [SP++];
ffa02a56:	10 00       	RTS;
ffa02a58:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa02a5c:	00 e1 30 01 	R0.L = 0x130;		/* (304)	R0=0xff900130(-7339728) */
ffa02a60:	ff e3 78 f8 	CALL 0xffa01b50 <_printf_str>;
ffa02a64:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02a66:	01 e8 00 00 	UNLINK;
ffa02a6a:	01 30       	R0 = R1;
ffa02a6c:	84 04       	(P5:4) = [SP++];
ffa02a6e:	10 00       	RTS;
ffa02a70:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900130(-7339728) */
ffa02a74:	00 e1 30 02 	R0.L = 0x230;		/* (560)	R0=0xff900230(-7339472) */
ffa02a78:	ff e3 c4 f7 	CALL 0xffa01a00 <_printf_int>;
ffa02a7c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02a7e:	01 e8 00 00 	UNLINK;
ffa02a82:	01 30       	R0 = R1;
ffa02a84:	84 04       	(P5:4) = [SP++];
ffa02a86:	10 00       	RTS;

ffa02a88 <_ether_testUDP>:
ffa02a88:	c5 04       	[--SP] = (P5:5);
ffa02a8a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff904241 */
ffa02a8e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02a92:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa02a96:	11 95       	R1 = W[P2] (Z);
ffa02a98:	11 32       	P2 = R1;
ffa02a9a:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f40 <_txbuf> */
ffa02a9e:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa02aa2:	21 e1 42 00 	R1 = 0x42 (X);		/*		R1=0x42( 66) */
ffa02aa6:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa02aa8:	52 91       	P2 = [P2];
ffa02aaa:	95 ad       	P5 = [P2 + 0x18];
ffa02aac:	55 32       	P2 = P5;
ffa02aae:	11 96       	W[P2++] = R1;
ffa02ab0:	4a 30       	R1 = P2;
ffa02ab2:	00 e3 2f 09 	CALL 0xffa03d10 <_ARP_req>;
ffa02ab6:	00 0c       	CC = R0 == 0x0;
ffa02ab8:	7e 18       	IF CC JUMP 0xffa02bb4 <_ether_testUDP+0x12c>;
ffa02aba:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa02abe:	0a e1 64 0f 	P2.L = 0xf64;		/* (3940)	P2=0xff900f64 <_NetOurMAC> */
ffa02ac2:	4d 32       	P1 = P5;
ffa02ac4:	50 99       	R0 = B[P2] (X);
ffa02ac6:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02aca:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa02ace:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02ad2:	90 e5 02 00 	R0 = B[P2 + 0x2] (X);
ffa02ad6:	a8 e6 0a 00 	B[P5 + 0xa] = R0;
ffa02ada:	90 e5 03 00 	R0 = B[P2 + 0x3] (X);
ffa02ade:	a8 e6 0b 00 	B[P5 + 0xb] = R0;
ffa02ae2:	90 e5 04 00 	R0 = B[P2 + 0x4] (X);
ffa02ae6:	a8 e6 0c 00 	B[P5 + 0xc] = R0;
ffa02aea:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02aee:	a8 e6 0d 00 	B[P5 + 0xd] = R0;
ffa02af2:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02af4:	e8 b5       	W[P5 + 0xe] = R0;
ffa02af6:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa02afa:	a8 e6 10 00 	B[P5 + 0x10] = R0;
ffa02afe:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02b00:	a8 e6 11 00 	B[P5 + 0x11] = R0;
ffa02b04:	20 e1 00 32 	R0 = 0x3200 (X);		/*		R0=0x3200(12800) */
ffa02b08:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f64 <_NetOurMAC> */
ffa02b0c:	0a e1 3e 0f 	P2.L = 0xf3e;		/* (3902)	P2=0xff900f3e <_NetIPID> */
ffa02b10:	68 b6       	W[P5 + 0x12] = R0;
ffa02b12:	10 95       	R0 = W[P2] (Z);
ffa02b14:	08 30       	R1 = R0;
ffa02b16:	09 64       	R1 += 0x1;		/* (  1) */
ffa02b18:	11 97       	W[P2] = R1;
ffa02b1a:	c1 42       	R1 = R0.L (Z);
ffa02b1c:	41 4e       	R1 >>= 0x8;
ffa02b1e:	40 4f       	R0 <<= 0x8;
ffa02b20:	08 56       	R0 = R0 | R1;
ffa02b22:	a8 b6       	W[P5 + 0x14] = R0;
ffa02b24:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa02b28:	e8 b6       	W[P5 + 0x16] = R0;
ffa02b2a:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02b2c:	a8 e6 18 00 	B[P5 + 0x18] = R0;
ffa02b30:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa02b32:	a8 e6 19 00 	B[P5 + 0x19] = R0;
ffa02b36:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02b38:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3e <_NetIPID> */
ffa02b3c:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa02b40:	68 b7       	W[P5 + 0x1a] = R0;
ffa02b42:	10 91       	R0 = [P2];
ffa02b44:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f70 <_NetOurIP> */
ffa02b48:	0a e1 34 0f 	P2.L = 0xf34;		/* (3892)	P2=0xff900f34 <_NetDestIP> */
ffa02b4c:	e8 b1       	[P5 + 0x1c] = R0;
ffa02b4e:	10 91       	R0 = [P2];
ffa02b50:	28 b2       	[P5 + 0x20] = R0;
ffa02b52:	81 6c       	P1 += 0x10;		/* ( 16) */
ffa02b54:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02b56:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02b58:	b2 e0 03 20 	LSETUP(0xffa02b5c <_ether_testUDP+0xd4>, 0xffa02b5e <_ether_testUDP+0xd6>) LC1 = P2;
ffa02b5c:	08 94       	R0 = W[P1++] (Z);
ffa02b5e:	41 50       	R1 = R1 + R0;
ffa02b60:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa02b64:	01 50       	R0 = R1 + R0;
ffa02b66:	c0 42       	R0 = R0.L (Z);
ffa02b68:	c0 43       	R0 =~ R0;
ffa02b6a:	68 b7       	W[P5 + 0x1a] = R0;
ffa02b6c:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa02b70:	68 e6 12 00 	W[P5 + 0x24] = R0;
ffa02b74:	20 e1 09 64 	R0 = 0x6409 (X);		/*		R0=0x6409(25609) */
ffa02b78:	68 e6 13 00 	W[P5 + 0x26] = R0;
ffa02b7c:	20 e1 00 1e 	R0 = 0x1e00 (X);		/*		R0=0x1e00(7680) */
ffa02b80:	68 e6 14 00 	W[P5 + 0x28] = R0;
ffa02b84:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02b86:	55 32       	P2 = P5;
ffa02b88:	68 e6 15 00 	W[P5 + 0x2a] = R0;
ffa02b8c:	62 6d       	P2 += 0x2c;		/* ( 44) */
ffa02b8e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02b90:	b1 68       	P1 = 0x16 (X);		/*		P1=0x16( 22) */
ffa02b92:	b2 e0 03 10 	LSETUP(0xffa02b96 <_ether_testUDP+0x10e>, 0xffa02b98 <_ether_testUDP+0x110>) LC1 = P1;
ffa02b96:	11 9a       	B[P2++] = R1;
ffa02b98:	09 64       	R1 += 0x1;		/* (  1) */
ffa02b9a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa02b9e:	00 e1 78 02 	R0.L = 0x278;		/* (632)	R0=0xff900278(-7339400) */
ffa02ba2:	ff e3 d7 f7 	CALL 0xffa01b50 <_printf_str>;
ffa02ba6:	ff e3 2d fc 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa02baa:	01 e8 00 00 	UNLINK;
ffa02bae:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02bb0:	85 04       	(P5:5) = [SP++];
ffa02bb2:	10 00       	RTS;
ffa02bb4:	01 e8 00 00 	UNLINK;
ffa02bb8:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02bba:	85 04       	(P5:5) = [SP++];
ffa02bbc:	10 00       	RTS;
	...

ffa02bc0 <_eth_header_setup>:
ffa02bc0:	c4 04       	[--SP] = (P5:4);
ffa02bc2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90000a */
ffa02bc6:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02bca:	00 32       	P0 = R0;
ffa02bcc:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa02bd0:	10 95       	R0 = W[P2] (Z);
ffa02bd2:	10 32       	P2 = R0;
ffa02bd4:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900016 */
ffa02bd8:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa02bdc:	00 91       	R0 = [P0];
ffa02bde:	21 32       	P4 = R1;
ffa02be0:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa02be2:	52 91       	P2 = [P2];
ffa02be4:	08 30       	R1 = R0;
ffa02be6:	80 67       	R0 += -0x10;		/* (-16) */
ffa02be8:	00 93       	[P0] = R0;
ffa02bea:	95 ad       	P5 = [P2 + 0x18];
ffa02bec:	82 c6 42 01 	R0 = R2 >>> 0x18;
ffa02bf0:	f1 67       	R1 += -0x2;		/* ( -2) */
ffa02bf2:	c0 4f       	R0 <<= 0x18;
ffa02bf4:	29 97       	W[P5] = R1;
ffa02bf6:	00 0c       	CC = R0 == 0x0;
ffa02bf8:	39 10       	IF !CC JUMP 0xffa02c6a <_eth_header_setup+0xaa>;
ffa02bfa:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02bfc:	a8 e6 02 00 	B[P5 + 0x2] = R0;
ffa02c00:	20 e1 5e 00 	R0 = 0x5e (X);		/*		R0=0x5e( 94) */
ffa02c04:	a8 e6 04 00 	B[P5 + 0x4] = R0;
ffa02c08:	68 60       	R0 = 0xd (X);		/*		R0=0xd( 13) */
ffa02c0a:	a8 e6 06 00 	B[P5 + 0x6] = R0;
ffa02c0e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02c10:	d8 63       	R0 = -0x5 (X);		/*		R0=0xfffffffb( -5) */
ffa02c12:	a9 e6 03 00 	B[P5 + 0x3] = R1;
ffa02c16:	a9 e6 05 00 	B[P5 + 0x5] = R1;
ffa02c1a:	a8 e6 07 00 	B[P5 + 0x7] = R0;
ffa02c1e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa02c22:	0a e1 64 0f 	P2.L = 0xf64;		/* (3940)	P2=0xff900f64 <_NetOurMAC> */
ffa02c26:	50 99       	R0 = B[P2] (X);
ffa02c28:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02c2c:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa02c30:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02c34:	90 e5 02 00 	R0 = B[P2 + 0x2] (X);
ffa02c38:	a8 e6 0a 00 	B[P5 + 0xa] = R0;
ffa02c3c:	90 e5 03 00 	R0 = B[P2 + 0x3] (X);
ffa02c40:	a8 e6 0b 00 	B[P5 + 0xb] = R0;
ffa02c44:	90 e5 04 00 	R0 = B[P2 + 0x4] (X);
ffa02c48:	a8 e6 0c 00 	B[P5 + 0xc] = R0;
ffa02c4c:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02c50:	a8 e6 0d 00 	B[P5 + 0xd] = R0;
ffa02c54:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02c56:	e8 b5       	W[P5 + 0xe] = R0;
ffa02c58:	4d 30       	R1 = P5;
ffa02c5a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02c5c:	81 64       	R1 += 0x10;		/* ( 16) */
ffa02c5e:	20 9b       	B[P4] = R0;
ffa02c60:	01 e8 00 00 	UNLINK;
ffa02c64:	01 30       	R0 = R1;
ffa02c66:	84 04       	(P5:4) = [SP++];
ffa02c68:	10 00       	RTS;
ffa02c6a:	4d 30       	R1 = P5;
ffa02c6c:	11 64       	R1 += 0x2;		/* (  2) */
ffa02c6e:	02 30       	R0 = R2;
ffa02c70:	00 e3 50 08 	CALL 0xffa03d10 <_ARP_req>;
ffa02c74:	00 0c       	CC = R0 == 0x0;
ffa02c76:	d4 17       	IF !CC JUMP 0xffa02c1e <_eth_header_setup+0x5e> (BP);
ffa02c78:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02c7a:	20 9b       	B[P4] = R0;
ffa02c7c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02c7e:	f1 2f       	JUMP.S 0xffa02c60 <_eth_header_setup+0xa0>;

ffa02c80 <_icmp_packet_setup>:
ffa02c80:	e4 05       	[--SP] = (R7:4, P5:4);
ffa02c82:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa02c86:	29 32       	P5 = R1;
ffa02c88:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa02c8a:	7f 30       	R7 = FP;
ffa02c8c:	f0 bb       	[FP -0x4] = R0;
ffa02c8e:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa02c90:	22 32       	P4 = R2;
ffa02c92:	be e5 2c 00 	R6 = B[FP + 0x2c] (X);
ffa02c96:	7d e5 18 00 	R5 = W[FP + 0x30] (X);
ffa02c9a:	7c e5 1a 00 	R4 = W[FP + 0x34] (X);
ffa02c9e:	07 30       	R0 = R7;
ffa02ca0:	ff e3 90 ff 	CALL 0xffa02bc0 <_eth_header_setup>;
ffa02ca4:	08 30       	R1 = R0;
ffa02ca6:	68 99       	R0 = B[P5] (X);
ffa02ca8:	80 0c       	CC = R0 < 0x0;
ffa02caa:	14 18       	IF CC JUMP 0xffa02cd2 <_icmp_packet_setup+0x52>;
ffa02cac:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02cae:	f0 b0       	[SP + 0xc] = R0;
ffa02cb0:	01 30       	R0 = R1;
ffa02cb2:	0f 30       	R1 = R7;
ffa02cb4:	54 30       	R2 = P4;
ffa02cb6:	ff e3 bb fa 	CALL 0xffa0222c <_ip_header_setup>;
ffa02cba:	e9 42       	R1 = R5.L (Z);
ffa02cbc:	f1 b0       	[SP + 0xc] = R1;
ffa02cbe:	e1 42       	R1 = R4.L (Z);
ffa02cc0:	31 b1       	[SP + 0x10] = R1;
ffa02cc2:	72 43       	R2 = R6.B (Z);
ffa02cc4:	0f 30       	R1 = R7;
ffa02cc6:	ff e3 11 fb 	CALL 0xffa022e8 <_icmp_header_setup>;
ffa02cca:	01 e8 00 00 	UNLINK;
ffa02cce:	a4 05       	(R7:4, P5:4) = [SP++];
ffa02cd0:	10 00       	RTS;
ffa02cd2:	01 e8 00 00 	UNLINK;
ffa02cd6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02cd8:	a4 05       	(R7:4, P5:4) = [SP++];
ffa02cda:	10 00       	RTS;

ffa02cdc <_icmp_rx>:
ffa02cdc:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02cde:	28 32       	P5 = R0;
ffa02ce0:	39 30       	R7 = R1;
ffa02ce2:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa02ce4:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa02ce8:	e8 a5       	R0 = W[P5 + 0xe] (Z);
ffa02cea:	08 08       	CC = R0 == R1;
ffa02cec:	06 18       	IF CC JUMP 0xffa02cf8 <_icmp_rx+0x1c>;
ffa02cee:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02cf0:	01 e8 00 00 	UNLINK;
ffa02cf4:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02cf6:	10 00       	RTS;
ffa02cf8:	58 61       	R0 = 0x2b (X);		/*		R0=0x2b( 43) */
ffa02cfa:	07 0a       	CC = R7 <= R0 (IU);
ffa02cfc:	f9 1b       	IF CC JUMP 0xffa02cee <_icmp_rx+0x12>;
ffa02cfe:	00 00       	NOP;
ffa02d00:	00 00       	NOP;
ffa02d02:	00 00       	NOP;
ffa02d04:	a8 e4 19 00 	R0 = B[P5 + 0x19] (Z);
ffa02d08:	08 0c       	CC = R0 == 0x1;
ffa02d0a:	f2 17       	IF !CC JUMP 0xffa02cee <_icmp_rx+0x12> (BP);
ffa02d0c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f64 <_NetOurMAC> */
ffa02d10:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa02d14:	28 a2       	R0 = [P5 + 0x20];
ffa02d16:	11 91       	R1 = [P2];
ffa02d18:	08 08       	CC = R0 == R1;
ffa02d1a:	ea 17       	IF !CC JUMP 0xffa02cee <_icmp_rx+0x12> (BP);
ffa02d1c:	68 e4 12 00 	R0 = W[P5 + 0x24] (Z);
ffa02d20:	21 e1 03 03 	R1 = 0x303 (X);		/*		R1=0x303(771) */
ffa02d24:	08 08       	CC = R0 == R1;
ffa02d26:	3e 18       	IF CC JUMP 0xffa02da2 <_icmp_rx+0xc6>;
ffa02d28:	00 00       	NOP;
ffa02d2a:	00 00       	NOP;
ffa02d2c:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa02d2e:	a8 e4 24 00 	R0 = B[P5 + 0x24] (Z);
ffa02d32:	08 08       	CC = R0 == R1;
ffa02d34:	dd 17       	IF !CC JUMP 0xffa02cee <_icmp_rx+0x12> (BP);
ffa02d36:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002b(-7339989) */
ffa02d3a:	e9 a1       	R1 = [P5 + 0x1c];
ffa02d3c:	00 e1 90 02 	R0.L = 0x290;		/* (656)	R0=0xff900290(-7339376) */
ffa02d40:	ff e3 0e f7 	CALL 0xffa01b5c <_printf_ip>;
ffa02d44:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f70 <_NetOurIP> */
ffa02d48:	0a e1 34 0f 	P2.L = 0xf34;		/* (3892)	P2=0xff900f34 <_NetDestIP> */
ffa02d4c:	e8 a1       	R0 = [P5 + 0x1c];
ffa02d4e:	4d 30       	R1 = P5;
ffa02d50:	10 93       	[P2] = R0;
ffa02d52:	41 64       	R1 += 0x8;		/* (  8) */
ffa02d54:	00 e3 cc 05 	CALL 0xffa038ec <_ARP_lut_add>;
ffa02d58:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900290(-7339376) */
ffa02d5c:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa02d60:	ff e3 f8 f6 	CALL 0xffa01b50 <_printf_str>;
ffa02d64:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P5 + 0x1c] || NOP;
ffa02d68:	ea a1 00 00 
ffa02d6c:	f0 b0       	[SP + 0xc] = R0;
ffa02d6e:	68 e4 14 00 	R0 = W[P5 + 0x28] (Z);
ffa02d72:	30 b1       	[SP + 0x10] = R0;
ffa02d74:	68 e4 15 00 	R0 = W[P5 + 0x2a] (Z);
ffa02d78:	70 b1       	[SP + 0x14] = R0;
ffa02d7a:	b7 66       	R7 += -0x2a;		/* (-42) */
ffa02d7c:	4f 30       	R1 = FP;
ffa02d7e:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa02d80:	07 30       	R0 = R7;
ffa02d82:	ff e3 7f ff 	CALL 0xffa02c80 <_icmp_packet_setup>;
ffa02d86:	08 30       	R1 = R0;
ffa02d88:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa02d8c:	00 0d       	CC = R0 <= 0x0;
ffa02d8e:	b0 1b       	IF CC JUMP 0xffa02cee <_icmp_rx+0x12>;
ffa02d90:	65 6d       	P5 += 0x2c;		/* ( 44) */
ffa02d92:	45 30       	R0 = P5;
ffa02d94:	17 30       	R2 = R7;
ffa02d96:	ff e3 2b f7 	CALL 0xffa01bec <_memcpy_>;
ffa02d9a:	ff e3 33 fb 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa02d9e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02da0:	a8 2f       	JUMP.S 0xffa02cf0 <_icmp_rx+0x14>;
ffa02da2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f34 <_NetDestIP> */
ffa02da6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02da8:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa02dac:	10 9b       	B[P2] = R0;
ffa02dae:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02db0:	a0 2f       	JUMP.S 0xffa02cf0 <_icmp_rx+0x14>;
	...

ffa02db4 <_udp_packet_setup>:
ffa02db4:	ec 05       	[--SP] = (R7:5, P5:4);
ffa02db6:	00 e8 05 00 	LINK 0x14;		/* (20) */
ffa02dba:	29 32       	P5 = R1;
ffa02dbc:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa02dbe:	77 30       	R6 = FP;
ffa02dc0:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900f3c <_txIdx> */
ffa02dc4:	f0 bb       	[FP -0x4] = R0;
ffa02dc6:	3a 30       	R7 = R2;
ffa02dc8:	e6 67       	R6 += -0x4;		/* ( -4) */
ffa02dca:	0c e1 74 0f 	P4.L = 0xf74;		/* (3956)	P4=0xff900f74 <_NetDataDestIP> */
ffa02dce:	82 ce 06 c0 	R0 = ROT R6 BY 0x0 || R2 = [P4] || NOP;
ffa02dd2:	22 91 00 00 
ffa02dd6:	ff e3 f5 fe 	CALL 0xffa02bc0 <_eth_header_setup>;
ffa02dda:	08 30       	R1 = R0;
ffa02ddc:	68 99       	R0 = B[P5] (X);
ffa02dde:	80 0c       	CC = R0 < 0x0;
ffa02de0:	22 18       	IF CC JUMP 0xffa02e24 <_udp_packet_setup+0x70>;
ffa02de2:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa02de4:	f0 b0       	[SP + 0xc] = R0;
ffa02de6:	01 30       	R0 = R1;
ffa02de8:	82 ce 06 c2 	R1 = ROT R6 BY 0x0 || R2 = [P4] || NOP;
ffa02dec:	22 91 00 00 
ffa02df0:	ff e3 1e fa 	CALL 0xffa0222c <_ip_header_setup>;
ffa02df4:	10 32       	P2 = R0;
ffa02df6:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa02dfa:	f9 42       	R1 = R7.L (Z);
ffa02dfc:	41 4e       	R1 >>= 0x8;
ffa02dfe:	10 97       	W[P2] = R0;
ffa02e00:	82 c6 47 80 	R0 = R7 << 0x8;
ffa02e04:	08 56       	R0 = R0 | R1;
ffa02e06:	50 b4       	W[P2 + 0x2] = R0;
ffa02e08:	f0 b9       	R0 = [FP -0x4];
ffa02e0a:	b9 e4 fd ff 	R1 = B[FP + -0x3] (Z);
ffa02e0e:	40 4f       	R0 <<= 0x8;
ffa02e10:	08 56       	R0 = R0 | R1;
ffa02e12:	90 b4       	W[P2 + 0x4] = R0;
ffa02e14:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02e16:	d0 b4       	W[P2 + 0x6] = R0;
ffa02e18:	42 30       	R0 = P2;
ffa02e1a:	01 e8 00 00 	UNLINK;
ffa02e1e:	40 64       	R0 += 0x8;		/* (  8) */
ffa02e20:	ac 05       	(R7:5, P5:4) = [SP++];
ffa02e22:	10 00       	RTS;
ffa02e24:	01 e8 00 00 	UNLINK;
ffa02e28:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02e2a:	ac 05       	(R7:5, P5:4) = [SP++];
ffa02e2c:	10 00       	RTS;
	...

ffa02e30 <_SetupTxBuffer>:
ffa02e30:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02e32:	38 30       	R7 = R0;
ffa02e34:	20 e1 3c 06 	R0 = 0x63c (X);		/*		R0=0x63c(1596) */
ffa02e38:	c7 40       	R7 *= R0;
ffa02e3a:	17 32       	P2 = R7;
ffa02e3c:	4d e1 80 ff 	P5.H = 0xff80;		/* (-128)	P5=0xff800f40 */
ffa02e40:	40 e1 80 ff 	R0.H = 0xff80;		/* (-128)	R0=0xff80063c(-8387012) */
ffa02e44:	00 e1 2c 30 	R0.L = 0x302c;		/* (12332)	R0=0xff80302c(-8376276) */
ffa02e48:	0d e1 00 30 	P5.L = 0x3000;		/* (12288)	P5=0xff803000 */
ffa02e4c:	6a 5b       	P5 = P2 + P5;
ffa02e4e:	c7 51       	R7 = R7 + R0;
ffa02e50:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02e54:	45 30       	R0 = P5;
ffa02e56:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02e58:	62 61       	R2 = 0x2c (X);		/*		R2=0x2c( 44) */
ffa02e5a:	ff e3 d9 f6 	CALL 0xffa01c0c <_memset_>;
ffa02e5e:	82 ce 07 c0 	R0 = ROT R7 BY 0x0 || [P5 + 0x18] = R7 || NOP;
ffa02e62:	af b1 00 00 
ffa02e66:	21 e1 aa 00 	R1 = 0xaa (X);		/*		R1=0xaa(170) */
ffa02e6a:	22 e1 10 06 	R2 = 0x610 (X);		/*		R2=0x610(1552) */
ffa02e6e:	ff e3 cf f6 	CALL 0xffa01c0c <_memset_>;
ffa02e72:	45 30       	R0 = P5;
ffa02e74:	60 64       	R0 += 0xc;		/* ( 12) */
ffa02e76:	28 93       	[P5] = R0;
ffa02e78:	a8 a1       	R0 = [P5 + 0x18];
ffa02e7a:	68 b0       	[P5 + 0x4] = R0;
ffa02e7c:	a8 e5 08 00 	R0 = B[P5 + 0x8] (X);
ffa02e80:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02e82:	9a 63       	R2 = -0xd (X);		/*		R2=0xfffffff3(-13) */
ffa02e84:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa02e86:	10 54       	R0 = R0 & R2;
ffa02e88:	18 4a       	BITSET (R0, 0x3);		/* bit  3 */
ffa02e8a:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02e8e:	a8 e5 09 00 	R0 = B[P5 + 0x9] (X);
ffa02e92:	83 63       	R3 = -0x10 (X);		/*		R3=0xfffffff0(-16) */
ffa02e94:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa02e96:	18 54       	R0 = R0 & R3;
ffa02e98:	08 56       	R0 = R0 | R1;
ffa02e9a:	21 e1 70 00 	R1 = 0x70 (X);		/*		R1=0x70(112) */
ffa02e9e:	08 56       	R0 = R0 | R1;
ffa02ea0:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02ea4:	45 30       	R0 = P5;
ffa02ea6:	40 65       	R0 += 0x28;		/* ( 40) */
ffa02ea8:	28 b1       	[P5 + 0x10] = R0;
ffa02eaa:	a8 e5 14 00 	R0 = B[P5 + 0x14] (X);
ffa02eae:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02eb0:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02eb2:	21 e1 88 ff 	R1 = -0x78 (X);		/*		R1=0xffffff88(-120) */
ffa02eb6:	10 54       	R0 = R0 & R2;
ffa02eb8:	08 56       	R0 = R0 | R1;
ffa02eba:	a8 e6 14 00 	B[P5 + 0x14] = R0;
ffa02ebe:	a8 e5 15 00 	R0 = B[P5 + 0x15] (X);
ffa02ec2:	18 54       	R0 = R0 & R3;
ffa02ec4:	39 64       	R1 += 0x7;		/* (  7) */
ffa02ec6:	08 54       	R0 = R0 & R1;
ffa02ec8:	a8 e6 15 00 	B[P5 + 0x15] = R0;
ffa02ecc:	ed bc       	[P5 + 0xc] = P5;
ffa02ece:	45 30       	R0 = P5;
ffa02ed0:	01 e8 00 00 	UNLINK;
ffa02ed4:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02ed6:	10 00       	RTS;

ffa02ed8 <_SetupRxBuffer>:
ffa02ed8:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02eda:	38 30       	R7 = R0;
ffa02edc:	20 e1 3c 06 	R0 = 0x63c (X);		/*		R0=0x63c(1596) */
ffa02ee0:	c7 40       	R7 *= R0;
ffa02ee2:	17 32       	P2 = R7;
ffa02ee4:	4d e1 80 ff 	P5.H = 0xff80;		/* (-128)	P5=0xff803000 */
ffa02ee8:	40 e1 80 ff 	R0.H = 0xff80;		/* (-128)	R0=0xff80063c(-8387012) */
ffa02eec:	00 e1 2c 10 	R0.L = 0x102c;		/* (4140)	R0=0xff80102c(-8384468) */
ffa02ef0:	0d e1 00 10 	P5.L = 0x1000;		/* (4096)	P5=0xff801000 */
ffa02ef4:	6a 5b       	P5 = P2 + P5;
ffa02ef6:	c7 51       	R7 = R7 + R0;
ffa02ef8:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02efc:	45 30       	R0 = P5;
ffa02efe:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02f00:	62 61       	R2 = 0x2c (X);		/*		R2=0x2c( 44) */
ffa02f02:	ff e3 85 f6 	CALL 0xffa01c0c <_memset_>;
ffa02f06:	af b1       	[P5 + 0x18] = R7;
ffa02f08:	07 30       	R0 = R7;
ffa02f0a:	21 e1 fe 00 	R1 = 0xfe (X);		/*		R1=0xfe(254) */
ffa02f0e:	22 e1 10 06 	R2 = 0x610 (X);		/*		R2=0x610(1552) */
ffa02f12:	ff e3 7d f6 	CALL 0xffa01c0c <_memset_>;
ffa02f16:	45 30       	R0 = P5;
ffa02f18:	60 64       	R0 += 0xc;		/* ( 12) */
ffa02f1a:	28 93       	[P5] = R0;
ffa02f1c:	a8 a1       	R0 = [P5 + 0x18];
ffa02f1e:	68 b0       	[P5 + 0x4] = R0;
ffa02f20:	a8 e5 08 00 	R0 = B[P5 + 0x8] (X);
ffa02f24:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02f26:	99 63       	R1 = -0xd (X);		/*		R1=0xfffffff3(-13) */
ffa02f28:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02f2a:	08 54       	R0 = R0 & R1;
ffa02f2c:	18 4a       	BITSET (R0, 0x3);		/* bit  3 */
ffa02f2e:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02f32:	a8 e5 09 00 	R0 = B[P5 + 0x9] (X);
ffa02f36:	87 63       	R7 = -0x10 (X);		/*		R7=0xfffffff0(-16) */
ffa02f38:	38 54       	R0 = R0 & R7;
ffa02f3a:	2b 60       	R3 = 0x5 (X);		/*		R3=0x5(  5) */
ffa02f3c:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa02f40:	18 56       	R0 = R0 | R3;
ffa02f42:	10 56       	R0 = R0 | R2;
ffa02f44:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02f48:	45 30       	R0 = P5;
ffa02f4a:	20 65       	R0 += 0x24;		/* ( 36) */
ffa02f4c:	28 b1       	[P5 + 0x10] = R0;
ffa02f4e:	a8 e5 14 00 	R0 = B[P5 + 0x14] (X);
ffa02f52:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02f54:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02f56:	08 54       	R0 = R0 & R1;
ffa02f58:	21 e1 88 ff 	R1 = -0x78 (X);		/*		R1=0xffffff88(-120) */
ffa02f5c:	08 56       	R0 = R0 | R1;
ffa02f5e:	a8 e6 14 00 	B[P5 + 0x14] = R0;
ffa02f62:	a8 e5 15 00 	R0 = B[P5 + 0x15] (X);
ffa02f66:	38 54       	R0 = R0 & R7;
ffa02f68:	18 56       	R0 = R0 | R3;
ffa02f6a:	10 56       	R0 = R0 | R2;
ffa02f6c:	a8 e6 15 00 	B[P5 + 0x15] = R0;
ffa02f70:	ed bc       	[P5 + 0xc] = P5;
ffa02f72:	45 30       	R0 = P5;
ffa02f74:	01 e8 00 00 	UNLINK;
ffa02f78:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02f7a:	10 00       	RTS;

ffa02f7c <_SetupSystemRegs>:
ffa02f7c:	f5 05       	[--SP] = (R7:6, P5:5);
ffa02f7e:	28 32       	P5 = R0;
ffa02f80:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90102c(-7335892) */
ffa02f84:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02f88:	00 e1 ac 02 	R0.L = 0x2ac;		/* (684)	R0=0xff9002ac(-7339348) */
ffa02f8c:	ff e3 e2 f5 	CALL 0xffa01b50 <_printf_str>;
ffa02f90:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cc4(-4191036) */
ffa02f94:	0a e1 14 32 	P2.L = 0x3214;		/* (12820)	P2=0xffc03214(-4181484) */
ffa02f98:	11 95       	R1 = W[P2] (Z);
ffa02f9a:	20 e1 ff cf 	R0 = -0x3001 (X);		/*		R0=0xffffcfff(-12289) */
ffa02f9e:	08 54       	R0 = R0 & R1;
ffa02fa0:	10 97       	W[P2] = R0;
ffa02fa2:	10 95       	R0 = W[P2] (Z);
ffa02fa4:	60 4a       	BITSET (R0, 0xc);		/* bit 12 */
ffa02fa6:	10 97       	W[P2] = R0;
ffa02fa8:	82 6f       	P2 += -0x10;		/* (-16) */
ffa02faa:	11 95       	R1 = W[P2] (Z);
ffa02fac:	20 e1 00 c0 	R0 = -0x4000 (X);		/*		R0=0xffffc000(-16384) */
ffa02fb0:	08 56       	R0 = R0 | R1;
ffa02fb2:	10 97       	W[P2] = R0;
ffa02fb4:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02fb6:	22 6c       	P2 += 0x4;		/* (  4) */
ffa02fb8:	10 97       	W[P2] = R0;
ffa02fba:	a8 60       	R0 = 0x15 (X);		/*		R0=0x15( 21) */
ffa02fbc:	82 6c       	P2 += 0x10;		/* ( 16) */
ffa02fbe:	10 97       	W[P2] = R0;
ffa02fc0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03214(-4181484) */
ffa02fc4:	0a e1 08 00 	P2.L = 0x8;		/* (  8)	P2=0xffc00008(-4194296) */
ffa02fc8:	10 95       	R0 = W[P2] (Z);
ffa02fca:	70 4a       	BITSET (R0, 0xe);		/* bit 14 */
ffa02fcc:	10 97       	W[P2] = R0;
ffa02fce:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00008(-4194296) */
ffa02fd2:	20 e1 06 18 	R0 = 0x1806 (X);		/*		R0=0x1806(6150) */
ffa02fd6:	0a e1 60 30 	P2.L = 0x3060;		/* (12384)	P2=0xffc03060(-4181920) */
ffa02fda:	10 93       	[P2] = R0;
ffa02fdc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03060(-4181920) */
ffa02fe0:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02fe4:	10 91       	R0 = [P2];
ffa02fe6:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02fe8:	09 18       	IF CC JUMP 0xffa02ffa <_SetupSystemRegs+0x7e>;
ffa02fea:	00 00       	NOP;
ffa02fec:	00 00       	NOP;
ffa02fee:	42 34       	I0 = P2;
ffa02ff0:	00 00       	NOP;
ffa02ff2:	00 00       	NOP;
ffa02ff4:	00 9d       	R0 = [I0];
ffa02ff6:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02ff8:	fc 17       	IF !CC JUMP 0xffa02ff0 <_SetupSystemRegs+0x74> (BP);
ffa02ffa:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02ffe:	20 e1 00 31 	R0 = 0x3100 (X);		/*		R0=0x3100(12544) */
ffa03002:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa03006:	10 93       	[P2] = R0;
ffa03008:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0300a:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa0300c:	10 93       	[P2] = R0;
ffa0300e:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03012:	ff e3 cd f7 	CALL 0xffa01fac <_udelay>;
ffa03016:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03018:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa0301a:	ff e3 4f f8 	CALL 0xffa020b8 <_RdPHYReg>;
ffa0301e:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03020:	26 60       	R6 = 0x4 (X);		/*		R6=0x4(  4) */
ffa03022:	0e 20       	JUMP.S 0xffa0303e <_SetupSystemRegs+0xc2>;
ffa03024:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03028:	ff e3 c2 f7 	CALL 0xffa01fac <_udelay>;
ffa0302c:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa0302e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03030:	ff e3 44 f8 	CALL 0xffa020b8 <_RdPHYReg>;
ffa03034:	0f 64       	R7 += 0x1;		/* (  1) */
ffa03036:	21 e1 b9 0b 	R1 = 0xbb9 (X);		/*		R1=0xbb9(3001) */
ffa0303a:	0f 08       	CC = R7 == R1;
ffa0303c:	36 18       	IF CC JUMP 0xffa030a8 <_SetupSystemRegs+0x12c>;
ffa0303e:	06 54       	R0 = R6 & R0;
ffa03040:	00 0c       	CC = R0 == 0x0;
ffa03042:	f1 1f       	IF CC JUMP 0xffa03024 <_SetupSystemRegs+0xa8> (BP);
ffa03044:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa03046:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03048:	ff e3 38 f8 	CALL 0xffa020b8 <_RdPHYReg>;
ffa0304c:	21 e1 40 01 	R1 = 0x140 (X);		/*		R1=0x140(320) */
ffa03050:	41 54       	R1 = R1 & R0;
ffa03052:	01 0c       	CC = R1 == 0x0;
ffa03054:	26 14       	IF !CC JUMP 0xffa030a0 <_SetupSystemRegs+0x124> (BP);
ffa03056:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03058:	28 93       	[P5] = R0;
ffa0305a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa0305e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa03060:	0a e1 80 30 	P2.L = 0x3080;		/* (12416)	P2=0xffc03080(-4181888) */
ffa03064:	10 93       	[P2] = R0;
ffa03066:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03080(-4181888) */
ffa0306a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0306c:	0a e1 90 0c 	P2.L = 0xc90;		/* (3216)	P2=0xffc00c90(-4191088) */
ffa03070:	10 97       	W[P2] = R0;
ffa03072:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa03074:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03076:	11 97       	W[P2] = R1;
ffa03078:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0307a:	10 97       	W[P2] = R0;
ffa0307c:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0307e:	10 97       	W[P2] = R0;
ffa03080:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c90(-4191088) */
ffa03084:	0a e1 50 0c 	P2.L = 0xc50;		/* (3152)	P2=0xffc00c50(-4191152) */
ffa03088:	10 97       	W[P2] = R0;
ffa0308a:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0308c:	11 97       	W[P2] = R1;
ffa0308e:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03090:	10 97       	W[P2] = R0;
ffa03092:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03094:	10 97       	W[P2] = R0;
ffa03096:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03098:	01 e8 00 00 	UNLINK;
ffa0309c:	b5 05       	(R7:6, P5:5) = [SP++];
ffa0309e:	10 00       	RTS;
ffa030a0:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa030a2:	d0 4f       	R0 <<= 0x1a;
ffa030a4:	28 93       	[P5] = R0;
ffa030a6:	da 2f       	JUMP.S 0xffa0305a <_SetupSystemRegs+0xde>;
ffa030a8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa030ac:	00 e1 c4 02 	R0.L = 0x2c4;		/* (708)	R0=0xff9002c4(-7339324) */
ffa030b0:	ff e3 50 f5 	CALL 0xffa01b50 <_printf_str>;
ffa030b4:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa030b6:	f1 2f       	JUMP.S 0xffa03098 <_SetupSystemRegs+0x11c>;

ffa030b8 <_SetupMacAddr>:
ffa030b8:	10 32       	P2 = R0;
ffa030ba:	fd 05       	[--SP] = (R7:7, P5:5);
ffa030bc:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa030c0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa030c2:	01 63       	R1 = -0x20 (X);		/*		R1=0xffffffe0(-32) */
ffa030c4:	10 9b       	B[P2] = R0;
ffa030c6:	10 61       	R0 = 0x22 (X);		/*		R0=0x22( 34) */
ffa030c8:	90 e6 02 00 	B[P2 + 0x2] = R0;
ffa030cc:	f0 63       	R0 = -0x2 (X);		/*		R0=0xfffffffe( -2) */
ffa030ce:	90 e6 03 00 	B[P2 + 0x3] = R0;
ffa030d2:	20 e1 51 00 	R0 = 0x51 (X);		/*		R0=0x51( 81) */
ffa030d6:	90 e6 04 00 	B[P2 + 0x4] = R0;
ffa030da:	60 60       	R0 = 0xc (X);		/*		R0=0xc( 12) */
ffa030dc:	91 e6 01 00 	B[P2 + 0x1] = R1;
ffa030e0:	90 e6 05 00 	B[P2 + 0x5] = R0;
ffa030e4:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa030e8:	49 43       	R1 = R1.B (Z);
ffa030ea:	80 4f       	R0 <<= 0x10;
ffa030ec:	41 4f       	R1 <<= 0x8;
ffa030ee:	41 56       	R1 = R1 | R0;
ffa030f0:	10 99       	R0 = B[P2] (Z);
ffa030f2:	41 56       	R1 = R1 | R0;
ffa030f4:	90 e4 03 00 	R0 = B[P2 + 0x3] (Z);
ffa030f8:	c0 4f       	R0 <<= 0x18;
ffa030fa:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00f40(-4190400) */
ffa030fe:	09 e1 04 30 	P1.L = 0x3004;		/* (12292)	P1=0xffc03004(-4182012) */
ffa03102:	41 56       	R1 = R1 | R0;
ffa03104:	09 93       	[P1] = R1;
ffa03106:	90 e4 04 00 	R0 = B[P2 + 0x4] (Z);
ffa0310a:	21 e1 00 0c 	R1 = 0xc00 (X);		/*		R1=0xc00(3072) */
ffa0310e:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc01000(-4190208) */
ffa03112:	08 56       	R0 = R0 | R1;
ffa03114:	0d e1 08 30 	P5.L = 0x3008;		/* (12296)	P5=0xffc03008(-4182008) */
ffa03118:	28 93       	[P5] = R0;
ffa0311a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000c(-7340020) */
ffa0311e:	09 91       	R1 = [P1];
ffa03120:	00 e1 f8 02 	R0.L = 0x2f8;		/* (760)	R0=0xff9002f8(-7339272) */
ffa03124:	47 e1 90 ff 	R7.H = 0xff90;		/* (-112)	R7=0xff900000 <_l1_data_a>(-7340032) */
ffa03128:	ff e3 10 f4 	CALL 0xffa01948 <_printf_hex>;
ffa0312c:	07 e1 20 08 	R7.L = 0x820;		/* (2080)	R7=0xff900820(-7337952) */
ffa03130:	07 30       	R0 = R7;
ffa03132:	ff e3 0f f5 	CALL 0xffa01b50 <_printf_str>;
ffa03136:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9002f8(-7339272) */
ffa0313a:	29 91       	R1 = [P5];
ffa0313c:	00 e1 04 03 	R0.L = 0x304;		/* (772)	R0=0xff900304(-7339260) */
ffa03140:	ff e3 04 f4 	CALL 0xffa01948 <_printf_hex>;
ffa03144:	07 30       	R0 = R7;
ffa03146:	01 e8 00 00 	UNLINK;
ffa0314a:	bd 05       	(R7:7, P5:5) = [SP++];
ffa0314c:	ff e2 02 f5 	JUMP.L 0xffa01b50 <_printf_str>;

ffa03150 <_bfin_EMAC_init>:
ffa03150:	fb 05       	[--SP] = (R7:7, P5:3);
ffa03152:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900304(-7339260) */
ffa03156:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0315a:	00 e1 10 03 	R0.L = 0x310;		/* (784)	R0=0xff900310(-7339248) */
ffa0315e:	ff e3 f9 f4 	CALL 0xffa01b50 <_printf_str>;
ffa03162:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c50 */
ffa03166:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03168:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa0316c:	11 97       	W[P2] = R1;
ffa0316e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa03172:	0a e1 50 0f 	P2.L = 0xf50;		/* (3920)	P2=0xff900f50 <_rxIdx> */
ffa03176:	11 97       	W[P2] = R1;
ffa03178:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f50 <_rxIdx> */
ffa0317c:	0a e1 3e 0f 	P2.L = 0xf3e;		/* (3902)	P2=0xff900f3e <_NetIPID> */
ffa03180:	11 97       	W[P2] = R1;
ffa03182:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3e <_NetIPID> */
ffa03186:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03188:	0a e1 6c 0f 	P2.L = 0xf6c;		/* (3948)	P2=0xff900f6c <_NetSubnetMask> */
ffa0318c:	17 93       	[P2] = R7;
ffa0318e:	40 e1 00 09 	R0.H = 0x900;		/* (2304)	R0=0x9000310(150995728) */
ffa03192:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f6c <_NetSubnetMask> */
ffa03196:	00 e1 c0 a8 	R0.L = 0xa8c0;		/* (-22336)	R0=0x900a8c0(151038144) */
ffa0319a:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa0319e:	10 93       	[P2] = R0;
ffa031a0:	80 e1 c0 a8 	R0 = 0xa8c0 (Z);		/*		R0=0xa8c0(43200) */
ffa031a4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f70 <_NetOurIP> */
ffa031a8:	c0 4a       	BITSET (R0, 0x18);		/* bit 24 */
ffa031aa:	0a e1 34 0f 	P2.L = 0xf34;		/* (3892)	P2=0xff900f34 <_NetDestIP> */
ffa031ae:	10 93       	[P2] = R0;
ffa031b0:	40 e1 e5 36 	R0.H = 0x36e5;		/* (14053)	R0=0x36e5a8c0(921020608) */
ffa031b4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f34 <_NetDestIP> */
ffa031b8:	00 e1 98 10 	R0.L = 0x1098;		/* (4248)	R0=0x36e51098(920981656) */
ffa031bc:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa031c0:	10 93       	[P2] = R0;
ffa031c2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f74 <_NetDataDestIP> */
ffa031c6:	0a e1 54 10 	P2.L = 0x1054;		/* (4180)	P2=0xff901054 <_TcpState> */
ffa031ca:	17 93       	[P2] = R7;
ffa031cc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901054 <_TcpState> */
ffa031d0:	0a e1 4c 10 	P2.L = 0x104c;		/* (4172)	P2=0xff90104c <_TcpSeqClient> */
ffa031d4:	17 93       	[P2] = R7;
ffa031d6:	40 e1 da 09 	R0.H = 0x9da;		/* (2522)	R0=0x9da1098(165286040) */
ffa031da:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90104c <_TcpSeqClient> */
ffa031de:	00 e1 b5 24 	R0.L = 0x24b5;		/* (9397)	R0=0x9da24b5(165291189) */
ffa031e2:	0a e1 48 10 	P2.L = 0x1048;		/* (4168)	P2=0xff901048 <_TcpSeqHost> */
ffa031e6:	10 93       	[P2] = R0;
ffa031e8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901048 <_TcpSeqHost> */
ffa031ec:	0a e1 60 10 	P2.L = 0x1060;		/* (4192)	P2=0xff901060 <_TcpClientPort> */
ffa031f0:	11 97       	W[P2] = R1;
ffa031f2:	00 e3 2d 03 	CALL 0xffa0384c <_ARP_init>;
ffa031f6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01060(-4190112) */
ffa031fa:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa031fe:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9024b5(-7330635) */
ffa03202:	17 93       	[P2] = R7;
ffa03204:	00 e1 64 0f 	R0.L = 0xf64;		/* (3940)	R0=0xff900f64 <_NetOurMAC>(-7336092) */
ffa03208:	ff e3 58 ff 	CALL 0xffa030b8 <_SetupMacAddr>;
ffa0320c:	47 30       	R0 = FP;
ffa0320e:	e0 67       	R0 += -0x4;		/* ( -4) */
ffa03210:	ff e3 b6 fe 	CALL 0xffa02f7c <_SetupSystemRegs>;
ffa03214:	80 0c       	CC = R0 < 0x0;
ffa03216:	79 18       	IF CC JUMP 0xffa03308 <_bfin_EMAC_init+0x1b8>;
ffa03218:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900f6c <_NetSubnetMask> */
ffa0321c:	0b e1 54 0f 	P3.L = 0xf54;		/* (3924)	P3=0xff900f54 <_rxbuf> */
ffa03220:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa03222:	63 32       	P4 = P3;
ffa03224:	45 30       	R0 = P5;
ffa03226:	ff e3 59 fe 	CALL 0xffa02ed8 <_SetupRxBuffer>;
ffa0322a:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff903004 */
ffa0322e:	ab 5e       	P2 = P3 + (P5 << 0x2);
ffa03230:	09 e1 54 0f 	P1.L = 0xf54;		/* (3924)	P1=0xff900f54 <_rxbuf> */
ffa03234:	10 93       	[P2] = R0;
ffa03236:	45 0c       	CC = P5 == 0x0;
ffa03238:	5e 18       	IF CC JUMP 0xffa032f4 <_bfin_EMAC_init+0x1a4>;
ffa0323a:	00 00       	NOP;
ffa0323c:	ac 5e       	P2 = P4 + (P5 << 0x2);
ffa0323e:	5d 0c       	CC = P5 == 0x3;
ffa03240:	12 e5 ff ff 	P2 = [P2 + -0x4];
ffa03244:	d0 b0       	[P2 + 0xc] = R0;
ffa03246:	5d 18       	IF CC JUMP 0xffa03300 <_bfin_EMAC_init+0x1b0>;
ffa03248:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa0324a:	5d 0d       	CC = P5 <= 0x3;
ffa0324c:	ec 1f       	IF CC JUMP 0xffa03224 <_bfin_EMAC_init+0xd4> (BP);
ffa0324e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900f74 <_NetDataDestIP> */
ffa03252:	0c e1 40 0f 	P4.L = 0xf40;		/* (3904)	P4=0xff900f40 <_txbuf> */
ffa03256:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa03258:	7c 30       	R7 = P4;
ffa0325a:	45 30       	R0 = P5;
ffa0325c:	ff e3 ea fd 	CALL 0xffa02e30 <_SetupTxBuffer>;
ffa03260:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f54 <_rxbuf> */
ffa03264:	ac 5e       	P2 = P4 + (P5 << 0x2);
ffa03266:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa0326a:	10 93       	[P2] = R0;
ffa0326c:	45 0c       	CC = P5 == 0x0;
ffa0326e:	41 18       	IF CC JUMP 0xffa032f0 <_bfin_EMAC_init+0x1a0>;
ffa03270:	07 32       	P0 = R7;
ffa03272:	5d 0c       	CC = P5 == 0x3;
ffa03274:	a8 5e       	P2 = P0 + (P5 << 0x2);
ffa03276:	12 e5 ff ff 	P2 = [P2 + -0x4];
ffa0327a:	d0 b0       	[P2 + 0xc] = R0;
ffa0327c:	3e 18       	IF CC JUMP 0xffa032f8 <_bfin_EMAC_init+0x1a8>;
ffa0327e:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa03280:	5d 0d       	CC = P5 <= 0x3;
ffa03282:	ec 1f       	IF CC JUMP 0xffa0325a <_bfin_EMAC_init+0x10a> (BP);
ffa03284:	59 91       	P1 = [P3];
ffa03286:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa0328a:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xffc00c40(-4191168) */
ffa0328e:	51 93       	[P2] = P1;
ffa03290:	08 a9       	R0 = W[P1 + 0x8] (X);
ffa03292:	42 6c       	P2 += 0x8;		/* (  8) */
ffa03294:	10 97       	W[P2] = R0;
ffa03296:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c40(-4191168) */
ffa0329a:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa0329e:	10 91       	R0 = [P2];
ffa032a0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa032a2:	09 18       	IF CC JUMP 0xffa032b4 <_bfin_EMAC_init+0x164>;
ffa032a4:	00 00       	NOP;
ffa032a6:	00 00       	NOP;
ffa032a8:	42 34       	I0 = P2;
ffa032aa:	00 00       	NOP;
ffa032ac:	00 00       	NOP;
ffa032ae:	00 9d       	R0 = [I0];
ffa032b0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa032b2:	fc 17       	IF !CC JUMP 0xffa032aa <_bfin_EMAC_init+0x15a> (BP);
ffa032b4:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa032b6:	f0 b9       	R0 = [FP -0x4];
ffa032b8:	d1 4f       	R1 <<= 0x1a;
ffa032ba:	08 08       	CC = R0 == R1;
ffa032bc:	2b 18       	IF CC JUMP 0xffa03312 <_bfin_EMAC_init+0x1c2>;
ffa032be:	20 e1 03 08 	R0 = 0x803 (X);		/*		R0=0x803(2051) */
ffa032c2:	08 30       	R1 = R0;
ffa032c4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa032c8:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa032cc:	10 93       	[P2] = R0;
ffa032ce:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900803(-7337981) */
ffa032d2:	00 e1 20 03 	R0.L = 0x320;		/* (800)	R0=0xff900320(-7339232) */
ffa032d6:	ff e3 39 f3 	CALL 0xffa01948 <_printf_hex>;
ffa032da:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900320(-7339232) */
ffa032de:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa032e2:	ff e3 37 f4 	CALL 0xffa01b50 <_printf_str>;
ffa032e6:	01 e8 00 00 	UNLINK;
ffa032ea:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa032ec:	bb 05       	(R7:7, P5:3) = [SP++];
ffa032ee:	10 00       	RTS;
ffa032f0:	0d 68       	P5 = 0x1 (X);		/*		P5=0x1(  1) */
ffa032f2:	b4 2f       	JUMP.S 0xffa0325a <_bfin_EMAC_init+0x10a>;
ffa032f4:	0d 68       	P5 = 0x1 (X);		/*		P5=0x1(  1) */
ffa032f6:	97 2f       	JUMP.S 0xffa03224 <_bfin_EMAC_init+0xd4>;
ffa032f8:	ca ac       	P2 = [P1 + 0xc];
ffa032fa:	08 91       	R0 = [P1];
ffa032fc:	d0 b0       	[P2 + 0xc] = R0;
ffa032fe:	c3 2f       	JUMP.S 0xffa03284 <_bfin_EMAC_init+0x134>;
ffa03300:	ca ac       	P2 = [P1 + 0xc];
ffa03302:	08 91       	R0 = [P1];
ffa03304:	d0 b0       	[P2 + 0xc] = R0;
ffa03306:	a4 2f       	JUMP.S 0xffa0324e <_bfin_EMAC_init+0xfe>;
ffa03308:	01 e8 00 00 	UNLINK;
ffa0330c:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa0330e:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03310:	10 00       	RTS;
ffa03312:	20 e1 03 08 	R0 = 0x803 (X);		/*		R0=0x803(2051) */
ffa03316:	d0 4a       	BITSET (R0, 0x1a);		/* bit 26 */
ffa03318:	08 30       	R1 = R0;
ffa0331a:	d5 2f       	JUMP.S 0xffa032c4 <_bfin_EMAC_init+0x174>;

ffa0331c <_bfin_EMAC_recv_poll>:
ffa0331c:	fb 05       	[--SP] = (R7:7, P5:3);
ffa0331e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900f40 <_txbuf> */
ffa03322:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900001 */
ffa03326:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa0332a:	18 32       	P3 = R0;
ffa0332c:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa0332e:	0c e1 54 0f 	P4.L = 0xf54;		/* (3924)	P4=0xff900f54 <_rxbuf> */
ffa03332:	0d e1 50 0f 	P5.L = 0xf50;		/* (3920)	P5=0xff900f50 <_rxIdx> */
ffa03336:	06 20       	JUMP.S 0xffa03342 <_bfin_EMAC_recv_poll+0x26>;
ffa03338:	0f 64       	R7 += 0x1;		/* (  1) */
ffa0333a:	20 e1 64 00 	R0 = 0x64 (X);		/*		R0=0x64(100) */
ffa0333e:	07 08       	CC = R7 == R0;
ffa03340:	54 18       	IF CC JUMP 0xffa033e8 <_bfin_EMAC_recv_poll+0xcc>;
ffa03342:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03346:	ff e3 33 f6 	CALL 0xffa01fac <_udelay>;
ffa0334a:	28 95       	R0 = W[P5] (Z);
ffa0334c:	10 32       	P2 = R0;
ffa0334e:	94 5e       	P2 = P4 + (P2 << 0x2);
ffa03350:	52 91       	P2 = [P2];
ffa03352:	90 a2       	R0 = [P2 + 0x28];
ffa03354:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa03356:	f1 1f       	IF CC JUMP 0xffa03338 <_bfin_EMAC_recv_poll+0x1c> (BP);
ffa03358:	20 e1 ff 07 	R0 = 0x7ff (X);		/*		R0=0x7ff(2047) */
ffa0335c:	91 a2       	R1 = [P2 + 0x28];
ffa0335e:	41 54       	R1 = R1 & R0;
ffa03360:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03362:	01 09       	CC = R1 <= R0;
ffa03364:	07 10       	IF !CC JUMP 0xffa03372 <_bfin_EMAC_recv_poll+0x56>;
ffa03366:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03368:	07 30       	R0 = R7;
ffa0336a:	01 e8 00 00 	UNLINK;
ffa0336e:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03370:	10 00       	RTS;
ffa03372:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03374:	90 b2       	[P2 + 0x28] = R0;
ffa03376:	39 30       	R7 = R1;
ffa03378:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa0337a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa0337e:	0f 30       	R1 = R7;
ffa03380:	00 e1 2c 03 	R0.L = 0x32c;		/* (812)	R0=0xff90032c(-7339220) */
ffa03384:	ff e3 3e f3 	CALL 0xffa01a00 <_printf_int>;
ffa03388:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903000 */
ffa0338c:	0a e1 50 0f 	P2.L = 0xf50;		/* (3920)	P2=0xff900f50 <_rxIdx> */
ffa03390:	10 95       	R0 = W[P2] (Z);
ffa03392:	08 32       	P1 = R0;
ffa03394:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f50 <_rxIdx> */
ffa03398:	0a e1 54 0f 	P2.L = 0xf54;		/* (3924)	P2=0xff900f54 <_rxbuf> */
ffa0339c:	0f 30       	R1 = R7;
ffa0339e:	4a 5e       	P1 = P2 + (P1 << 0x2);
ffa033a0:	4a 91       	P2 = [P1];
ffa033a2:	90 a1       	R0 = [P2 + 0x18];
ffa033a4:	18 93       	[P3] = R0;
ffa033a6:	00 e3 21 03 	CALL 0xffa039e8 <_ARP_rx>;
ffa033aa:	00 0c       	CC = R0 == 0x0;
ffa033ac:	17 18       	IF CC JUMP 0xffa033da <_bfin_EMAC_recv_poll+0xbe>;
ffa033ae:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa033b0:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f40 <_txbuf> */
ffa033b4:	2a 95       	R2 = W[P5] (Z);
ffa033b6:	d1 42       	R1 = R2.L (Z);
ffa033b8:	01 32       	P0 = R1;
ffa033ba:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa033bc:	09 e1 50 0f 	P1.L = 0xf50;		/* (3920)	P1=0xff900f50 <_rxIdx> */
ffa033c0:	11 0d       	CC = R1 <= 0x2;
ffa033c2:	84 5e       	P2 = P4 + (P0 << 0x2);
ffa033c4:	52 91       	P2 = [P2];
ffa033c6:	90 b2       	[P2 + 0x28] = R0;
ffa033c8:	03 10       	IF !CC JUMP 0xffa033ce <_bfin_EMAC_recv_poll+0xb2>;
ffa033ca:	02 30       	R0 = R2;
ffa033cc:	08 64       	R0 += 0x1;		/* (  1) */
ffa033ce:	08 97       	W[P1] = R0;
ffa033d0:	07 30       	R0 = R7;
ffa033d2:	01 e8 00 00 	UNLINK;
ffa033d6:	bb 05       	(R7:7, P5:3) = [SP++];
ffa033d8:	10 00       	RTS;
ffa033da:	18 91       	R0 = [P3];
ffa033dc:	0f 30       	R1 = R7;
ffa033de:	ff e3 7f fc 	CALL 0xffa02cdc <_icmp_rx>;
ffa033e2:	00 0c       	CC = R0 == 0x0;
ffa033e4:	e6 1f       	IF CC JUMP 0xffa033b0 <_bfin_EMAC_recv_poll+0x94> (BP);
ffa033e6:	e4 2f       	JUMP.S 0xffa033ae <_bfin_EMAC_recv_poll+0x92>;
ffa033e8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa033ec:	00 e1 38 03 	R0.L = 0x338;		/* (824)	R0=0xff900338(-7339208) */
ffa033f0:	ff e3 b0 f3 	CALL 0xffa01b50 <_printf_str>;
ffa033f4:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa033f6:	07 30       	R0 = R7;
ffa033f8:	01 e8 00 00 	UNLINK;
ffa033fc:	bb 05       	(R7:7, P5:3) = [SP++];
ffa033fe:	10 00       	RTS;

ffa03400 <_bridge_publish>:
ffa03400:	e3 05       	[--SP] = (R7:4, P5:3);
ffa03402:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa03406:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03408:	b8 e6 ff ff 	B[FP + -0x1] = R0;
ffa0340c:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f50 <_rxIdx> */
ffa03410:	40 e1 c8 00 	R0.H = 0xc8;		/* (200)	R0=0xc80001(13107201) */
ffa03414:	0d e1 74 0f 	P5.L = 0xf74;		/* (3956)	P5=0xff900f74 <_NetDataDestIP> */
ffa03418:	00 e1 ef 00 	R0.L = 0xef;		/* (239)	R0=0xc800ef(13107439) */
ffa0341c:	67 32       	P4 = FP;
ffa0341e:	5f 32       	P3 = FP;
ffa03420:	77 30       	R6 = FP;
ffa03422:	45 e1 0b e5 	R5.H = 0xe50b;		/* (-6901)	R5=0xe50b0009(-452263927) */
ffa03426:	28 93       	[P5] = R0;
ffa03428:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa0342a:	c4 6f       	P4 += -0x8;		/* ( -8) */
ffa0342c:	fb 6f       	P3 += -0x1;		/* ( -1) */
ffa0342e:	a6 67       	R6 += -0xc;		/* (-12) */
ffa03430:	05 e1 81 f7 	R5.L = 0xf781;		/* (-2175)	R5=0xe50bf781(-452200575) */
ffa03434:	b0 61       	R0 = 0x36 (X);		/*		R0=0x36( 54) */
ffa03436:	e0 bb       	[FP -0x8] = R0;
ffa03438:	4b 30       	R1 = P3;
ffa0343a:	44 30       	R0 = P4;
ffa0343c:	2a 91       	R2 = [P5];
ffa0343e:	ff e3 c1 fb 	CALL 0xffa02bc0 <_eth_header_setup>;
ffa03442:	08 30       	R1 = R0;
ffa03444:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa03448:	80 0c       	CC = R0 < 0x0;
ffa0344a:	98 18       	IF CC JUMP 0xffa0357a <_bridge_publish+0x17a>;
ffa0344c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f54 <_rxbuf> */
ffa03450:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa03454:	d1 bb       	[FP -0xc] = R1;
ffa03456:	12 91       	R2 = [P2];
ffa03458:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa0345a:	f0 b0       	[SP + 0xc] = R0;
ffa0345c:	01 30       	R0 = R1;
ffa0345e:	4c 30       	R1 = P4;
ffa03460:	ff e3 e6 f6 	CALL 0xffa0222c <_ip_header_setup>;
ffa03464:	10 32       	P2 = R0;
ffa03466:	21 e1 10 f4 	R1 = -0xbf0 (X);		/*		R1=0xfffff410(-3056) */
ffa0346a:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa0346e:	ba e4 f9 ff 	R2 = B[FP + -0x7] (Z);
ffa03472:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03474:	51 b4       	W[P2 + 0x2] = R1;
ffa03476:	10 97       	W[P2] = R0;
ffa03478:	e1 b9       	R1 = [FP -0x8];
ffa0347a:	82 c6 41 80 	R0 = R1 << 0x8;
ffa0347e:	10 56       	R0 = R0 | R2;
ffa03480:	90 b4       	W[P2 + 0x4] = R0;
ffa03482:	c1 67       	R1 += -0x8;		/* ( -8) */
ffa03484:	e1 bb       	[FP -0x8] = R1;
ffa03486:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03488:	d0 b4       	W[P2 + 0x6] = R0;
ffa0348a:	4a 30       	R1 = P2;
ffa0348c:	41 64       	R1 += 0x8;		/* (  8) */
ffa0348e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03492:	d1 bb       	[FP -0xc] = R1;
ffa03494:	52 60       	R2 = 0xa (X);		/*		R2=0xa( 10) */
ffa03496:	00 e1 48 03 	R0.L = 0x348;		/* (840)	R0=0xff900348(-7339192) */
ffa0349a:	ff e3 a9 f3 	CALL 0xffa01bec <_memcpy_>;
ffa0349e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900348(-7339192) */
ffa034a2:	00 e1 54 03 	R0.L = 0x354;		/* (852)	R0=0xff900354(-7339180) */
ffa034a6:	ff e3 55 f3 	CALL 0xffa01b50 <_printf_str>;
ffa034aa:	ff e3 ab f7 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa034ae:	05 20       	JUMP.S 0xffa034b8 <_bridge_publish+0xb8>;
ffa034b0:	0f 64       	R7 += 0x1;		/* (  1) */
ffa034b2:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa034b4:	07 08       	CC = R7 == R0;
ffa034b6:	45 18       	IF CC JUMP 0xffa03540 <_bridge_publish+0x140>;
ffa034b8:	06 30       	R0 = R6;
ffa034ba:	ff e3 31 ff 	CALL 0xffa0331c <_bfin_EMAC_recv_poll>;
ffa034be:	59 61       	R1 = 0x2b (X);		/*		R1=0x2b( 43) */
ffa034c0:	e0 bb       	[FP -0x8] = R0;
ffa034c2:	da b9       	P2 = [FP -0xc];
ffa034c4:	08 09       	CC = R0 <= R1;
ffa034c6:	f5 1f       	IF CC JUMP 0xffa034b0 <_bridge_publish+0xb0> (BP);
ffa034c8:	d0 a9       	R0 = W[P2 + 0xe] (X);
ffa034ca:	91 e4 0f 00 	R1 = B[P2 + 0xf] (Z);
ffa034ce:	40 4f       	R0 <<= 0x8;
ffa034d0:	08 56       	R0 = R0 | R1;
ffa034d2:	c0 42       	R0 = R0.L (Z);
ffa034d4:	21 e1 00 08 	R1 = 0x800 (X);		/*		R1=0x800(2048) */
ffa034d8:	08 08       	CC = R0 == R1;
ffa034da:	eb 17       	IF !CC JUMP 0xffa034b0 <_bridge_publish+0xb0> (BP);
ffa034dc:	50 e4 12 00 	R0 = W[P2 + 0x24] (Z);
ffa034e0:	81 e1 10 f4 	R1 = 0xf410 (Z);		/*		R1=0xf410(62480) */
ffa034e4:	08 08       	CC = R0 == R1;
ffa034e6:	e5 17       	IF !CC JUMP 0xffa034b0 <_bridge_publish+0xb0> (BP);
ffa034e8:	50 e4 13 00 	R0 = W[P2 + 0x26] (Z);
ffa034ec:	81 e1 10 f5 	R1 = 0xf510 (Z);		/*		R1=0xf510(62736) */
ffa034f0:	08 08       	CC = R0 == R1;
ffa034f2:	df 17       	IF !CC JUMP 0xffa034b0 <_bridge_publish+0xb0> (BP);
ffa034f4:	d1 a1       	R1 = [P2 + 0x1c];
ffa034f6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000a(-7340022) */
ffa034fa:	29 93       	[P5] = R1;
ffa034fc:	00 e1 6c 03 	R0.L = 0x36c;		/* (876)	R0=0xff90036c(-7339156) */
ffa03500:	ff e3 2e f3 	CALL 0xffa01b5c <_printf_ip>;
ffa03504:	da b9       	P2 = [FP -0xc];
ffa03506:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90036c(-7339156) */
ffa0350a:	00 e1 78 03 	R0.L = 0x378;		/* (888)	R0=0xff900378(-7339144) */
ffa0350e:	62 6d       	P2 += 0x2c;		/* ( 44) */
ffa03510:	da bb       	[FP -0xc] = P2;
ffa03512:	a2 6e       	P2 += -0x2c;		/* (-44) */
ffa03514:	91 e4 2c 00 	R1 = B[P2 + 0x2c] (Z);
ffa03518:	ff e3 c2 f1 	CALL 0xffa0189c <_printf_hex_byte>;
ffa0351c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900378(-7339144) */
ffa03520:	00 e1 84 03 	R0.L = 0x384;		/* (900)	R0=0xff900384(-7339132) */
ffa03524:	ff e3 16 f3 	CALL 0xffa01b50 <_printf_str>;
ffa03528:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f74 <_NetDataDestIP> */
ffa0352c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0352e:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa03532:	10 9b       	B[P2] = R0;
ffa03534:	da b9       	P2 = [FP -0xc];
ffa03536:	01 e8 00 00 	UNLINK;
ffa0353a:	a3 05       	(R7:4, P5:3) = [SP++];
ffa0353c:	50 99       	R0 = B[P2] (X);
ffa0353e:	10 00       	RTS;
ffa03540:	ff e3 34 e6 	CALL 0xffa001a8 <_ustimer>;
ffa03544:	08 4e       	R0 >>= 0x1;
ffa03546:	80 c0 05 18 	A1 = R0.L * R5.L (FU);
ffa0354a:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0354e:	81 c0 05 86 	A1 += R0.H * R5.L, A0 = R0.H * R5.H (FU);
ffa03552:	81 c0 28 98 	A1 += R5.H * R0.L (FU);
ffa03556:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0355a:	0b c4 3f 80 	A0 += A1;
ffa0355e:	8b c0 00 38 	R0 = A0 (FU);
ffa03562:	58 4e       	R0 >>= 0xb;
ffa03564:	20 08       	CC = R0 == R4;
ffa03566:	67 1b       	IF CC JUMP 0xffa03434 <_bridge_publish+0x34>;
ffa03568:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00cc4(-4191036) */
ffa0356c:	21 e1 00 80 	R1 = -0x8000 (X);		/*		R1=0xffff8000(-32768) */
ffa03570:	0a e1 0c 07 	P2.L = 0x70c;		/* (1804)	P2=0xffc0070c(-4192500) */
ffa03574:	11 97       	W[P2] = R1;
ffa03576:	20 30       	R4 = R0;
ffa03578:	5e 2f       	JUMP.S 0xffa03434 <_bridge_publish+0x34>;
ffa0357a:	01 e8 00 00 	UNLINK;
ffa0357e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03580:	a3 05       	(R7:4, P5:3) = [SP++];
ffa03582:	10 00       	RTS;

ffa03584 <_DHCP_rx>:
ffa03584:	e3 05       	[--SP] = (R7:4, P5:3);
ffa03586:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0358a:	67 32       	P4 = FP;
ffa0358c:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc00f54(-4190380) */
ffa03590:	e4 6f       	P4 += -0x4;		/* ( -4) */
ffa03592:	24 e1 e4 fe 	R4 = -0x11c (X);		/*		R4=0xfffffee4(-284) */
ffa03596:	0b e1 04 30 	P3.L = 0x3004;		/* (12292)	P3=0xffc03004(-4182012) */
ffa0359a:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa0359c:	0b 20       	JUMP.S 0xffa035b2 <_DHCP_rx+0x2e>;
ffa0359e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa035a2:	00 e1 a8 03 	R0.L = 0x3a8;		/* (936)	R0=0xff9003a8(-7339096) */
ffa035a6:	ff e3 d5 f2 	CALL 0xffa01b50 <_printf_str>;
ffa035aa:	0e 64       	R6 += 0x1;		/* (  1) */
ffa035ac:	60 60       	R0 = 0xc (X);		/*		R0=0xc( 12) */
ffa035ae:	06 09       	CC = R6 <= R0;
ffa035b0:	66 10       	IF !CC JUMP 0xffa0367c <_DHCP_rx+0xf8>;
ffa035b2:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000c(-7340020) */
ffa035b6:	00 e1 c8 03 	R0.L = 0x3c8;		/* (968)	R0=0xff9003c8(-7339064) */
ffa035ba:	ff e3 cb f2 	CALL 0xffa01b50 <_printf_str>;
ffa035be:	44 30       	R0 = P4;
ffa035c0:	ff e3 ae fe 	CALL 0xffa0331c <_bfin_EMAC_recv_poll>;
ffa035c4:	38 30       	R7 = R0;
ffa035c6:	60 51       	R5 = R0 + R4;
ffa035c8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003c8(-7339064) */
ffa035cc:	0d 30       	R1 = R5;
ffa035ce:	00 e1 d8 03 	R0.L = 0x3d8;		/* (984)	R0=0xff9003d8(-7339048) */
ffa035d2:	ff e3 17 f2 	CALL 0xffa01a00 <_printf_int>;
ffa035d6:	21 e1 1b 01 	R1 = 0x11b (X);		/*		R1=0x11b(283) */
ffa035da:	fd b9       	P5 = [FP -0x4];
ffa035dc:	0f 09       	CC = R7 <= R1;
ffa035de:	e0 1b       	IF CC JUMP 0xffa0359e <_DHCP_rx+0x1a>;
ffa035e0:	00 00       	NOP;
ffa035e2:	00 00       	NOP;
ffa035e4:	00 00       	NOP;
ffa035e6:	e8 a9       	R0 = W[P5 + 0xe] (X);
ffa035e8:	a9 e4 0f 00 	R1 = B[P5 + 0xf] (Z);
ffa035ec:	40 4f       	R0 <<= 0x8;
ffa035ee:	08 56       	R0 = R0 | R1;
ffa035f0:	c0 42       	R0 = R0.L (Z);
ffa035f2:	21 e1 00 08 	R1 = 0x800 (X);		/*		R1=0x800(2048) */
ffa035f6:	08 08       	CC = R0 == R1;
ffa035f8:	d3 17       	IF !CC JUMP 0xffa0359e <_DHCP_rx+0x1a> (BP);
ffa035fa:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003d8(-7339048) */
ffa035fe:	00 e1 88 03 	R0.L = 0x388;		/* (904)	R0=0xff900388(-7339128) */
ffa03602:	ff e3 a7 f2 	CALL 0xffa01b50 <_printf_str>;
ffa03606:	68 e4 12 00 	R0 = W[P5 + 0x24] (Z);
ffa0360a:	21 e1 00 43 	R1 = 0x4300 (X);		/*		R1=0x4300(17152) */
ffa0360e:	08 08       	CC = R0 == R1;
ffa03610:	ce 17       	IF !CC JUMP 0xffa035ac <_DHCP_rx+0x28> (BP);
ffa03612:	68 e4 13 00 	R0 = W[P5 + 0x26] (Z);
ffa03616:	21 e1 00 44 	R1 = 0x4400 (X);		/*		R1=0x4400(17408) */
ffa0361a:	08 08       	CC = R0 == R1;
ffa0361c:	c8 17       	IF !CC JUMP 0xffa035ac <_DHCP_rx+0x28> (BP);
ffa0361e:	19 91       	R1 = [P3];
ffa03620:	28 a3       	R0 = [P5 + 0x30];
ffa03622:	08 08       	CC = R0 == R1;
ffa03624:	c4 17       	IF !CC JUMP 0xffa035ac <_DHCP_rx+0x28> (BP);
ffa03626:	41 e1 53 63 	R1.H = 0x6353;		/* (25427)	R1=0x63534400(1666401280) */
ffa0362a:	28 e4 46 00 	R0 = [P5 + 0x118];
ffa0362e:	01 e1 63 82 	R1.L = 0x8263;		/* (-32157)	R1=0x63538263(1666417251) */
ffa03632:	08 08       	CC = R0 == R1;
ffa03634:	bc 17       	IF !CC JUMP 0xffa035ac <_DHCP_rx+0x28> (BP);
ffa03636:	4d 30       	R1 = P5;
ffa03638:	20 e1 1c 01 	R0 = 0x11c (X);		/*		R0=0x11c(284) */
ffa0363c:	01 50       	R0 = R1 + R0;
ffa0363e:	82 ce 05 c2 	R1 = ROT R5 BY 0x0 || [FP -0x4] = R0 || NOP;
ffa03642:	f0 bb 00 00 
ffa03646:	ff e3 51 f8 	CALL 0xffa026e8 <_DHCP_parse>;
ffa0364a:	e9 a3       	R1 = [P5 + 0x3c];
ffa0364c:	01 0c       	CC = R1 == 0x0;
ffa0364e:	12 1c       	IF CC JUMP 0xffa03672 <_DHCP_rx+0xee> (BP);
ffa03650:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90070c */
ffa03654:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa03658:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90011c(-7339748) */
ffa0365c:	11 93       	[P2] = R1;
ffa0365e:	00 e1 98 03 	R0.L = 0x398;		/* (920)	R0=0xff900398(-7339112) */
ffa03662:	ff e3 7d f2 	CALL 0xffa01b5c <_printf_ip>;
ffa03666:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900398(-7339112) */
ffa0366a:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa0366e:	ff e3 71 f2 	CALL 0xffa01b50 <_printf_str>;
ffa03672:	01 e8 00 00 	UNLINK;
ffa03676:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03678:	a3 05       	(R7:4, P5:3) = [SP++];
ffa0367a:	10 00       	RTS;
ffa0367c:	ff e3 12 f8 	CALL 0xffa026a0 <_DHCP_tx_discover>;
ffa03680:	8d 2f       	JUMP.S 0xffa0359a <_DHCP_rx+0x16>;
	...

ffa03684 <_DHCP_req>:
ffa03684:	c5 04       	[--SP] = (P5:5);
ffa03686:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa0368a:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa0368e:	00 e1 e8 03 	R0.L = 0x3e8;		/* (1000)	R0=0xff9003e8(-7339032) */
ffa03692:	ff e3 5f f2 	CALL 0xffa01b50 <_printf_str>;
ffa03696:	ff e3 05 f8 	CALL 0xffa026a0 <_DHCP_tx_discover>;
ffa0369a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003e8(-7339032) */
ffa0369e:	00 e1 f8 03 	R0.L = 0x3f8;		/* (1016)	R0=0xff9003f8(-7339016) */
ffa036a2:	ff e3 57 f2 	CALL 0xffa01b50 <_printf_str>;
ffa036a6:	ff e3 6f ff 	CALL 0xffa03584 <_DHCP_rx>;
ffa036aa:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003f8(-7339016) */
ffa036ae:	00 e1 08 04 	R0.L = 0x408;		/* (1032)	R0=0xff900408(-7339000) */
ffa036b2:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f74 <_NetDataDestIP> */
ffa036b6:	ff e3 4d f2 	CALL 0xffa01b50 <_printf_str>;
ffa036ba:	0d e1 38 0f 	P5.L = 0xf38;		/* (3896)	P5=0xff900f38 <_NetDHCPserv> */
ffa036be:	29 91       	R1 = [P5];
ffa036c0:	39 0c       	CC = R1 == -0x1;
ffa036c2:	42 18       	IF CC JUMP 0xffa03746 <_DHCP_req+0xc2>;
ffa036c4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f70 <_NetOurIP> */
ffa036c8:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa036cc:	10 91       	R0 = [P2];
ffa036ce:	00 0c       	CC = R0 == 0x0;
ffa036d0:	08 18       	IF CC JUMP 0xffa036e0 <_DHCP_req+0x5c>;
ffa036d2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f70 <_NetOurIP> */
ffa036d6:	0a e1 6c 0f 	P2.L = 0xf6c;		/* (3948)	P2=0xff900f6c <_NetSubnetMask> */
ffa036da:	10 91       	R0 = [P2];
ffa036dc:	00 0c       	CC = R0 == 0x0;
ffa036de:	2f 10       	IF !CC JUMP 0xffa0373c <_DHCP_req+0xb8>;
ffa036e0:	a8 61       	R0 = 0x35 (X);		/*		R0=0x35( 53) */
ffa036e2:	b8 e6 f4 ff 	B[FP + -0xc] = R0;
ffa036e6:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa036e8:	b8 e6 f5 ff 	B[FP + -0xb] = R0;
ffa036ec:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa036ee:	b8 e6 f6 ff 	B[FP + -0xa] = R0;
ffa036f2:	b0 61       	R0 = 0x36 (X);		/*		R0=0x36( 54) */
ffa036f4:	b8 e6 f7 ff 	B[FP + -0x9] = R0;
ffa036f8:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa036fa:	b8 e6 f8 ff 	B[FP + -0x8] = R0;
ffa036fe:	82 c6 c1 81 	R0 = R1 >> 0x8;
ffa03702:	b8 e6 fa ff 	B[FP + -0x6] = R0;
ffa03706:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa0370a:	b8 e6 fb ff 	B[FP + -0x5] = R0;
ffa0370e:	82 c6 41 81 	R0 = R1 >> 0x18;
ffa03712:	b8 e6 fc ff 	B[FP + -0x4] = R0;
ffa03716:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa03718:	b8 e6 fd ff 	B[FP + -0x3] = R0;
ffa0371c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90ffff(-7274497) */
ffa03720:	b9 e6 f9 ff 	B[FP + -0x7] = R1;
ffa03724:	00 e1 34 04 	R0.L = 0x434;		/* (1076)	R0=0xff900434(-7338956) */
ffa03728:	ff e3 14 f2 	CALL 0xffa01b50 <_printf_str>;
ffa0372c:	4f 30       	R1 = FP;
ffa0372e:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa03730:	a1 67       	R1 += -0xc;		/* (-12) */
ffa03732:	2a 91       	R2 = [P5];
ffa03734:	ff e3 d0 f6 	CALL 0xffa024d4 <_DHCP_tx>;
ffa03738:	ff e3 26 ff 	CALL 0xffa03584 <_DHCP_rx>;
ffa0373c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0373e:	01 e8 00 00 	UNLINK;
ffa03742:	85 04       	(P5:5) = [SP++];
ffa03744:	10 00       	RTS;
ffa03746:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa0374a:	00 e1 18 04 	R0.L = 0x418;		/* (1048)	R0=0xff900418(-7338984) */
ffa0374e:	ff e3 01 f2 	CALL 0xffa01b50 <_printf_str>;
ffa03752:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa03754:	f5 2f       	JUMP.S 0xffa0373e <_DHCP_req+0xba>;
	...

ffa03758 <_bfin_EMAC_recv>:
ffa03758:	e3 05       	[--SP] = (R7:4, P5:3);
ffa0375a:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900000 <_l1_data_a>(-7340032) */
ffa0375e:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff90f781(-7276671) */
ffa03762:	06 e1 50 0f 	R6.L = 0xf50;		/* (3920)	R6=0xff900f50 <_rxIdx>(-7336112) */
ffa03766:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc03004(-4182012) */
ffa0376a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa0376e:	28 32       	P5 = R0;
ffa03770:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03772:	05 e1 54 0f 	R5.L = 0xf54;		/* (3924)	R5=0xff900f54 <_rxbuf>(-7336108) */
ffa03776:	26 32       	P4 = R6;
ffa03778:	0b e1 68 0c 	P3.L = 0xc68;		/* (3176)	P3=0xffc00c68(-4191128) */
ffa0377c:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa0377e:	06 32       	P0 = R6;
ffa03780:	0d 32       	P1 = R5;
ffa03782:	00 95       	R0 = W[P0] (Z);
ffa03784:	10 32       	P2 = R0;
ffa03786:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03788:	52 91       	P2 = [P2];
ffa0378a:	90 a2       	R0 = [P2 + 0x28];
ffa0378c:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa0378e:	48 18       	IF CC JUMP 0xffa0381e <_bfin_EMAC_recv+0xc6>;
ffa03790:	00 00       	NOP;
ffa03792:	00 00       	NOP;
ffa03794:	00 00       	NOP;
ffa03796:	90 a2       	R0 = [P2 + 0x28];
ffa03798:	a0 48       	CC = !BITTST (R0, 0x14);		/* bit 20 */
ffa0379a:	44 10       	IF !CC JUMP 0xffa03822 <_bfin_EMAC_recv+0xca>;
ffa0379c:	00 00       	NOP;
ffa0379e:	00 00       	NOP;
ffa037a0:	00 00       	NOP;
ffa037a2:	90 a2       	R0 = [P2 + 0x28];
ffa037a4:	68 48       	CC = !BITTST (R0, 0xd);		/* bit 13 */
ffa037a6:	45 18       	IF CC JUMP 0xffa03830 <_bfin_EMAC_recv+0xd8>;
ffa037a8:	00 00       	NOP;
ffa037aa:	00 00       	NOP;
ffa037ac:	21 e1 ff 07 	R1 = 0x7ff (X);		/*		R1=0x7ff(2047) */
ffa037b0:	90 a2       	R0 = [P2 + 0x28];
ffa037b2:	c8 55       	R7 = R0 & R1;
ffa037b4:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa037b6:	07 09       	CC = R7 <= R0;
ffa037b8:	43 18       	IF CC JUMP 0xffa0383e <_bfin_EMAC_recv+0xe6>;
ffa037ba:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa037bc:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f50 <_rxIdx> */
ffa037c0:	09 e1 54 0f 	P1.L = 0xf54;		/* (3924)	P1=0xff900f54 <_rxbuf> */
ffa037c4:	90 a1       	R0 = [P2 + 0x18];
ffa037c6:	28 93       	[P5] = R0;
ffa037c8:	18 95       	R0 = W[P3] (Z);
ffa037ca:	01 56       	R0 = R1 | R0;
ffa037cc:	18 97       	W[P3] = R0;
ffa037ce:	21 95       	R1 = W[P4] (Z);
ffa037d0:	c8 42       	R0 = R1.L (Z);
ffa037d2:	00 32       	P0 = R0;
ffa037d4:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa037d6:	10 0d       	CC = R0 <= 0x2;
ffa037d8:	81 5e       	P2 = P1 + (P0 << 0x2);
ffa037da:	52 91       	P2 = [P2];
ffa037dc:	94 b2       	[P2 + 0x28] = R4;
ffa037de:	1c 1c       	IF CC JUMP 0xffa03816 <_bfin_EMAC_recv+0xbe> (BP);
ffa037e0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa037e2:	20 97       	W[P4] = R0;
ffa037e4:	28 91       	R0 = [P5];
ffa037e6:	0f 30       	R1 = R7;
ffa037e8:	00 e3 00 01 	CALL 0xffa039e8 <_ARP_rx>;
ffa037ec:	00 0c       	CC = R0 == 0x0;
ffa037ee:	03 18       	IF CC JUMP 0xffa037f4 <_bfin_EMAC_recv+0x9c>;
ffa037f0:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa037f2:	c6 2f       	JUMP.S 0xffa0377e <_bfin_EMAC_recv+0x26>;
ffa037f4:	28 91       	R0 = [P5];
ffa037f6:	0f 30       	R1 = R7;
ffa037f8:	ff e3 72 fa 	CALL 0xffa02cdc <_icmp_rx>;
ffa037fc:	00 0c       	CC = R0 == 0x0;
ffa037fe:	f9 17       	IF !CC JUMP 0xffa037f0 <_bfin_EMAC_recv+0x98> (BP);
ffa03800:	28 91       	R0 = [P5];
ffa03802:	0f 30       	R1 = R7;
ffa03804:	00 e3 88 04 	CALL 0xffa04114 <_tcp_rx>;
ffa03808:	00 0c       	CC = R0 == 0x0;
ffa0380a:	f3 17       	IF !CC JUMP 0xffa037f0 <_bfin_EMAC_recv+0x98> (BP);
ffa0380c:	07 30       	R0 = R7;
ffa0380e:	01 e8 00 00 	UNLINK;
ffa03812:	a3 05       	(R7:4, P5:3) = [SP++];
ffa03814:	10 00       	RTS;
ffa03816:	01 30       	R0 = R1;
ffa03818:	08 64       	R0 += 0x1;		/* (  1) */
ffa0381a:	20 97       	W[P4] = R0;
ffa0381c:	e4 2f       	JUMP.S 0xffa037e4 <_bfin_EMAC_recv+0x8c>;
ffa0381e:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa03820:	f6 2f       	JUMP.S 0xffa0380c <_bfin_EMAC_recv+0xb4>;
ffa03822:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03826:	00 e1 48 04 	R0.L = 0x448;		/* (1096)	R0=0xff900448(-7338936) */
ffa0382a:	ff e3 93 f1 	CALL 0xffa01b50 <_printf_str>;
ffa0382e:	ef 2f       	JUMP.S 0xffa0380c <_bfin_EMAC_recv+0xb4>;
ffa03830:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900448(-7338936) */
ffa03834:	00 e1 64 04 	R0.L = 0x464;		/* (1124)	R0=0xff900464(-7338908) */
ffa03838:	ff e3 8c f1 	CALL 0xffa01b50 <_printf_str>;
ffa0383c:	e8 2f       	JUMP.S 0xffa0380c <_bfin_EMAC_recv+0xb4>;
ffa0383e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900464(-7338908) */
ffa03842:	00 e1 78 04 	R0.L = 0x478;		/* (1144)	R0=0xff900478(-7338888) */
ffa03846:	ff e3 85 f1 	CALL 0xffa01b50 <_printf_str>;
ffa0384a:	e1 2f       	JUMP.S 0xffa0380c <_bfin_EMAC_recv+0xb4>;

ffa0384c <_ARP_init>:
ffa0384c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f6c <_NetSubnetMask> */
ffa03850:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa03854:	0a e1 84 0f 	P2.L = 0xf84;		/* (3972)	P2=0xff900f84 */
ffa03858:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0385a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0385c:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0385e:	51 68       	P1 = 0xa (X);		/*		P1=0xa( 10) */
ffa03860:	b2 e0 12 10 	LSETUP(0xffa03864 <_ARP_init+0x18>, 0xffa03884 <_ARP_init+0x38>) LC1 = P1;
ffa03864:	11 e6 fe ff 	[P2 + -0x8] = R1;
ffa03868:	90 e6 fc ff 	B[P2 + -0x4] = R0;
ffa0386c:	90 e6 fd ff 	B[P2 + -0x3] = R0;
ffa03870:	90 e6 fe ff 	B[P2 + -0x2] = R0;
ffa03874:	90 e6 ff ff 	B[P2 + -0x1] = R0;
ffa03878:	10 9b       	B[P2] = R0;
ffa0387a:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa0387e:	52 b4       	W[P2 + 0x2] = R2;
ffa03880:	51 b0       	[P2 + 0x4] = R1;
ffa03882:	91 b0       	[P2 + 0x8] = R1;
ffa03884:	a2 6c       	P2 += 0x14;		/* ( 20) */
ffa03886:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f84 */
ffa0388a:	20 e1 64 00 	R0 = 0x64 (X);		/*		R0=0x64(100) */
ffa0388e:	0a e1 78 0f 	P2.L = 0xf78;		/* (3960)	P2=0xff900f78 <_NetArpLut_age> */
ffa03892:	10 97       	W[P2] = R0;
ffa03894:	01 e8 00 00 	UNLINK;
ffa03898:	10 00       	RTS;
	...

ffa0389c <_ARP_lut_find>:
ffa0389c:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900f3c <_txIdx> */
ffa038a0:	08 e1 7c 0f 	P0.L = 0xf7c;		/* (3964)	P0=0xff900f7c <_NetArpLut> */
ffa038a4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa038a8:	48 32       	P1 = P0;
ffa038aa:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa038ac:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa038ae:	b2 e0 06 20 	LSETUP(0xffa038b2 <_ARP_lut_find+0x16>, 0xffa038ba <_ARP_lut_find+0x1e>) LC1 = P2;
ffa038b2:	08 91       	R0 = [P1];
ffa038b4:	00 0c       	CC = R0 == 0x0;
ffa038b6:	0f 18       	IF CC JUMP 0xffa038d4 <_ARP_lut_find+0x38>;
ffa038b8:	09 64       	R1 += 0x1;		/* (  1) */
ffa038ba:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa038bc:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff90000a */
ffa038c0:	43 a5       	R3 = W[P0 + 0xa] (Z);
ffa038c2:	09 e1 9a 0f 	P1.L = 0xf9a;		/* (3994)	P1=0xff900f9a */
ffa038c6:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa038c8:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa038ca:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa038cc:	0a 64       	R2 += 0x1;		/* (  1) */
ffa038ce:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa038d0:	42 0c       	CC = P2 == 0x0;
ffa038d2:	05 10       	IF !CC JUMP 0xffa038dc <_ARP_lut_find+0x40>;
ffa038d4:	01 30       	R0 = R1;
ffa038d6:	01 e8 00 00 	UNLINK;
ffa038da:	10 00       	RTS;
ffa038dc:	08 95       	R0 = W[P1] (Z);
ffa038de:	03 09       	CC = R3 <= R0;
ffa038e0:	03 07       	IF CC R0 = R3;
ffa038e2:	0a 06       	IF !CC R1 = R2;
ffa038e4:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa038e6:	18 30       	R3 = R0;
ffa038e8:	f2 2f       	JUMP.S 0xffa038cc <_ARP_lut_find+0x30>;
	...

ffa038ec <_ARP_lut_add>:
ffa038ec:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900f7c <_NetArpLut> */
ffa038f0:	fb 05       	[--SP] = (R7:7, P5:3);
ffa038f2:	08 e1 7c 0f 	P0.L = 0xf7c;		/* (3964)	P0=0xff900f7c <_NetArpLut> */
ffa038f6:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa038fa:	38 30       	R7 = R0;
ffa038fc:	58 32       	P3 = P0;
ffa038fe:	48 32       	P1 = P0;
ffa03900:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa03902:	fb 63       	R3 = -0x1 (X);		/*		R3=0xffffffff( -1) */
ffa03904:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03906:	00 00       	NOP;
ffa03908:	08 91       	R0 = [P1];
ffa0390a:	38 08       	CC = R0 == R7;
ffa0390c:	aa 07       	IF CC P5 = R2;
ffa0390e:	ab 06       	IF !CC P5 = R3;
ffa03910:	0a 64       	R2 += 0x1;		/* (  1) */
ffa03912:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03914:	42 0c       	CC = P2 == 0x0;
ffa03916:	1f 10       	IF !CC JUMP 0xffa03954 <_ARP_lut_add+0x68>;
ffa03918:	7d 0c       	CC = P5 == -0x1;
ffa0391a:	21 18       	IF CC JUMP 0xffa0395c <_ARP_lut_add+0x70>;
ffa0391c:	6c 44       	P4 = P5 << 0x2;
ffa0391e:	ac 5a       	P2 = P4 + P5;
ffa03920:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa03922:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03924:	0f 93       	[P1] = R7;
ffa03926:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa03928:	01 32       	P0 = R1;
ffa0392a:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa0392c:	b2 e0 03 20 	LSETUP(0xffa03930 <_ARP_lut_add+0x44>, 0xffa03932 <_ARP_lut_add+0x46>) LC1 = P2;
ffa03930:	40 98       	R0 = B[P0++] (X);
ffa03932:	08 9a       	B[P1++] = R0;
ffa03934:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900006 */
ffa03938:	0a e1 78 0f 	P2.L = 0xf78;		/* (3960)	P2=0xff900f78 <_NetArpLut_age> */
ffa0393c:	10 95       	R0 = W[P2] (Z);
ffa0393e:	08 64       	R0 += 0x1;		/* (  1) */
ffa03940:	10 97       	W[P2] = R0;
ffa03942:	ec 45       	P4 = (P4 + P5) << 0x2;
ffa03944:	a3 5a       	P2 = P3 + P4;
ffa03946:	50 b5       	W[P2 + 0xa] = R0;
ffa03948:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0394a:	10 b1       	[P2 + 0x10] = R0;
ffa0394c:	01 e8 00 00 	UNLINK;
ffa03950:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03952:	10 00       	RTS;
ffa03954:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03956:	7d 0c       	CC = P5 == -0x1;
ffa03958:	d7 1f       	IF CC JUMP 0xffa03906 <_ARP_lut_add+0x1a> (BP);
ffa0395a:	e1 2f       	JUMP.S 0xffa0391c <_ARP_lut_add+0x30>;
ffa0395c:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa0395e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03960:	b2 e0 06 20 	LSETUP(0xffa03964 <_ARP_lut_add+0x78>, 0xffa0396c <_ARP_lut_add+0x80>) LC1 = P2;
ffa03964:	00 91       	R0 = [P0];
ffa03966:	00 0c       	CC = R0 == 0x0;
ffa03968:	da 1b       	IF CC JUMP 0xffa0391c <_ARP_lut_add+0x30>;
ffa0396a:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa0396c:	a0 6c       	P0 += 0x14;		/* ( 20) */
ffa0396e:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f9a */
ffa03972:	5b a5       	R3 = W[P3 + 0xa] (Z);
ffa03974:	09 e1 9a 0f 	P1.L = 0xf9a;		/* (3994)	P1=0xff900f9a */
ffa03978:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa0397a:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0397c:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa0397e:	0a 64       	R2 += 0x1;		/* (  1) */
ffa03980:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03982:	42 0c       	CC = P2 == 0x0;
ffa03984:	02 10       	IF !CC JUMP 0xffa03988 <_ARP_lut_add+0x9c>;
ffa03986:	cb 2f       	JUMP.S 0xffa0391c <_ARP_lut_add+0x30>;
ffa03988:	08 95       	R0 = W[P1] (Z);
ffa0398a:	98 08       	CC = R0 < R3;
ffa0398c:	03 06       	IF !CC R0 = R3;
ffa0398e:	aa 07       	IF CC P5 = R2;
ffa03990:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03992:	18 30       	R3 = R0;
ffa03994:	f5 2f       	JUMP.S 0xffa0397e <_ARP_lut_add+0x92>;
	...

ffa03998 <_ARP_lu>:
ffa03998:	c4 04       	[--SP] = (P5:4);
ffa0399a:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900f54 <_rxbuf> */
ffa0399e:	0c e1 7c 0f 	P4.L = 0xf7c;		/* (3964)	P4=0xff900f7c <_NetArpLut> */
ffa039a2:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa039a6:	10 30       	R2 = R0;
ffa039a8:	29 32       	P5 = R1;
ffa039aa:	4c 32       	P1 = P4;
ffa039ac:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa039ae:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa039b0:	b2 e0 06 20 	LSETUP(0xffa039b4 <_ARP_lu+0x1c>, 0xffa039bc <_ARP_lu+0x24>) LC1 = P2;
ffa039b4:	08 91       	R0 = [P1];
ffa039b6:	10 08       	CC = R0 == R2;
ffa039b8:	08 18       	IF CC JUMP 0xffa039c8 <_ARP_lu+0x30>;
ffa039ba:	08 6c       	P0 += 0x1;		/* (  1) */
ffa039bc:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa039be:	01 e8 00 00 	UNLINK;
ffa039c2:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa039c4:	84 04       	(P5:4) = [SP++];
ffa039c6:	10 00       	RTS;
ffa039c8:	08 a1       	R0 = [P1 + 0x10];
ffa039ca:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa039cc:	f7 1f       	IF CC JUMP 0xffa039ba <_ARP_lu+0x22> (BP);
ffa039ce:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa039d0:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa039d2:	54 5e       	P1 = P4 + (P2 << 0x2);
ffa039d4:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa039d6:	b2 e0 03 20 	LSETUP(0xffa039da <_ARP_lu+0x42>, 0xffa039dc <_ARP_lu+0x44>) LC1 = P2;
ffa039da:	48 98       	R0 = B[P1++] (X);
ffa039dc:	28 9a       	B[P5++] = R0;
ffa039de:	01 e8 00 00 	UNLINK;
ffa039e2:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa039e4:	84 04       	(P5:4) = [SP++];
ffa039e6:	10 00       	RTS;

ffa039e8 <_ARP_rx>:
ffa039e8:	fb 05       	[--SP] = (R7:7, P5:3);
ffa039ea:	20 32       	P4 = R0;
ffa039ec:	39 30       	R7 = R1;
ffa039ee:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa039f2:	e0 a5       	R0 = W[P4 + 0xe] (Z);
ffa039f4:	ff e3 ea f3 	CALL 0xffa021c8 <_htons>;
ffa039f8:	c0 42       	R0 = R0.L (Z);
ffa039fa:	21 e1 06 08 	R1 = 0x806 (X);		/*		R1=0x806(2054) */
ffa039fe:	08 08       	CC = R0 == R1;
ffa03a00:	06 18       	IF CC JUMP 0xffa03a0c <_ARP_rx+0x24>;
ffa03a02:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03a04:	01 e8 00 00 	UNLINK;
ffa03a08:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03a0a:	10 00       	RTS;
ffa03a0c:	58 61       	R0 = 0x2b (X);		/*		R0=0x2b( 43) */
ffa03a0e:	07 0a       	CC = R7 <= R0 (IU);
ffa03a10:	f9 1f       	IF CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a12:	27 a6       	R7 = W[P4 + 0x10] (Z);
ffa03a14:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03a16:	ff e3 d9 f3 	CALL 0xffa021c8 <_htons>;
ffa03a1a:	c0 42       	R0 = R0.L (Z);
ffa03a1c:	07 08       	CC = R7 == R0;
ffa03a1e:	f2 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a20:	67 a6       	R7 = W[P4 + 0x12] (Z);
ffa03a22:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03a26:	ff e3 d1 f3 	CALL 0xffa021c8 <_htons>;
ffa03a2a:	c0 42       	R0 = R0.L (Z);
ffa03a2c:	07 08       	CC = R7 == R0;
ffa03a2e:	ea 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a30:	a0 a6       	R0 = W[P4 + 0x14] (Z);
ffa03a32:	21 e1 06 04 	R1 = 0x406 (X);		/*		R1=0x406(1030) */
ffa03a36:	08 08       	CC = R0 == R1;
ffa03a38:	e5 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a3a:	e7 a6       	R7 = W[P4 + 0x16] (Z);
ffa03a3c:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa03a3e:	ff e3 c5 f3 	CALL 0xffa021c8 <_htons>;
ffa03a42:	c0 42       	R0 = R0.L (Z);
ffa03a44:	07 08       	CC = R7 == R0;
ffa03a46:	0c 14       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03a48:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900006 */
ffa03a4c:	0a e1 64 0f 	P2.L = 0xf64;		/* (3940)	P2=0xff900f64 <_NetOurMAC> */
ffa03a50:	a1 e4 22 00 	R1 = B[P4 + 0x22] (Z);
ffa03a54:	10 99       	R0 = B[P2] (Z);
ffa03a56:	01 08       	CC = R1 == R0;
ffa03a58:	ad 18       	IF CC JUMP 0xffa03bb2 <_ARP_rx+0x1ca>;
ffa03a5a:	00 00       	NOP;
ffa03a5c:	00 00       	NOP;
ffa03a5e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03a60:	27 a6       	R7 = W[P4 + 0x10] (Z);
ffa03a62:	ff e3 b3 f3 	CALL 0xffa021c8 <_htons>;
ffa03a66:	c0 42       	R0 = R0.L (Z);
ffa03a68:	07 08       	CC = R7 == R0;
ffa03a6a:	cc 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a6c:	67 a6       	R7 = W[P4 + 0x12] (Z);
ffa03a6e:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03a72:	ff e3 ab f3 	CALL 0xffa021c8 <_htons>;
ffa03a76:	c0 42       	R0 = R0.L (Z);
ffa03a78:	07 08       	CC = R7 == R0;
ffa03a7a:	c4 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a7c:	a0 a6       	R0 = W[P4 + 0x14] (Z);
ffa03a7e:	21 e1 06 04 	R1 = 0x406 (X);		/*		R1=0x406(1030) */
ffa03a82:	08 08       	CC = R0 == R1;
ffa03a84:	bf 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a86:	e7 a6       	R7 = W[P4 + 0x16] (Z);
ffa03a88:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03a8a:	ff e3 9f f3 	CALL 0xffa021c8 <_htons>;
ffa03a8e:	c0 42       	R0 = R0.L (Z);
ffa03a90:	07 08       	CC = R7 == R0;
ffa03a92:	b8 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03a94:	47 e1 90 ff 	R7.H = 0xff90;		/* (-112)	R7=0xff90ffff(-7274497) */
ffa03a98:	07 e1 70 0f 	R7.L = 0xf70;		/* (3952)	R7=0xff900f70 <_NetOurIP>(-7336080) */
ffa03a9c:	17 32       	P2 = R7;
ffa03a9e:	a1 a2       	R1 = [P4 + 0x28];
ffa03aa0:	10 91       	R0 = [P2];
ffa03aa2:	01 08       	CC = R1 == R0;
ffa03aa4:	af 17       	IF !CC JUMP 0xffa03a02 <_ARP_rx+0x1a> (BP);
ffa03aa6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f64 <_NetOurMAC> */
ffa03aaa:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa03aae:	10 95       	R0 = W[P2] (Z);
ffa03ab0:	10 32       	P2 = R0;
ffa03ab2:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f9a */
ffa03ab6:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa03aba:	50 61       	R0 = 0x2a (X);		/*		R0=0x2a( 42) */
ffa03abc:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa03ac0:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03ac2:	52 91       	P2 = [P2];
ffa03ac4:	0d e1 64 0f 	P5.L = 0xf64;		/* (3940)	P5=0xff900f64 <_NetOurMAC> */
ffa03ac8:	93 ad       	P3 = [P2 + 0x18];
ffa03aca:	18 97       	W[P3] = R0;
ffa03acc:	a0 e5 08 00 	R0 = B[P4 + 0x8] (X);
ffa03ad0:	98 e6 02 00 	B[P3 + 0x2] = R0;
ffa03ad4:	a0 e5 09 00 	R0 = B[P4 + 0x9] (X);
ffa03ad8:	98 e6 03 00 	B[P3 + 0x3] = R0;
ffa03adc:	a0 e5 0a 00 	R0 = B[P4 + 0xa] (X);
ffa03ae0:	98 e6 04 00 	B[P3 + 0x4] = R0;
ffa03ae4:	a0 e5 0b 00 	R0 = B[P4 + 0xb] (X);
ffa03ae8:	98 e6 05 00 	B[P3 + 0x5] = R0;
ffa03aec:	a0 e5 0c 00 	R0 = B[P4 + 0xc] (X);
ffa03af0:	98 e6 06 00 	B[P3 + 0x6] = R0;
ffa03af4:	a0 e5 0d 00 	R0 = B[P4 + 0xd] (X);
ffa03af8:	98 e6 07 00 	B[P3 + 0x7] = R0;
ffa03afc:	68 99       	R0 = B[P5] (X);
ffa03afe:	98 e6 08 00 	B[P3 + 0x8] = R0;
ffa03b02:	a8 e5 01 00 	R0 = B[P5 + 0x1] (X);
ffa03b06:	98 e6 09 00 	B[P3 + 0x9] = R0;
ffa03b0a:	a8 e5 02 00 	R0 = B[P5 + 0x2] (X);
ffa03b0e:	98 e6 0a 00 	B[P3 + 0xa] = R0;
ffa03b12:	a8 e5 03 00 	R0 = B[P5 + 0x3] (X);
ffa03b16:	98 e6 0b 00 	B[P3 + 0xb] = R0;
ffa03b1a:	a8 e5 04 00 	R0 = B[P5 + 0x4] (X);
ffa03b1e:	98 e6 0c 00 	B[P3 + 0xc] = R0;
ffa03b22:	a8 e5 05 00 	R0 = B[P5 + 0x5] (X);
ffa03b26:	98 e6 0d 00 	B[P3 + 0xd] = R0;
ffa03b2a:	20 e1 06 08 	R0 = 0x806 (X);		/*		R0=0x806(2054) */
ffa03b2e:	ff e3 4d f3 	CALL 0xffa021c8 <_htons>;
ffa03b32:	d8 b5       	W[P3 + 0xe] = R0;
ffa03b34:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03b36:	ff e3 49 f3 	CALL 0xffa021c8 <_htons>;
ffa03b3a:	18 b6       	W[P3 + 0x10] = R0;
ffa03b3c:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03b40:	ff e3 44 f3 	CALL 0xffa021c8 <_htons>;
ffa03b44:	58 b6       	W[P3 + 0x12] = R0;
ffa03b46:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03b48:	98 e6 14 00 	B[P3 + 0x14] = R0;
ffa03b4c:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03b4e:	98 e6 15 00 	B[P3 + 0x15] = R0;
ffa03b52:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa03b54:	ff e3 3a f3 	CALL 0xffa021c8 <_htons>;
ffa03b58:	44 32       	P0 = P4;
ffa03b5a:	d8 b6       	W[P3 + 0x16] = R0;
ffa03b5c:	53 32       	P2 = P3;
ffa03b5e:	c0 6c       	P0 += 0x18;		/* ( 24) */
ffa03b60:	31 68       	P1 = 0x6 (X);		/*		P1=0x6(  6) */
ffa03b62:	b2 e0 08 10 	LSETUP(0xffa03b66 <_ARP_rx+0x17e>, 0xffa03b72 <_ARP_rx+0x18a>) LC1 = P1;
ffa03b66:	68 98       	R0 = B[P5++] (X);
ffa03b68:	90 e6 18 00 	B[P2 + 0x18] = R0;
ffa03b6c:	40 98       	R0 = B[P0++] (X);
ffa03b6e:	90 e6 22 00 	B[P2 + 0x22] = R0;
ffa03b72:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03b74:	17 32       	P2 = R7;
ffa03b76:	11 91       	R1 = [P2];
ffa03b78:	82 c6 c1 81 	R0 = R1 >> 0x8;
ffa03b7c:	98 e6 1f 00 	B[P3 + 0x1f] = R0;
ffa03b80:	99 e6 1e 00 	B[P3 + 0x1e] = R1;
ffa03b84:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa03b88:	c1 4e       	R1 >>= 0x18;
ffa03b8a:	98 e6 20 00 	B[P3 + 0x20] = R0;
ffa03b8e:	99 e6 21 00 	B[P3 + 0x21] = R1;
ffa03b92:	a3 e4 21 00 	R3 = B[P4 + 0x21] (Z);
ffa03b96:	a1 e4 1f 00 	R1 = B[P4 + 0x1f] (Z);
ffa03b9a:	a2 e4 20 00 	R2 = B[P4 + 0x20] (Z);
ffa03b9e:	f3 b0       	[SP + 0xc] = R3;
ffa03ba0:	a0 e4 1e 00 	R0 = B[P4 + 0x1e] (Z);
ffa03ba4:	ff e3 24 f2 	CALL 0xffa01fec <_FormatIPAddress>;
ffa03ba8:	98 b2       	[P3 + 0x28] = R0;
ffa03baa:	ff e3 2b f4 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa03bae:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03bb0:	2a 2f       	JUMP.S 0xffa03a04 <_ARP_rx+0x1c>;
ffa03bb2:	a1 e4 23 00 	R1 = B[P4 + 0x23] (Z);
ffa03bb6:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa03bba:	01 08       	CC = R1 == R0;
ffa03bbc:	51 17       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03bbe:	a1 e4 24 00 	R1 = B[P4 + 0x24] (Z);
ffa03bc2:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa03bc6:	01 08       	CC = R1 == R0;
ffa03bc8:	4b 17       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03bca:	a1 e4 25 00 	R1 = B[P4 + 0x25] (Z);
ffa03bce:	90 e4 03 00 	R0 = B[P2 + 0x3] (Z);
ffa03bd2:	01 08       	CC = R1 == R0;
ffa03bd4:	45 17       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03bd6:	a1 e4 26 00 	R1 = B[P4 + 0x26] (Z);
ffa03bda:	90 e4 04 00 	R0 = B[P2 + 0x4] (Z);
ffa03bde:	01 08       	CC = R1 == R0;
ffa03be0:	3f 17       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03be2:	a0 e4 27 00 	R0 = B[P4 + 0x27] (Z);
ffa03be6:	91 e4 05 00 	R1 = B[P2 + 0x5] (Z);
ffa03bea:	08 08       	CC = R0 == R1;
ffa03bec:	39 17       	IF !CC JUMP 0xffa03a5e <_ARP_rx+0x76> (BP);
ffa03bee:	f4 6c       	P4 += 0x1e;		/* ( 30) */
ffa03bf0:	44 30       	R0 = P4;
ffa03bf2:	ff e3 09 f3 	CALL 0xffa02204 <_pack4chars>;
ffa03bf6:	38 30       	R7 = R0;
ffa03bf8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa03bfc:	0f 30       	R1 = R7;
ffa03bfe:	00 e1 84 05 	R0.L = 0x584;		/* (1412)	R0=0xff900584(-7338620) */
ffa03c02:	ff e3 ad ef 	CALL 0xffa01b5c <_printf_ip>;
ffa03c06:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900584(-7338620) */
ffa03c0a:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa03c0e:	ff e3 a1 ef 	CALL 0xffa01b50 <_printf_str>;
ffa03c12:	d4 6f       	P4 += -0x6;		/* ( -6) */
ffa03c14:	07 30       	R0 = R7;
ffa03c16:	4c 30       	R1 = P4;
ffa03c18:	ff e3 6a fe 	CALL 0xffa038ec <_ARP_lut_add>;
ffa03c1c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03c1e:	f3 2e       	JUMP.S 0xffa03a04 <_ARP_rx+0x1c>;

ffa03c20 <_ARP_tx>:
ffa03c20:	fc 05       	[--SP] = (R7:7, P5:4);
ffa03c22:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa03c26:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03c2a:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa03c2e:	38 30       	R7 = R0;
ffa03c30:	10 95       	R0 = W[P2] (Z);
ffa03c32:	10 32       	P2 = R0;
ffa03c34:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900006 */
ffa03c38:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa03c3c:	60 61       	R0 = 0x2c (X);		/*		R0=0x2c( 44) */
ffa03c3e:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f64 <_NetOurMAC> */
ffa03c42:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03c44:	52 91       	P2 = [P2];
ffa03c46:	0d e1 64 0f 	P5.L = 0xf64;		/* (3940)	P5=0xff900f64 <_NetOurMAC> */
ffa03c4a:	94 ad       	P4 = [P2 + 0x18];
ffa03c4c:	20 97       	W[P4] = R0;
ffa03c4e:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa03c50:	a0 e6 02 00 	B[P4 + 0x2] = R0;
ffa03c54:	a0 e6 03 00 	B[P4 + 0x3] = R0;
ffa03c58:	a0 e6 04 00 	B[P4 + 0x4] = R0;
ffa03c5c:	a0 e6 05 00 	B[P4 + 0x5] = R0;
ffa03c60:	a0 e6 06 00 	B[P4 + 0x6] = R0;
ffa03c64:	a0 e6 07 00 	B[P4 + 0x7] = R0;
ffa03c68:	68 99       	R0 = B[P5] (X);
ffa03c6a:	a0 e6 08 00 	B[P4 + 0x8] = R0;
ffa03c6e:	a8 e5 01 00 	R0 = B[P5 + 0x1] (X);
ffa03c72:	a0 e6 09 00 	B[P4 + 0x9] = R0;
ffa03c76:	a8 e5 02 00 	R0 = B[P5 + 0x2] (X);
ffa03c7a:	a0 e6 0a 00 	B[P4 + 0xa] = R0;
ffa03c7e:	a8 e5 03 00 	R0 = B[P5 + 0x3] (X);
ffa03c82:	a0 e6 0b 00 	B[P4 + 0xb] = R0;
ffa03c86:	a8 e5 04 00 	R0 = B[P5 + 0x4] (X);
ffa03c8a:	a0 e6 0c 00 	B[P4 + 0xc] = R0;
ffa03c8e:	a8 e5 05 00 	R0 = B[P5 + 0x5] (X);
ffa03c92:	a0 e6 0d 00 	B[P4 + 0xd] = R0;
ffa03c96:	20 e1 06 08 	R0 = 0x806 (X);		/*		R0=0x806(2054) */
ffa03c9a:	ff e3 97 f2 	CALL 0xffa021c8 <_htons>;
ffa03c9e:	e0 b5       	W[P4 + 0xe] = R0;
ffa03ca0:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03ca2:	ff e3 93 f2 	CALL 0xffa021c8 <_htons>;
ffa03ca6:	20 b6       	W[P4 + 0x10] = R0;
ffa03ca8:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03cac:	ff e3 8e f2 	CALL 0xffa021c8 <_htons>;
ffa03cb0:	60 b6       	W[P4 + 0x12] = R0;
ffa03cb2:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03cb4:	a0 e6 14 00 	B[P4 + 0x14] = R0;
ffa03cb8:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03cba:	a0 e6 15 00 	B[P4 + 0x15] = R0;
ffa03cbe:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03cc0:	ff e3 84 f2 	CALL 0xffa021c8 <_htons>;
ffa03cc4:	e0 b6       	W[P4 + 0x16] = R0;
ffa03cc6:	54 32       	P2 = P4;
ffa03cc8:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03cca:	31 68       	P1 = 0x6 (X);		/*		P1=0x6(  6) */
ffa03ccc:	b2 e0 07 10 	LSETUP(0xffa03cd0 <_ARP_tx+0xb0>, 0xffa03cda <_ARP_tx+0xba>) LC1 = P1;
ffa03cd0:	68 98       	R0 = B[P5++] (X);
ffa03cd2:	90 e6 18 00 	B[P2 + 0x18] = R0;
ffa03cd6:	91 e6 22 00 	B[P2 + 0x22] = R1;
ffa03cda:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03cdc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa03ce0:	0a e1 70 0f 	P2.L = 0xf70;		/* (3952)	P2=0xff900f70 <_NetOurIP> */
ffa03ce4:	11 91       	R1 = [P2];
ffa03ce6:	82 ce c1 81 	R0 = R1 >> 0x8 || [P4 + 0x28] = R7 || NOP;
ffa03cea:	a7 b2 00 00 
ffa03cee:	a0 e6 1f 00 	B[P4 + 0x1f] = R0;
ffa03cf2:	a1 e6 1e 00 	B[P4 + 0x1e] = R1;
ffa03cf6:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa03cfa:	c1 4e       	R1 >>= 0x18;
ffa03cfc:	a0 e6 20 00 	B[P4 + 0x20] = R0;
ffa03d00:	a1 e6 21 00 	B[P4 + 0x21] = R1;
ffa03d04:	01 e8 00 00 	UNLINK;
ffa03d08:	bc 05       	(R7:7, P5:4) = [SP++];
ffa03d0a:	ff e2 7b f3 	JUMP.L 0xffa02400 <_bfin_EMAC_send_nocopy>;
	...

ffa03d10 <_ARP_req>:
ffa03d10:	f3 05       	[--SP] = (R7:6, P5:3);
ffa03d12:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900f64 <_NetOurMAC> */
ffa03d16:	0d e1 7c 0f 	P5.L = 0xf7c;		/* (3964)	P5=0xff900f7c <_NetArpLut> */
ffa03d1a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03d1e:	38 30       	R7 = R0;
ffa03d20:	21 32       	P4 = R1;
ffa03d22:	5d 32       	P3 = P5;
ffa03d24:	4d 32       	P1 = P5;
ffa03d26:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa03d28:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03d2a:	b2 e0 06 20 	LSETUP(0xffa03d2e <_ARP_req+0x1e>, 0xffa03d36 <_ARP_req+0x26>) LC1 = P2;
ffa03d2e:	08 91       	R0 = [P1];
ffa03d30:	07 08       	CC = R7 == R0;
ffa03d32:	56 18       	IF CC JUMP 0xffa03dde <_ARP_req+0xce>;
ffa03d34:	08 6c       	P0 += 0x1;		/* (  1) */
ffa03d36:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03d38:	ff e3 38 e2 	CALL 0xffa001a8 <_ustimer>;
ffa03d3c:	41 e1 e3 38 	R1.H = 0x38e3;		/* (14563)	R1=0x38e30000(954400768) */
ffa03d40:	01 e1 39 8e 	R1.L = 0x8e39;		/* (-29127)	R1=0x38e38e39(954437177) */
ffa03d44:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa03d48:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa03d4c:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa03d50:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa03d54:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa03d58:	0b c4 3f 80 	A0 += A1;
ffa03d5c:	8b c0 00 38 	R0 = A0 (FU);
ffa03d60:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900006 */
ffa03d64:	82 c6 f8 8d 	R6 = R0 >> 0x1;
ffa03d68:	09 e1 7c 0f 	P1.L = 0xf7c;		/* (3964)	P1=0xff900f7c <_NetArpLut> */
ffa03d6c:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa03d6e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03d70:	b2 e0 06 20 	LSETUP(0xffa03d74 <_ARP_req+0x64>, 0xffa03d7c <_ARP_req+0x6c>) LC1 = P2;
ffa03d74:	08 91       	R0 = [P1];
ffa03d76:	38 08       	CC = R0 == R7;
ffa03d78:	43 18       	IF CC JUMP 0xffa03dfe <_ARP_req+0xee>;
ffa03d7a:	08 6c       	P0 += 0x1;		/* (  1) */
ffa03d7c:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03d7e:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa03d80:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03d82:	b2 e0 06 20 	LSETUP(0xffa03d86 <_ARP_req+0x76>, 0xffa03d8e <_ARP_req+0x7e>) LC1 = P2;
ffa03d86:	28 91       	R0 = [P5];
ffa03d88:	00 0c       	CC = R0 == 0x0;
ffa03d8a:	0f 18       	IF CC JUMP 0xffa03da8 <_ARP_req+0x98>;
ffa03d8c:	09 6c       	P1 += 0x1;		/* (  1) */
ffa03d8e:	a5 6c       	P5 += 0x14;		/* ( 20) */
ffa03d90:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900000 <_l1_data_a> */
ffa03d94:	5a a5       	R2 = W[P3 + 0xa] (Z);
ffa03d96:	08 e1 9a 0f 	P0.L = 0xf9a;		/* (3994)	P0=0xff900f9a */
ffa03d9a:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa03d9c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03d9e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03da0:	09 64       	R1 += 0x1;		/* (  1) */
ffa03da2:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03da4:	42 0c       	CC = P2 == 0x0;
ffa03da6:	4a 10       	IF !CC JUMP 0xffa03e3a <_ARP_req+0x12a>;
ffa03da8:	89 5e       	P2 = P1 + (P1 << 0x2);
ffa03daa:	93 5e       	P2 = P3 + (P2 << 0x2);
ffa03dac:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa03dae:	10 b1       	[P2 + 0x10] = R0;
ffa03db0:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03db4:	04 cc 30 00 	R0 = R6 + R0 (NS) || [P2] = R7 || NOP;
ffa03db8:	17 93 00 00 
ffa03dbc:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900000 <_l1_data_a> */
ffa03dc0:	09 e1 78 0f 	P1.L = 0xf78;		/* (3960)	P1=0xff900f78 <_NetArpLut_age> */
ffa03dc4:	d0 b0       	[P2 + 0xc] = R0;
ffa03dc6:	08 95       	R0 = W[P1] (Z);
ffa03dc8:	08 64       	R0 += 0x1;		/* (  1) */
ffa03dca:	08 97       	W[P1] = R0;
ffa03dcc:	50 b5       	W[P2 + 0xa] = R0;
ffa03dce:	07 30       	R0 = R7;
ffa03dd0:	ff e3 28 ff 	CALL 0xffa03c20 <_ARP_tx>;
ffa03dd4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03dd6:	01 e8 00 00 	UNLINK;
ffa03dda:	b3 05       	(R7:6, P5:3) = [SP++];
ffa03ddc:	10 00       	RTS;
ffa03dde:	08 a1       	R0 = [P1 + 0x10];
ffa03de0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa03de2:	a9 1f       	IF CC JUMP 0xffa03d34 <_ARP_req+0x24> (BP);
ffa03de4:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa03de6:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03de8:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa03dea:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa03dec:	b2 e0 03 20 	LSETUP(0xffa03df0 <_ARP_req+0xe0>, 0xffa03df2 <_ARP_req+0xe2>) LC1 = P2;
ffa03df0:	48 98       	R0 = B[P1++] (X);
ffa03df2:	20 9a       	B[P4++] = R0;
ffa03df4:	01 e8 00 00 	UNLINK;
ffa03df8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03dfa:	b3 05       	(R7:6, P5:3) = [SP++];
ffa03dfc:	10 00       	RTS;
ffa03dfe:	08 a1       	R0 = [P1 + 0x10];
ffa03e00:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa03e02:	bc 1f       	IF CC JUMP 0xffa03d7a <_ARP_req+0x6a> (BP);
ffa03e04:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa03e06:	53 5f       	P5 = P3 + (P2 << 0x2);
ffa03e08:	e8 a0       	R0 = [P5 + 0xc];
ffa03e0a:	86 09       	CC = R6 < R0 (IU);
ffa03e0c:	e4 1f       	IF CC JUMP 0xffa03dd4 <_ARP_req+0xc4> (BP);
ffa03e0e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa03e12:	0f 30       	R1 = R7;
ffa03e14:	00 e1 a8 05 	R0.L = 0x5a8;		/* (1448)	R0=0xff9005a8(-7338584) */
ffa03e18:	ff e3 a2 ee 	CALL 0xffa01b5c <_printf_ip>;
ffa03e1c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005a8(-7338584) */
ffa03e20:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa03e24:	ff e3 96 ee 	CALL 0xffa01b50 <_printf_str>;
ffa03e28:	07 30       	R0 = R7;
ffa03e2a:	ff e3 fb fe 	CALL 0xffa03c20 <_ARP_tx>;
ffa03e2e:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03e32:	06 50       	R0 = R6 + R0;
ffa03e34:	e8 b0       	[P5 + 0xc] = R0;
ffa03e36:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03e38:	cf 2f       	JUMP.S 0xffa03dd6 <_ARP_req+0xc6>;
ffa03e3a:	00 95       	R0 = W[P0] (Z);
ffa03e3c:	90 08       	CC = R0 < R2;
ffa03e3e:	02 06       	IF !CC R0 = R2;
ffa03e40:	89 07       	IF CC P1 = R1;
ffa03e42:	a0 6c       	P0 += 0x14;		/* ( 20) */
ffa03e44:	10 30       	R2 = R0;
ffa03e46:	ad 2f       	JUMP.S 0xffa03da0 <_ARP_req+0x90>;

ffa03e48 <_tcp_length>:
ffa03e48:	c5 04       	[--SP] = (P5:5);
ffa03e4a:	28 32       	P5 = R0;
ffa03e4c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03e50:	68 a6       	R0 = W[P5 + 0x12] (Z);
ffa03e52:	ff e3 bb f1 	CALL 0xffa021c8 <_htons>;
ffa03e56:	a9 e4 10 00 	R1 = B[P5 + 0x10] (Z);
ffa03e5a:	7a 60       	R2 = 0xf (X);		/*		R2=0xf( 15) */
ffa03e5c:	51 54       	R1 = R1 & R2;
ffa03e5e:	11 4f       	R1 <<= 0x2;
ffa03e60:	c0 42       	R0 = R0.L (Z);
ffa03e62:	08 52       	R0 = R0 - R1;
ffa03e64:	a9 e4 30 00 	R1 = B[P5 + 0x30] (Z);
ffa03e68:	11 4d       	R1 >>>= 0x2;
ffa03e6a:	e2 61       	R2 = 0x3c (X);		/*		R2=0x3c( 60) */
ffa03e6c:	51 54       	R1 = R1 & R2;
ffa03e6e:	01 e8 00 00 	UNLINK;
ffa03e72:	08 52       	R0 = R0 - R1;
ffa03e74:	85 04       	(P5:5) = [SP++];
ffa03e76:	10 00       	RTS;

ffa03e78 <_tcp_checksum_calc>:
ffa03e78:	08 32       	P1 = R0;
ffa03e7a:	ed 05       	[--SP] = (R7:5, P5:5);
ffa03e7c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03e80:	28 32       	P5 = R0;
ffa03e82:	29 30       	R5 = R1;
ffa03e84:	e1 6c       	P1 += 0x1c;		/* ( 28) */
ffa03e86:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa03e88:	22 68       	P2 = 0x4 (X);		/*		P2=0x4(  4) */
ffa03e8a:	b2 e0 03 20 	LSETUP(0xffa03e8e <_tcp_checksum_calc+0x16>, 0xffa03e90 <_tcp_checksum_calc+0x18>) LC1 = P2;
ffa03e8e:	08 94       	R0 = W[P1++] (Z);
ffa03e90:	86 51       	R6 = R6 + R0;
ffa03e92:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03e96:	10 4e       	R0 >>= 0x2;
ffa03e98:	05 50       	R0 = R5 + R0;
ffa03e9a:	af e4 19 00 	R7 = B[P5 + 0x19] (Z);
ffa03e9e:	c0 42       	R0 = R0.L (Z);
ffa03ea0:	ff e3 94 f1 	CALL 0xffa021c8 <_htons>;
ffa03ea4:	47 4f       	R7 <<= 0x8;
ffa03ea6:	fe 51       	R7 = R6 + R7;
ffa03ea8:	c0 42       	R0 = R0.L (Z);
ffa03eaa:	87 50       	R2 = R7 + R0;
ffa03eac:	05 48       	CC = !BITTST (R5, 0x0);		/* bit  0 */
ffa03eae:	0d 1c       	IF CC JUMP 0xffa03ec8 <_tcp_checksum_calc+0x50> (BP);
ffa03eb0:	0d 32       	P1 = R5;
ffa03eb2:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03eb6:	25 6d       	P5 += 0x24;		/* ( 36) */
ffa03eb8:	10 4e       	R0 >>= 0x2;
ffa03eba:	0d 64       	R5 += 0x1;		/* (  1) */
ffa03ebc:	8d 5a       	P2 = P5 + P1;
ffa03ebe:	08 32       	P1 = R0;
ffa03ec0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03ec2:	e5 6e       	P5 += -0x24;		/* (-36) */
ffa03ec4:	8a 5a       	P2 = P2 + P1;
ffa03ec6:	10 9b       	B[P2] = R0;
ffa03ec8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03eca:	68 e6 1a 00 	W[P5 + 0x34] = R0;
ffa03ece:	82 c6 0d 83 	R1 = R5 >> 0x1f;
ffa03ed2:	69 50       	R1 = R1 + R5;
ffa03ed4:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03ed8:	09 4d       	R1 >>>= 0x1;
ffa03eda:	18 4e       	R0 >>= 0x3;
ffa03edc:	01 50       	R0 = R1 + R0;
ffa03ede:	00 0d       	CC = R0 <= 0x0;
ffa03ee0:	08 18       	IF CC JUMP 0xffa03ef0 <_tcp_checksum_calc+0x78>;
ffa03ee2:	55 32       	P2 = P5;
ffa03ee4:	22 6d       	P2 += 0x24;		/* ( 36) */
ffa03ee6:	08 32       	P1 = R0;
ffa03ee8:	b2 e0 03 10 	LSETUP(0xffa03eec <_tcp_checksum_calc+0x74>, 0xffa03eee <_tcp_checksum_calc+0x76>) LC1 = P1;
ffa03eec:	10 94       	R0 = W[P2++] (Z);
ffa03eee:	82 50       	R2 = R2 + R0;
ffa03ef0:	d1 42       	R1 = R2.L (Z);
ffa03ef2:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa03ef6:	08 50       	R0 = R0 + R1;
ffa03ef8:	01 e8 00 00 	UNLINK;
ffa03efc:	c0 43       	R0 =~ R0;
ffa03efe:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03f00:	10 00       	RTS;
	...

ffa03f04 <_tcp_checksum_set>:
ffa03f04:	c5 04       	[--SP] = (P5:5);
ffa03f06:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900004 */
ffa03f0a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03f0e:	08 30       	R1 = R0;
ffa03f10:	0a e1 3c 0f 	P2.L = 0xf3c;		/* (3900)	P2=0xff900f3c <_txIdx> */
ffa03f14:	10 95       	R0 = W[P2] (Z);
ffa03f16:	10 32       	P2 = R0;
ffa03f18:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f78 <_NetArpLut_age> */
ffa03f1c:	09 e1 40 0f 	P1.L = 0xf40;		/* (3904)	P1=0xff900f40 <_txbuf> */
ffa03f20:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03f22:	52 91       	P2 = [P2];
ffa03f24:	95 ad       	P5 = [P2 + 0x18];
ffa03f26:	45 30       	R0 = P5;
ffa03f28:	ff e3 a8 ff 	CALL 0xffa03e78 <_tcp_checksum_calc>;
ffa03f2c:	68 e6 1a 00 	W[P5 + 0x34] = R0;
ffa03f30:	01 e8 00 00 	UNLINK;
ffa03f34:	85 04       	(P5:5) = [SP++];
ffa03f36:	10 00       	RTS;

ffa03f38 <_tcp_checksum_check>:
ffa03f38:	10 32       	P2 = R0;
ffa03f3a:	78 05       	[--SP] = (R7:7);
ffa03f3c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03f40:	57 e4 1a 00 	R7 = W[P2 + 0x34] (Z);
ffa03f44:	ff e3 9a ff 	CALL 0xffa03e78 <_tcp_checksum_calc>;
ffa03f48:	0f 30       	R1 = R7;
ffa03f4a:	c7 42       	R7 = R0.L (Z);
ffa03f4c:	39 08       	CC = R1 == R7;
ffa03f4e:	19 18       	IF CC JUMP 0xffa03f80 <_tcp_checksum_check+0x48>;
ffa03f50:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03f54:	00 e1 c8 05 	R0.L = 0x5c8;		/* (1480)	R0=0xff9005c8(-7338552) */
ffa03f58:	ff e3 f8 ec 	CALL 0xffa01948 <_printf_hex>;
ffa03f5c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005c8(-7338552) */
ffa03f60:	0f 30       	R1 = R7;
ffa03f62:	00 e1 e4 05 	R0.L = 0x5e4;		/* (1508)	R0=0xff9005e4(-7338524) */
ffa03f66:	ff e3 f1 ec 	CALL 0xffa01948 <_printf_hex>;
ffa03f6a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005e4(-7338524) */
ffa03f6e:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa03f72:	ff e3 ef ed 	CALL 0xffa01b50 <_printf_str>;
ffa03f76:	01 e8 00 00 	UNLINK;
ffa03f7a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03f7c:	38 05       	(R7:7) = [SP++];
ffa03f7e:	10 00       	RTS;
ffa03f80:	01 e8 00 00 	UNLINK;
ffa03f84:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03f86:	38 05       	(R7:7) = [SP++];
ffa03f88:	10 00       	RTS;
	...

ffa03f8c <_tcp_packet_setup>:
ffa03f8c:	ed 05       	[--SP] = (R7:5, P5:5);
ffa03f8e:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa03f92:	29 32       	P5 = R1;
ffa03f94:	c0 65       	R0 += 0x38;		/* ( 56) */
ffa03f96:	7f 30       	R7 = FP;
ffa03f98:	f0 bb       	[FP -0x4] = R0;
ffa03f9a:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa03f9c:	2a 30       	R5 = R2;
ffa03f9e:	be e5 24 00 	R6 = B[FP + 0x24] (X);
ffa03fa2:	07 30       	R0 = R7;
ffa03fa4:	ff e3 0e f6 	CALL 0xffa02bc0 <_eth_header_setup>;
ffa03fa8:	08 30       	R1 = R0;
ffa03faa:	68 99       	R0 = B[P5] (X);
ffa03fac:	80 0c       	CC = R0 < 0x0;
ffa03fae:	14 18       	IF CC JUMP 0xffa03fd6 <_tcp_packet_setup+0x4a>;
ffa03fb0:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03fb2:	f0 b0       	[SP + 0xc] = R0;
ffa03fb4:	01 30       	R0 = R1;
ffa03fb6:	0f 30       	R1 = R7;
ffa03fb8:	15 30       	R2 = R5;
ffa03fba:	ff e3 39 f1 	CALL 0xffa0222c <_ip_header_setup>;
ffa03fbe:	b9 a2       	R1 = [FP + 0x28];
ffa03fc0:	f1 b0       	[SP + 0xc] = R1;
ffa03fc2:	f9 a2       	R1 = [FP + 0x2c];
ffa03fc4:	31 b1       	[SP + 0x10] = R1;
ffa03fc6:	72 43       	R2 = R6.B (Z);
ffa03fc8:	0f 30       	R1 = R7;
ffa03fca:	ff e3 d7 f1 	CALL 0xffa02378 <_tcp_header_setup>;
ffa03fce:	01 e8 00 00 	UNLINK;
ffa03fd2:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03fd4:	10 00       	RTS;
ffa03fd6:	01 e8 00 00 	UNLINK;
ffa03fda:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03fdc:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03fde:	10 00       	RTS;

ffa03fe0 <_tcp_burst>:
ffa03fe0:	e3 05       	[--SP] = (R7:4, P5:3);
ffa03fe2:	00 e8 08 00 	LINK 0x20;		/* (32) */
ffa03fe6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f3c <_txIdx> */
ffa03fea:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f40 <_txbuf> */
ffa03fee:	78 b2       	[FP + 0x24] = R0;
ffa03ff0:	31 30       	R6 = R1;
ffa03ff2:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa03ff6:	09 e1 64 10 	P1.L = 0x1064;		/* (4196)	P1=0xff901064 <_g_httpHeaderLen> */
ffa03ffa:	11 91       	R1 = [P2];
ffa03ffc:	08 91       	R0 = [P1];
ffa03ffe:	01 50       	R0 = R1 + R0;
ffa04000:	e0 bb       	[FP -0x8] = R0;
ffa04002:	78 a2       	R0 = [FP + 0x24];
ffa04004:	00 0d       	CC = R0 <= 0x0;
ffa04006:	80 18       	IF CC JUMP 0xffa04106 <_tcp_burst+0x126>;
ffa04008:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900c68 */
ffa0400c:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa0400e:	0b e1 48 10 	P3.L = 0x1048;		/* (4168)	P3=0xff901048 <_TcpSeqHost> */
ffa04012:	85 68       	P5 = 0x10 (X);		/*		P5=0x10( 16) */
ffa04014:	e0 b9       	R0 = [FP -0x8];
ffa04016:	30 0a       	CC = R0 <= R6 (IU);
ffa04018:	66 18       	IF CC JUMP 0xffa040e4 <_tcp_burst+0x104>;
ffa0401a:	30 52       	R0 = R0 - R6;
ffa0401c:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa04020:	08 09       	CC = R0 <= R1;
ffa04022:	07 c4 01 4a 	R5 = MIN (R0, R1);
ffa04026:	04 02       	R4 = CC;
ffa04028:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff901064 <_g_httpHeaderLen> */
ffa0402c:	09 e1 50 10 	P1.L = 0x1050;		/* (4176)	P1=0xff901050 <_TcpSeqHttpStart> */
ffa04030:	08 91       	R0 = [P1];
ffa04032:	0c 02       	CC = R4;
ffa04034:	06 50       	R0 = R6 + R0;
ffa04036:	c1 60       	R1 = 0x18 (X);		/*		R1=0x18( 24) */
ffa04038:	18 93       	[P3] = R0;
ffa0403a:	4d 06       	IF !CC R1 = P5;
ffa0403c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901068 <_g_httpContentLen> */
ffa04040:	f1 b0       	[SP + 0xc] = R1;
ffa04042:	30 b1       	[SP + 0x10] = R0;
ffa04044:	0a e1 4c 10 	P2.L = 0x104c;		/* (4172)	P2=0xff90104c <_TcpSeqClient> */
ffa04048:	10 91       	R0 = [P2];
ffa0404a:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff901050 <_TcpSeqHttpStart> */
ffa0404e:	70 b1       	[SP + 0x14] = R0;
ffa04050:	09 e1 34 0f 	P1.L = 0xf34;		/* (3892)	P1=0xff900f34 <_NetDestIP> */
ffa04054:	4f 30       	R1 = FP;
ffa04056:	82 ce 05 c0 	R0 = ROT R5 BY 0x0 || R2 = [P1] || NOP;
ffa0405a:	0a 91 00 00 
ffa0405e:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa04060:	ff e3 96 ff 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa04064:	38 30       	R7 = R0;
ffa04066:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa0406a:	00 0d       	CC = R0 <= 0x0;
ffa0406c:	de 1f       	IF CC JUMP 0xffa04028 <_tcp_burst+0x48> (BP);
ffa0406e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90104c <_TcpSeqClient> */
ffa04072:	0a e1 64 10 	P2.L = 0x1064;		/* (4196)	P2=0xff901064 <_g_httpHeaderLen> */
ffa04076:	10 91       	R0 = [P2];
ffa04078:	30 0a       	CC = R0 <= R6 (IU);
ffa0407a:	3a 10       	IF !CC JUMP 0xffa040ee <_tcp_burst+0x10e>;
ffa0407c:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa0407e:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f34 <_NetDestIP> */
ffa04082:	09 e1 64 10 	P1.L = 0x1064;		/* (4196)	P1=0xff901064 <_g_httpHeaderLen> */
ffa04086:	08 91       	R0 = [P1];
ffa04088:	06 52       	R0 = R6 - R0;
ffa0408a:	21 e1 00 41 	R1 = 0x4100 (X);		/*		R1=0x4100(16640) */
ffa0408e:	08 50       	R0 = R0 + R1;
ffa04090:	0f 30       	R1 = R7;
ffa04092:	15 30       	R2 = R5;
ffa04094:	ff e3 ac ed 	CALL 0xffa01bec <_memcpy_>;
ffa04098:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901064 <_g_httpHeaderLen> */
ffa0409c:	0a e1 50 10 	P2.L = 0x1050;		/* (4176)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa040a0:	10 91       	R0 = [P2];
ffa040a2:	ae 51       	R6 = R6 + R5;
ffa040a4:	06 50       	R0 = R6 + R0;
ffa040a6:	18 93       	[P3] = R0;
ffa040a8:	2c 50       	R0 = R4 + R5;
ffa040aa:	ff e3 2d ff 	CALL 0xffa03f04 <_tcp_checksum_set>;
ffa040ae:	ff e3 a9 f1 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa040b2:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff901064 <_g_httpHeaderLen> */
ffa040b6:	09 e1 50 0f 	P1.L = 0xf50;		/* (3920)	P1=0xff900f50 <_rxIdx> */
ffa040ba:	08 95       	R0 = W[P1] (Z);
ffa040bc:	10 32       	P2 = R0;
ffa040be:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f50 <_rxIdx> */
ffa040c2:	09 e1 54 0f 	P1.L = 0xf54;		/* (3924)	P1=0xff900f54 <_rxbuf> */
ffa040c6:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa040c8:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa040ca:	52 91       	P2 = [P2];
ffa040cc:	90 a2       	R0 = [P2 + 0x28];
ffa040ce:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa040d0:	07 1c       	IF CC JUMP 0xffa040de <_tcp_burst+0xfe> (BP);
ffa040d2:	90 a2       	R0 = [P2 + 0x28];
ffa040d4:	68 48       	CC = !BITTST (R0, 0xd);		/* bit 13 */
ffa040d6:	4c 30       	R1 = P4;
ffa040d8:	7a a2       	R2 = [FP + 0x24];
ffa040da:	11 50       	R0 = R1 + R2;
ffa040dc:	a0 06       	IF !CC P4 = R0;
ffa040de:	79 ae       	P1 = [FP + 0x24];
ffa040e0:	61 09       	CC = P1 <= P4;
ffa040e2:	99 17       	IF !CC JUMP 0xffa04014 <_tcp_burst+0x34> (BP);
ffa040e4:	44 30       	R0 = P4;
ffa040e6:	01 e8 00 00 	UNLINK;
ffa040ea:	a3 05       	(R7:4, P5:3) = [SP++];
ffa040ec:	10 00       	RTS;
ffa040ee:	30 53       	R4 = R0 - R6;
ffa040f0:	20 e1 00 40 	R0 = 0x4000 (X);		/*		R0=0x4000(16384) */
ffa040f4:	06 50       	R0 = R6 + R0;
ffa040f6:	0f 30       	R1 = R7;
ffa040f8:	14 30       	R2 = R4;
ffa040fa:	ff e3 79 ed 	CALL 0xffa01bec <_memcpy_>;
ffa040fe:	e7 51       	R7 = R7 + R4;
ffa04100:	65 53       	R5 = R5 - R4;
ffa04102:	a6 51       	R6 = R6 + R4;
ffa04104:	bd 2f       	JUMP.S 0xffa0407e <_tcp_burst+0x9e>;
ffa04106:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa04108:	44 30       	R0 = P4;
ffa0410a:	01 e8 00 00 	UNLINK;
ffa0410e:	a3 05       	(R7:4, P5:3) = [SP++];
ffa04110:	10 00       	RTS;
	...

ffa04114 <_tcp_rx>:
ffa04114:	e3 05       	[--SP] = (R7:4, P5:3);
ffa04116:	20 32       	P4 = R0;
ffa04118:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa0411c:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa04120:	e7 a5       	R7 = W[P4 + 0xe] (Z);
ffa04122:	ff e3 53 f0 	CALL 0xffa021c8 <_htons>;
ffa04126:	c0 42       	R0 = R0.L (Z);
ffa04128:	07 08       	CC = R7 == R0;
ffa0412a:	06 18       	IF CC JUMP 0xffa04136 <_tcp_rx+0x22>;
ffa0412c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0412e:	01 e8 00 00 	UNLINK;
ffa04132:	a3 05       	(R7:4, P5:3) = [SP++];
ffa04134:	10 00       	RTS;
ffa04136:	a0 e4 19 00 	R0 = B[P4 + 0x19] (Z);
ffa0413a:	31 60       	R1 = 0x6 (X);		/*		R1=0x6(  6) */
ffa0413c:	08 08       	CC = R0 == R1;
ffa0413e:	f7 17       	IF !CC JUMP 0xffa0412c <_tcp_rx+0x18> (BP);
ffa04140:	67 e4 13 00 	R7 = W[P4 + 0x26] (Z);
ffa04144:	20 e1 50 00 	R0 = 0x50 (X);		/*		R0=0x50( 80) */
ffa04148:	ff e3 40 f0 	CALL 0xffa021c8 <_htons>;
ffa0414c:	c0 42       	R0 = R0.L (Z);
ffa0414e:	07 08       	CC = R7 == R0;
ffa04150:	ee 17       	IF !CC JUMP 0xffa0412c <_tcp_rx+0x18> (BP);
ffa04152:	44 30       	R0 = P4;
ffa04154:	80 64       	R0 += 0x10;		/* ( 16) */
ffa04156:	ff e3 b7 f0 	CALL 0xffa022c4 <_ip_header_checksum>;
ffa0415a:	40 43       	R0 = R0.B (Z);
ffa0415c:	00 0c       	CC = R0 == 0x0;
ffa0415e:	e7 1f       	IF CC JUMP 0xffa0412c <_tcp_rx+0x18> (BP);
ffa04160:	4c 30       	R1 = P4;
ffa04162:	41 64       	R1 += 0x8;		/* (  8) */
ffa04164:	e0 a1       	R0 = [P4 + 0x1c];
ffa04166:	ff e3 c3 fb 	CALL 0xffa038ec <_ARP_lut_add>;
ffa0416a:	44 30       	R0 = P4;
ffa0416c:	ff e3 6e fe 	CALL 0xffa03e48 <_tcp_length>;
ffa04170:	30 30       	R6 = R0;
ffa04172:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900050(-7339952) */
ffa04176:	0e 30       	R1 = R6;
ffa04178:	00 e1 f4 05 	R0.L = 0x5f4;		/* (1524)	R0=0xff9005f4(-7338508) */
ffa0417c:	ff e3 42 ec 	CALL 0xffa01a00 <_printf_int>;
ffa04180:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9005f4(-7338508) */
ffa04184:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa04188:	ff e3 e4 ec 	CALL 0xffa01b50 <_printf_str>;
ffa0418c:	44 30       	R0 = P4;
ffa0418e:	0e 30       	R1 = R6;
ffa04190:	ff e3 d4 fe 	CALL 0xffa03f38 <_tcp_checksum_check>;
ffa04194:	40 43       	R0 = R0.B (Z);
ffa04196:	00 0c       	CC = R0 == 0x0;
ffa04198:	ca 1b       	IF CC JUMP 0xffa0412c <_tcp_rx+0x18>;
ffa0419a:	00 00       	NOP;
ffa0419c:	00 00       	NOP;
ffa0419e:	22 60       	R2 = 0x4 (X);		/*		R2=0x4(  4) */
ffa041a0:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa041a4:	10 08       	CC = R0 == R2;
ffa041a6:	3c 19       	IF CC JUMP 0xffa0441e <_tcp_rx+0x30a>;
ffa041a8:	10 0c       	CC = R0 == 0x2;
ffa041aa:	f8 18       	IF CC JUMP 0xffa0439a <_tcp_rx+0x286>;
ffa041ac:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa041ae:	08 08       	CC = R0 == R1;
ffa041b0:	80 18       	IF CC JUMP 0xffa042b0 <_tcp_rx+0x19c>;
ffa041b2:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa041b4:	a6 10       	IF !CC JUMP 0xffa04300 <_tcp_rx+0x1ec>;
ffa041b6:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900010 */
ffa041ba:	0d e1 54 10 	P5.L = 0x1054;		/* (4180)	P5=0xff901054 <_TcpState> */
ffa041be:	20 48       	CC = !BITTST (R0, 0x4);		/* bit  4 */
ffa041c0:	38 10       	IF !CC JUMP 0xffa04230 <_tcp_rx+0x11c>;
ffa041c2:	28 91       	R0 = [P5];
ffa041c4:	10 0c       	CC = R0 == 0x2;
ffa041c6:	b3 17       	IF !CC JUMP 0xffa0412c <_tcp_rx+0x18> (BP);
ffa041c8:	a4 e5 30 00 	R4 = B[P4 + 0x30] (X);
ffa041cc:	a0 a2       	R0 = [P4 + 0x28];
ffa041ce:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff900f54 <_rxbuf>(-7336108) */
ffa041d2:	ff e3 05 f0 	CALL 0xffa021dc <_htonl>;
ffa041d6:	05 e1 34 0f 	R5.L = 0xf34;		/* (3892)	R5=0xff900f34 <_NetDestIP>(-7336140) */
ffa041da:	15 32       	P2 = R5;
ffa041dc:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff901048 <_TcpSeqHost> */
ffa041e0:	30 50       	R0 = R0 + R6;
ffa041e2:	0b e1 4c 10 	P3.L = 0x104c;		/* (4172)	P3=0xff90104c <_TcpSeqClient> */
ffa041e6:	18 93       	[P3] = R0;
ffa041e8:	e0 a1       	R0 = [P4 + 0x1c];
ffa041ea:	10 93       	[P2] = R0;
ffa041ec:	e0 a2       	R0 = [P4 + 0x2c];
ffa041ee:	ff e3 f7 ef 	CALL 0xffa021dc <_htonl>;
ffa041f2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa041f6:	0a e1 50 10 	P2.L = 0x1050;		/* (4176)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa041fa:	11 91       	R1 = [P2];
ffa041fc:	c8 53       	R7 = R0 - R1;
ffa041fe:	a1 e4 31 00 	R1 = B[P4 + 0x31] (Z);
ffa04202:	21 48       	CC = !BITTST (R1, 0x4);		/* bit  4 */
ffa04204:	28 1d       	IF CC JUMP 0xffa04454 <_tcp_rx+0x340> (BP);
ffa04206:	06 0c       	CC = R6 == 0x0;
ffa04208:	26 15       	IF !CC JUMP 0xffa04454 <_tcp_rx+0x340> (BP);
ffa0420a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa0420e:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa04212:	10 91       	R0 = [P2];
ffa04214:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901068 <_g_httpContentLen> */
ffa04218:	0a e1 64 10 	P2.L = 0x1064;		/* (4196)	P2=0xff901064 <_g_httpHeaderLen> */
ffa0421c:	11 91       	R1 = [P2];
ffa0421e:	08 50       	R0 = R0 + R1;
ffa04220:	38 08       	CC = R0 == R7;
ffa04222:	ba 1c       	IF CC JUMP 0xffa04396 <_tcp_rx+0x282> (BP);
ffa04224:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04226:	0f 30       	R1 = R7;
ffa04228:	ff e3 dc fe 	CALL 0xffa03fe0 <_tcp_burst>;
ffa0422c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0422e:	80 2f       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa04230:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa04232:	28 91       	R0 = [P5];
ffa04234:	08 08       	CC = R0 == R1;
ffa04236:	5d 19       	IF CC JUMP 0xffa044f0 <_tcp_rx+0x3dc>;
ffa04238:	00 0c       	CC = R0 == 0x0;
ffa0423a:	c4 17       	IF !CC JUMP 0xffa041c2 <_tcp_rx+0xae> (BP);
ffa0423c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04240:	00 e1 70 06 	R0.L = 0x670;		/* (1648)	R0=0xff900670(-7338384) */
ffa04244:	ff e3 86 ec 	CALL 0xffa01b50 <_printf_str>;
ffa04248:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901064 <_g_httpHeaderLen> */
ffa0424c:	0a e1 6c 10 	P2.L = 0x106c;		/* (4204)	P2=0xff90106c <_g_httpRxed> */
ffa04250:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa04252:	17 93       	[P2] = R7;
ffa04254:	a0 a2       	R0 = [P4 + 0x28];
ffa04256:	ff e3 c3 ef 	CALL 0xffa021dc <_htonl>;
ffa0425a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90106c <_g_httpRxed> */
ffa0425e:	0a e1 4c 10 	P2.L = 0x104c;		/* (4172)	P2=0xff90104c <_TcpSeqClient> */
ffa04262:	10 93       	[P2] = R0;
ffa04264:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90104c <_TcpSeqClient> */
ffa04268:	e2 a1       	R2 = [P4 + 0x1c];
ffa0426a:	0a e1 34 0f 	P2.L = 0xf34;		/* (3892)	P2=0xff900f34 <_NetDestIP> */
ffa0426e:	12 93       	[P2] = R2;
ffa04270:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f34 <_NetDestIP> */
ffa04274:	61 e5 12 00 	R1 = W[P4 + 0x24] (X);
ffa04278:	0a e1 60 10 	P2.L = 0x1060;		/* (4192)	P2=0xff901060 <_TcpClientPort> */
ffa0427c:	11 97       	W[P2] = R1;
ffa0427e:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa04280:	f1 b0       	[SP + 0xc] = R1;
ffa04282:	30 b1       	[SP + 0x10] = R0;
ffa04284:	4f 30       	R1 = FP;
ffa04286:	77 b1       	[SP + 0x14] = R7;
ffa04288:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0428a:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa0428c:	ff e3 80 fe 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa04290:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa04294:	00 0d       	CC = R0 <= 0x0;
ffa04296:	96 1f       	IF CC JUMP 0xffa041c2 <_tcp_rx+0xae> (BP);
ffa04298:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901060 <_TcpClientPort> */
ffa0429c:	0a e1 54 10 	P2.L = 0x1054;		/* (4180)	P2=0xff901054 <_TcpState> */
ffa042a0:	17 93       	[P2] = R7;
ffa042a2:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa042a4:	ff e3 30 fe 	CALL 0xffa03f04 <_tcp_checksum_set>;
ffa042a8:	ff e3 ac f0 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa042ac:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa042ae:	40 2f       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa042b0:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff901054 <_TcpState> */
ffa042b4:	0d e1 54 10 	P5.L = 0x1054;		/* (4180)	P5=0xff901054 <_TcpState> */
ffa042b8:	28 91       	R0 = [P5];
ffa042ba:	08 0c       	CC = R0 == 0x1;
ffa042bc:	ba 17       	IF !CC JUMP 0xffa04230 <_tcp_rx+0x11c> (BP);
ffa042be:	e0 a2       	R0 = [P4 + 0x2c];
ffa042c0:	ff e3 8e ef 	CALL 0xffa021dc <_htonl>;
ffa042c4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901054 <_TcpState> */
ffa042c8:	0a e1 48 10 	P2.L = 0x1048;		/* (4168)	P2=0xff901048 <_TcpSeqHost> */
ffa042cc:	11 91       	R1 = [P2];
ffa042ce:	08 08       	CC = R0 == R1;
ffa042d0:	33 19       	IF CC JUMP 0xffa04536 <_tcp_rx+0x422>;
ffa042d2:	00 00       	NOP;
ffa042d4:	00 00       	NOP;
ffa042d6:	00 00       	NOP;
ffa042d8:	e0 a2       	R0 = [P4 + 0x2c];
ffa042da:	ff e3 81 ef 	CALL 0xffa021dc <_htonl>;
ffa042de:	08 30       	R1 = R0;
ffa042e0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa042e4:	00 e1 20 06 	R0.L = 0x620;		/* (1568)	R0=0xff900620(-7338464) */
ffa042e8:	ff e3 3a ec 	CALL 0xffa01b5c <_printf_ip>;
ffa042ec:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa042ee:	28 93       	[P5] = R0;
ffa042f0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa042f4:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa042f8:	ff e3 2c ec 	CALL 0xffa01b50 <_printf_str>;
ffa042fc:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa042fe:	18 2f       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa04300:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04304:	00 e1 4c 06 	R0.L = 0x64c;		/* (1612)	R0=0xff90064c(-7338420) */
ffa04308:	ff e3 24 ec 	CALL 0xffa01b50 <_printf_str>;
ffa0430c:	a0 a2       	R0 = [P4 + 0x28];
ffa0430e:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff900f34 <_NetDestIP>(-7336140) */
ffa04312:	ff e3 65 ef 	CALL 0xffa021dc <_htonl>;
ffa04316:	05 e1 34 0f 	R5.L = 0xf34;		/* (3892)	R5=0xff900f34 <_NetDestIP>(-7336140) */
ffa0431a:	15 32       	P2 = R5;
ffa0431c:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff901054 <_TcpState> */
ffa04320:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || R2 = [P4 + 0x1c] || NOP;
ffa04324:	e2 a1 00 00 
ffa04328:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff90104c <_TcpSeqClient> */
ffa0432c:	0d e1 54 10 	P5.L = 0x1054;		/* (4180)	P5=0xff901054 <_TcpState> */
ffa04330:	09 64       	R1 += 0x1;		/* (  1) */
ffa04332:	0b e1 4c 10 	P3.L = 0x104c;		/* (4172)	P3=0xff90104c <_TcpSeqClient> */
ffa04336:	28 91       	R0 = [P5];
ffa04338:	12 93       	[P2] = R2;
ffa0433a:	19 93       	[P3] = R1;
ffa0433c:	10 0c       	CC = R0 == 0x2;
ffa0433e:	03 18       	IF CC JUMP 0xffa04344 <_tcp_rx+0x230>;
ffa04340:	00 0c       	CC = R0 == 0x0;
ffa04342:	13 14       	IF !CC JUMP 0xffa04368 <_tcp_rx+0x254> (BP);
ffa04344:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa04346:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901048 <_TcpSeqHost> */
ffa0434a:	f0 b0       	[SP + 0xc] = R0;
ffa0434c:	0a e1 48 10 	P2.L = 0x1048;		/* (4168)	P2=0xff901048 <_TcpSeqHost> */
ffa04350:	10 91       	R0 = [P2];
ffa04352:	71 b1       	[SP + 0x14] = R1;
ffa04354:	30 b1       	[SP + 0x10] = R0;
ffa04356:	4f 30       	R1 = FP;
ffa04358:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0435a:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa0435c:	ff e3 18 fe 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa04360:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa04364:	00 0d       	CC = R0 <= 0x0;
ffa04366:	9d 10       	IF !CC JUMP 0xffa044a0 <_tcp_rx+0x38c>;
ffa04368:	28 91       	R0 = [P5];
ffa0436a:	18 0c       	CC = R0 == 0x3;
ffa0436c:	a3 18       	IF CC JUMP 0xffa044b2 <_tcp_rx+0x39e>;
ffa0436e:	00 00       	NOP;
ffa04370:	00 00       	NOP;
ffa04372:	00 00       	NOP;
ffa04374:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa04378:	23 2f       	JUMP.S 0xffa041be <_tcp_rx+0xaa>;
ffa0437a:	28 91       	R0 = [P5];
ffa0437c:	08 64       	R0 += 0x1;		/* (  1) */
ffa0437e:	28 93       	[P5] = R0;
ffa04380:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04382:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901048 <_TcpSeqHost> */
ffa04386:	0a e1 54 10 	P2.L = 0x1054;		/* (4180)	P2=0xff901054 <_TcpState> */
ffa0438a:	10 93       	[P2] = R0;
ffa0438c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0438e:	ff e3 bb fd 	CALL 0xffa03f04 <_tcp_checksum_set>;
ffa04392:	ff e3 37 f0 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa04396:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04398:	cb 2e       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa0439a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa0439e:	00 e1 14 06 	R0.L = 0x614;		/* (1556)	R0=0xff900614(-7338476) */
ffa043a2:	ff e3 d7 eb 	CALL 0xffa01b50 <_printf_str>;
ffa043a6:	a0 a2       	R0 = [P4 + 0x28];
ffa043a8:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff901054 <_TcpState> */
ffa043ac:	ff e3 18 ef 	CALL 0xffa021dc <_htonl>;
ffa043b0:	0d e1 4c 10 	P5.L = 0x104c;		/* (4172)	P5=0xff90104c <_TcpSeqClient> */
ffa043b4:	28 93       	[P5] = R0;
ffa043b6:	44 30       	R0 = P4;
ffa043b8:	ff e3 48 fd 	CALL 0xffa03e48 <_tcp_length>;
ffa043bc:	29 91       	R1 = [P5];
ffa043be:	09 64       	R1 += 0x1;		/* (  1) */
ffa043c0:	41 50       	R1 = R1 + R0;
ffa043c2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901054 <_TcpState> */
ffa043c6:	60 e5 12 00 	R0 = W[P4 + 0x24] (X);
ffa043ca:	0a e1 60 10 	P2.L = 0x1060;		/* (4192)	P2=0xff901060 <_TcpClientPort> */
ffa043ce:	10 97       	W[P2] = R0;
ffa043d0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901060 <_TcpClientPort> */
ffa043d4:	00 cc 00 c0 	R0 = R0 -|- R0 || [P5] = R1 || NOP;
ffa043d8:	29 93 00 00 
ffa043dc:	0a e1 6c 10 	P2.L = 0x106c;		/* (4204)	P2=0xff90106c <_g_httpRxed> */
ffa043e0:	10 93       	[P2] = R0;
ffa043e2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90106c <_g_httpRxed> */
ffa043e6:	e2 a1       	R2 = [P4 + 0x1c];
ffa043e8:	0a e1 34 0f 	P2.L = 0xf34;		/* (3892)	P2=0xff900f34 <_NetDestIP> */
ffa043ec:	12 93       	[P2] = R2;
ffa043ee:	90 60       	R0 = 0x12 (X);		/*		R0=0x12( 18) */
ffa043f0:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff90104c <_TcpSeqClient> */
ffa043f4:	f0 b0       	[SP + 0xc] = R0;
ffa043f6:	0d e1 48 10 	P5.L = 0x1048;		/* (4168)	P5=0xff901048 <_TcpSeqHost> */
ffa043fa:	28 91       	R0 = [P5];
ffa043fc:	71 b1       	[SP + 0x14] = R1;
ffa043fe:	30 b1       	[SP + 0x10] = R0;
ffa04400:	4f 30       	R1 = FP;
ffa04402:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04404:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa04406:	ff e3 c3 fd 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa0440a:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa0440e:	00 0d       	CC = R0 <= 0x0;
ffa04410:	b5 13       	IF !CC JUMP 0xffa0437a <_tcp_rx+0x266>;
ffa04412:	00 00       	NOP;
ffa04414:	00 00       	NOP;
ffa04416:	00 00       	NOP;
ffa04418:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa0441c:	c8 2e       	JUMP.S 0xffa041ac <_tcp_rx+0x98>;
ffa0441e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04422:	00 e1 08 06 	R0.L = 0x608;		/* (1544)	R0=0xff900608(-7338488) */
ffa04426:	ff e3 95 eb 	CALL 0xffa01b50 <_printf_str>;
ffa0442a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f34 <_NetDestIP> */
ffa0442e:	0a e1 54 10 	P2.L = 0x1054;		/* (4180)	P2=0xff901054 <_TcpState> */
ffa04432:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa04434:	17 93       	[P2] = R7;
ffa04436:	a0 a2       	R0 = [P4 + 0x28];
ffa04438:	ff e3 d2 ee 	CALL 0xffa021dc <_htonl>;
ffa0443c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901054 <_TcpState> */
ffa04440:	0a e1 4c 10 	P2.L = 0x104c;		/* (4172)	P2=0xff90104c <_TcpSeqClient> */
ffa04444:	10 93       	[P2] = R0;
ffa04446:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90104c <_TcpSeqClient> */
ffa0444a:	0a e1 6c 10 	P2.L = 0x106c;		/* (4204)	P2=0xff90106c <_g_httpRxed> */
ffa0444e:	17 93       	[P2] = R7;
ffa04450:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04452:	6e 2e       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa04454:	20 e1 f0 00 	R0 = 0xf0 (X);		/*		R0=0xf0(240) */
ffa04458:	24 6d       	P4 += 0x24;		/* ( 36) */
ffa0445a:	20 54       	R0 = R0 & R4;
ffa0445c:	10 4d       	R0 >>>= 0x2;
ffa0445e:	54 30       	R2 = P4;
ffa04460:	02 50       	R0 = R2 + R0;
ffa04462:	19 48       	CC = !BITTST (R1, 0x3);		/* bit  3 */
ffa04464:	4e 1c       	IF CC JUMP 0xffa04500 <_tcp_rx+0x3ec> (BP);
ffa04466:	0e 30       	R1 = R6;
ffa04468:	00 e3 3e 05 	CALL 0xffa04ee4 <_httpCollate>;
ffa0446c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90106c <_g_httpRxed> */
ffa04470:	0a e1 50 10 	P2.L = 0x1050;		/* (4176)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa04474:	10 91       	R0 = [P2];
ffa04476:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff901048 <_TcpSeqHost> */
ffa0447a:	07 50       	R0 = R7 + R0;
ffa0447c:	0d e1 48 10 	P5.L = 0x1048;		/* (4168)	P5=0xff901048 <_TcpSeqHost> */
ffa04480:	28 93       	[P5] = R0;
ffa04482:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa04486:	0c e1 6c 10 	P4.L = 0x106c;		/* (4204)	P4=0xff90106c <_g_httpRxed> */
ffa0448a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0448c:	80 4f       	R0 <<= 0x10;
ffa0448e:	21 91       	R1 = [P4];
ffa04490:	00 e3 12 03 	CALL 0xffa04ab4 <_httpResp>;
ffa04494:	00 0c       	CC = R0 == 0x0;
ffa04496:	62 10       	IF !CC JUMP 0xffa0455a <_tcp_rx+0x446>;
ffa04498:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0449a:	20 93       	[P4] = R0;
ffa0449c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0449e:	48 2e       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa044a0:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa044a2:	28 93       	[P5] = R0;
ffa044a4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa044a6:	ff e3 2f fd 	CALL 0xffa03f04 <_tcp_checksum_set>;
ffa044aa:	ff e3 ab ef 	CALL 0xffa02400 <_bfin_EMAC_send_nocopy>;
ffa044ae:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa044b0:	3f 2e       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa044b2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa044b6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa044b8:	0a e1 6c 10 	P2.L = 0x106c;		/* (4204)	P2=0xff90106c <_g_httpRxed> */
ffa044bc:	10 93       	[P2] = R0;
ffa044be:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa044c0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90106c <_g_httpRxed> */
ffa044c4:	f0 b0       	[SP + 0xc] = R0;
ffa044c6:	0a e1 48 10 	P2.L = 0x1048;		/* (4168)	P2=0xff901048 <_TcpSeqHost> */
ffa044ca:	10 91       	R0 = [P2];
ffa044cc:	15 32       	P2 = R5;
ffa044ce:	30 b1       	[SP + 0x10] = R0;
ffa044d0:	18 91       	R0 = [P3];
ffa044d2:	70 b1       	[SP + 0x14] = R0;
ffa044d4:	4f 30       	R1 = FP;
ffa044d6:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P2] || NOP;
ffa044da:	12 91 00 00 
ffa044de:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa044e0:	ff e3 56 fd 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa044e4:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa044e8:	00 0d       	CC = R0 <= 0x0;
ffa044ea:	44 1f       	IF CC JUMP 0xffa04372 <_tcp_rx+0x25e> (BP);
ffa044ec:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa044ee:	4a 2f       	JUMP.S 0xffa04382 <_tcp_rx+0x26e>;
ffa044f0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900004(-7340028) */
ffa044f4:	00 e1 5c 06 	R0.L = 0x65c;		/* (1628)	R0=0xff90065c(-7338404) */
ffa044f8:	ff e3 2c eb 	CALL 0xffa01b50 <_printf_str>;
ffa044fc:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa044fe:	18 2e       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa04500:	0e 30       	R1 = R6;
ffa04502:	00 e3 f1 04 	CALL 0xffa04ee4 <_httpCollate>;
ffa04506:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa04508:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901048 <_TcpSeqHost> */
ffa0450c:	f0 b0       	[SP + 0xc] = R0;
ffa0450e:	0a e1 48 10 	P2.L = 0x1048;		/* (4168)	P2=0xff901048 <_TcpSeqHost> */
ffa04512:	10 91       	R0 = [P2];
ffa04514:	15 32       	P2 = R5;
ffa04516:	30 b1       	[SP + 0x10] = R0;
ffa04518:	18 91       	R0 = [P3];
ffa0451a:	70 b1       	[SP + 0x14] = R0;
ffa0451c:	4f 30       	R1 = FP;
ffa0451e:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P2] || NOP;
ffa04522:	12 91 00 00 
ffa04526:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa04528:	ff e3 32 fd 	CALL 0xffa03f8c <_tcp_packet_setup>;
ffa0452c:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa04530:	00 0d       	CC = R0 <= 0x0;
ffa04532:	2d 17       	IF !CC JUMP 0xffa0438c <_tcp_rx+0x278> (BP);
ffa04534:	fc 2d       	JUMP.S 0xffa0412c <_tcp_rx+0x18>;
ffa04536:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa04538:	28 93       	[P5] = R0;
ffa0453a:	a0 a2       	R0 = [P4 + 0x28];
ffa0453c:	ff e3 50 ee 	CALL 0xffa021dc <_htonl>;
ffa04540:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901048 <_TcpSeqHost> */
ffa04544:	0a e1 4c 10 	P2.L = 0x104c;		/* (4172)	P2=0xff90104c <_TcpSeqClient> */
ffa04548:	10 93       	[P2] = R0;
ffa0454a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900002(-7340030) */
ffa0454e:	00 e1 3c 06 	R0.L = 0x63c;		/* (1596)	R0=0xff90063c(-7338436) */
ffa04552:	ff e3 ff ea 	CALL 0xffa01b50 <_printf_str>;
ffa04556:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04558:	eb 2d       	JUMP.S 0xffa0412e <_tcp_rx+0x1a>;
ffa0455a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90104c <_TcpSeqClient> */
ffa0455e:	28 91       	R0 = [P5];
ffa04560:	0a e1 50 10 	P2.L = 0x1050;		/* (4176)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa04564:	10 93       	[P2] = R0;
ffa04566:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901050 <_TcpSeqHttpStart> */
ffa0456a:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa0456e:	11 91       	R1 = [P2];
ffa04570:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901068 <_g_httpContentLen> */
ffa04574:	0a e1 64 10 	P2.L = 0x1064;		/* (4196)	P2=0xff901064 <_g_httpHeaderLen> */
ffa04578:	10 91       	R0 = [P2];
ffa0457a:	41 50       	R1 = R1 + R0;
ffa0457c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04580:	00 e1 8c 06 	R0.L = 0x68c;		/* (1676)	R0=0xff90068c(-7338356) */
ffa04584:	ff e3 3e ea 	CALL 0xffa01a00 <_printf_int>;
ffa04588:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90068c(-7338356) */
ffa0458c:	00 e1 20 08 	R0.L = 0x820;		/* (2080)	R0=0xff900820(-7337952) */
ffa04590:	ff e3 e0 ea 	CALL 0xffa01b50 <_printf_str>;
ffa04594:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa04596:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04598:	ff e3 24 fd 	CALL 0xffa03fe0 <_tcp_burst>;
ffa0459c:	7e 2f       	JUMP.S 0xffa04498 <_tcp_rx+0x384>;
	...

ffa045a0 <_htmlForm>:
ffa045a0:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa045a4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900004(-7340028) */
ffa045a8:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa045ac:	01 e8 00 00 	UNLINK;
ffa045b0:	ff e2 4e eb 	JUMP.L 0xffa01c4c <_strcpy_>;

ffa045b4 <_htmlDiv>:
ffa045b4:	12 43       	R2 = R2.B (X);
ffa045b6:	23 e1 62 00 	R3 = 0x62 (X);		/*		R3=0x62( 98) */
ffa045ba:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa045be:	1a 08       	CC = R2 == R3;
ffa045c0:	09 18       	IF CC JUMP 0xffa045d2 <_htmlDiv+0x1e>;
ffa045c2:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa045c6:	02 e1 fc 06 	R2.L = 0x6fc;		/* (1788)	R2=0xff9006fc(-7338244) */
ffa045ca:	01 e8 00 00 	UNLINK;
ffa045ce:	ff e2 3f eb 	JUMP.L 0xffa01c4c <_strcpy_>;
ffa045d2:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006fc(-7338244) */
ffa045d6:	02 e1 c8 06 	R2.L = 0x6c8;		/* (1736)	R2=0xff9006c8(-7338296) */
ffa045da:	01 e8 00 00 	UNLINK;
ffa045de:	ff e2 37 eb 	JUMP.L 0xffa01c4c <_strcpy_>;
	...

ffa045e4 <_html404>:
ffa045e4:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa045e8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa045ea:	f0 bb       	[FP -0x4] = R0;
ffa045ec:	4f 30       	R1 = FP;
ffa045ee:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006c8(-7338296) */
ffa045f2:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa045f6:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa045f8:	02 e1 30 07 	R2.L = 0x730;		/* (1840)	R2=0xff900730(-7338192) */
ffa045fc:	ff e3 28 eb 	CALL 0xffa01c4c <_strcpy_>;
ffa04600:	f0 b9       	R0 = [FP -0x4];
ffa04602:	01 e8 00 00 	UNLINK;
ffa04606:	10 00       	RTS;

ffa04608 <_htmlCursorOption>:
ffa04608:	68 05       	[--SP] = (R7:5);
ffa0460a:	2a 30       	R5 = R2;
ffa0460c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa04610:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900730(-7338192) */
ffa04614:	82 ce 01 cc 	R6 = ROT R1 BY 0x0 || R7 = [FP + 0x20] || NOP;
ffa04618:	3f a2 00 00 
ffa0461c:	02 e1 4c 07 	R2.L = 0x74c;		/* (1868)	R2=0xff90074c(-7338164) */
ffa04620:	ff e3 16 eb 	CALL 0xffa01c4c <_strcpy_>;
ffa04624:	0e 30       	R1 = R6;
ffa04626:	15 30       	R2 = R5;
ffa04628:	ff e3 64 ec 	CALL 0xffa01ef0 <_strprintf_int>;
ffa0462c:	3d 08       	CC = R5 == R7;
ffa0462e:	16 18       	IF CC JUMP 0xffa0465a <_htmlCursorOption+0x52>;
ffa04630:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90074c(-7338164) */
ffa04634:	0e 30       	R1 = R6;
ffa04636:	02 e1 74 07 	R2.L = 0x774;		/* (1908)	R2=0xff900774(-7338124) */
ffa0463a:	ff e3 09 eb 	CALL 0xffa01c4c <_strcpy_>;
ffa0463e:	0e 30       	R1 = R6;
ffa04640:	15 30       	R2 = R5;
ffa04642:	ff e3 57 ec 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04646:	0e 30       	R1 = R6;
ffa04648:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900774(-7338124) */
ffa0464c:	01 e8 00 00 	UNLINK;
ffa04650:	02 e1 78 07 	R2.L = 0x778;		/* (1912)	R2=0xff900778(-7338120) */
ffa04654:	28 05       	(R7:5) = [SP++];
ffa04656:	ff e2 fb ea 	JUMP.L 0xffa01c4c <_strcpy_>;
ffa0465a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900778(-7338120) */
ffa0465e:	0e 30       	R1 = R6;
ffa04660:	02 e1 5c 07 	R2.L = 0x75c;		/* (1884)	R2=0xff90075c(-7338148) */
ffa04664:	ff e3 f4 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04668:	e4 2f       	JUMP.S 0xffa04630 <_htmlCursorOption+0x28>;
	...

ffa0466c <_htmlCursorSelect>:
ffa0466c:	60 05       	[--SP] = (R7:4);
ffa0466e:	3a 30       	R7 = R2;
ffa04670:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa04674:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90075c(-7338148) */
ffa04678:	82 ce 01 ca 	R5 = ROT R1 BY 0x0 || R6 = [FP + 0x24] || NOP;
ffa0467c:	7e a2 00 00 
ffa04680:	02 e1 84 07 	R2.L = 0x784;		/* (1924)	R2=0xff900784(-7338108) */
ffa04684:	bc a2       	R4 = [FP + 0x28];
ffa04686:	ff e3 e3 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa0468a:	17 30       	R2 = R7;
ffa0468c:	0d 30       	R1 = R5;
ffa0468e:	ff e3 df ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04692:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900784(-7338108) */
ffa04696:	0d 30       	R1 = R5;
ffa04698:	02 e1 90 07 	R2.L = 0x790;		/* (1936)	R2=0xff900790(-7338096) */
ffa0469c:	ff e3 d8 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa046a0:	0d 30       	R1 = R5;
ffa046a2:	16 30       	R2 = R6;
ffa046a4:	ff e3 d4 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa046a8:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900790(-7338096) */
ffa046ac:	0d 30       	R1 = R5;
ffa046ae:	02 e1 ac 07 	R2.L = 0x7ac;		/* (1964)	R2=0xff9007ac(-7338068) */
ffa046b2:	ff e3 cd ea 	CALL 0xffa01c4c <_strcpy_>;
ffa046b6:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa046b8:	82 ce 05 c2 	R1 = ROT R5 BY 0x0 || [SP + 0xc] = R4 || NOP;
ffa046bc:	f4 b0 00 00 
ffa046c0:	17 30       	R2 = R7;
ffa046c2:	ff e3 a3 ff 	CALL 0xffa04608 <_htmlCursorOption>;
ffa046c6:	0f 64       	R7 += 0x1;		/* (  1) */
ffa046c8:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa046ca:	0f 08       	CC = R7 == R1;
ffa046cc:	f6 17       	IF !CC JUMP 0xffa046b8 <_htmlCursorSelect+0x4c> (BP);
ffa046ce:	0d 30       	R1 = R5;
ffa046d0:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007ac(-7338068) */
ffa046d4:	01 e8 00 00 	UNLINK;
ffa046d8:	02 e1 b0 07 	R2.L = 0x7b0;		/* (1968)	R2=0xff9007b0(-7338064) */
ffa046dc:	20 05       	(R7:4) = [SP++];
ffa046de:	ff e2 b7 ea 	JUMP.L 0xffa01c4c <_strcpy_>;
	...

ffa046e4 <_httpHeader>:
ffa046e4:	78 05       	[--SP] = (R7:7);
ffa046e6:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa046ea:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa046ec:	7f 30       	R7 = FP;
ffa046ee:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa046f0:	f0 bb       	[FP -0x4] = R0;
ffa046f2:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007b0(-7338064) */
ffa046f6:	0f 30       	R1 = R7;
ffa046f8:	02 e1 c8 07 	R2.L = 0x7c8;		/* (1992)	R2=0xff9007c8(-7338040) */
ffa046fc:	20 e1 00 40 	R0 = 0x4000 (X);		/*		R0=0x4000(16384) */
ffa04700:	ff e3 a6 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04704:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007c8(-7338040) */
ffa04708:	0f 30       	R1 = R7;
ffa0470a:	02 e1 dc 07 	R2.L = 0x7dc;		/* (2012)	R2=0xff9007dc(-7338020) */
ffa0470e:	ff e3 9f ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04712:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007dc(-7338020) */
ffa04716:	0f 30       	R1 = R7;
ffa04718:	02 e1 f0 07 	R2.L = 0x7f0;		/* (2032)	R2=0xff9007f0(-7338000) */
ffa0471c:	ff e3 98 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04720:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901064 <_g_httpHeaderLen> */
ffa04724:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa04728:	12 91       	R2 = [P2];
ffa0472a:	0f 30       	R1 = R7;
ffa0472c:	ff e3 e2 eb 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04730:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007f0(-7338000) */
ffa04734:	0f 30       	R1 = R7;
ffa04736:	02 e1 04 08 	R2.L = 0x804;		/* (2052)	R2=0xff900804(-7337980) */
ffa0473a:	ff e3 89 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa0473e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901068 <_g_httpContentLen> */
ffa04742:	f0 b9       	R0 = [FP -0x4];
ffa04744:	0a e1 64 10 	P2.L = 0x1064;		/* (4196)	P2=0xff901064 <_g_httpHeaderLen> */
ffa04748:	10 93       	[P2] = R0;
ffa0474a:	01 e8 00 00 	UNLINK;
ffa0474e:	38 05       	(R7:7) = [SP++];
ffa04750:	10 00       	RTS;
	...

ffa04754 <_htmlGeneric>:
ffa04754:	10 30       	R2 = R0;
ffa04756:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0475a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0475c:	f0 bb       	[FP -0x4] = R0;
ffa0475e:	4f 30       	R1 = FP;
ffa04760:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa04762:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa04766:	ff e3 73 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa0476a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901064 <_g_httpHeaderLen> */
ffa0476e:	f0 b9       	R0 = [FP -0x4];
ffa04770:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa04774:	10 93       	[P2] = R0;
ffa04776:	ff e3 b7 ff 	CALL 0xffa046e4 <_httpHeader>;
ffa0477a:	f0 b9       	R0 = [FP -0x4];
ffa0477c:	01 e8 00 00 	UNLINK;
ffa04780:	10 00       	RTS;
	...

ffa04784 <_htmlDefault>:
ffa04784:	e4 05       	[--SP] = (R7:4, P5:4);
ffa04786:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa0478a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0478c:	6f 32       	P5 = FP;
ffa0478e:	e5 6f       	P5 += -0x4;		/* ( -4) */
ffa04790:	f0 bb       	[FP -0x4] = R0;
ffa04792:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900804(-7337980) */
ffa04796:	4d 30       	R1 = P5;
ffa04798:	02 e1 24 08 	R2.L = 0x824;		/* (2084)	R2=0xff900824(-7337948) */
ffa0479c:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa047a0:	ff e3 56 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa047a4:	4d 30       	R1 = P5;
ffa047a6:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa047aa:	ff e3 05 ff 	CALL 0xffa045b4 <_htmlDiv>;
ffa047ae:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa047b2:	4d 30       	R1 = P5;
ffa047b4:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa047b8:	ff e3 4a ea 	CALL 0xffa01c4c <_strcpy_>;
ffa047bc:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa047c0:	4d 30       	R1 = P5;
ffa047c2:	02 e1 74 08 	R2.L = 0x874;		/* (2164)	R2=0xff900874(-7337868) */
ffa047c6:	ff e3 43 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa047ca:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901068 <_g_httpContentLen> */
ffa047ce:	08 30       	R1 = R0;
ffa047d0:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa047d4:	10 99       	R0 = B[P2] (Z);
ffa047d6:	00 0c       	CC = R0 == 0x0;
ffa047d8:	5c 1d       	IF CC JUMP 0xffa04a90 <_htmlDefault+0x30c> (BP);
ffa047da:	01 30       	R0 = R1;
ffa047dc:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900874(-7337868) */
ffa047e0:	4d 30       	R1 = P5;
ffa047e2:	02 e1 c4 08 	R2.L = 0x8c4;		/* (2244)	R2=0xff9008c4(-7337788) */
ffa047e6:	ff e3 33 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa047ea:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008c4(-7337788) */
ffa047ee:	4d 30       	R1 = P5;
ffa047f0:	02 e1 dc 08 	R2.L = 0x8dc;		/* (2268)	R2=0xff9008dc(-7337764) */
ffa047f4:	ff e3 2c ea 	CALL 0xffa01c4c <_strcpy_>;
ffa047f8:	4d 30       	R1 = P5;
ffa047fa:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa047fe:	ff e3 db fe 	CALL 0xffa045b4 <_htmlDiv>;
ffa04802:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa04806:	4d 30       	R1 = P5;
ffa04808:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa0480c:	ff e3 20 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04810:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa04814:	4d 30       	R1 = P5;
ffa04816:	02 e1 f0 08 	R2.L = 0x8f0;		/* (2288)	R2=0xff9008f0(-7337744) */
ffa0481a:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff90106c <_g_httpRxed> */
ffa0481e:	ff e3 17 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04822:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa04824:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa04826:	0c e1 74 0f 	P4.L = 0xf74;		/* (3956)	P4=0xff900f74 <_NetDataDestIP> */
ffa0482a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008f0(-7337744) */
ffa0482e:	4d 30       	R1 = P5;
ffa04830:	02 e1 0c 09 	R2.L = 0x90c;		/* (2316)	R2=0xff90090c(-7337716) */
ffa04834:	ff e3 0c ea 	CALL 0xffa01c4c <_strcpy_>;
ffa04838:	17 30       	R2 = R7;
ffa0483a:	4d 30       	R1 = P5;
ffa0483c:	ff e3 5a eb 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04840:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90090c(-7337716) */
ffa04844:	4d 30       	R1 = P5;
ffa04846:	02 e1 28 09 	R2.L = 0x928;		/* (2344)	R2=0xff900928(-7337688) */
ffa0484a:	ff e3 01 ea 	CALL 0xffa01c4c <_strcpy_>;
ffa0484e:	22 91       	R2 = [P4];
ffa04850:	72 40       	R2 >>= R6;
ffa04852:	52 43       	R2 = R2.B (Z);
ffa04854:	4d 30       	R1 = P5;
ffa04856:	ff e3 4d eb 	CALL 0xffa01ef0 <_strprintf_int>;
ffa0485a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900928(-7337688) */
ffa0485e:	4d 30       	R1 = P5;
ffa04860:	02 e1 3c 09 	R2.L = 0x93c;		/* (2364)	R2=0xff90093c(-7337668) */
ffa04864:	ff e3 f4 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04868:	0f 64       	R7 += 0x1;		/* (  1) */
ffa0486a:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa0486c:	46 64       	R6 += 0x8;		/* (  8) */
ffa0486e:	0f 08       	CC = R7 == R1;
ffa04870:	dd 17       	IF !CC JUMP 0xffa0482a <_htmlDefault+0xa6> (BP);
ffa04872:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90093c(-7337668) */
ffa04876:	4d 30       	R1 = P5;
ffa04878:	02 e1 44 09 	R2.L = 0x944;		/* (2372)	R2=0xff900944(-7337660) */
ffa0487c:	ff e3 e8 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04880:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900944(-7337660) */
ffa04884:	4d 30       	R1 = P5;
ffa04886:	02 e1 dc 08 	R2.L = 0x8dc;		/* (2268)	R2=0xff9008dc(-7337764) */
ffa0488a:	ff e3 e1 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa0488e:	4d 30       	R1 = P5;
ffa04890:	22 e1 67 00 	R2 = 0x67 (X);		/*		R2=0x67(103) */
ffa04894:	ff e3 90 fe 	CALL 0xffa045b4 <_htmlDiv>;
ffa04898:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900067(-7339929) */
ffa0489c:	4d 30       	R1 = P5;
ffa0489e:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa048a2:	ff e3 d5 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa048a6:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa048aa:	4d 30       	R1 = P5;
ffa048ac:	02 e1 68 09 	R2.L = 0x968;		/* (2408)	R2=0xff900968(-7337624) */
ffa048b0:	ff e3 ce e9 	CALL 0xffa01c4c <_strcpy_>;
ffa048b4:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800cc4 */
ffa048b8:	08 30       	R1 = R0;
ffa048ba:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa048be:	10 99       	R0 = B[P2] (Z);
ffa048c0:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa048c2:	f0 10       	IF !CC JUMP 0xffa04aa2 <_htmlDefault+0x31e>;
ffa048c4:	01 30       	R0 = R1;
ffa048c6:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900968(-7337624) */
ffa048ca:	4d 30       	R1 = P5;
ffa048cc:	02 e1 c4 08 	R2.L = 0x8c4;		/* (2244)	R2=0xff9008c4(-7337788) */
ffa048d0:	ff e3 be e9 	CALL 0xffa01c4c <_strcpy_>;
ffa048d4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008c4(-7337788) */
ffa048d8:	4d 30       	R1 = P5;
ffa048da:	02 e1 dc 08 	R2.L = 0x8dc;		/* (2268)	R2=0xff9008dc(-7337764) */
ffa048de:	ff e3 b7 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa048e2:	4d 30       	R1 = P5;
ffa048e4:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa048e8:	ff e3 66 fe 	CALL 0xffa045b4 <_htmlDiv>;
ffa048ec:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa048f0:	4d 30       	R1 = P5;
ffa048f2:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa048f6:	ff e3 ab e9 	CALL 0xffa01c4c <_strcpy_>;
ffa048fa:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa048fe:	4d 30       	R1 = P5;
ffa04900:	02 e1 a8 09 	R2.L = 0x9a8;		/* (2472)	R2=0xff9009a8(-7337560) */
ffa04904:	ff e3 a4 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04908:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff900005(-7340027) */
ffa0490c:	01 e1 d8 09 	R1.L = 0x9d8;		/* (2520)	R1=0xff9009d8(-7337512) */
ffa04910:	00 cc 3f ce 	R7 = R7 -|- R7 || [SP + 0xc] = R1 || NOP;
ffa04914:	f1 b0 00 00 
ffa04918:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9009a8(-7337560) */
ffa0491c:	37 b1       	[SP + 0x10] = R7;
ffa0491e:	4d 30       	R1 = P5;
ffa04920:	02 e1 cc 09 	R2.L = 0x9cc;		/* (2508)	R2=0xff9009cc(-7337524) */
ffa04924:	ff e3 a4 fe 	CALL 0xffa0466c <_htmlCursorSelect>;
ffa04928:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff9009d8(-7337512) */
ffa0492c:	01 e1 f0 09 	R1.L = 0x9f0;		/* (2544)	R1=0xff9009f0(-7337488) */
ffa04930:	f1 b0       	[SP + 0xc] = R1;
ffa04932:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9009cc(-7337524) */
ffa04936:	37 b1       	[SP + 0x10] = R7;
ffa04938:	4d 30       	R1 = P5;
ffa0493a:	02 e1 e4 09 	R2.L = 0x9e4;		/* (2532)	R2=0xff9009e4(-7337500) */
ffa0493e:	ff e3 97 fe 	CALL 0xffa0466c <_htmlCursorSelect>;
ffa04942:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff9009f0(-7337488) */
ffa04946:	01 e1 08 0a 	R1.L = 0xa08;		/* (2568)	R1=0xff900a08(-7337464) */
ffa0494a:	f1 b0       	[SP + 0xc] = R1;
ffa0494c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9009e4(-7337500) */
ffa04950:	37 b1       	[SP + 0x10] = R7;
ffa04952:	4d 30       	R1 = P5;
ffa04954:	02 e1 fc 09 	R2.L = 0x9fc;		/* (2556)	R2=0xff9009fc(-7337476) */
ffa04958:	ff e3 8a fe 	CALL 0xffa0466c <_htmlCursorSelect>;
ffa0495c:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff900a08(-7337464) */
ffa04960:	01 e1 1c 0a 	R1.L = 0xa1c;		/* (2588)	R1=0xff900a1c(-7337444) */
ffa04964:	f1 b0       	[SP + 0xc] = R1;
ffa04966:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9009fc(-7337476) */
ffa0496a:	37 b1       	[SP + 0x10] = R7;
ffa0496c:	4d 30       	R1 = P5;
ffa0496e:	02 e1 14 0a 	R2.L = 0xa14;		/* (2580)	R2=0xff900a14(-7337452) */
ffa04972:	ff e3 7d fe 	CALL 0xffa0466c <_htmlCursorSelect>;
ffa04976:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900a14(-7337452) */
ffa0497a:	4d 30       	R1 = P5;
ffa0497c:	02 e1 28 0a 	R2.L = 0xa28;		/* (2600)	R2=0xff900a28(-7337432) */
ffa04980:	ff e3 66 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04984:	4d 30       	R1 = P5;
ffa04986:	22 e1 67 00 	R2 = 0x67 (X);		/*		R2=0x67(103) */
ffa0498a:	ff e3 15 fe 	CALL 0xffa045b4 <_htmlDiv>;
ffa0498e:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900067(-7339929) */
ffa04992:	4d 30       	R1 = P5;
ffa04994:	02 e1 a8 06 	R2.L = 0x6a8;		/* (1704)	R2=0xff9006a8(-7338328) */
ffa04998:	ff e3 5a e9 	CALL 0xffa01c4c <_strcpy_>;
ffa0499c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006a8(-7338328) */
ffa049a0:	4d 30       	R1 = P5;
ffa049a2:	02 e1 64 0a 	R2.L = 0xa64;		/* (2660)	R2=0xff900a64(-7337372) */
ffa049a6:	ff e3 53 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa049aa:	4d 30       	R1 = P5;
ffa049ac:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa049b0:	ff e3 02 fe 	CALL 0xffa045b4 <_htmlDiv>;
ffa049b4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa049b8:	4d 30       	R1 = P5;
ffa049ba:	02 e1 bc 0a 	R2.L = 0xabc;		/* (2748)	R2=0xff900abc(-7337284) */
ffa049be:	ff e3 47 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa049c2:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900abc(-7337284) */
ffa049c6:	4d 30       	R1 = P5;
ffa049c8:	02 e1 e4 0a 	R2.L = 0xae4;		/* (2788)	R2=0xff900ae4(-7337244) */
ffa049cc:	ff e3 40 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa049d0:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900ae4(-7337244) */
ffa049d4:	4d 30       	R1 = P5;
ffa049d6:	02 e1 dc 08 	R2.L = 0x8dc;		/* (2268)	R2=0xff9008dc(-7337764) */
ffa049da:	ff e3 39 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa049de:	38 30       	R7 = R0;
ffa049e0:	ff e3 e4 db 	CALL 0xffa001a8 <_ustimer>;
ffa049e4:	41 e1 e3 38 	R1.H = 0x38e3;		/* (14563)	R1=0x38e30a1c(954403356) */
ffa049e8:	01 e1 39 8e 	R1.L = 0x8e39;		/* (-29127)	R1=0x38e38e39(954437177) */
ffa049ec:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa049f0:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa049f4:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa049f8:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa049fc:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa04a00:	0b c4 3f 80 	A0 += A1;
ffa04a04:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008dc(-7337764) */
ffa04a08:	8b c0 00 39 	R4 = A0 (FU);
ffa04a0c:	02 e1 2c 0b 	R2.L = 0xb2c;		/* (2860)	R2=0xff900b2c(-7337172) */
ffa04a10:	4d 30       	R1 = P5;
ffa04a12:	07 30       	R0 = R7;
ffa04a14:	ff e3 1c e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04a18:	0c 4e       	R4 >>= 0x1;
ffa04a1a:	28 30       	R5 = R0;
ffa04a1c:	04 30       	R0 = R4;
ffa04a1e:	21 e1 e8 03 	R1 = 0x3e8 (X);		/*		R1=0x3e8(1000) */
ffa04a22:	ff e3 d1 e5 	CALL 0xffa015c4 <___divsi3>;
ffa04a26:	30 30       	R6 = R0;
ffa04a28:	e1 61       	R1 = 0x3c (X);		/*		R1=0x3c( 60) */
ffa04a2a:	ff e3 cd e5 	CALL 0xffa015c4 <___divsi3>;
ffa04a2e:	38 30       	R7 = R0;
ffa04a30:	4d 30       	R1 = P5;
ffa04a32:	17 30       	R2 = R7;
ffa04a34:	05 30       	R0 = R5;
ffa04a36:	ff e3 5d ea 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04a3a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900b2c(-7337172) */
ffa04a3e:	4d 30       	R1 = P5;
ffa04a40:	02 e1 bc 00 	R2.L = 0xbc;		/* (188)	R2=0xff9000bc(-7339844) */
ffa04a44:	ff e3 04 e9 	CALL 0xffa01c4c <_strcpy_>;
ffa04a48:	82 c6 27 82 	R1 = R7 << 0x4;
ffa04a4c:	cf 53       	R7 = R7 - R1;
ffa04a4e:	07 32       	P0 = R7;
ffa04a50:	0e 32       	P1 = R6;
ffa04a52:	4d 30       	R1 = P5;
ffa04a54:	81 5e       	P2 = P1 + (P0 << 0x2);
ffa04a56:	52 30       	R2 = P2;
ffa04a58:	ff e3 4c ea 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04a5c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9000bc(-7339844) */
ffa04a60:	4d 30       	R1 = P5;
ffa04a62:	02 e1 2c 01 	R2.L = 0x12c;		/* (300)	R2=0xff90012c(-7339732) */
ffa04a66:	ff e3 f3 e8 	CALL 0xffa01c4c <_strcpy_>;
ffa04a6a:	22 e1 18 fc 	R2 = -0x3e8 (X);		/*		R2=0xfffffc18(-1000) */
ffa04a6e:	f2 40       	R2 *= R6;
ffa04a70:	4d 30       	R1 = P5;
ffa04a72:	a2 50       	R2 = R2 + R4;
ffa04a74:	ff e3 3e ea 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04a78:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90fc18(-7275496) */
ffa04a7c:	4d 30       	R1 = P5;
ffa04a7e:	02 e1 38 0b 	R2.L = 0xb38;		/* (2872)	R2=0xff900b38(-7337160) */
ffa04a82:	ff e3 e5 e8 	CALL 0xffa01c4c <_strcpy_>;
ffa04a86:	f0 b9       	R0 = [FP -0x4];
ffa04a88:	01 e8 00 00 	UNLINK;
ffa04a8c:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04a8e:	10 00       	RTS;
ffa04a90:	01 30       	R0 = R1;
ffa04a92:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900b38(-7337160) */
ffa04a96:	4d 30       	R1 = P5;
ffa04a98:	02 e1 d0 08 	R2.L = 0x8d0;		/* (2256)	R2=0xff9008d0(-7337776) */
ffa04a9c:	ff e3 d8 e8 	CALL 0xffa01c4c <_strcpy_>;
ffa04aa0:	a5 2e       	JUMP.S 0xffa047ea <_htmlDefault+0x66>;
ffa04aa2:	01 30       	R0 = R1;
ffa04aa4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008d0(-7337776) */
ffa04aa8:	4d 30       	R1 = P5;
ffa04aaa:	02 e1 d0 08 	R2.L = 0x8d0;		/* (2256)	R2=0xff9008d0(-7337776) */
ffa04aae:	ff e3 cf e8 	CALL 0xffa01c4c <_strcpy_>;
ffa04ab2:	11 2f       	JUMP.S 0xffa048d4 <_htmlDefault+0x150>;

ffa04ab4 <_httpResp>:
ffa04ab4:	e4 05       	[--SP] = (R7:4, P5:4);
ffa04ab6:	30 30       	R6 = R0;
ffa04ab8:	70 60       	R0 = 0xe (X);		/*		R0=0xe( 14) */
ffa04aba:	00 e8 14 00 	LINK 0x50;		/* (80) */
ffa04abe:	39 30       	R7 = R1;
ffa04ac0:	01 09       	CC = R1 <= R0;
ffa04ac2:	1e 10       	IF !CC JUMP 0xffa04afe <_httpResp+0x4a>;
ffa04ac4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000e(-7340018) */
ffa04ac8:	00 e1 48 0b 	R0.L = 0xb48;		/* (2888)	R0=0xff900b48(-7337144) */
ffa04acc:	0e 30       	R1 = R6;
ffa04ace:	17 30       	R2 = R7;
ffa04ad0:	ff e3 36 e9 	CALL 0xffa01d3c <_substr>;
ffa04ad4:	00 0c       	CC = R0 == 0x0;
ffa04ad6:	06 10       	IF !CC JUMP 0xffa04ae2 <_httpResp+0x2e>;
ffa04ad8:	01 e8 00 00 	UNLINK;
ffa04adc:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04ade:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04ae0:	10 00       	RTS;
ffa04ae2:	ff e3 81 fd 	CALL 0xffa045e4 <_html404>;
ffa04ae6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900808 */
ffa04aea:	0a e1 68 10 	P2.L = 0x1068;		/* (4200)	P2=0xff901068 <_g_httpContentLen> */
ffa04aee:	10 93       	[P2] = R0;
ffa04af0:	ff e3 fa fd 	CALL 0xffa046e4 <_httpHeader>;
ffa04af4:	01 e8 00 00 	UNLINK;
ffa04af8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04afa:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04afc:	10 00       	RTS;
ffa04afe:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff90003c(-7339972) */
ffa04b02:	06 30       	R0 = R6;
ffa04b04:	01 e1 50 0b 	R1.L = 0xb50;		/* (2896)	R1=0xff900b50(-7337136) */
ffa04b08:	ff e3 ec e8 	CALL 0xffa01ce0 <_strcmp>;
ffa04b0c:	00 0c       	CC = R0 == 0x0;
ffa04b0e:	34 11       	IF !CC JUMP 0xffa04d76 <_httpResp+0x2c2>;
ffa04b10:	89 60       	R1 = 0x11 (X);		/*		R1=0x11( 17) */
ffa04b12:	0f 09       	CC = R7 <= R1;
ffa04b14:	d8 1b       	IF CC JUMP 0xffa04ac4 <_httpResp+0x10>;
ffa04b16:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04b1a:	00 e1 5c 0b 	R0.L = 0xb5c;		/* (2908)	R0=0xff900b5c(-7337124) */
ffa04b1e:	0e 30       	R1 = R6;
ffa04b20:	17 30       	R2 = R7;
ffa04b22:	ff e3 0d e9 	CALL 0xffa01d3c <_substr>;
ffa04b26:	00 0c       	CC = R0 == 0x0;
ffa04b28:	f3 10       	IF !CC JUMP 0xffa04d0e <_httpResp+0x25a>;
ffa04b2a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b5c(-7337124) */
ffa04b2e:	00 e1 9c 0b 	R0.L = 0xb9c;		/* (2972)	R0=0xff900b9c(-7337060) */
ffa04b32:	0e 30       	R1 = R6;
ffa04b34:	17 30       	R2 = R7;
ffa04b36:	ff e3 03 e9 	CALL 0xffa01d3c <_substr>;
ffa04b3a:	00 0c       	CC = R0 == 0x0;
ffa04b3c:	c4 1f       	IF CC JUMP 0xffa04ac4 <_httpResp+0x10> (BP);
ffa04b3e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b9c(-7337060) */
ffa04b42:	0e 30       	R1 = R6;
ffa04b44:	17 30       	R2 = R7;
ffa04b46:	00 e1 9c 0b 	R0.L = 0xb9c;		/* (2972)	R0=0xff900b9c(-7337060) */
ffa04b4a:	ff e3 f9 e8 	CALL 0xffa01d3c <_substr>;
ffa04b4e:	46 51       	R5 = R6 + R0;
ffa04b50:	07 53       	R4 = R7 - R0;
ffa04b52:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b9c(-7337060) */
ffa04b56:	00 e1 a4 0b 	R0.L = 0xba4;		/* (2980)	R0=0xff900ba4(-7337052) */
ffa04b5a:	0d 30       	R1 = R5;
ffa04b5c:	14 30       	R2 = R4;
ffa04b5e:	ff e3 ef e8 	CALL 0xffa01d3c <_substr>;
ffa04b62:	00 0c       	CC = R0 == 0x0;
ffa04b64:	51 11       	IF !CC JUMP 0xffa04e06 <_httpResp+0x352>;
ffa04b66:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa04b68:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900ba4(-7337052) */
ffa04b6c:	00 e1 c8 0b 	R0.L = 0xbc8;		/* (3016)	R0=0xff900bc8(-7337016) */
ffa04b70:	0d 30       	R1 = R5;
ffa04b72:	14 30       	R2 = R4;
ffa04b74:	ff e3 e4 e8 	CALL 0xffa01d3c <_substr>;
ffa04b78:	00 0c       	CC = R0 == 0x0;
ffa04b7a:	75 11       	IF !CC JUMP 0xffa04e64 <_httpResp+0x3b0>;
ffa04b7c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900bc8(-7337016) */
ffa04b80:	0d 30       	R1 = R5;
ffa04b82:	00 e1 d4 0b 	R0.L = 0xbd4;		/* (3028)	R0=0xff900bd4(-7337004) */
ffa04b86:	14 30       	R2 = R4;
ffa04b88:	ff e3 da e8 	CALL 0xffa01d3c <_substr>;
ffa04b8c:	00 0c       	CC = R0 == 0x0;
ffa04b8e:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa04b90:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900bd4(-7337004) */
ffa04b94:	37 06       	IF !CC R6 = R7;
ffa04b96:	0d 30       	R1 = R5;
ffa04b98:	14 30       	R2 = R4;
ffa04b9a:	00 e1 e0 0b 	R0.L = 0xbe0;		/* (3040)	R0=0xff900be0(-7336992) */
ffa04b9e:	ff e3 cf e8 	CALL 0xffa01d3c <_substr>;
ffa04ba2:	00 0c       	CC = R0 == 0x0;
ffa04ba4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900be0(-7336992) */
ffa04ba8:	37 06       	IF !CC R6 = R7;
ffa04baa:	0d 30       	R1 = R5;
ffa04bac:	14 30       	R2 = R4;
ffa04bae:	00 e1 ec 0b 	R0.L = 0xbec;		/* (3052)	R0=0xff900bec(-7336980) */
ffa04bb2:	ff e3 c5 e8 	CALL 0xffa01d3c <_substr>;
ffa04bb6:	00 0c       	CC = R0 == 0x0;
ffa04bb8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900bec(-7336980) */
ffa04bbc:	37 06       	IF !CC R6 = R7;
ffa04bbe:	0d 30       	R1 = R5;
ffa04bc0:	14 30       	R2 = R4;
ffa04bc2:	00 e1 f8 0b 	R0.L = 0xbf8;		/* (3064)	R0=0xff900bf8(-7336968) */
ffa04bc6:	ff e3 bb e8 	CALL 0xffa01d3c <_substr>;
ffa04bca:	00 0c       	CC = R0 == 0x0;
ffa04bcc:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900bf8(-7336968) */
ffa04bd0:	37 06       	IF !CC R6 = R7;
ffa04bd2:	00 e1 04 0c 	R0.L = 0xc04;		/* (3076)	R0=0xff900c04(-7336956) */
ffa04bd6:	0d 30       	R1 = R5;
ffa04bd8:	14 30       	R2 = R4;
ffa04bda:	ff e3 b1 e8 	CALL 0xffa01d3c <_substr>;
ffa04bde:	00 0c       	CC = R0 == 0x0;
ffa04be0:	30 11       	IF !CC JUMP 0xffa04e40 <_httpResp+0x38c>;
ffa04be2:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900c04(-7336956) */
ffa04be6:	00 e1 0c 0c 	R0.L = 0xc0c;		/* (3084)	R0=0xff900c0c(-7336948) */
ffa04bea:	0d 30       	R1 = R5;
ffa04bec:	14 30       	R2 = R4;
ffa04bee:	ff e3 a7 e8 	CALL 0xffa01d3c <_substr>;
ffa04bf2:	00 0c       	CC = R0 == 0x0;
ffa04bf4:	e3 10       	IF !CC JUMP 0xffa04dba <_httpResp+0x306>;
ffa04bf6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900c0c(-7336948) */
ffa04bfa:	00 e1 14 0c 	R0.L = 0xc14;		/* (3092)	R0=0xff900c14(-7336940) */
ffa04bfe:	0d 30       	R1 = R5;
ffa04c00:	14 30       	R2 = R4;
ffa04c02:	ff e3 9d e8 	CALL 0xffa01d3c <_substr>;
ffa04c06:	00 0c       	CC = R0 == 0x0;
ffa04c08:	c4 10       	IF !CC JUMP 0xffa04d90 <_httpResp+0x2dc>;
ffa04c0a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900c14(-7336940) */
ffa04c0e:	00 e1 1c 0c 	R0.L = 0xc1c;		/* (3100)	R0=0xff900c1c(-7336932) */
ffa04c12:	0d 30       	R1 = R5;
ffa04c14:	14 30       	R2 = R4;
ffa04c16:	ff e3 93 e8 	CALL 0xffa01d3c <_substr>;
ffa04c1a:	00 0c       	CC = R0 == 0x0;
ffa04c1c:	e4 10       	IF !CC JUMP 0xffa04de4 <_httpResp+0x330>;
ffa04c1e:	30 43       	R0 = R6.B (X);
ffa04c20:	00 0c       	CC = R0 == 0x0;
ffa04c22:	b4 10       	IF !CC JUMP 0xffa04d8a <_httpResp+0x2d6>;
ffa04c24:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900c1c(-7336932) */
ffa04c28:	00 e1 24 0c 	R0.L = 0xc24;		/* (3108)	R0=0xff900c24(-7336924) */
ffa04c2c:	0d 30       	R1 = R5;
ffa04c2e:	14 30       	R2 = R4;
ffa04c30:	ff e3 86 e8 	CALL 0xffa01d3c <_substr>;
ffa04c34:	00 0c       	CC = R0 == 0x0;
ffa04c36:	51 1b       	IF CC JUMP 0xffa04ad8 <_httpResp+0x24>;
ffa04c38:	2a e1 bc ff 	P2 = -0x44 (X);		/*		P2=0xffffffbc(-68) */
ffa04c3c:	17 5b       	P4 = FP + P2;
ffa04c3e:	77 30       	R6 = FP;
ffa04c40:	44 32       	P0 = P4;
ffa04c42:	e6 67       	R6 += -0x4;		/* ( -4) */
ffa04c44:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04c46:	82 68       	P2 = 0x10 (X);		/*		P2=0x10( 16) */
ffa04c48:	b2 e0 02 20 	LSETUP(0xffa04c4c <_httpResp+0x198>, 0xffa04c4c <_httpResp+0x198>) LC1 = P2;
ffa04c4c:	00 92       	[P0++] = R0;
ffa04c4e:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800010 */
ffa04c52:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04c56:	21 e1 ff 1f 	R1 = 0x1fff (X);		/*		R1=0x1fff(8191) */
ffa04c5a:	29 4f       	R1 <<= 0x5;
ffa04c5c:	10 91       	R0 = [P2];
ffa04c5e:	08 54       	R0 = R0 & R1;
ffa04c60:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04c62:	81 4f       	R1 <<= 0x10;
ffa04c64:	08 50       	R0 = R0 + R1;
ffa04c66:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04c68:	41 e1 03 00 	R1.H = 0x3;		/* (  3)	R1=0x3ffff(262143) */
ffa04c6c:	08 54       	R0 = R0 & R1;
ffa04c6e:	11 30       	R2 = R1;
ffa04c70:	2d e1 00 08 	P5 = 0x800 (X);		/*		P5=0x800(2048) */
ffa04c74:	b2 e0 0c 50 	LSETUP(0xffa04c78 <_httpResp+0x1c4>, 0xffa04c8c <_httpResp+0x1d8>) LC1 = P5;
ffa04c78:	4c 32       	P1 = P4;
ffa04c7a:	10 32       	P2 = R0;
ffa04c7c:	08 91       	R0 = [P1];
ffa04c7e:	11 94       	R1 = W[P2++] (Z);
ffa04c80:	08 50       	R0 = R0 + R1;
ffa04c82:	08 92       	[P1++] = R0;
ffa04c84:	4a 30       	R1 = P2;
ffa04c86:	11 54       	R0 = R1 & R2;
ffa04c88:	48 08       	CC = P0 == P1;
ffa04c8a:	f8 17       	IF !CC JUMP 0xffa04c7a <_httpResp+0x1c6> (BP);
ffa04c8c:	00 00       	NOP;
ffa04c8e:	00 00       	NOP;
ffa04c90:	20 91       	R0 = [P4];
ffa04c92:	58 4d       	R0 >>>= 0xb;
ffa04c94:	20 92       	[P4++] = R0;
ffa04c96:	44 08       	CC = P4 == P0;
ffa04c98:	fb 17       	IF !CC JUMP 0xffa04c8e <_httpResp+0x1da> (BP);
ffa04c9a:	ff e3 75 fd 	CALL 0xffa04784 <_htmlDefault>;
ffa04c9e:	68 67       	R0 += -0x13;		/* (-19) */
ffa04ca0:	f0 bb       	[FP -0x4] = R0;
ffa04ca2:	21 e1 00 41 	R1 = 0x4100 (X);		/*		R1=0x4100(16640) */
ffa04ca6:	08 50       	R0 = R0 + R1;
ffa04ca8:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008d0(-7337776) */
ffa04cac:	0e 30       	R1 = R6;
ffa04cae:	02 e1 34 0c 	R2.L = 0xc34;		/* (3124)	R2=0xff900c34(-7336908) */
ffa04cb2:	ff e3 cd e7 	CALL 0xffa01c4c <_strcpy_>;
ffa04cb6:	f5 b8       	R5 = [FP -0x44];
ffa04cb8:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa04cba:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900c34(-7336908) */
ffa04cbe:	0e 30       	R1 = R6;
ffa04cc0:	02 e1 40 0c 	R2.L = 0xc40;		/* (3136)	R2=0xff900c40(-7336896) */
ffa04cc4:	ff e3 c4 e7 	CALL 0xffa01c4c <_strcpy_>;
ffa04cc8:	17 30       	R2 = R7;
ffa04cca:	0e 30       	R1 = R6;
ffa04ccc:	ff e3 12 e9 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04cd0:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900c40(-7336896) */
ffa04cd4:	0e 30       	R1 = R6;
ffa04cd6:	02 e1 54 0c 	R2.L = 0xc54;		/* (3156)	R2=0xff900c54(-7336876) */
ffa04cda:	ff e3 b9 e7 	CALL 0xffa01c4c <_strcpy_>;
ffa04cde:	0e 30       	R1 = R6;
ffa04ce0:	15 30       	R2 = R5;
ffa04ce2:	ff e3 07 e9 	CALL 0xffa01ef0 <_strprintf_int>;
ffa04ce6:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900c54(-7336876) */
ffa04cea:	0e 30       	R1 = R6;
ffa04cec:	02 e1 64 0c 	R2.L = 0xc64;		/* (3172)	R2=0xff900c64(-7336860) */
ffa04cf0:	ff e3 ae e7 	CALL 0xffa01c4c <_strcpy_>;
ffa04cf4:	0f 64       	R7 += 0x1;		/* (  1) */
ffa04cf6:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa04cf8:	0f 08       	CC = R7 == R1;
ffa04cfa:	e0 17       	IF !CC JUMP 0xffa04cba <_httpResp+0x206> (BP);
ffa04cfc:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900c64(-7336860) */
ffa04d00:	0e 30       	R1 = R6;
ffa04d02:	02 e1 70 0c 	R2.L = 0xc70;		/* (3184)	R2=0xff900c70(-7336848) */
ffa04d06:	ff e3 a3 e7 	CALL 0xffa01c4c <_strcpy_>;
ffa04d0a:	f0 b9       	R0 = [FP -0x4];
ffa04d0c:	ed 2e       	JUMP.S 0xffa04ae6 <_httpResp+0x32>;
ffa04d0e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04d12:	00 e1 68 0b 	R0.L = 0xb68;		/* (2920)	R0=0xff900b68(-7337112) */
ffa04d16:	0e 30       	R1 = R6;
ffa04d18:	17 30       	R2 = R7;
ffa04d1a:	ff e3 11 e8 	CALL 0xffa01d3c <_substr>;
ffa04d1e:	00 0c       	CC = R0 == 0x0;
ffa04d20:	dc 1e       	IF CC JUMP 0xffa04ad8 <_httpResp+0x24> (BP);
ffa04d22:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa04d24:	06 50       	R0 = R6 + R0;
ffa04d26:	ff e3 0d e9 	CALL 0xffa01f40 <_atoi_>;
ffa04d2a:	10 30       	R2 = R0;
ffa04d2c:	00 67       	R0 += -0x20;		/* (-32) */
ffa04d2e:	21 e1 80 0f 	R1 = 0xf80 (X);		/*		R1=0xf80(3968) */
ffa04d32:	08 0a       	CC = R0 <= R1 (IU);
ffa04d34:	ca 10       	IF !CC JUMP 0xffa04ec8 <_httpResp+0x414>;
ffa04d36:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800800 */
ffa04d3a:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04d3e:	82 c6 1a 86 	R3 = R2 << 0x3;
ffa04d42:	17 91       	R7 = [P2];
ffa04d44:	03 0d       	CC = R3 <= 0x0;
ffa04d46:	15 18       	IF CC JUMP 0xffa04d70 <_httpResp+0x2bc>;
ffa04d48:	20 e1 ff 1f 	R0 = 0x1fff (X);		/*		R0=0x1fff(8191) */
ffa04d4c:	28 4f       	R0 <<= 0x5;
ffa04d4e:	07 54       	R0 = R7 & R0;
ffa04d50:	82 c6 2a 82 	R1 = R2 << 0x5;
ffa04d54:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa04d56:	48 52       	R1 = R0 - R1;
ffa04d58:	29 e1 00 41 	P1 = 0x4100 (X);		/*		P1=0x4100(16640) */
ffa04d5c:	47 e1 03 00 	R7.H = 0x3;		/* (  3)	R7=0x3ffff(262143) */
ffa04d60:	13 32       	P2 = R3;
ffa04d62:	b2 e0 06 20 	LSETUP(0xffa04d66 <_httpResp+0x2b2>, 0xffa04d6e <_httpResp+0x2ba>) LC1 = P2;
ffa04d66:	79 54       	R1 = R1 & R7;
ffa04d68:	01 32       	P0 = R1;
ffa04d6a:	21 64       	R1 += 0x4;		/* (  4) */
ffa04d6c:	00 90       	R0 = [P0++];
ffa04d6e:	08 92       	[P1++] = R0;
ffa04d70:	82 c6 2a 80 	R0 = R2 << 0x5;
ffa04d74:	b9 2e       	JUMP.S 0xffa04ae6 <_httpResp+0x32>;
ffa04d76:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff901fff(-7331841) */
ffa04d7a:	00 e1 48 0b 	R0.L = 0xb48;		/* (2888)	R0=0xff900b48(-7337144) */
ffa04d7e:	0e 30       	R1 = R6;
ffa04d80:	17 30       	R2 = R7;
ffa04d82:	ff e3 dd e7 	CALL 0xffa01d3c <_substr>;
ffa04d86:	00 0c       	CC = R0 == 0x0;
ffa04d88:	a8 1e       	IF CC JUMP 0xffa04ad8 <_httpResp+0x24> (BP);
ffa04d8a:	ff e3 fd fc 	CALL 0xffa04784 <_htmlDefault>;
ffa04d8e:	ac 2e       	JUMP.S 0xffa04ae6 <_httpResp+0x32>;
ffa04d90:	45 51       	R5 = R5 + R0;
ffa04d92:	04 53       	R4 = R4 - R0;
ffa04d94:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04d96:	05 30       	R0 = R5;
ffa04d98:	ff e3 d4 e8 	CALL 0xffa01f40 <_atoi_>;
ffa04d9c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900800 */
ffa04da0:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa04da4:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04da6:	12 91       	R2 = [P2];
ffa04da8:	41 e1 00 ff 	R1.H = 0xff00;		/* (-256)	R1=0xff00ffff(-16711681) */
ffa04dac:	40 43       	R0 = R0.B (Z);
ffa04dae:	8a 54       	R2 = R2 & R1;
ffa04db0:	80 4f       	R0 <<= 0x10;
ffa04db2:	10 50       	R0 = R0 + R2;
ffa04db4:	10 93       	[P2] = R0;
ffa04db6:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04db8:	29 2f       	JUMP.S 0xffa04c0a <_httpResp+0x156>;
ffa04dba:	45 51       	R5 = R5 + R0;
ffa04dbc:	04 53       	R4 = R4 - R0;
ffa04dbe:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04dc0:	05 30       	R0 = R5;
ffa04dc2:	ff e3 bf e8 	CALL 0xffa01f40 <_atoi_>;
ffa04dc6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f74 <_NetDataDestIP> */
ffa04dca:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa04dce:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04dd0:	12 91       	R2 = [P2];
ffa04dd2:	01 e1 ff 00 	R1.L = 0xff;		/* (255)	R1=0xffff00ff(-65281) */
ffa04dd6:	40 43       	R0 = R0.B (Z);
ffa04dd8:	8a 54       	R2 = R2 & R1;
ffa04dda:	40 4f       	R0 <<= 0x8;
ffa04ddc:	10 50       	R0 = R0 + R2;
ffa04dde:	10 93       	[P2] = R0;
ffa04de0:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04de2:	0a 2f       	JUMP.S 0xffa04bf6 <_httpResp+0x142>;
ffa04de4:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04de6:	05 50       	R0 = R5 + R0;
ffa04de8:	ff e3 ac e8 	CALL 0xffa01f40 <_atoi_>;
ffa04dec:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f74 <_NetDataDestIP> */
ffa04df0:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa04df4:	fa 63       	R2 = -0x1 (X);		/*		R2=0xffffffff( -1) */
ffa04df6:	11 91       	R1 = [P2];
ffa04df8:	42 e1 ff 00 	R2.H = 0xff;		/* (255)	R2=0xffffff(16777215) */
ffa04dfc:	51 54       	R1 = R1 & R2;
ffa04dfe:	c0 4f       	R0 <<= 0x18;
ffa04e00:	08 50       	R0 = R0 + R1;
ffa04e02:	10 93       	[P2] = R0;
ffa04e04:	c3 2f       	JUMP.S 0xffa04d8a <_httpResp+0x2d6>;
ffa04e06:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b48(-7337144) */
ffa04e0a:	00 e1 b4 0b 	R0.L = 0xbb4;		/* (2996)	R0=0xff900bb4(-7337036) */
ffa04e0e:	0d 30       	R1 = R5;
ffa04e10:	14 30       	R2 = R4;
ffa04e12:	ff e3 95 e7 	CALL 0xffa01d3c <_substr>;
ffa04e16:	00 0c       	CC = R0 == 0x0;
ffa04e18:	49 14       	IF !CC JUMP 0xffa04eaa <_httpResp+0x3f6> (BP);
ffa04e1a:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa04e1c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900bb4(-7337036) */
ffa04e20:	00 e1 bc 0b 	R0.L = 0xbbc;		/* (3004)	R0=0xff900bbc(-7337028) */
ffa04e24:	0d 30       	R1 = R5;
ffa04e26:	14 30       	R2 = R4;
ffa04e28:	ff e3 8a e7 	CALL 0xffa01d3c <_substr>;
ffa04e2c:	00 0c       	CC = R0 == 0x0;
ffa04e2e:	9d 1e       	IF CC JUMP 0xffa04b68 <_httpResp+0xb4> (BP);
ffa04e30:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f74 <_NetDataDestIP> */
ffa04e34:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04e36:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa04e3a:	10 9b       	B[P2] = R0;
ffa04e3c:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e3e:	95 2e       	JUMP.S 0xffa04b68 <_httpResp+0xb4>;
ffa04e40:	45 51       	R5 = R5 + R0;
ffa04e42:	04 53       	R4 = R4 - R0;
ffa04e44:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04e46:	05 30       	R0 = R5;
ffa04e48:	ff e3 7c e8 	CALL 0xffa01f40 <_atoi_>;
ffa04e4c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900cc4 <_g_streamEnabled> */
ffa04e50:	0a e1 74 0f 	P2.L = 0xf74;		/* (3956)	P2=0xff900f74 <_NetDataDestIP> */
ffa04e54:	11 91       	R1 = [P2];
ffa04e56:	41 4d       	R1 >>>= 0x8;
ffa04e58:	41 4f       	R1 <<= 0x8;
ffa04e5a:	40 43       	R0 = R0.B (Z);
ffa04e5c:	08 50       	R0 = R0 + R1;
ffa04e5e:	10 93       	[P2] = R0;
ffa04e60:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e62:	c0 2e       	JUMP.S 0xffa04be2 <_httpResp+0x12e>;
ffa04e64:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04e68:	00 e1 b4 0b 	R0.L = 0xbb4;		/* (2996)	R0=0xff900bb4(-7337036) */
ffa04e6c:	0d 30       	R1 = R5;
ffa04e6e:	14 30       	R2 = R4;
ffa04e70:	ff e3 66 e7 	CALL 0xffa01d3c <_substr>;
ffa04e74:	00 0c       	CC = R0 == 0x0;
ffa04e76:	08 1c       	IF CC JUMP 0xffa04e86 <_httpResp+0x3d2> (BP);
ffa04e78:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800f74 */
ffa04e7c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04e7e:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa04e82:	10 9b       	B[P2] = R0;
ffa04e84:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e86:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04e8a:	00 e1 bc 0b 	R0.L = 0xbbc;		/* (3004)	R0=0xff900bbc(-7337028) */
ffa04e8e:	0d 30       	R1 = R5;
ffa04e90:	14 30       	R2 = R4;
ffa04e92:	ff e3 55 e7 	CALL 0xffa01d3c <_substr>;
ffa04e96:	00 0c       	CC = R0 == 0x0;
ffa04e98:	72 1e       	IF CC JUMP 0xffa04b7c <_httpResp+0xc8> (BP);
ffa04e9a:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800808 */
ffa04e9e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04ea0:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa04ea4:	10 9b       	B[P2] = R0;
ffa04ea6:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04ea8:	6a 2e       	JUMP.S 0xffa04b7c <_httpResp+0xc8>;
ffa04eaa:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900808 */
ffa04eae:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04eb0:	0a e1 c4 0c 	P2.L = 0xcc4;		/* (3268)	P2=0xff900cc4 <_g_streamEnabled> */
ffa04eb4:	10 9b       	B[P2] = R0;
ffa04eb6:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800cc4 */
ffa04eba:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04ebe:	10 91       	R0 = [P2];
ffa04ec0:	22 6c       	P2 += 0x4;		/* (  4) */
ffa04ec2:	10 93       	[P2] = R0;
ffa04ec4:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04ec6:	ab 2f       	JUMP.S 0xffa04e1c <_httpResp+0x368>;
ffa04ec8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04eca:	f0 bb       	[FP -0x4] = R0;
ffa04ecc:	4f 30       	R1 = FP;
ffa04ece:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90ffff(-7274497) */
ffa04ed2:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa04ed6:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa04ed8:	02 e1 70 0b 	R2.L = 0xb70;		/* (2928)	R2=0xff900b70(-7337104) */
ffa04edc:	ff e3 b8 e6 	CALL 0xffa01c4c <_strcpy_>;
ffa04ee0:	f0 b9       	R0 = [FP -0x4];
ffa04ee2:	02 2e       	JUMP.S 0xffa04ae6 <_httpResp+0x32>;

ffa04ee4 <_httpCollate>:
ffa04ee4:	fd 05       	[--SP] = (R7:7, P5:5);
ffa04ee6:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900800 */
ffa04eea:	0d e1 6c 10 	P5.L = 0x106c;		/* (4204)	P5=0xff90106c <_g_httpRxed> */
ffa04eee:	39 30       	R7 = R1;
ffa04ef0:	0a 60       	R2 = 0x1 (X);		/*		R2=0x1(  1) */
ffa04ef2:	29 91       	R1 = [P5];
ffa04ef4:	82 4f       	R2 <<= 0x10;
ffa04ef6:	51 50       	R1 = R1 + R2;
ffa04ef8:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa04efc:	17 30       	R2 = R7;
ffa04efe:	ff e3 77 e6 	CALL 0xffa01bec <_memcpy_>;
ffa04f02:	28 91       	R0 = [P5];
ffa04f04:	c7 51       	R7 = R7 + R0;
ffa04f06:	2f 93       	[P5] = R7;
ffa04f08:	01 e8 00 00 	UNLINK;
ffa04f0c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04f0e:	bd 05       	(R7:7, P5:5) = [SP++];
ffa04f10:	10 00       	RTS;
	...
