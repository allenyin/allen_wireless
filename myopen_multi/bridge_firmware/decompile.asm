
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
ffa0057c:	00 e3 22 0a 	CALL 0xffa019c0 <_printf_int>;
ffa00580:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa00584:	00 e1 6c 05 	R0.L = 0x56c;		/* (1388)	R0=0xff90056c(-7338644) */
ffa00588:	00 e3 80 08 	CALL 0xffa01688 <_uart_str>;
ffa0058c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90056c(-7338644) */
ffa00590:	0d 30       	R1 = R5;
ffa00592:	00 e1 14 00 	R0.L = 0x14;		/* ( 20)	R0=0xff900014(-7340012) */
ffa00596:	00 e3 63 09 	CALL 0xffa0185c <_printf_hex_byte>;
ffa0059a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900014(-7340012) */
ffa0059e:	00 e1 6c 05 	R0.L = 0x56c;		/* (1388)	R0=0xff90056c(-7338644) */
ffa005a2:	00 e3 73 08 	CALL 0xffa01688 <_uart_str>;
ffa005a6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90056c(-7338644) */
ffa005aa:	00 e1 20 00 	R0.L = 0x20;		/* ( 32)	R0=0xff900020(-7340000) */
ffa005ae:	0f 30       	R1 = R7;
ffa005b0:	00 e3 56 09 	CALL 0xffa0185c <_printf_hex_byte>;
ffa005b4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900020(-7340000) */
ffa005b8:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa005bc:	00 e3 66 08 	CALL 0xffa01688 <_uart_str>;
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
ffa0063c:	00 e3 c2 09 	CALL 0xffa019c0 <_printf_int>;
ffa00640:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002c(-7339988) */
ffa00644:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa00648:	ef 42       	R7 = R5.L (Z);
ffa0064a:	00 e3 1f 08 	CALL 0xffa01688 <_uart_str>;
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
ffa0077a:	0d e1 34 0c 	P5.L = 0xc34;		/* (3124)	P5=0xff900c34 <_g_sampCh> */
ffa0077e:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff90150c */
ffa00782:	6e 99       	R6 = B[P5] (X);
ffa00784:	08 e1 3c 0c 	P0.L = 0xc3c;		/* (3132)	P0=0xff900c3c <_g_sampR> */
ffa00788:	75 43       	R5 = R6.B (Z);
ffa0078a:	04 91       	R4 = [P0];
ffa0078c:	22 e1 ff 01 	R2 = 0x1ff (X);		/*		R2=0x1ff(511) */
ffa00790:	65 50       	R1 = R5 + R4;
ffa00792:	11 54       	R0 = R1 & R2;
ffa00794:	20 32       	P4 = R0;
ffa00796:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900500 */
ffa0079a:	09 e1 68 0c 	P1.L = 0xc68;		/* (3176)	P1=0xff900c68 <_g_samples> */
ffa0079e:	11 64       	R1 += 0x2;		/* (  2) */
ffa007a0:	51 54       	R1 = R1 & R2;
ffa007a2:	a1 5a       	P2 = P1 + P4;
ffa007a4:	53 99       	R3 = B[P2] (X);
ffa007a6:	11 32       	P2 = R1;
ffa007a8:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa007ac:	0c e1 44 0c 	P4.L = 0xc44;		/* (3140)	P4=0xff900c44 <_g_sampOff> */
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
ffa00806:	0a e1 20 0c 	P2.L = 0xc20;		/* (3104)	P2=0xff900c20 <_g_sampW> */
ffa0080a:	10 91       	R0 = [P2];
ffa0080c:	04 0a       	CC = R4 <= R0 (IU);
ffa0080e:	3b 14       	IF !CC JUMP 0xffa00884 <_audio_out+0x128> (BP);
ffa00810:	20 52       	R0 = R0 - R4;
ffa00812:	21 e1 d4 01 	R1 = 0x1d4 (X);		/*		R1=0x1d4(468) */
ffa00816:	08 0a       	CC = R0 <= R1 (IU);
ffa00818:	61 18       	IF CC JUMP 0xffa008da <_audio_out+0x17e>;
ffa0081a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c20 <_g_sampW> */
ffa0081e:	0a e1 14 0c 	P2.L = 0xc14;		/* (3092)	P2=0xff900c14 <_g_sampMode> */
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
ffa00838:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c14 <_g_sampMode> */
ffa0083c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0083e:	0a e1 24 0c 	P2.L = 0xc24;		/* (3108)	P2=0xff900c24 <_g_sampInc> */
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
ffa00886:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c24 <_g_sampInc> */
ffa0088a:	0a e1 14 0c 	P2.L = 0xc14;		/* (3092)	P2=0xff900c14 <_g_sampMode> */
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
ffa008aa:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c14 <_g_sampMode> */
ffa008ae:	40 e1 13 10 	R0.H = 0x1013;		/* (4115)	R0=0x10130004(269680644) */
ffa008b2:	0a e1 24 0c 	P2.L = 0xc24;		/* (3108)	P2=0xff900c24 <_g_sampInc> */
ffa008b6:	00 e1 cd ab 	R0.L = 0xabcd;		/* (-21555)	R0=0x1013abcd(269724621) */
ffa008ba:	10 93       	[P2] = R0;
ffa008bc:	c5 2f       	JUMP.S 0xffa00846 <_audio_out+0xea>;
ffa008be:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c24 <_g_sampInc> */
ffa008c2:	40 e1 f1 0f 	R0.H = 0xff1;		/* (4081)	R0=0xff1abcd(267496397) */
ffa008c6:	0a e1 24 0c 	P2.L = 0xc24;		/* (3108)	P2=0xff900c24 <_g_sampInc> */
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
ffa008e2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c24 <_g_sampInc> */
ffa008e6:	0a e1 14 0c 	P2.L = 0xc14;		/* (3092)	P2=0xff900c14 <_g_sampMode> */
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
ffa00926:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00c3c(-4191172) */
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
ffa00a4e:	4c e1 c0 ff 	P4.H = 0xffc0;		/* (-64)	P4=0xffc00c44(-4191164) */
ffa00a52:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00c34(-4191180) */
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
ffa00cc2:	00 e3 cd 05 	CALL 0xffa0185c <_printf_hex_byte>;
ffa00cc6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900044(-7339964) */
ffa00cca:	29 99       	R1 = B[P5] (Z);
ffa00ccc:	00 e1 54 00 	R0.L = 0x54;		/* ( 84)	R0=0xff900054(-7339948) */
ffa00cd0:	00 e3 c6 05 	CALL 0xffa0185c <_printf_hex_byte>;
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
ffa00cf6:	00 e2 0d 07 	JUMP.L 0xffa01b10 <_printf_str>;
	...

ffa00cfc <_eth_listen>:
ffa00cfc:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa00d00:	00 0c       	CC = R0 == 0x0;
ffa00d02:	04 18       	IF CC JUMP 0xffa00d0a <_eth_listen+0xe>;
ffa00d04:	01 e8 00 00 	UNLINK;
ffa00d08:	10 00       	RTS;
ffa00d0a:	47 30       	R0 = FP;
ffa00d0c:	e0 67       	R0 += -0x4;		/* ( -4) */
ffa00d0e:	00 e3 e7 14 	CALL 0xffa036dc <_bfin_EMAC_recv>;
ffa00d12:	00 0d       	CC = R0 <= 0x0;
ffa00d14:	f8 1b       	IF CC JUMP 0xffa00d04 <_eth_listen+0x8>;
ffa00d16:	f9 b9       	P1 = [FP -0x4];
ffa00d18:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901508 */
ffa00d1c:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa00d20:	11 91       	R1 = [P2];
ffa00d22:	c8 a1       	R0 = [P1 + 0x1c];
ffa00d24:	08 08       	CC = R0 == R1;
ffa00d26:	ef 17       	IF !CC JUMP 0xffa00d04 <_eth_listen+0x8> (BP);
ffa00d28:	48 e4 13 00 	R0 = W[P1 + 0x26] (Z);
ffa00d2c:	00 e3 2e 0a 	CALL 0xffa02188 <_htons>;
ffa00d30:	c0 42       	R0 = R0.L (Z);
ffa00d32:	21 e1 f6 10 	R1 = 0x10f6 (X);		/*		R1=0x10f6(4342) */
ffa00d36:	08 08       	CC = R0 == R1;
ffa00d38:	e6 17       	IF !CC JUMP 0xffa00d04 <_eth_listen+0x8> (BP);
ffa00d3a:	f0 b9       	R0 = [FP -0x4];
ffa00d3c:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff9010f6(-7335690) */
ffa00d40:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa00d42:	01 e1 48 0c 	R1.L = 0xc48;		/* (3144)	R1=0xff900c48 <_g_outpkt>(-7336888) */
ffa00d46:	02 61       	R2 = 0x20 (X);		/*		R2=0x20( 32) */
ffa00d48:	00 e3 32 07 	CALL 0xffa01bac <_memcpy_>;
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
ffa00d80:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ef0(-4190480) */
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
ffa00dae:	08 e1 1c 0c 	P0.L = 0xc1c;		/* (3100)	P0=0xff900c1c <_wrptr> */
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
ffa00dd6:	0b e1 20 0c 	P3.L = 0xc20;		/* (3104)	P3=0xff900c20 <_g_sampW> */
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
ffa00e04:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900c1c <_wrptr> */
ffa00e08:	08 e1 68 0c 	P0.L = 0xc68;		/* (3176)	P0=0xff900c68 <_g_samples> */
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
ffa00e6e:	09 e1 10 0c 	P1.L = 0xc10;		/* (3088)	P1=0xff900c10 <_g_nextFlag> */
ffa00e72:	58 56       	R1 = R0 | R3;
ffa00e74:	0a 91       	R2 = [P1];
ffa00e76:	0a 08       	CC = R2 == R1;
ffa00e78:	11 18       	IF CC JUMP 0xffa00e9a <_getRadioPacket+0x14a>;
ffa00e7a:	91 09       	CC = R1 < R2 (IU);
ffa00e7c:	96 1c       	IF CC JUMP 0xffa00fa8 <_getRadioPacket+0x258> (BP);
ffa00e7e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900708 */
ffa00e82:	0a e1 38 0c 	P2.L = 0xc38;		/* (3128)	P2=0xff900c38 <_g_dropped> */
ffa00e86:	10 91       	R0 = [P2];
ffa00e88:	10 52       	R0 = R0 - R2;
ffa00e8a:	08 50       	R0 = R0 + R1;
ffa00e8c:	10 93       	[P2] = R0;
ffa00e8e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c38(-4191176) */
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
ffa00ed4:	0a e1 08 0c 	P2.L = 0xc08;		/* (3080)	P2=0xff900c08 <_g_radioChan> */
ffa00ed8:	12 91       	R2 = [P2];
ffa00eda:	21 e1 f4 10 	R1 = 0x10f4 (X);		/*		R1=0x10f4(4340) */
ffa00ede:	04 cc 11 04 	R2 = R2 + R1 (NS) || R0 = [P0] || NOP;
ffa00ee2:	00 91 00 00 
ffa00ee6:	4f 30       	R1 = FP;
ffa00ee8:	20 64       	R0 += 0x4;		/* (  4) */
ffa00eea:	d2 42       	R2 = R2.L (Z);
ffa00eec:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa00eee:	00 e3 43 0f 	CALL 0xffa02d74 <_udp_packet_setup>;
ffa00ef2:	08 32       	P1 = R0;
ffa00ef4:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa00ef8:	00 0d       	CC = R0 <= 0x0;
ffa00efa:	41 18       	IF CC JUMP 0xffa00f7c <_getRadioPacket+0x22c>;
ffa00efc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c08 <_g_radioChan> */
ffa00f00:	0a e1 38 0c 	P2.L = 0xc38;		/* (3128)	P2=0xff900c38 <_g_dropped> */
ffa00f04:	10 91       	R0 = [P2];
ffa00f06:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c38 <_g_dropped> */
ffa00f0a:	08 93       	[P1] = R0;
ffa00f0c:	0a e1 1c 0c 	P2.L = 0xc1c;		/* (3100)	P2=0xff900c1c <_wrptr> */
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
ffa00f38:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c1c <_wrptr> */
ffa00f3c:	0a e1 18 0c 	P2.L = 0xc18;		/* (3096)	P2=0xff900c18 <_trptr> */
ffa00f40:	10 91       	R0 = [P2];
ffa00f42:	08 64       	R0 += 0x1;		/* (  1) */
ffa00f44:	10 93       	[P2] = R0;
ffa00f46:	00 e3 3d 0a 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
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
ffa00f60:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c18(-4191208) */
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
ffa00f80:	0a e1 18 0c 	P2.L = 0xc18;		/* (3096)	P2=0xff900c18 <_trptr> */
ffa00f84:	10 91       	R0 = [P2];
ffa00f86:	08 64       	R0 += 0x1;		/* (  1) */
ffa00f88:	10 93       	[P2] = R0;
ffa00f8a:	eb 2f       	JUMP.S 0xffa00f60 <_getRadioPacket+0x210>;
ffa00f8c:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900c10 <_g_nextFlag> */
ffa00f90:	09 e1 1c 0c 	P1.L = 0xc1c;		/* (3100)	P1=0xff900c1c <_wrptr> */
ffa00f94:	4d 91       	P5 = [P1];
ffa00f96:	79 bb       	[FP -0x24] = P1;
ffa00f98:	ff e3 08 f9 	CALL 0xffa001a8 <_ustimer>;
ffa00f9c:	7a b9       	P2 = [FP -0x24];
ffa00f9e:	28 93       	[P5] = R0;
ffa00fa0:	10 91       	R0 = [P2];
ffa00fa2:	20 64       	R0 += 0x4;		/* (  4) */
ffa00fa4:	10 93       	[P2] = R0;
ffa00fa6:	07 2f       	JUMP.S 0xffa00db4 <_getRadioPacket+0x64>;
ffa00fa8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c18 <_trptr> */
ffa00fac:	0a e1 38 0c 	P2.L = 0xc38;		/* (3128)	P2=0xff900c38 <_g_dropped> */
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
ffa00fd0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c38(-4191176) */
ffa00fd4:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa00fd8:	79 e5 fa ff 	R1 = W[FP + -0xc] (X);
ffa00fdc:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc01508(-4188920) */
ffa00fe0:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa00fe4:	11 97       	W[P2] = R1;
ffa00fe6:	20 e1 a0 00 	R0 = 0xa0 (X);		/*		R0=0xa0(160) */
ffa00fea:	0d e1 0c 05 	P5.L = 0x50c;		/* (1292)	P5=0xffc0050c(-4193012) */
ffa00fee:	0c e1 48 0c 	P4.L = 0xc48;		/* (3144)	P4=0xff900c48 <_g_outpkt> */
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
ffa0106e:	48 e1 c0 ff 	P0.H = 0xffc0;		/* (-64)	P0=0xffc00c68(-4191128) */
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
ffa010bc:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00c1c(-4191204) */
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
ffa010e6:	0a e1 68 0e 	P2.L = 0xe68;		/* (3688)	P2=0xff900e68 <_printf_temp> */
ffa010ea:	10 93       	[P2] = R0;
ffa010ec:	20 e1 01 e0 	R0 = -0x1fff (X);		/*		R0=0xffffe001(-8191) */
ffa010f0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900e68 <_printf_temp> */
ffa010f4:	50 4f       	R0 <<= 0xa;
ffa010f6:	0a e1 6c 0e 	P2.L = 0xe6c;		/* (3692)	P2=0xff900e6c <_printf_out> */
ffa010fa:	10 93       	[P2] = R0;
ffa010fc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00e6c(-4190612) */
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
ffa0112e:	00 e3 1f 07 	CALL 0xffa01f6c <_udelay>;
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
ffa01176:	00 e3 25 04 	CALL 0xffa019c0 <_printf_int>;
ffa0117a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90007c(-7339908) */
ffa0117e:	00 e1 84 00 	R0.L = 0x84;		/* (132)	R0=0xff900084(-7339900) */
ffa01182:	00 e3 c7 04 	CALL 0xffa01b10 <_printf_str>;
ffa01186:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900084(-7339900) */
ffa0118a:	00 e1 88 00 	R0.L = 0x88;		/* (136)	R0=0xff900088(-7339896) */
ffa0118e:	00 e3 c1 04 	CALL 0xffa01b10 <_printf_str>;
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
ffa011ba:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa011bc:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa011be:	02 20       	JUMP.S 0xffa011c2 <_main+0x166>;
ffa011c0:	45 6c       	P5 += 0x8;		/* (  8) */
ffa011c2:	2f 95       	R7 = W[P5] (Z);
ffa011c4:	80 e1 ca de 	R0 = 0xdeca (Z);		/*		R0=0xdeca(57034) */
ffa011c8:	07 08       	CC = R7 == R0;
ffa011ca:	15 1c       	IF CC JUMP 0xffa011f4 <_main+0x198> (BP);
ffa011cc:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90deca(-7282998) */
ffa011d0:	0e 30       	R1 = R6;
ffa011d2:	00 e1 9c 00 	R0.L = 0x9c;		/* (156)	R0=0xff90009c(-7339876) */
ffa011d6:	00 e3 99 03 	CALL 0xffa01908 <_printf_hex>;
ffa011da:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90009c(-7339876) */
ffa011de:	00 e1 a8 00 	R0.L = 0xa8;		/* (168)	R0=0xff9000a8(-7339864) */
ffa011e2:	0f 30       	R1 = R7;
ffa011e4:	00 e3 92 03 	CALL 0xffa01908 <_printf_hex>;
ffa011e8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000a8(-7339864) */
ffa011ec:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa011f0:	00 e3 90 04 	CALL 0xffa01b10 <_printf_str>;
ffa011f4:	81 e1 ad fb 	R1 = 0xfbad (Z);		/*		R1=0xfbad(64429) */
ffa011f8:	68 a4       	R0 = W[P5 + 0x2] (Z);
ffa011fa:	08 08       	CC = R0 == R1;
ffa011fc:	08 1c       	IF CC JUMP 0xffa0120c <_main+0x1b0> (BP);
ffa011fe:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90079c(-7338084) */
ffa01202:	00 e1 9c 00 	R0.L = 0x9c;		/* (156)	R0=0xff90009c(-7339876) */
ffa01206:	0e 30       	R1 = R6;
ffa01208:	00 e3 80 03 	CALL 0xffa01908 <_printf_hex>;
ffa0120c:	81 e1 ed c0 	R1 = 0xc0ed (Z);		/*		R1=0xc0ed(49389) */
ffa01210:	a8 a4       	R0 = W[P5 + 0x4] (Z);
ffa01212:	08 08       	CC = R0 == R1;
ffa01214:	08 1c       	IF CC JUMP 0xffa01224 <_main+0x1c8> (BP);
ffa01216:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90009c(-7339876) */
ffa0121a:	00 e1 9c 00 	R0.L = 0x9c;		/* (156)	R0=0xff90009c(-7339876) */
ffa0121e:	0e 30       	R1 = R6;
ffa01220:	00 e3 74 03 	CALL 0xffa01908 <_printf_hex>;
ffa01224:	81 e1 be ba 	R1 = 0xbabe (Z);		/*		R1=0xbabe(47806) */
ffa01228:	e8 a4       	R0 = W[P5 + 0x6] (Z);
ffa0122a:	08 08       	CC = R0 == R1;
ffa0122c:	08 1c       	IF CC JUMP 0xffa0123c <_main+0x1e0> (BP);
ffa0122e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90009c(-7339876) */
ffa01232:	00 e1 9c 00 	R0.L = 0x9c;		/* (156)	R0=0xff90009c(-7339876) */
ffa01236:	0e 30       	R1 = R6;
ffa01238:	00 e3 68 03 	CALL 0xffa01908 <_printf_hex>;
ffa0123c:	4a e1 ff 01 	P2.H = 0x1ff;		/* (511)	P2=0x1ff0000 */
ffa01240:	0a e1 f8 ff 	P2.L = 0xfff8;		/* ( -8)	P2=0x1fffff8 */
ffa01244:	0e 64       	R6 += 0x1;		/* (  1) */
ffa01246:	55 08       	CC = P5 == P2;
ffa01248:	bc 17       	IF !CC JUMP 0xffa011c0 <_main+0x164> (BP);
ffa0124a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90009c(-7339876) */
ffa0124e:	00 e1 b0 00 	R0.L = 0xb0;		/* (176)	R0=0xff9000b0(-7339856) */
ffa01252:	00 e3 5f 04 	CALL 0xffa01b10 <_printf_str>;
ffa01256:	00 e3 5d 0f 	CALL 0xffa03110 <_bfin_EMAC_init>;
ffa0125a:	f0 bb       	[FP -0x4] = R0;
ffa0125c:	00 0c       	CC = R0 == 0x0;
ffa0125e:	8f 19       	IF CC JUMP 0xffa0157c <_main+0x520>;
ffa01260:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa01264:	0d e1 ec 0e 	P5.L = 0xeec;		/* (3820)	P5=0xff900eec <_NetOurIP> */
ffa01268:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000b0(-7339856) */
ffa0126c:	29 99       	R1 = B[P5] (Z);
ffa0126e:	00 e1 c0 00 	R0.L = 0xc0;		/* (192)	R0=0xff9000c0(-7339840) */
ffa01272:	00 e3 a7 03 	CALL 0xffa019c0 <_printf_int>;
ffa01276:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000c0(-7339840) */
ffa0127a:	a9 e4 01 00 	R1 = B[P5 + 0x1] (Z);
ffa0127e:	00 e1 c4 00 	R0.L = 0xc4;		/* (196)	R0=0xff9000c4(-7339836) */
ffa01282:	00 e3 9f 03 	CALL 0xffa019c0 <_printf_int>;
ffa01286:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000c4(-7339836) */
ffa0128a:	a9 e4 02 00 	R1 = B[P5 + 0x2] (Z);
ffa0128e:	00 e1 c4 00 	R0.L = 0xc4;		/* (196)	R0=0xff9000c4(-7339836) */
ffa01292:	00 e3 97 03 	CALL 0xffa019c0 <_printf_int>;
ffa01296:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000c4(-7339836) */
ffa0129a:	a9 e4 03 00 	R1 = B[P5 + 0x3] (Z);
ffa0129e:	00 e1 c4 00 	R0.L = 0xc4;		/* (196)	R0=0xff9000c4(-7339836) */
ffa012a2:	00 e3 8f 03 	CALL 0xffa019c0 <_printf_int>;
ffa012a6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000c4(-7339836) */
ffa012aa:	00 e1 c8 00 	R0.L = 0xc8;		/* (200)	R0=0xff9000c8(-7339832) */
ffa012ae:	00 e3 31 04 	CALL 0xffa01b10 <_printf_str>;
ffa012b2:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0fff8(-4128776) */
ffa012b6:	20 e1 83 38 	R0 = 0x3883 (X);		/*		R0=0x3883(14467) */
ffa012ba:	0a e1 00 32 	P2.L = 0x3200;		/* (12800)	P2=0xffc03200(-4181504) */
ffa012be:	10 97       	W[P2] = R0;
ffa012c0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03200(-4181504) */
ffa012c4:	20 e1 56 fe 	R0 = -0x1aa (X);		/*		R0=0xfffffe56(-426) */
ffa012c8:	0a e1 30 07 	P2.L = 0x730;		/* (1840)	P2=0xffc00730(-4192464) */
ffa012cc:	10 97       	W[P2] = R0;
ffa012ce:	20 e1 ab 01 	R0 = 0x1ab (X);		/*		R0=0x1ab(427) */
ffa012d2:	82 6c       	P2 += 0x10;		/* ( 16) */
ffa012d4:	10 97       	W[P2] = R0;
ffa012d6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00730(-4192464) */
ffa012da:	20 e1 40 01 	R0 = 0x140 (X);		/*		R0=0x140(320) */
ffa012de:	0a e1 10 32 	P2.L = 0x3210;		/* (12816)	P2=0xffc03210(-4181488) */
ffa012e2:	10 97       	W[P2] = R0;
ffa012e4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03210(-4181488) */
ffa012e8:	0a e1 40 15 	P2.L = 0x1540;		/* (5440)	P2=0xffc01540(-4188864) */
ffa012ec:	10 95       	R0 = W[P2] (Z);
ffa012ee:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa012f0:	10 97       	W[P2] = R0;
ffa012f2:	82 6f       	P2 += -0x10;		/* (-16) */
ffa012f4:	10 95       	R0 = W[P2] (Z);
ffa012f6:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa012f8:	10 97       	W[P2] = R0;
ffa012fa:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc01540(-4188864) */
ffa012fe:	0a e1 04 32 	P2.L = 0x3204;		/* (12804)	P2=0xffc03204(-4181500) */
ffa01302:	10 95       	R0 = W[P2] (Z);
ffa01304:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa01306:	10 97       	W[P2] = R0;
ffa01308:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00000(-4194304) */
ffa0130c:	09 e1 00 09 	P1.L = 0x900;		/* (2304)	P1=0xffc00900(-4192000) */
ffa01310:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01312:	08 97       	W[P1] = R0;
ffa01314:	24 00       	SSYNC;
ffa01316:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903204 */
ffa0131a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0131c:	0a e1 3c 0c 	P2.L = 0xc3c;		/* (3132)	P2=0xff900c3c <_g_sampR> */
ffa01320:	10 93       	[P2] = R0;
ffa01322:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c3c <_g_sampR> */
ffa01326:	0a e1 20 0c 	P2.L = 0xc20;		/* (3104)	P2=0xff900c20 <_g_sampW> */
ffa0132a:	10 93       	[P2] = R0;
ffa0132c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c20 <_g_sampW> */
ffa01330:	0a e1 44 0c 	P2.L = 0xc44;		/* (3140)	P2=0xff900c44 <_g_sampOff> */
ffa01334:	10 93       	[P2] = R0;
ffa01336:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c44 <_g_sampOff> */
ffa0133a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0133c:	0a e1 14 0c 	P2.L = 0xc14;		/* (3092)	P2=0xff900c14 <_g_sampMode> */
ffa01340:	10 9b       	B[P2] = R0;
ffa01342:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01344:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c14 <_g_sampMode> */
ffa01348:	d8 4f       	R0 <<= 0x1b;
ffa0134a:	0a e1 24 0c 	P2.L = 0xc24;		/* (3108)	P2=0xff900c24 <_g_sampInc> */
ffa0134e:	10 93       	[P2] = R0;
ffa01350:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c24 <_g_sampInc> */
ffa01354:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01356:	0a e1 34 0c 	P2.L = 0xc34;		/* (3124)	P2=0xff900c34 <_g_sampCh> */
ffa0135a:	10 9b       	B[P2] = R0;
ffa0135c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c34(-4191180) */
ffa01360:	e8 60       	R0 = 0x1d (X);		/*		R0=0x1d( 29) */
ffa01362:	0a e1 08 09 	P2.L = 0x908;		/* (2312)	P2=0xffc00908(-4191992) */
ffa01366:	10 97       	W[P2] = R0;
ffa01368:	f8 60       	R0 = 0x1f (X);		/*		R0=0x1f( 31) */
ffa0136a:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0136c:	10 97       	W[P2] = R0;
ffa0136e:	b8 60       	R0 = 0x17 (X);		/*		R0=0x17( 23) */
ffa01370:	c2 6f       	P2 += -0x8;		/* ( -8) */
ffa01372:	10 97       	W[P2] = R0;
ffa01374:	20 e1 03 4e 	R0 = 0x4e03 (X);		/*		R0=0x4e03(19971) */
ffa01378:	08 97       	W[P1] = R0;
ffa0137a:	40 e1 a0 ff 	R0.H = 0xffa0;		/* (-96)	R0=0xffa04e03(-6271485) */
ffa0137e:	4a e1 e0 ff 	P2.H = 0xffe0;		/* (-32)	P2=0xffe00908(-2094840) */
ffa01382:	00 e1 5c 07 	R0.L = 0x75c;		/* (1884)	R0=0xffa0075c <_audio_out>(-6289572) */
ffa01386:	0a e1 1c 20 	P2.L = 0x201c;		/* (8220)	P2=0xffe0201c(-2088932) */
ffa0138a:	10 93       	[P2] = R0;
ffa0138c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0201c(-4186084) */
ffa01390:	0a e1 0c 01 	P2.L = 0x10c;		/* (268)	P2=0xffc0010c(-4194036) */
ffa01394:	10 91       	R0 = [P2];
ffa01396:	48 4a       	BITSET (R0, 0x9);		/* bit  9 */
ffa01398:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900eec <_NetOurIP> */
ffa0139c:	10 93       	[P2] = R0;
ffa0139e:	0d e1 08 0c 	P5.L = 0xc08;		/* (3080)	P5=0xff900c08 <_g_radioChan> */
ffa013a2:	24 e1 00 01 	R4 = 0x100 (X);		/*		R4=0x100(256) */
ffa013a6:	2c e1 00 80 	P4 = -0x8000 (X);		/*		P4=0xffff8000(-32768) */
ffa013aa:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90075c(-7338148) */
ffa013ae:	00 e1 cc 00 	R0.L = 0xcc;		/* (204)	R0=0xff9000cc(-7339828) */
ffa013b2:	00 e3 af 03 	CALL 0xffa01b10 <_printf_str>;
ffa013b6:	00 e3 05 10 	CALL 0xffa033c0 <_bridge_publish>;
ffa013ba:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90010c */
ffa013be:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa013c0:	0a e1 1c 0c 	P2.L = 0xc1c;		/* (3100)	P2=0xff900c1c <_wrptr> */
ffa013c4:	16 93       	[P2] = R6;
ffa013c6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c1c <_wrptr> */
ffa013ca:	0a e1 18 0c 	P2.L = 0xc18;		/* (3096)	P2=0xff900c18 <_trptr> */
ffa013ce:	16 93       	[P2] = R6;
ffa013d0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c18 <_trptr> */
ffa013d4:	0a e1 38 0c 	P2.L = 0xc38;		/* (3128)	P2=0xff900c38 <_g_dropped> */
ffa013d8:	16 93       	[P2] = R6;
ffa013da:	40 43       	R0 = R0.B (Z);
ffa013dc:	28 93       	[P5] = R0;
ffa013de:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c38 <_g_dropped> */
ffa013e2:	0a e1 10 0c 	P2.L = 0xc10;		/* (3088)	P2=0xff900c10 <_g_nextFlag> */
ffa013e6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000cc(-7339828) */
ffa013ea:	16 93       	[P2] = R6;
ffa013ec:	00 e1 e0 00 	R0.L = 0xe0;		/* (224)	R0=0xff9000e0(-7339808) */
ffa013f0:	00 e3 90 03 	CALL 0xffa01b10 <_printf_str>;
ffa013f4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c10(-4191216) */
ffa013f8:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa013fc:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa01400:	10 97       	W[P2] = R0;
ffa01402:	20 e1 50 02 	R0 = 0x250 (X);		/*		R0=0x250(592) */
ffa01406:	22 6c       	P2 += 0x4;		/* (  4) */
ffa01408:	10 97       	W[P2] = R0;
ffa0140a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00704(-4192508) */
ffa0140e:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa01410:	0a e1 08 15 	P2.L = 0x1508;		/* (5384)	P2=0xffc01508(-4188920) */
ffa01414:	10 97       	W[P2] = R0;
ffa01416:	24 00       	SSYNC;
ffa01418:	27 e1 7f 00 	R7 = 0x7f (X);		/*		R7=0x7f(127) */
ffa0141c:	2a 99       	R2 = B[P5] (Z);
ffa0141e:	ba 54       	R2 = R2 & R7;
ffa01420:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa01422:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa01424:	ff e3 d4 f8 	CALL 0xffa005cc <_radio_init>;
ffa01428:	2a 99       	R2 = B[P5] (Z);
ffa0142a:	ba 54       	R2 = R2 & R7;
ffa0142c:	01 61       	R1 = 0x20 (X);		/*		R1=0x20( 32) */
ffa0142e:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa01432:	ff e3 cd f8 	CALL 0xffa005cc <_radio_init>;
ffa01436:	2a 99       	R2 = B[P5] (Z);
ffa01438:	ba 54       	R2 = R2 & R7;
ffa0143a:	21 e1 00 01 	R1 = 0x100 (X);		/*		R1=0x100(256) */
ffa0143e:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa01442:	ff e3 c5 f8 	CALL 0xffa005cc <_radio_init>;
ffa01446:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff901508 */
ffa0144a:	0a e1 3c 0c 	P2.L = 0xc3c;		/* (3132)	P2=0xff900c3c <_g_sampR> */
ffa0144e:	16 93       	[P2] = R6;
ffa01450:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c3c <_g_sampR> */
ffa01454:	0a e1 20 0c 	P2.L = 0xc20;		/* (3104)	P2=0xff900c20 <_g_sampW> */
ffa01458:	16 93       	[P2] = R6;
ffa0145a:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa0145c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0145e:	ff e3 e5 f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa01462:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa01466:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01468:	ff e3 e0 f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa0146c:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa01470:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa01474:	ff e3 da f7 	CALL 0xffa00428 <_radio_set_rx>;
ffa01478:	28 91       	R0 = [P5];
ffa0147a:	38 4e       	R0 >>= 0x7;
ffa0147c:	00 4b       	BITTGL (R0, 0x0);		/* bit  0 */
ffa0147e:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc00c20(-4191200) */
ffa01482:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa01484:	05 60       	R5 = 0x0 (X);		/*		R5=0x0(  0) */
ffa01486:	46 43       	R6 = R0.B (Z);
ffa01488:	0b e1 0c 07 	P3.L = 0x70c;		/* (1804)	P3=0xffc0070c(-4192500) */
ffa0148c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c20 <_g_sampW> */
ffa01490:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa01494:	10 99       	R0 = B[P2] (Z);
ffa01496:	00 0c       	CC = R0 == 0x0;
ffa01498:	89 1f       	IF CC JUMP 0xffa013aa <_main+0x34e> (BP);
ffa0149a:	f0 b9       	R0 = [FP -0x4];
ffa0149c:	ff e3 30 fc 	CALL 0xffa00cfc <_eth_listen>;
ffa014a0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c40(-4191168) */
ffa014a4:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014a8:	10 95       	R0 = W[P2] (Z);
ffa014aa:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa014ac:	01 54       	R0 = R1 & R0;
ffa014ae:	00 0c       	CC = R0 == 0x0;
ffa014b0:	3f 18       	IF CC JUMP 0xffa0152e <_main+0x4d2>;
ffa014b2:	00 00       	NOP;
ffa014b4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa014b8:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014bc:	10 95       	R0 = W[P2] (Z);
ffa014be:	28 48       	CC = !BITTST (R0, 0x5);		/* bit  5 */
ffa014c0:	44 18       	IF CC JUMP 0xffa01548 <_main+0x4ec>;
ffa014c2:	00 00       	NOP;
ffa014c4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa014c8:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014cc:	10 95       	R0 = W[P2] (Z);
ffa014ce:	04 54       	R0 = R4 & R0;
ffa014d0:	00 0c       	CC = R0 == 0x0;
ffa014d2:	4b 18       	IF CC JUMP 0xffa01568 <_main+0x50c>;
ffa014d4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa014d8:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa014dc:	21 e1 28 01 	R1 = 0x128 (X);		/*		R1=0x128(296) */
ffa014e0:	10 95       	R0 = W[P2] (Z);
ffa014e2:	01 54       	R0 = R1 & R0;
ffa014e4:	08 08       	CC = R0 == R1;
ffa014e6:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa014e8:	38 07       	IF CC R7 = R0;
ffa014ea:	20 e1 50 02 	R0 = 0x250 (X);		/*		R0=0x250(592) */
ffa014ee:	42 6c       	P2 += 0x8;		/* (  8) */
ffa014f0:	10 97       	W[P2] = R0;
ffa014f2:	ff e3 5b f6 	CALL 0xffa001a8 <_ustimer>;
ffa014f6:	08 4e       	R0 >>= 0x1;
ffa014f8:	21 e1 81 f7 	R1 = -0x87f (X);		/*		R1=0xfffff781(-2175) */
ffa014fc:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa01500:	41 e1 0b e5 	R1.H = 0xe50b;		/* (-6901)	R1=0xe50bf781(-452200575) */
ffa01504:	01 e1 81 f7 	R1.L = 0xf781;		/* (-2175)	R1=0xe50bf781(-452200575) */
ffa01508:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0150c:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa01510:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa01514:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa01518:	0b c4 3f 80 	A0 += A1;
ffa0151c:	8b c0 00 38 	R0 = A0 (FU);
ffa01520:	58 4e       	R0 >>= 0xb;
ffa01522:	28 08       	CC = R0 == R5;
ffa01524:	b4 1b       	IF CC JUMP 0xffa0148c <_main+0x430>;
ffa01526:	4c 30       	R1 = P4;
ffa01528:	19 97       	W[P3] = R1;
ffa0152a:	28 30       	R5 = R0;
ffa0152c:	b0 2f       	JUMP.S 0xffa0148c <_main+0x430>;
ffa0152e:	7a 43       	R2 = R7.B (Z);
ffa01530:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa01532:	f6 b0       	[SP + 0xc] = R6;
ffa01534:	ff e3 0e fc 	CALL 0xffa00d50 <_getRadioPacket>;
ffa01538:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa0153c:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa01540:	10 95       	R0 = W[P2] (Z);
ffa01542:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa01544:	28 48       	CC = !BITTST (R0, 0x5);		/* bit  5 */
ffa01546:	bf 17       	IF !CC JUMP 0xffa014c4 <_main+0x468> (BP);
ffa01548:	7a 43       	R2 = R7.B (Z);
ffa0154a:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa0154e:	f6 b0       	[SP + 0xc] = R6;
ffa01550:	01 61       	R1 = 0x20 (X);		/*		R1=0x20( 32) */
ffa01552:	ff e3 ff fb 	CALL 0xffa00d50 <_getRadioPacket>;
ffa01556:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa0155a:	0a e1 00 07 	P2.L = 0x700;		/* (1792)	P2=0xffc00700(-4192512) */
ffa0155e:	10 95       	R0 = W[P2] (Z);
ffa01560:	04 54       	R0 = R4 & R0;
ffa01562:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa01564:	00 0c       	CC = R0 == 0x0;
ffa01566:	b7 17       	IF !CC JUMP 0xffa014d4 <_main+0x478> (BP);
ffa01568:	7a 43       	R2 = R7.B (Z);
ffa0156a:	f6 b0       	[SP + 0xc] = R6;
ffa0156c:	20 e1 00 02 	R0 = 0x200 (X);		/*		R0=0x200(512) */
ffa01570:	21 e1 00 01 	R1 = 0x100 (X);		/*		R1=0x100(256) */
ffa01574:	ff e3 ee fb 	CALL 0xffa00d50 <_getRadioPacket>;
ffa01578:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa0157a:	ad 2f       	JUMP.S 0xffa014d4 <_main+0x478>;
ffa0157c:	00 e3 58 10 	CALL 0xffa0362c <_DHCP_req>;
ffa01580:	70 2e       	JUMP.S 0xffa01260 <_main+0x204>;
	...

ffa01584 <___divsi3>:
ffa01584:	c8 58       	R3 = R0 ^ R1;
ffa01586:	07 c4 00 80 	R0 = ABS R0;
ffa0158a:	18 03       	CC = V;
ffa0158c:	82 c6 fb c7 	R3 = ROT R3 BY -0x1;
ffa01590:	07 c4 08 82 	R1 = ABS R1;
ffa01594:	88 08       	CC = R0 < R1;
ffa01596:	76 18       	IF CC JUMP 0xffa01682 <___divsi3+0xfe>;
ffa01598:	82 c6 89 85 	R2 = R1 >> 0xf;
ffa0159c:	0a 02       	CC = R2;
ffa0159e:	1e 18       	IF CC JUMP 0xffa015da <___divsi3+0x56>;
ffa015a0:	82 c6 81 84 	R2 = R1 << 0x10;
ffa015a4:	02 09       	CC = R2 <= R0;
ffa015a6:	1a 18       	IF CC JUMP 0xffa015da <___divsi3+0x56>;
ffa015a8:	48 42       	DIVS (R0, R1);
ffa015aa:	08 42       	DIVQ (R0, R1);
ffa015ac:	08 42       	DIVQ (R0, R1);
ffa015ae:	08 42       	DIVQ (R0, R1);
ffa015b0:	08 42       	DIVQ (R0, R1);
ffa015b2:	08 42       	DIVQ (R0, R1);
ffa015b4:	08 42       	DIVQ (R0, R1);
ffa015b6:	08 42       	DIVQ (R0, R1);
ffa015b8:	08 42       	DIVQ (R0, R1);
ffa015ba:	08 42       	DIVQ (R0, R1);
ffa015bc:	08 42       	DIVQ (R0, R1);
ffa015be:	08 42       	DIVQ (R0, R1);
ffa015c0:	08 42       	DIVQ (R0, R1);
ffa015c2:	08 42       	DIVQ (R0, R1);
ffa015c4:	08 42       	DIVQ (R0, R1);
ffa015c6:	08 42       	DIVQ (R0, R1);
ffa015c8:	08 42       	DIVQ (R0, R1);
ffa015ca:	c0 42       	R0 = R0.L (Z);
ffa015cc:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa015d0:	08 50       	R0 = R0 + R1;
ffa015d2:	81 43       	R1 = -R0;
ffa015d4:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa015d6:	01 07       	IF CC R0 = R1;
ffa015d8:	10 00       	RTS;
ffa015da:	01 0c       	CC = R1 == 0x0;
ffa015dc:	34 18       	IF CC JUMP 0xffa01644 <___divsi3+0xc0>;
ffa015de:	00 0c       	CC = R0 == 0x0;
ffa015e0:	3f 18       	IF CC JUMP 0xffa0165e <___divsi3+0xda>;
ffa015e2:	08 08       	CC = R0 == R1;
ffa015e4:	30 18       	IF CC JUMP 0xffa01644 <___divsi3+0xc0>;
ffa015e6:	09 0c       	CC = R1 == 0x1;
ffa015e8:	2e 18       	IF CC JUMP 0xffa01644 <___divsi3+0xc0>;
ffa015ea:	06 c6 01 c4 	R2.L = ONES R1;
ffa015ee:	d2 42       	R2 = R2.L (Z);
ffa015f0:	0a 0c       	CC = R2 == 0x1;
ffa015f2:	37 18       	IF CC JUMP 0xffa01660 <___divsi3+0xdc>;
ffa015f4:	f9 68       	P1 = 0x1f (X);		/*		P1=0x1f( 31) */
ffa015f6:	68 05       	[--SP] = (R7:5);
ffa015f8:	8a 43       	R2 = -R1;
ffa015fa:	42 01       	[--SP] = R2;
ffa015fc:	82 c6 08 84 	R2 = R0 << 0x1;
ffa01600:	88 59       	R6 = R0 ^ R1;
ffa01602:	82 c6 0e 8b 	R5 = R6 >> 0x1f;
ffa01606:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01608:	aa 56       	R2 = R2 | R5;
ffa0160a:	88 59       	R6 = R0 ^ R1;
ffa0160c:	a2 e0 12 10 	LSETUP(0xffa01610 <___divsi3+0x8c>, 0xffa01630 <___divsi3+0xac>) LC0 = P1;
ffa01610:	82 c6 0a 8f 	R7 = R2 >> 0x1f;
ffa01614:	82 c6 0a 84 	R2 = R2 << 0x1;
ffa01618:	82 ce 08 80 	R0 = R0 << 0x1 || R5 = [SP] || NOP;
ffa0161c:	35 91 00 00 
ffa01620:	38 56       	R0 = R0 | R7;
ffa01622:	86 0c       	CC = R6 < 0x0;
ffa01624:	29 07       	IF CC R5 = R1;
ffa01626:	28 50       	R0 = R0 + R5;
ffa01628:	88 59       	R6 = R0 ^ R1;
ffa0162a:	82 c6 0e 8b 	R5 = R6 >> 0x1f;
ffa0162e:	05 4b       	BITTGL (R5, 0x0);		/* bit  0 */
ffa01630:	aa 50       	R2 = R2 + R5;
ffa01632:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa01636:	8a 50       	R2 = R2 + R1;
ffa01638:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa0163a:	90 43       	R0 = -R2;
ffa0163c:	02 06       	IF !CC R0 = R2;
ffa0163e:	26 6c       	SP += 0x4;		/* (  4) */
ffa01640:	28 05       	(R7:5) = [SP++];
ffa01642:	10 00       	RTS;
ffa01644:	01 0c       	CC = R1 == 0x0;
ffa01646:	fa 63       	R2 = -0x1 (X);		/*		R2=0xffffffff( -1) */
ffa01648:	0a 4e       	R2 >>= 0x1;
ffa0164a:	06 18       	IF CC JUMP 0xffa01656 <___divsi3+0xd2>;
ffa0164c:	08 08       	CC = R0 == R1;
ffa0164e:	82 e1 01 00 	R2 = 0x1 (Z);		/*		R2=0x1(  1) */
ffa01652:	02 18       	IF CC JUMP 0xffa01656 <___divsi3+0xd2>;
ffa01654:	10 30       	R2 = R0;
ffa01656:	02 30       	R0 = R2;
ffa01658:	92 43       	R2 = -R2;
ffa0165a:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa0165c:	02 07       	IF CC R0 = R2;
ffa0165e:	10 00       	RTS;
ffa01660:	82 c6 08 85 	R2 = R0 >> 0x1f;
ffa01664:	81 0c       	CC = R1 < 0x0;
ffa01666:	f8 1b       	IF CC JUMP 0xffa01656 <___divsi3+0xd2>;
ffa01668:	05 c6 01 02 	R1.L = SIGNBITS R1;
ffa0166c:	c9 42       	R1 = R1.L (Z);
ffa0166e:	11 67       	R1 += -0x1e;		/* (-30) */
ffa01670:	02 c6 08 80 	R0 = LSHIFT R0 BY R1.L;
ffa01674:	82 c6 0b 83 	R1 = R3 >> 0x1f;
ffa01678:	08 50       	R0 = R0 + R1;
ffa0167a:	82 43       	R2 = -R0;
ffa0167c:	f3 49       	CC = BITTST (R3, 0x1e);		/* bit 30 */
ffa0167e:	02 07       	IF CC R0 = R2;
ffa01680:	10 00       	RTS;
ffa01682:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01684:	10 00       	RTS;
	...

ffa01688 <_uart_str>:
ffa01688:	e3 05       	[--SP] = (R7:4, P5:3);
ffa0168a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00700(-4192512) */
ffa0168e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01692:	20 32       	P4 = R0;
ffa01694:	0a e1 24 04 	P2.L = 0x424;		/* (1060)	P2=0xffc00424(-4193244) */
ffa01698:	10 95       	R0 = W[P2] (Z);
ffa0169a:	c0 42       	R0 = R0.L (Z);
ffa0169c:	08 0c       	CC = R0 == 0x1;
ffa0169e:	71 18       	IF CC JUMP 0xffa01780 <_uart_str+0xf8>;
ffa016a0:	00 00       	NOP;
ffa016a2:	00 00       	NOP;
ffa016a4:	00 00       	NOP;
ffa016a6:	63 99       	R3 = B[P4] (X);
ffa016a8:	08 61       	R0 = 0x21 (X);		/*		R0=0x21( 33) */
ffa016aa:	03 08       	CC = R3 == R0;
ffa016ac:	07 18       	IF CC JUMP 0xffa016ba <_uart_str+0x32>;
ffa016ae:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa016b0:	06 30       	R0 = R6;
ffa016b2:	01 e8 00 00 	UNLINK;
ffa016b6:	a3 05       	(R7:4, P5:3) = [SP++];
ffa016b8:	10 00       	RTS;
ffa016ba:	a2 e5 01 00 	R2 = B[P4 + 0x1] (X);
ffa016be:	17 43       	R7 = R2.B (X);
ffa016c0:	07 0c       	CC = R7 == 0x0;
ffa016c2:	f6 1b       	IF CC JUMP 0xffa016ae <_uart_str+0x26>;
ffa016c4:	6c 32       	P5 = P4;
ffa016c6:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff908000 */
ffa016ca:	15 6c       	P5 += 0x2;		/* (  2) */
ffa016cc:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa016ce:	24 e1 bf ff 	R4 = -0x41 (X);		/*		R4=0xffffffbf(-65) */
ffa016d2:	25 e1 9f ff 	R5 = -0x61 (X);		/*		R5=0xffffff9f(-97) */
ffa016d6:	0c e1 0c 0c 	P4.L = 0xc0c;		/* (3084)	P4=0xff900c0c <__bss_start> */
ffa016da:	2b e1 80 ff 	P3 = -0x80 (X);		/*		P3=0xffffff80(-128) */
ffa016de:	2c 20       	JUMP.S 0xffa01736 <_uart_str+0xae>;
ffa016e0:	68 60       	R0 = 0xd (X);		/*		R0=0xd( 13) */
ffa016e2:	07 08       	CC = R7 == R0;
ffa016e4:	35 18       	IF CC JUMP 0xffa0174e <_uart_str+0xc6>;
ffa016e6:	22 50       	R0 = R2 + R4;
ffa016e8:	40 43       	R0 = R0.B (Z);
ffa016ea:	c9 60       	R1 = 0x19 (X);		/*		R1=0x19( 25) */
ffa016ec:	08 0a       	CC = R0 <= R1 (IU);
ffa016ee:	37 1c       	IF CC JUMP 0xffa0175c <_uart_str+0xd4> (BP);
ffa016f0:	03 61       	R3 = 0x20 (X);		/*		R3=0x20( 32) */
ffa016f2:	15 50       	R0 = R5 + R2;
ffa016f4:	40 43       	R0 = R0.B (Z);
ffa016f6:	c9 60       	R1 = 0x19 (X);		/*		R1=0x19( 25) */
ffa016f8:	08 0a       	CC = R0 <= R1 (IU);
ffa016fa:	02 30       	R0 = R2;
ffa016fc:	11 43       	R1 = R2.B (X);
ffa016fe:	80 66       	R0 += -0x30;		/* (-48) */
ffa01700:	19 07       	IF CC R3 = R1;
ffa01702:	40 43       	R0 = R0.B (Z);
ffa01704:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01706:	10 0a       	CC = R0 <= R2 (IU);
ffa01708:	19 07       	IF CC R3 = R1;
ffa0170a:	60 61       	R0 = 0x2c (X);		/*		R0=0x2c( 44) */
ffa0170c:	07 08       	CC = R7 == R0;
ffa0170e:	2f 18       	IF CC JUMP 0xffa0176c <_uart_str+0xe4>;
ffa01710:	09 61       	R1 = 0x21 (X);		/*		R1=0x21( 33) */
ffa01712:	0f 08       	CC = R7 == R1;
ffa01714:	26 18       	IF CC JUMP 0xffa01760 <_uart_str+0xd8>;
ffa01716:	fa 61       	R2 = 0x3f (X);		/*		R2=0x3f( 63) */
ffa01718:	17 08       	CC = R7 == R2;
ffa0171a:	88 10       	IF !CC JUMP 0xffa0182a <_uart_str+0x1a2>;
ffa0171c:	20 e1 3f 02 	R0 = 0x23f (X);		/*		R0=0x23f(575) */
ffa01720:	ff e3 f0 f8 	CALL 0xffa00900 <_oled_write>;
ffa01724:	6a 98       	R2 = B[P5++] (X);
ffa01726:	17 43       	R7 = R2.B (X);
ffa01728:	0e 64       	R6 += 0x1;		/* (  1) */
ffa0172a:	07 0c       	CC = R7 == 0x0;
ffa0172c:	c2 1b       	IF CC JUMP 0xffa016b0 <_uart_str+0x28>;
ffa0172e:	20 e1 00 04 	R0 = 0x400 (X);		/*		R0=0x400(1024) */
ffa01732:	06 08       	CC = R6 == R0;
ffa01734:	be 1b       	IF CC JUMP 0xffa016b0 <_uart_str+0x28>;
ffa01736:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01738:	0f 08       	CC = R7 == R1;
ffa0173a:	d3 17       	IF !CC JUMP 0xffa016e0 <_uart_str+0x58> (BP);
ffa0173c:	20 99       	R0 = B[P4] (Z);
ffa0173e:	30 48       	CC = !BITTST (R0, 0x6);		/* bit  6 */
ffa01740:	18 1c       	IF CC JUMP 0xffa01770 <_uart_str+0xe8> (BP);
ffa01742:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900424 */
ffa01746:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01748:	0a e1 0c 0c 	P2.L = 0xc0c;		/* (3084)	P2=0xff900c0c <__bss_start> */
ffa0174c:	10 9b       	B[P2] = R0;
ffa0174e:	60 99       	R0 = B[P4] (X);
ffa01750:	4b 30       	R1 = P3;
ffa01752:	08 56       	R0 = R0 | R1;
ffa01754:	40 43       	R0 = R0.B (Z);
ffa01756:	ff e3 d5 f8 	CALL 0xffa00900 <_oled_write>;
ffa0175a:	e5 2f       	JUMP.S 0xffa01724 <_uart_str+0x9c>;
ffa0175c:	13 43       	R3 = R2.B (X);
ffa0175e:	ca 2f       	JUMP.S 0xffa016f2 <_uart_str+0x6a>;
ffa01760:	0b 61       	R3 = 0x21 (X);		/*		R3=0x21( 33) */
ffa01762:	22 e1 00 02 	R2 = 0x200 (X);		/*		R2=0x200(512) */
ffa01766:	13 50       	R0 = R3 + R2;
ffa01768:	c0 42       	R0 = R0.L (Z);
ffa0176a:	db 2f       	JUMP.S 0xffa01720 <_uart_str+0x98>;
ffa0176c:	63 61       	R3 = 0x2c (X);		/*		R3=0x2c( 44) */
ffa0176e:	fa 2f       	JUMP.S 0xffa01762 <_uart_str+0xda>;
ffa01770:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c0c <__bss_start> */
ffa01774:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa01778:	0a e1 0c 0c 	P2.L = 0xc0c;		/* (3084)	P2=0xff900c0c <__bss_start> */
ffa0177c:	10 9b       	B[P2] = R0;
ffa0177e:	e8 2f       	JUMP.S 0xffa0174e <_uart_str+0xc6>;
ffa01780:	63 99       	R3 = B[P4] (X);
ffa01782:	08 61       	R0 = 0x21 (X);		/*		R0=0x21( 33) */
ffa01784:	03 08       	CC = R3 == R0;
ffa01786:	58 18       	IF CC JUMP 0xffa01836 <_uart_str+0x1ae>;
ffa01788:	00 00       	NOP;
ffa0178a:	00 00       	NOP;
ffa0178c:	54 32       	P2 = P4;
ffa0178e:	50 99       	R0 = B[P2] (X);
ffa01790:	01 43       	R1 = R0.B (X);
ffa01792:	01 0c       	CC = R1 == 0x0;
ffa01794:	8a 1b       	IF CC JUMP 0xffa016a8 <_uart_str+0x20>;
ffa01796:	42 32       	P0 = P2;
ffa01798:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc00c08(-4191224) */
ffa0179c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c0c(-4191220) */
ffa017a0:	08 6c       	P0 += 0x1;		/* (  1) */
ffa017a2:	0d e1 00 04 	P5.L = 0x400;		/* (1024)	P5=0xffc00400(-4193280) */
ffa017a6:	0a e1 14 04 	P2.L = 0x414;		/* (1044)	P2=0xffc00414(-4193260) */
ffa017aa:	02 61       	R2 = 0x20 (X);		/*		R2=0x20( 32) */
ffa017ac:	57 60       	R7 = 0xa (X);		/*		R7=0xa( 10) */
ffa017ae:	6e 60       	R6 = 0xd (X);		/*		R6=0xd( 13) */
ffa017b0:	29 e1 00 04 	P1 = 0x400 (X);		/*		P1=0x400(1024) */
ffa017b4:	55 60       	R5 = 0xa (X);		/*		R5=0xa( 10) */
ffa017b6:	b2 e0 19 10 	LSETUP(0xffa017ba <_uart_str+0x132>, 0xffa017e8 <_uart_str+0x160>) LC1 = P1;
ffa017ba:	29 08       	CC = R1 == R5;
ffa017bc:	18 18       	IF CC JUMP 0xffa017ec <_uart_str+0x164>;
ffa017be:	00 00       	NOP;
ffa017c0:	00 43       	R0 = R0.B (X);
ffa017c2:	28 97       	W[P5] = R0;
ffa017c4:	10 95       	R0 = W[P2] (Z);
ffa017c6:	02 54       	R0 = R2 & R0;
ffa017c8:	00 0c       	CC = R0 == 0x0;
ffa017ca:	0b 10       	IF !CC JUMP 0xffa017e0 <_uart_str+0x158>;
ffa017cc:	00 00       	NOP;
ffa017ce:	00 00       	NOP;
ffa017d0:	42 34       	I0 = P2;
ffa017d2:	00 00       	NOP;
ffa017d4:	00 00       	NOP;
ffa017d6:	20 9d       	R0.L = W[I0];
ffa017d8:	02 54       	R0 = R2 & R0;
ffa017da:	00 0c       	CC = R0 == 0x0;
ffa017dc:	fb 1f       	IF CC JUMP 0xffa017d2 <_uart_str+0x14a> (BP);
ffa017de:	90 32       	P2 = I0;
ffa017e0:	40 98       	R0 = B[P0++] (X);
ffa017e2:	01 43       	R1 = R0.B (X);
ffa017e4:	01 0c       	CC = R1 == 0x0;
ffa017e6:	61 1b       	IF CC JUMP 0xffa016a8 <_uart_str+0x20>;
ffa017e8:	00 00       	NOP;
ffa017ea:	5f 2f       	JUMP.S 0xffa016a8 <_uart_str+0x20>;
ffa017ec:	2f 97       	W[P5] = R7;
ffa017ee:	10 95       	R0 = W[P2] (Z);
ffa017f0:	02 54       	R0 = R2 & R0;
ffa017f2:	00 0c       	CC = R0 == 0x0;
ffa017f4:	0b 10       	IF !CC JUMP 0xffa0180a <_uart_str+0x182>;
ffa017f6:	00 00       	NOP;
ffa017f8:	00 00       	NOP;
ffa017fa:	42 34       	I0 = P2;
ffa017fc:	00 00       	NOP;
ffa017fe:	00 00       	NOP;
ffa01800:	20 9d       	R0.L = W[I0];
ffa01802:	02 54       	R0 = R2 & R0;
ffa01804:	00 0c       	CC = R0 == 0x0;
ffa01806:	fb 1f       	IF CC JUMP 0xffa017fc <_uart_str+0x174> (BP);
ffa01808:	90 32       	P2 = I0;
ffa0180a:	2e 97       	W[P5] = R6;
ffa0180c:	10 95       	R0 = W[P2] (Z);
ffa0180e:	02 54       	R0 = R2 & R0;
ffa01810:	00 0c       	CC = R0 == 0x0;
ffa01812:	e7 13       	IF !CC JUMP 0xffa017e0 <_uart_str+0x158>;
ffa01814:	00 00       	NOP;
ffa01816:	00 00       	NOP;
ffa01818:	42 34       	I0 = P2;
ffa0181a:	00 00       	NOP;
ffa0181c:	00 00       	NOP;
ffa0181e:	20 9d       	R0.L = W[I0];
ffa01820:	02 54       	R0 = R2 & R0;
ffa01822:	00 0c       	CC = R0 == 0x0;
ffa01824:	fb 1f       	IF CC JUMP 0xffa0181a <_uart_str+0x192> (BP);
ffa01826:	90 32       	P2 = I0;
ffa01828:	dc 2f       	JUMP.S 0xffa017e0 <_uart_str+0x158>;
ffa0182a:	d0 61       	R0 = 0x3a (X);		/*		R0=0x3a( 58) */
ffa0182c:	07 08       	CC = R7 == R0;
ffa0182e:	07 10       	IF !CC JUMP 0xffa0183c <_uart_str+0x1b4>;
ffa01830:	20 e1 3a 02 	R0 = 0x23a (X);		/*		R0=0x23a(570) */
ffa01834:	76 2f       	JUMP.S 0xffa01720 <_uart_str+0x98>;
ffa01836:	54 32       	P2 = P4;
ffa01838:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa0183a:	aa 2f       	JUMP.S 0xffa0178e <_uart_str+0x106>;
ffa0183c:	71 61       	R1 = 0x2e (X);		/*		R1=0x2e( 46) */
ffa0183e:	0f 08       	CC = R7 == R1;
ffa01840:	91 13       	IF !CC JUMP 0xffa01762 <_uart_str+0xda>;
ffa01842:	20 e1 2e 02 	R0 = 0x22e (X);		/*		R0=0x22e(558) */
ffa01846:	6d 2f       	JUMP.S 0xffa01720 <_uart_str+0x98>;

ffa01848 <_printf_newline>:
ffa01848:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0184c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90022e(-7339474) */
ffa01850:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa01854:	01 e8 00 00 	UNLINK;
ffa01858:	ff e2 18 ff 	JUMP.L 0xffa01688 <_uart_str>;

ffa0185c <_printf_hex_byte>:
ffa0185c:	fc 05       	[--SP] = (R7:7, P5:4);
ffa0185e:	39 30       	R7 = R1;
ffa01860:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01864:	28 32       	P5 = R0;
ffa01866:	00 e3 c1 01 	CALL 0xffa01be8 <_strlen_>;
ffa0186a:	08 30       	R1 = R0;
ffa0186c:	20 e1 fb 03 	R0 = 0x3fb (X);		/*		R0=0x3fb(1019) */
ffa01870:	01 09       	CC = R1 <= R0;
ffa01872:	3d 10       	IF !CC JUMP 0xffa018ec <_printf_hex_byte+0x90>;
ffa01874:	01 0d       	CC = R1 <= 0x0;
ffa01876:	44 18       	IF CC JUMP 0xffa018fe <_printf_hex_byte+0xa2>;
ffa01878:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900c0c <__bss_start> */
ffa0187c:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa0187e:	0c e1 6c 0e 	P4.L = 0xe6c;		/* (3692)	P4=0xff900e6c <_printf_out> */
ffa01882:	09 32       	P1 = R1;
ffa01884:	b2 e0 06 10 	LSETUP(0xffa01888 <_printf_hex_byte+0x2c>, 0xffa01890 <_printf_hex_byte+0x34>) LC1 = P1;
ffa01888:	62 91       	P2 = [P4];
ffa0188a:	68 98       	R0 = B[P5++] (X);
ffa0188c:	82 5a       	P2 = P2 + P0;
ffa0188e:	10 9b       	B[P2] = R0;
ffa01890:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01892:	09 32       	P1 = R1;
ffa01894:	62 91       	P2 = [P4];
ffa01896:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01898:	79 43       	R1 = R7.B (Z);
ffa0189a:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa0189c:	8a 5a       	P2 = P2 + P1;
ffa0189e:	10 9b       	B[P2] = R0;
ffa018a0:	62 91       	P2 = [P4];
ffa018a2:	09 6c       	P1 += 0x1;		/* (  1) */
ffa018a4:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa018a8:	8a 5a       	P2 = P2 + P1;
ffa018aa:	10 9b       	B[P2] = R0;
ffa018ac:	82 c6 e1 81 	R0 = R1 >> 0x4;
ffa018b0:	09 6c       	P1 += 0x1;		/* (  1) */
ffa018b2:	10 09       	CC = R0 <= R2;
ffa018b4:	23 14       	IF !CC JUMP 0xffa018fa <_printf_hex_byte+0x9e> (BP);
ffa018b6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa018b8:	62 91       	P2 = [P4];
ffa018ba:	8a 5a       	P2 = P2 + P1;
ffa018bc:	10 9b       	B[P2] = R0;
ffa018be:	78 60       	R0 = 0xf (X);		/*		R0=0xf( 15) */
ffa018c0:	01 54       	R0 = R1 & R0;
ffa018c2:	49 60       	R1 = 0x9 (X);		/*		R1=0x9(  9) */
ffa018c4:	08 09       	CC = R0 <= R1;
ffa018c6:	18 1c       	IF CC JUMP 0xffa018f6 <_printf_hex_byte+0x9a> (BP);
ffa018c8:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa018ca:	62 91       	P2 = [P4];
ffa018cc:	8a 5a       	P2 = P2 + P1;
ffa018ce:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa018d2:	62 91       	P2 = [P4];
ffa018d4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa018d6:	8a 5a       	P2 = P2 + P1;
ffa018d8:	90 e6 02 00 	B[P2 + 0x2] = R0;
ffa018dc:	20 91       	R0 = [P4];
ffa018de:	ff e3 d5 fe 	CALL 0xffa01688 <_uart_str>;
ffa018e2:	01 e8 00 00 	UNLINK;
ffa018e6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa018e8:	bc 05       	(R7:7, P5:4) = [SP++];
ffa018ea:	10 00       	RTS;
ffa018ec:	01 e8 00 00 	UNLINK;
ffa018f0:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa018f2:	bc 05       	(R7:7, P5:4) = [SP++];
ffa018f4:	10 00       	RTS;
ffa018f6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa018f8:	e9 2f       	JUMP.S 0xffa018ca <_printf_hex_byte+0x6e>;
ffa018fa:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa018fc:	de 2f       	JUMP.S 0xffa018b8 <_printf_hex_byte+0x5c>;
ffa018fe:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e6c <_printf_out> */
ffa01902:	0c e1 6c 0e 	P4.L = 0xe6c;		/* (3692)	P4=0xff900e6c <_printf_out> */
ffa01906:	c6 2f       	JUMP.S 0xffa01892 <_printf_hex_byte+0x36>;

ffa01908 <_printf_hex>:
ffa01908:	fb 05       	[--SP] = (R7:7, P5:3);
ffa0190a:	39 30       	R7 = R1;
ffa0190c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01910:	28 32       	P5 = R0;
ffa01912:	00 e3 6b 01 	CALL 0xffa01be8 <_strlen_>;
ffa01916:	08 30       	R1 = R0;
ffa01918:	20 e1 f5 03 	R0 = 0x3f5 (X);		/*		R0=0x3f5(1013) */
ffa0191c:	01 09       	CC = R1 <= R0;
ffa0191e:	46 10       	IF !CC JUMP 0xffa019aa <_printf_hex+0xa2>;
ffa01920:	01 0d       	CC = R1 <= 0x0;
ffa01922:	49 18       	IF CC JUMP 0xffa019b4 <_printf_hex+0xac>;
ffa01924:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e6c <_printf_out> */
ffa01928:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa0192a:	0c e1 6c 0e 	P4.L = 0xe6c;		/* (3692)	P4=0xff900e6c <_printf_out> */
ffa0192e:	09 32       	P1 = R1;
ffa01930:	b2 e0 06 10 	LSETUP(0xffa01934 <_printf_hex+0x2c>, 0xffa0193c <_printf_hex+0x34>) LC1 = P1;
ffa01934:	62 91       	P2 = [P4];
ffa01936:	68 98       	R0 = B[P5++] (X);
ffa01938:	82 5a       	P2 = P2 + P0;
ffa0193a:	10 9b       	B[P2] = R0;
ffa0193c:	08 6c       	P0 += 0x1;		/* (  1) */
ffa0193e:	09 32       	P1 = R1;
ffa01940:	62 91       	P2 = [P4];
ffa01942:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01944:	29 32       	P5 = R1;
ffa01946:	e1 60       	R1 = 0x1c (X);		/*		R1=0x1c( 28) */
ffa01948:	8a 5a       	P2 = P2 + P1;
ffa0194a:	10 9b       	B[P2] = R0;
ffa0194c:	62 91       	P2 = [P4];
ffa0194e:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01950:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa01954:	15 6c       	P5 += 0x2;		/* (  2) */
ffa01956:	8a 5a       	P2 = P2 + P1;
ffa01958:	10 9b       	B[P2] = R0;
ffa0195a:	7a 60       	R2 = 0xf (X);		/*		R2=0xf( 15) */
ffa0195c:	40 68       	P0 = 0x8 (X);		/*		P0=0x8(  8) */
ffa0195e:	4b 60       	R3 = 0x9 (X);		/*		R3=0x9(  9) */
ffa01960:	b2 e0 10 00 	LSETUP(0xffa01964 <_printf_hex+0x5c>, 0xffa01980 <_printf_hex+0x78>) LC1 = P0;
ffa01964:	07 30       	R0 = R7;
ffa01966:	08 40       	R0 >>>= R1;
ffa01968:	10 54       	R0 = R0 & R2;
ffa0196a:	18 09       	CC = R0 <= R3;
ffa0196c:	1d 1c       	IF CC JUMP 0xffa019a6 <_printf_hex+0x9e> (BP);
ffa0196e:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa01970:	62 91       	P2 = [P4];
ffa01972:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff90ff80 */
ffa01976:	0b e1 6c 0e 	P3.L = 0xe6c;		/* (3692)	P3=0xff900e6c <_printf_out> */
ffa0197a:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa0197c:	aa 5a       	P2 = P2 + P5;
ffa0197e:	10 9b       	B[P2] = R0;
ffa01980:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01982:	5a 91       	P2 = [P3];
ffa01984:	49 6c       	P1 += 0x9;		/* (  9) */
ffa01986:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa01988:	8a 5a       	P2 = P2 + P1;
ffa0198a:	10 9b       	B[P2] = R0;
ffa0198c:	5a 91       	P2 = [P3];
ffa0198e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01990:	8a 5a       	P2 = P2 + P1;
ffa01992:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa01996:	18 91       	R0 = [P3];
ffa01998:	ff e3 78 fe 	CALL 0xffa01688 <_uart_str>;
ffa0199c:	01 e8 00 00 	UNLINK;
ffa019a0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa019a2:	bb 05       	(R7:7, P5:3) = [SP++];
ffa019a4:	10 00       	RTS;
ffa019a6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa019a8:	e4 2f       	JUMP.S 0xffa01970 <_printf_hex+0x68>;
ffa019aa:	01 e8 00 00 	UNLINK;
ffa019ae:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa019b0:	bb 05       	(R7:7, P5:3) = [SP++];
ffa019b2:	10 00       	RTS;
ffa019b4:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e6c <_printf_out> */
ffa019b8:	0c e1 6c 0e 	P4.L = 0xe6c;		/* (3692)	P4=0xff900e6c <_printf_out> */
ffa019bc:	c1 2f       	JUMP.S 0xffa0193e <_printf_hex+0x36>;
	...

ffa019c0 <_printf_int>:
ffa019c0:	eb 05       	[--SP] = (R7:5, P5:3);
ffa019c2:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa019c6:	28 30       	R5 = R0;
ffa019c8:	39 30       	R7 = R1;
ffa019ca:	01 0c       	CC = R1 == 0x0;
ffa019cc:	45 14       	IF !CC JUMP 0xffa01a56 <_printf_int+0x96> (BP);
ffa019ce:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff90000d(-7340019) */
ffa019d2:	06 e1 68 0e 	R6.L = 0xe68;		/* (3688)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa019d6:	06 32       	P0 = R6;
ffa019d8:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa019da:	0c 68       	P4 = 0x1 (X);		/*		P4=0x1(  1) */
ffa019dc:	42 91       	P2 = [P0];
ffa019de:	10 9b       	B[P2] = R0;
ffa019e0:	05 30       	R0 = R5;
ffa019e2:	00 e3 03 01 	CALL 0xffa01be8 <_strlen_>;
ffa019e6:	08 30       	R1 = R0;
ffa019e8:	44 30       	R0 = P4;
ffa019ea:	81 50       	R2 = R1 + R0;
ffa019ec:	20 e1 ff 03 	R0 = 0x3ff (X);		/*		R0=0x3ff(1023) */
ffa019f0:	02 09       	CC = R2 <= R0;
ffa019f2:	50 10       	IF !CC JUMP 0xffa01a92 <_printf_int+0xd2>;
ffa019f4:	01 0d       	CC = R1 <= 0x0;
ffa019f6:	7d 18       	IF CC JUMP 0xffa01af0 <_printf_int+0x130>;
ffa019f8:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900e6c <_printf_out> */
ffa019fc:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa019fe:	0b e1 6c 0e 	P3.L = 0xe6c;		/* (3692)	P3=0xff900e6c <_printf_out> */
ffa01a02:	09 32       	P1 = R1;
ffa01a04:	b2 e0 08 10 	LSETUP(0xffa01a08 <_printf_int+0x48>, 0xffa01a14 <_printf_int+0x54>) LC1 = P1;
ffa01a08:	2d 32       	P5 = R5;
ffa01a0a:	5a 91       	P2 = [P3];
ffa01a0c:	0d 64       	R5 += 0x1;		/* (  1) */
ffa01a0e:	82 5a       	P2 = P2 + P0;
ffa01a10:	68 98       	R0 = B[P5++] (X);
ffa01a12:	10 9b       	B[P2] = R0;
ffa01a14:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01a16:	44 32       	P0 = P4;
ffa01a18:	29 32       	P5 = R1;
ffa01a1a:	f8 6f       	P0 += -0x1;		/* ( -1) */
ffa01a1c:	26 32       	P4 = R6;
ffa01a1e:	5a 91       	P2 = [P3];
ffa01a20:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff90001c(-7340004) */
ffa01a24:	01 e1 6c 0e 	R1.L = 0xe6c;		/* (3692)	R1=0xff900e6c <_printf_out>(-7336340) */
ffa01a28:	61 91       	P1 = [P4];
ffa01a2a:	aa 5a       	P2 = P2 + P5;
ffa01a2c:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01a2e:	41 5a       	P1 = P1 + P0;
ffa01a30:	48 99       	R0 = B[P1] (X);
ffa01a32:	f8 6f       	P0 += -0x1;		/* ( -1) */
ffa01a34:	10 9b       	B[P2] = R0;
ffa01a36:	78 0c       	CC = P0 == -0x1;
ffa01a38:	f2 17       	IF !CC JUMP 0xffa01a1c <_printf_int+0x5c> (BP);
ffa01a3a:	29 32       	P5 = R1;
ffa01a3c:	02 32       	P0 = R2;
ffa01a3e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01a40:	6a 91       	P2 = [P5];
ffa01a42:	82 5a       	P2 = P2 + P0;
ffa01a44:	10 9b       	B[P2] = R0;
ffa01a46:	28 91       	R0 = [P5];
ffa01a48:	ff e3 20 fe 	CALL 0xffa01688 <_uart_str>;
ffa01a4c:	01 e8 00 00 	UNLINK;
ffa01a50:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01a52:	ab 05       	(R7:5, P5:3) = [SP++];
ffa01a54:	10 00       	RTS;
ffa01a56:	01 0d       	CC = R1 <= 0x0;
ffa01a58:	22 18       	IF CC JUMP 0xffa01a9c <_printf_int+0xdc>;
ffa01a5a:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01a5e:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa01a60:	06 e1 68 0e 	R6.L = 0xe68;		/* (3688)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01a64:	05 20       	JUMP.S 0xffa01a6e <_printf_int+0xae>;
ffa01a66:	2a e1 80 00 	P2 = 0x80 (X);		/*		P2=0x80(128) */
ffa01a6a:	54 08       	CC = P4 == P2;
ffa01a6c:	ba 1b       	IF CC JUMP 0xffa019e0 <_printf_int+0x20>;
ffa01a6e:	07 30       	R0 = R7;
ffa01a70:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01a72:	00 e3 8b 00 	CALL 0xffa01b88 <_mod>;
ffa01a76:	0e 32       	P1 = R6;
ffa01a78:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01a7a:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01a7c:	4a 91       	P2 = [P1];
ffa01a7e:	a2 5a       	P2 = P2 + P4;
ffa01a80:	10 9b       	B[P2] = R0;
ffa01a82:	07 30       	R0 = R7;
ffa01a84:	00 e3 74 00 	CALL 0xffa01b6c <_div_>;
ffa01a88:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa01a8a:	38 30       	R7 = R0;
ffa01a8c:	00 0d       	CC = R0 <= 0x0;
ffa01a8e:	ec 17       	IF !CC JUMP 0xffa01a66 <_printf_int+0xa6> (BP);
ffa01a90:	a8 2f       	JUMP.S 0xffa019e0 <_printf_int+0x20>;
ffa01a92:	01 e8 00 00 	UNLINK;
ffa01a96:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa01a98:	ab 05       	(R7:5, P5:3) = [SP++];
ffa01a9a:	10 00       	RTS;
ffa01a9c:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa01a9e:	ff 4c       	BITCLR (R7, 0x1f);		/* bit 31 */
ffa01aa0:	f8 4f       	R0 <<= 0x1f;
ffa01aa2:	f8 53       	R7 = R0 - R7;
ffa01aa4:	07 0d       	CC = R7 <= 0x0;
ffa01aa6:	2e 18       	IF CC JUMP 0xffa01b02 <_printf_int+0x142>;
ffa01aa8:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01aac:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa01aae:	06 e1 68 0e 	R6.L = 0xe68;		/* (3688)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01ab2:	05 20       	JUMP.S 0xffa01abc <_printf_int+0xfc>;
ffa01ab4:	28 e1 80 00 	P0 = 0x80 (X);		/*		P0=0x80(128) */
ffa01ab8:	45 08       	CC = P5 == P0;
ffa01aba:	20 18       	IF CC JUMP 0xffa01afa <_printf_int+0x13a>;
ffa01abc:	26 32       	P4 = R6;
ffa01abe:	07 30       	R0 = R7;
ffa01ac0:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01ac2:	00 e3 63 00 	CALL 0xffa01b88 <_mod>;
ffa01ac6:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01ac8:	62 91       	P2 = [P4];
ffa01aca:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01acc:	aa 5a       	P2 = P2 + P5;
ffa01ace:	10 9b       	B[P2] = R0;
ffa01ad0:	07 30       	R0 = R7;
ffa01ad2:	00 e3 4d 00 	CALL 0xffa01b6c <_div_>;
ffa01ad6:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01ad8:	38 30       	R7 = R0;
ffa01ada:	00 0d       	CC = R0 <= 0x0;
ffa01adc:	ec 17       	IF !CC JUMP 0xffa01ab4 <_printf_int+0xf4> (BP);
ffa01ade:	65 32       	P4 = P5;
ffa01ae0:	4d 32       	P1 = P5;
ffa01ae2:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa01ae4:	2e 32       	P5 = R6;
ffa01ae6:	68 61       	R0 = 0x2d (X);		/*		R0=0x2d( 45) */
ffa01ae8:	6a 91       	P2 = [P5];
ffa01aea:	8a 5a       	P2 = P2 + P1;
ffa01aec:	10 9b       	B[P2] = R0;
ffa01aee:	79 2f       	JUMP.S 0xffa019e0 <_printf_int+0x20>;
ffa01af0:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900e6c <_printf_out> */
ffa01af4:	0b e1 6c 0e 	P3.L = 0xe6c;		/* (3692)	P3=0xff900e6c <_printf_out> */
ffa01af8:	8f 2f       	JUMP.S 0xffa01a16 <_printf_int+0x56>;
ffa01afa:	48 32       	P1 = P0;
ffa01afc:	2c e1 81 00 	P4 = 0x81 (X);		/*		P4=0x81(129) */
ffa01b00:	f2 2f       	JUMP.S 0xffa01ae4 <_printf_int+0x124>;
ffa01b02:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01b06:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa01b08:	0c 68       	P4 = 0x1 (X);		/*		P4=0x1(  1) */
ffa01b0a:	06 e1 68 0e 	R6.L = 0xe68;		/* (3688)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01b0e:	eb 2f       	JUMP.S 0xffa01ae4 <_printf_int+0x124>;

ffa01b10 <_printf_str>:
ffa01b10:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01b14:	01 e8 00 00 	UNLINK;
ffa01b18:	ff e2 b8 fd 	JUMP.L 0xffa01688 <_uart_str>;

ffa01b1c <_printf_ip>:
ffa01b1c:	70 05       	[--SP] = (R7:6);
ffa01b1e:	39 30       	R7 = R1;
ffa01b20:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01b24:	49 43       	R1 = R1.B (Z);
ffa01b26:	ff e3 4d ff 	CALL 0xffa019c0 <_printf_int>;
ffa01b2a:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900e68 <_printf_temp>(-7336344) */
ffa01b2e:	06 e1 f0 00 	R6.L = 0xf0;		/* (240)	R6=0xff9000f0(-7339792) */
ffa01b32:	82 c6 c7 83 	R1 = R7 >> 0x8;
ffa01b36:	49 43       	R1 = R1.B (Z);
ffa01b38:	06 30       	R0 = R6;
ffa01b3a:	ff e3 43 ff 	CALL 0xffa019c0 <_printf_int>;
ffa01b3e:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa01b42:	49 43       	R1 = R1.B (Z);
ffa01b44:	06 30       	R0 = R6;
ffa01b46:	ff e3 3d ff 	CALL 0xffa019c0 <_printf_int>;
ffa01b4a:	c7 4e       	R7 >>= 0x18;
ffa01b4c:	0f 30       	R1 = R7;
ffa01b4e:	06 30       	R0 = R6;
ffa01b50:	ff e3 38 ff 	CALL 0xffa019c0 <_printf_int>;
ffa01b54:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002d(-7339987) */
ffa01b58:	00 e1 6c 05 	R0.L = 0x56c;		/* (1388)	R0=0xff90056c(-7338644) */
ffa01b5c:	ff e3 96 fd 	CALL 0xffa01688 <_uart_str>;
ffa01b60:	01 e8 00 00 	UNLINK;
ffa01b64:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01b66:	30 05       	(R7:6) = [SP++];
ffa01b68:	10 00       	RTS;
	...

ffa01b6c <_div_>:
ffa01b6c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01b70:	08 4f       	R0 <<= 0x1;
ffa01b72:	48 42       	DIVS (R0, R1);
ffa01b74:	7a 68       	P2 = 0xf (X);		/*		P2=0xf( 15) */
ffa01b76:	b2 e0 03 20 	LSETUP(0xffa01b7a <_div_+0xe>, 0xffa01b7c <_div_+0x10>) LC1 = P2;
ffa01b7a:	08 42       	DIVQ (R0, R1);
ffa01b7c:	00 00       	NOP;
ffa01b7e:	80 42       	R0 = R0.L (X);
ffa01b80:	01 e8 00 00 	UNLINK;
ffa01b84:	10 00       	RTS;
	...

ffa01b88 <_mod>:
ffa01b88:	18 30       	R3 = R0;
ffa01b8a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01b8e:	08 4f       	R0 <<= 0x1;
ffa01b90:	11 30       	R2 = R1;
ffa01b92:	50 42       	DIVS (R0, R2);
ffa01b94:	7a 68       	P2 = 0xf (X);		/*		P2=0xf( 15) */
ffa01b96:	b2 e0 03 20 	LSETUP(0xffa01b9a <_mod+0x12>, 0xffa01b9c <_mod+0x14>) LC1 = P2;
ffa01b9a:	10 42       	DIVQ (R0, R2);
ffa01b9c:	00 00       	NOP;
ffa01b9e:	80 42       	R0 = R0.L (X);
ffa01ba0:	c8 40       	R0 *= R1;
ffa01ba2:	01 e8 00 00 	UNLINK;
ffa01ba6:	03 52       	R0 = R3 - R0;
ffa01ba8:	10 00       	RTS;
	...

ffa01bac <_memcpy_>:
ffa01bac:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bb0:	00 32       	P0 = R0;
ffa01bb2:	09 32       	P1 = R1;
ffa01bb4:	02 0d       	CC = R2 <= 0x0;
ffa01bb6:	07 18       	IF CC JUMP 0xffa01bc4 <_memcpy_+0x18>;
ffa01bb8:	00 00       	NOP;
ffa01bba:	12 32       	P2 = R2;
ffa01bbc:	b2 e0 03 20 	LSETUP(0xffa01bc0 <_memcpy_+0x14>, 0xffa01bc2 <_memcpy_+0x16>) LC1 = P2;
ffa01bc0:	40 98       	R0 = B[P0++] (X);
ffa01bc2:	08 9a       	B[P1++] = R0;
ffa01bc4:	01 e8 00 00 	UNLINK;
ffa01bc8:	10 00       	RTS;
	...

ffa01bcc <_memset_>:
ffa01bcc:	08 32       	P1 = R0;
ffa01bce:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bd2:	01 30       	R0 = R1;
ffa01bd4:	02 0d       	CC = R2 <= 0x0;
ffa01bd6:	05 18       	IF CC JUMP 0xffa01be0 <_memset_+0x14>;
ffa01bd8:	12 32       	P2 = R2;
ffa01bda:	b2 e0 02 20 	LSETUP(0xffa01bde <_memset_+0x12>, 0xffa01bde <_memset_+0x12>) LC1 = P2;
ffa01bde:	08 9a       	B[P1++] = R0;
ffa01be0:	01 e8 00 00 	UNLINK;
ffa01be4:	10 00       	RTS;
	...

ffa01be8 <_strlen_>:
ffa01be8:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01bec:	08 32       	P1 = R0;
ffa01bee:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01bf0:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01bf4:	b2 e0 05 20 	LSETUP(0xffa01bf8 <_strlen_+0x10>, 0xffa01bfe <_strlen_+0x16>) LC1 = P2;
ffa01bf8:	48 98       	R0 = B[P1++] (X);
ffa01bfa:	00 0c       	CC = R0 == 0x0;
ffa01bfc:	03 18       	IF CC JUMP 0xffa01c02 <_strlen_+0x1a>;
ffa01bfe:	09 64       	R1 += 0x1;		/* (  1) */
ffa01c00:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01c02:	01 30       	R0 = R1;
ffa01c04:	01 e8 00 00 	UNLINK;
ffa01c08:	10 00       	RTS;
	...

ffa01c0c <_strcpy_>:
ffa01c0c:	12 32       	P2 = R2;
ffa01c0e:	c5 04       	[--SP] = (P5:5);
ffa01c10:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c14:	29 32       	P5 = R1;
ffa01c16:	00 32       	P0 = R0;
ffa01c18:	51 99       	R1 = B[P2] (X);
ffa01c1a:	08 43       	R0 = R1.B (X);
ffa01c1c:	00 0c       	CC = R0 == 0x0;
ffa01c1e:	19 18       	IF CC JUMP 0xffa01c50 <_strcpy_+0x44>;
ffa01c20:	0a 32       	P1 = R2;
ffa01c22:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01c24:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01c28:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01c2a:	b2 e0 0a 20 	LSETUP(0xffa01c2e <_strcpy_+0x22>, 0xffa01c3e <_strcpy_+0x32>) LC1 = P2;
ffa01c2e:	01 9a       	B[P0++] = R1;
ffa01c30:	49 98       	R1 = B[P1++] (X);
ffa01c32:	08 43       	R0 = R1.B (X);
ffa01c34:	0a 64       	R2 += 0x1;		/* (  1) */
ffa01c36:	00 0c       	CC = R0 == 0x0;
ffa01c38:	04 18       	IF CC JUMP 0xffa01c40 <_strcpy_+0x34>;
ffa01c3a:	00 00       	NOP;
ffa01c3c:	00 00       	NOP;
ffa01c3e:	00 00       	NOP;
ffa01c40:	28 91       	R0 = [P5];
ffa01c42:	10 50       	R0 = R0 + R2;
ffa01c44:	28 93       	[P5] = R0;
ffa01c46:	01 e8 00 00 	UNLINK;
ffa01c4a:	40 30       	R0 = P0;
ffa01c4c:	85 04       	(P5:5) = [SP++];
ffa01c4e:	10 00       	RTS;
ffa01c50:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01c52:	f7 2f       	JUMP.S 0xffa01c40 <_strcpy_+0x34>;

ffa01c54 <_strprepend>:
ffa01c54:	c5 04       	[--SP] = (P5:5);
ffa01c56:	02 32       	P0 = R2;
ffa01c58:	0a 32       	P1 = R2;
ffa01c5a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01c5e:	18 30       	R3 = R0;
ffa01c60:	29 32       	P5 = R1;
ffa01c62:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa01c64:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01c68:	b2 e0 07 20 	LSETUP(0xffa01c6c <_strprepend+0x18>, 0xffa01c76 <_strprepend+0x22>) LC1 = P2;
ffa01c6c:	48 98       	R0 = B[P1++] (X);
ffa01c6e:	00 0c       	CC = R0 == 0x0;
ffa01c70:	0c 18       	IF CC JUMP 0xffa01c88 <_strprepend+0x34>;
ffa01c72:	00 00       	NOP;
ffa01c74:	00 00       	NOP;
ffa01c76:	0a 64       	R2 += 0x1;		/* (  1) */
ffa01c78:	28 91       	R0 = [P5];
ffa01c7a:	c3 52       	R3 = R3 - R0;
ffa01c7c:	0b 32       	P1 = R3;
ffa01c7e:	01 e8 00 00 	UNLINK;
ffa01c82:	41 30       	R0 = P1;
ffa01c84:	85 04       	(P5:5) = [SP++];
ffa01c86:	10 00       	RTS;
ffa01c88:	28 91       	R0 = [P5];
ffa01c8a:	03 52       	R0 = R3 - R0;
ffa01c8c:	08 32       	P1 = R0;
ffa01c8e:	02 0c       	CC = R2 == 0x0;
ffa01c90:	f7 1b       	IF CC JUMP 0xffa01c7e <_strprepend+0x2a>;
ffa01c92:	00 00       	NOP;
ffa01c94:	12 32       	P2 = R2;
ffa01c96:	b2 e0 03 20 	LSETUP(0xffa01c9a <_strprepend+0x46>, 0xffa01c9c <_strprepend+0x48>) LC1 = P2;
ffa01c9a:	40 98       	R0 = B[P0++] (X);
ffa01c9c:	08 9a       	B[P1++] = R0;
ffa01c9e:	ed 2f       	JUMP.S 0xffa01c78 <_strprepend+0x24>;

ffa01ca0 <_strcmp>:
ffa01ca0:	10 32       	P2 = R0;
ffa01ca2:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01ca6:	09 32       	P1 = R1;
ffa01ca8:	51 99       	R1 = B[P2] (X);
ffa01caa:	01 0c       	CC = R1 == 0x0;
ffa01cac:	20 18       	IF CC JUMP 0xffa01cec <_strcmp+0x4c>;
ffa01cae:	00 00       	NOP;
ffa01cb0:	00 00       	NOP;
ffa01cb2:	00 00       	NOP;
ffa01cb4:	48 99       	R0 = B[P1] (X);
ffa01cb6:	00 0c       	CC = R0 == 0x0;
ffa01cb8:	1a 18       	IF CC JUMP 0xffa01cec <_strcmp+0x4c>;
ffa01cba:	01 08       	CC = R1 == R0;
ffa01cbc:	1c 10       	IF !CC JUMP 0xffa01cf4 <_strcmp+0x54>;
ffa01cbe:	42 32       	P0 = P2;
ffa01cc0:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01cc2:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01cc4:	2a e1 00 05 	P2 = 0x500 (X);		/*		P2=0x500(1280) */
ffa01cc8:	b3 e0 11 20 	LSETUP(0xffa01cce <_strcmp+0x2e>, 0xffa01cea <_strcmp+0x4a>) LC1 = P2;
ffa01ccc:	06 20       	JUMP.S 0xffa01cd8 <_strcmp+0x38>;
ffa01cce:	01 08       	CC = R1 == R0;
ffa01cd0:	12 10       	IF !CC JUMP 0xffa01cf4 <_strcmp+0x54>;
ffa01cd2:	00 00       	NOP;
ffa01cd4:	00 00       	NOP;
ffa01cd6:	00 00       	NOP;
ffa01cd8:	41 98       	R1 = B[P0++] (X);
ffa01cda:	01 0c       	CC = R1 == 0x0;
ffa01cdc:	08 18       	IF CC JUMP 0xffa01cec <_strcmp+0x4c>;
ffa01cde:	00 00       	NOP;
ffa01ce0:	00 00       	NOP;
ffa01ce2:	00 00       	NOP;
ffa01ce4:	48 98       	R0 = B[P1++] (X);
ffa01ce6:	00 0c       	CC = R0 == 0x0;
ffa01ce8:	02 18       	IF CC JUMP 0xffa01cec <_strcmp+0x4c>;
ffa01cea:	00 00       	NOP;
ffa01cec:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa01cee:	01 e8 00 00 	UNLINK;
ffa01cf2:	10 00       	RTS;
ffa01cf4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01cf6:	01 e8 00 00 	UNLINK;
ffa01cfa:	10 00       	RTS;

ffa01cfc <_substr>:
ffa01cfc:	f4 05       	[--SP] = (R7:6, P5:4);
ffa01cfe:	20 32       	P4 = R0;
ffa01d00:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01d04:	32 30       	R6 = R2;
ffa01d06:	11 32       	P2 = R1;
ffa01d08:	62 99       	R2 = B[P4] (X);
ffa01d0a:	02 0c       	CC = R2 == 0x0;
ffa01d0c:	1a 18       	IF CC JUMP 0xffa01d40 <_substr+0x44>;
ffa01d0e:	00 00       	NOP;
ffa01d10:	00 00       	NOP;
ffa01d12:	00 00       	NOP;
ffa01d14:	50 99       	R0 = B[P2] (X);
ffa01d16:	00 0c       	CC = R0 == 0x0;
ffa01d18:	14 18       	IF CC JUMP 0xffa01d40 <_substr+0x44>;
ffa01d1a:	06 0d       	CC = R6 <= 0x0;
ffa01d1c:	12 18       	IF CC JUMP 0xffa01d40 <_substr+0x44>;
ffa01d1e:	29 32       	P5 = R1;
ffa01d20:	7c 30       	R7 = P4;
ffa01d22:	08 68       	P0 = 0x1 (X);		/*		P0=0x1(  1) */
ffa01d24:	17 64       	R7 += 0x2;		/* (  2) */
ffa01d26:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01d28:	02 08       	CC = R2 == R0;
ffa01d2a:	10 18       	IF CC JUMP 0xffa01d4a <_substr+0x4e>;
ffa01d2c:	00 00       	NOP;
ffa01d2e:	00 00       	NOP;
ffa01d30:	48 30       	R1 = P0;
ffa01d32:	68 99       	R0 = B[P5] (X);
ffa01d34:	00 0c       	CC = R0 == 0x0;
ffa01d36:	05 18       	IF CC JUMP 0xffa01d40 <_substr+0x44>;
ffa01d38:	08 6c       	P0 += 0x1;		/* (  1) */
ffa01d3a:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01d3c:	0e 09       	CC = R6 <= R1;
ffa01d3e:	f5 17       	IF !CC JUMP 0xffa01d28 <_substr+0x2c> (BP);
ffa01d40:	01 e8 00 00 	UNLINK;
ffa01d44:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01d46:	b4 05       	(R7:6, P5:4) = [SP++];
ffa01d48:	10 00       	RTS;
ffa01d4a:	0f 32       	P1 = R7;
ffa01d4c:	55 32       	P2 = P5;
ffa01d4e:	40 30       	R0 = P0;
ffa01d50:	a1 e5 01 00 	R1 = B[P4 + 0x1] (X);
ffa01d54:	00 00       	NOP;
ffa01d56:	53 98       	R3 = B[P2++] (X);
ffa01d58:	0b 08       	CC = R3 == R1;
ffa01d5a:	eb 13       	IF !CC JUMP 0xffa01d30 <_substr+0x34>;
ffa01d5c:	03 0c       	CC = R3 == 0x0;
ffa01d5e:	e9 1b       	IF CC JUMP 0xffa01d30 <_substr+0x34>;
ffa01d60:	00 00       	NOP;
ffa01d62:	00 00       	NOP;
ffa01d64:	08 64       	R0 += 0x1;		/* (  1) */
ffa01d66:	49 98       	R1 = B[P1++] (X);
ffa01d68:	01 0c       	CC = R1 == 0x0;
ffa01d6a:	f5 17       	IF !CC JUMP 0xffa01d54 <_substr+0x58> (BP);
ffa01d6c:	01 e8 00 00 	UNLINK;
ffa01d70:	b4 05       	(R7:6, P5:4) = [SP++];
ffa01d72:	10 00       	RTS;

ffa01d74 <_sprintf_int>:
ffa01d74:	f3 05       	[--SP] = (R7:6, P5:3);
ffa01d76:	29 32       	P5 = R1;
ffa01d78:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01d7c:	30 30       	R6 = R0;
ffa01d7e:	45 0c       	CC = P5 == 0x0;
ffa01d80:	1a 14       	IF !CC JUMP 0xffa01db4 <_sprintf_int+0x40> (BP);
ffa01d82:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900001 */
ffa01d86:	0c e1 68 0e 	P4.L = 0xe68;		/* (3688)	P4=0xff900e68 <_printf_temp> */
ffa01d8a:	62 91       	P2 = [P4];
ffa01d8c:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01d8e:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa01d90:	10 9b       	B[P2] = R0;
ffa01d92:	0f 32       	P1 = R7;
ffa01d94:	06 32       	P0 = R6;
ffa01d96:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa01d98:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa01d9a:	09 64       	R1 += 0x1;		/* (  1) */
ffa01d9c:	62 91       	P2 = [P4];
ffa01d9e:	b9 08       	CC = R1 < R7;
ffa01da0:	8a 5a       	P2 = P2 + P1;
ffa01da2:	50 99       	R0 = B[P2] (X);
ffa01da4:	00 9a       	B[P0++] = R0;
ffa01da6:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa01da8:	f9 1f       	IF CC JUMP 0xffa01d9a <_sprintf_int+0x26> (BP);
ffa01daa:	07 30       	R0 = R7;
ffa01dac:	01 e8 00 00 	UNLINK;
ffa01db0:	b3 05       	(R7:6, P5:3) = [SP++];
ffa01db2:	10 00       	RTS;
ffa01db4:	45 0d       	CC = P5 <= 0x0;
ffa01db6:	21 18       	IF CC JUMP 0xffa01df8 <_sprintf_int+0x84>;
ffa01db8:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e68 <_printf_temp> */
ffa01dbc:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa01dbe:	0c e1 68 0e 	P4.L = 0xe68;		/* (3688)	P4=0xff900e68 <_printf_temp> */
ffa01dc2:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01dc4:	45 30       	R0 = P5;
ffa01dc6:	ff e3 df fb 	CALL 0xffa01584 <___divsi3>;
ffa01dca:	17 32       	P2 = R7;
ffa01dcc:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || P1 = [P4] || NOP;
ffa01dd0:	61 91 00 00 
ffa01dd4:	e8 4f       	R0 <<= 0x1d;
ffa01dd6:	08 52       	R0 = R0 - R1;
ffa01dd8:	10 4f       	R0 <<= 0x2;
ffa01dda:	51 5a       	P1 = P1 + P2;
ffa01ddc:	08 52       	R0 = R0 - R1;
ffa01dde:	10 32       	P2 = R0;
ffa01de0:	0f 64       	R7 += 0x1;		/* (  1) */
ffa01de2:	01 0c       	CC = R1 == 0x0;
ffa01de4:	95 5c       	P2 = P5 + (P2 << 0x1);
ffa01de6:	42 30       	R0 = P2;
ffa01de8:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01dea:	08 9b       	B[P1] = R0;
ffa01dec:	d3 1b       	IF CC JUMP 0xffa01d92 <_sprintf_int+0x1e>;
ffa01dee:	58 60       	R0 = 0xb (X);		/*		R0=0xb( 11) */
ffa01df0:	29 32       	P5 = R1;
ffa01df2:	07 08       	CC = R7 == R0;
ffa01df4:	e7 17       	IF !CC JUMP 0xffa01dc2 <_sprintf_int+0x4e> (BP);
ffa01df6:	ce 2f       	JUMP.S 0xffa01d92 <_sprintf_int+0x1e>;
ffa01df8:	01 30       	R0 = R1;
ffa01dfa:	f8 4c       	BITCLR (R0, 0x1f);		/* bit 31 */
ffa01dfc:	28 32       	P5 = R0;
ffa01dfe:	4a e1 00 80 	P2.H = 0x8000;		/* (-32768)	P2=0x80000500 */
ffa01e02:	0a e1 00 00 	P2.L = 0x0;		/* (  0)	P2=0x80000000 */
ffa01e06:	5a 32       	P3 = P2;
ffa01e08:	2b 44       	P3 -= P5;
ffa01e0a:	43 0d       	CC = P3 <= 0x0;
ffa01e0c:	2a 18       	IF CC JUMP 0xffa01e60 <_sprintf_int+0xec>;
ffa01e0e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e68 <_printf_temp> */
ffa01e12:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa01e14:	0c e1 68 0e 	P4.L = 0xe68;		/* (3688)	P4=0xff900e68 <_printf_temp> */
ffa01e18:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa01e1a:	43 30       	R0 = P3;
ffa01e1c:	ff e3 b4 fb 	CALL 0xffa01584 <___divsi3>;
ffa01e20:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || P1 = [P4] || NOP;
ffa01e24:	61 91 00 00 
ffa01e28:	e8 4f       	R0 <<= 0x1d;
ffa01e2a:	08 52       	R0 = R0 - R1;
ffa01e2c:	10 4f       	R0 <<= 0x2;
ffa01e2e:	08 52       	R0 = R0 - R1;
ffa01e30:	10 32       	P2 = R0;
ffa01e32:	69 5a       	P1 = P1 + P5;
ffa01e34:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa01e36:	01 0c       	CC = R1 == 0x0;
ffa01e38:	93 5c       	P2 = P3 + (P2 << 0x1);
ffa01e3a:	42 30       	R0 = P2;
ffa01e3c:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01e3e:	08 9b       	B[P1] = R0;
ffa01e40:	0c 18       	IF CC JUMP 0xffa01e58 <_sprintf_int+0xe4>;
ffa01e42:	5a 68       	P2 = 0xb (X);		/*		P2=0xb( 11) */
ffa01e44:	19 32       	P3 = R1;
ffa01e46:	55 08       	CC = P5 == P2;
ffa01e48:	e8 17       	IF !CC JUMP 0xffa01e18 <_sprintf_int+0xa4> (BP);
ffa01e4a:	59 68       	P1 = 0xb (X);		/*		P1=0xb( 11) */
ffa01e4c:	67 60       	R7 = 0xc (X);		/*		R7=0xc( 12) */
ffa01e4e:	62 91       	P2 = [P4];
ffa01e50:	68 61       	R0 = 0x2d (X);		/*		R0=0x2d( 45) */
ffa01e52:	8a 5a       	P2 = P2 + P1;
ffa01e54:	10 9b       	B[P2] = R0;
ffa01e56:	9e 2f       	JUMP.S 0xffa01d92 <_sprintf_int+0x1e>;
ffa01e58:	7d 30       	R7 = P5;
ffa01e5a:	4d 32       	P1 = P5;
ffa01e5c:	0f 64       	R7 += 0x1;		/* (  1) */
ffa01e5e:	f8 2f       	JUMP.S 0xffa01e4e <_sprintf_int+0xda>;
ffa01e60:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e68 <_printf_temp> */
ffa01e64:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa01e66:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa01e68:	0c e1 68 0e 	P4.L = 0xe68;		/* (3688)	P4=0xff900e68 <_printf_temp> */
ffa01e6c:	f1 2f       	JUMP.S 0xffa01e4e <_sprintf_int+0xda>;
	...

ffa01e70 <_sprintf_hex>:
ffa01e70:	10 32       	P2 = R0;
ffa01e72:	78 05       	[--SP] = (R7:7);
ffa01e74:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01e78:	80 61       	R0 = 0x30 (X);		/*		R0=0x30( 48) */
ffa01e7a:	e2 60       	R2 = 0x1c (X);		/*		R2=0x1c( 28) */
ffa01e7c:	10 9b       	B[P2] = R0;
ffa01e7e:	20 e1 78 00 	R0 = 0x78 (X);		/*		R0=0x78(120) */
ffa01e82:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa01e86:	12 6c       	P2 += 0x2;		/* (  2) */
ffa01e88:	7b 60       	R3 = 0xf (X);		/*		R3=0xf( 15) */
ffa01e8a:	41 68       	P1 = 0x8 (X);		/*		P1=0x8(  8) */
ffa01e8c:	4f 60       	R7 = 0x9 (X);		/*		R7=0x9(  9) */
ffa01e8e:	b2 e0 09 10 	LSETUP(0xffa01e92 <_sprintf_hex+0x22>, 0xffa01ea0 <_sprintf_hex+0x30>) LC1 = P1;
ffa01e92:	01 30       	R0 = R1;
ffa01e94:	10 40       	R0 >>>= R2;
ffa01e96:	18 54       	R0 = R0 & R3;
ffa01e98:	38 09       	CC = R0 <= R7;
ffa01e9a:	09 1c       	IF CC JUMP 0xffa01eac <_sprintf_hex+0x3c> (BP);
ffa01e9c:	b8 65       	R0 += 0x37;		/* ( 55) */
ffa01e9e:	10 9a       	B[P2++] = R0;
ffa01ea0:	e2 67       	R2 += -0x4;		/* ( -4) */
ffa01ea2:	01 e8 00 00 	UNLINK;
ffa01ea6:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa01ea8:	38 05       	(R7:7) = [SP++];
ffa01eaa:	10 00       	RTS;
ffa01eac:	80 65       	R0 += 0x30;		/* ( 48) */
ffa01eae:	f8 2f       	JUMP.S 0xffa01e9e <_sprintf_hex+0x2e>;

ffa01eb0 <_strprintf_int>:
ffa01eb0:	fd 05       	[--SP] = (R7:7, P5:5);
ffa01eb2:	29 32       	P5 = R1;
ffa01eb4:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01eb8:	38 30       	R7 = R0;
ffa01eba:	0a 30       	R1 = R2;
ffa01ebc:	ff e3 5c ff 	CALL 0xffa01d74 <_sprintf_int>;
ffa01ec0:	29 91       	R1 = [P5];
ffa01ec2:	41 50       	R1 = R1 + R0;
ffa01ec4:	04 cc 38 0e 	R7 = R7 + R0 (NS) || [P5] = R1 || NOP;
ffa01ec8:	29 93 00 00 
ffa01ecc:	07 30       	R0 = R7;
ffa01ece:	01 e8 00 00 	UNLINK;
ffa01ed2:	bd 05       	(R7:7, P5:5) = [SP++];
ffa01ed4:	10 00       	RTS;
	...

ffa01ed8 <_strprintf_hex>:
ffa01ed8:	fd 05       	[--SP] = (R7:7, P5:5);
ffa01eda:	29 32       	P5 = R1;
ffa01edc:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa01ee0:	38 30       	R7 = R0;
ffa01ee2:	0a 30       	R1 = R2;
ffa01ee4:	ff e3 c6 ff 	CALL 0xffa01e70 <_sprintf_hex>;
ffa01ee8:	29 91       	R1 = [P5];
ffa01eea:	41 50       	R1 = R1 + R0;
ffa01eec:	04 cc 38 0e 	R7 = R7 + R0 (NS) || [P5] = R1 || NOP;
ffa01ef0:	29 93 00 00 
ffa01ef4:	07 30       	R0 = R7;
ffa01ef6:	01 e8 00 00 	UNLINK;
ffa01efa:	bd 05       	(R7:7, P5:5) = [SP++];
ffa01efc:	10 00       	RTS;
	...

ffa01f00 <_atoi_>:
ffa01f00:	10 32       	P2 = R0;
ffa01f02:	68 05       	[--SP] = (R7:5);
ffa01f04:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01f08:	39 30       	R7 = R1;
ffa01f0a:	6a 61       	R2 = 0x2d (X);		/*		R2=0x2d( 45) */
ffa01f0c:	51 99       	R1 = B[P2] (X);
ffa01f0e:	08 43       	R0 = R1.B (X);
ffa01f10:	10 08       	CC = R0 == R2;
ffa01f12:	28 18       	IF CC JUMP 0xffa01f62 <_atoi_+0x62>;
ffa01f14:	03 60       	R3 = 0x0 (X);		/*		R3=0x0(  0) */
ffa01f16:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa01f18:	11 30       	R2 = R1;
ffa01f1a:	82 66       	R2 += -0x30;		/* (-48) */
ffa01f1c:	50 43       	R0 = R2.B (Z);
ffa01f1e:	4a 32       	P1 = P2;
ffa01f20:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01f22:	09 6c       	P1 += 0x1;		/* (  1) */
ffa01f24:	02 68       	P2 = 0x0 (X);		/*		P2=0x0(  0) */
ffa01f26:	10 0a       	CC = R0 <= R2 (IU);
ffa01f28:	16 10       	IF !CC JUMP 0xffa01f54 <_atoi_+0x54>;
ffa01f2a:	4d 60       	R5 = 0x9 (X);		/*		R5=0x9(  9) */
ffa01f2c:	bb 08       	CC = R3 < R7;
ffa01f2e:	13 10       	IF !CC JUMP 0xffa01f54 <_atoi_+0x54>;
ffa01f30:	42 30       	R0 = P2;
ffa01f32:	80 66       	R0 += -0x30;		/* (-48) */
ffa01f34:	09 43       	R1 = R1.B (X);
ffa01f36:	48 50       	R1 = R0 + R1;
ffa01f38:	11 32       	P2 = R1;
ffa01f3a:	49 98       	R1 = B[P1++] (X);
ffa01f3c:	11 30       	R2 = R1;
ffa01f3e:	82 66       	R2 += -0x30;		/* (-48) */
ffa01f40:	50 43       	R0 = R2.B (Z);
ffa01f42:	28 0a       	CC = R0 <= R5 (IU);
ffa01f44:	03 14       	IF !CC JUMP 0xffa01f4a <_atoi_+0x4a> (BP);
ffa01f46:	92 5e       	P2 = P2 + (P2 << 0x2);
ffa01f48:	92 5a       	P2 = P2 << 0x1;
ffa01f4a:	50 43       	R0 = R2.B (Z);
ffa01f4c:	4a 60       	R2 = 0x9 (X);		/*		R2=0x9(  9) */
ffa01f4e:	0b 64       	R3 += 0x1;		/* (  1) */
ffa01f50:	10 0a       	CC = R0 <= R2 (IU);
ffa01f52:	ed 1f       	IF CC JUMP 0xffa01f2c <_atoi_+0x2c> (BP);
ffa01f54:	6a 30       	R5 = P2;
ffa01f56:	f5 40       	R5 *= R6;
ffa01f58:	01 e8 00 00 	UNLINK;
ffa01f5c:	05 30       	R0 = R5;
ffa01f5e:	28 05       	(R7:5) = [SP++];
ffa01f60:	10 00       	RTS;
ffa01f62:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa01f64:	51 99       	R1 = B[P2] (X);
ffa01f66:	0b 60       	R3 = 0x1 (X);		/*		R3=0x1(  1) */
ffa01f68:	fe 63       	R6 = -0x1 (X);		/*		R6=0xffffffff( -1) */
ffa01f6a:	d7 2f       	JUMP.S 0xffa01f18 <_atoi_+0x18>;

ffa01f6c <_udelay>:
ffa01f6c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01f70:	00 0d       	CC = R0 <= 0x0;
ffa01f72:	0a 18       	IF CC JUMP 0xffa01f86 <_udelay+0x1a>;
ffa01f74:	08 32       	P1 = R0;
ffa01f76:	a2 e0 07 10 	LSETUP(0xffa01f7a <_udelay+0xe>, 0xffa01f84 <_udelay+0x18>) LC0 = P1;
ffa01f7a:	2a e1 a0 00 	P2 = 0xa0 (X);		/*		P2=0xa0(160) */
ffa01f7e:	b2 e0 03 20 	LSETUP(0xffa01f82 <_udelay+0x16>, 0xffa01f84 <_udelay+0x18>) LC1 = P2;
ffa01f82:	00 00       	NOP;
ffa01f84:	00 00       	NOP;
ffa01f86:	01 e8 00 00 	UNLINK;
ffa01f8a:	10 00       	RTS;

ffa01f8c <_bfin_EMAC_send_check>:
ffa01f8c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc000a0(-4194144) */
ffa01f90:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01f94:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa01f98:	10 95       	R0 = W[P2] (Z);
ffa01f9a:	c0 42       	R0 = R0.L (Z);
ffa01f9c:	18 4e       	R0 >>= 0x3;
ffa01f9e:	00 4b       	BITTGL (R0, 0x0);		/* bit  0 */
ffa01fa0:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa01fa2:	08 54       	R0 = R0 & R1;
ffa01fa4:	01 e8 00 00 	UNLINK;
ffa01fa8:	10 00       	RTS;
	...

ffa01fac <_FormatIPAddress>:
ffa01fac:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01fb0:	18 30       	R3 = R0;
ffa01fb2:	b8 e4 14 00 	R0 = B[FP + 0x14] (Z);
ffa01fb6:	40 4f       	R0 <<= 0x8;
ffa01fb8:	52 43       	R2 = R2.B (Z);
ffa01fba:	10 56       	R0 = R0 | R2;
ffa01fbc:	40 4f       	R0 <<= 0x8;
ffa01fbe:	49 43       	R1 = R1.B (Z);
ffa01fc0:	08 56       	R0 = R0 | R1;
ffa01fc2:	40 4f       	R0 <<= 0x8;
ffa01fc4:	5b 43       	R3 = R3.B (Z);
ffa01fc6:	18 56       	R0 = R0 | R3;
ffa01fc8:	01 e8 00 00 	UNLINK;
ffa01fcc:	10 00       	RTS;
	...

ffa01fd0 <_bfin_EMAC_halt>:
ffa01fd0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ca8(-4191064) */
ffa01fd4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa01fd8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa01fda:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa01fde:	10 93       	[P2] = R0;
ffa01fe0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa01fe4:	0a e1 48 0c 	P2.L = 0xc48;		/* (3144)	P2=0xffc00c48(-4191160) */
ffa01fe8:	10 97       	W[P2] = R0;
ffa01fea:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c48(-4191160) */
ffa01fee:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa01ff2:	10 97       	W[P2] = R0;
ffa01ff4:	01 e8 00 00 	UNLINK;
ffa01ff8:	10 00       	RTS;
	...

ffa01ffc <_PollMdcDone>:
ffa01ffc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa02000:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02004:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02008:	10 91       	R0 = [P2];
ffa0200a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0200c:	09 18       	IF CC JUMP 0xffa0201e <_PollMdcDone+0x22>;
ffa0200e:	00 00       	NOP;
ffa02010:	00 00       	NOP;
ffa02012:	42 34       	I0 = P2;
ffa02014:	00 00       	NOP;
ffa02016:	00 00       	NOP;
ffa02018:	00 9d       	R0 = [I0];
ffa0201a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0201c:	fc 17       	IF !CC JUMP 0xffa02014 <_PollMdcDone+0x18> (BP);
ffa0201e:	01 e8 00 00 	UNLINK;
ffa02022:	10 00       	RTS;

ffa02024 <_WrPHYReg>:
ffa02024:	78 05       	[--SP] = (R7:7);
ffa02026:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa0202a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0202e:	18 30       	R3 = R0;
ffa02030:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02034:	39 30       	R7 = R1;
ffa02036:	10 91       	R0 = [P2];
ffa02038:	0a 30       	R1 = R2;
ffa0203a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0203c:	09 18       	IF CC JUMP 0xffa0204e <_WrPHYReg+0x2a>;
ffa0203e:	00 00       	NOP;
ffa02040:	00 00       	NOP;
ffa02042:	42 34       	I0 = P2;
ffa02044:	00 00       	NOP;
ffa02046:	00 00       	NOP;
ffa02048:	00 9d       	R0 = [I0];
ffa0204a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0204c:	fc 17       	IF !CC JUMP 0xffa02044 <_WrPHYReg+0x20> (BP);
ffa0204e:	c8 42       	R0 = R1.L (Z);
ffa02050:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02054:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02058:	d9 42       	R1 = R3.L (Z);
ffa0205a:	10 93       	[P2] = R0;
ffa0205c:	59 4f       	R1 <<= 0xb;
ffa0205e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02060:	c9 42       	R1 = R1.L (Z);
ffa02062:	41 56       	R1 = R1 | R0;
ffa02064:	f8 60       	R0 = 0x1f (X);		/*		R0=0x1f( 31) */
ffa02066:	38 54       	R0 = R0 & R7;
ffa02068:	30 4f       	R0 <<= 0x6;
ffa0206a:	41 56       	R1 = R1 | R0;
ffa0206c:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0206e:	11 93       	[P2] = R1;
ffa02070:	01 e8 00 00 	UNLINK;
ffa02074:	38 05       	(R7:7) = [SP++];
ffa02076:	10 00       	RTS;

ffa02078 <_RdPHYReg>:
ffa02078:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa0207c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02080:	10 30       	R2 = R0;
ffa02082:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02086:	10 91       	R0 = [P2];
ffa02088:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0208a:	09 18       	IF CC JUMP 0xffa0209c <_RdPHYReg+0x24>;
ffa0208c:	00 00       	NOP;
ffa0208e:	00 00       	NOP;
ffa02090:	42 34       	I0 = P2;
ffa02092:	00 00       	NOP;
ffa02094:	00 00       	NOP;
ffa02096:	00 9d       	R0 = [I0];
ffa02098:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0209a:	fc 17       	IF !CC JUMP 0xffa02092 <_RdPHYReg+0x1a> (BP);
ffa0209c:	cb 42       	R3 = R1.L (Z);
ffa0209e:	d0 42       	R0 = R2.L (Z);
ffa020a0:	58 4f       	R0 <<= 0xb;
ffa020a2:	f9 60       	R1 = 0x1f (X);		/*		R1=0x1f( 31) */
ffa020a4:	c0 42       	R0 = R0.L (Z);
ffa020a6:	4b 54       	R1 = R3 & R1;
ffa020a8:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa020aa:	31 4f       	R1 <<= 0x6;
ffa020ac:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa020b0:	08 56       	R0 = R0 | R1;
ffa020b2:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa020b6:	10 93       	[P2] = R0;
ffa020b8:	10 91       	R0 = [P2];
ffa020ba:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020bc:	09 18       	IF CC JUMP 0xffa020ce <_RdPHYReg+0x56>;
ffa020be:	00 00       	NOP;
ffa020c0:	00 00       	NOP;
ffa020c2:	42 34       	I0 = P2;
ffa020c4:	00 00       	NOP;
ffa020c6:	00 00       	NOP;
ffa020c8:	00 9d       	R0 = [I0];
ffa020ca:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020cc:	fc 17       	IF !CC JUMP 0xffa020c4 <_RdPHYReg+0x4c> (BP);
ffa020ce:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa020d2:	0b 32       	P1 = R3;
ffa020d4:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa020d8:	10 91       	R0 = [P2];
ffa020da:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903018 */
ffa020de:	0a e1 70 0e 	P2.L = 0xe70;		/* (3696)	P2=0xff900e70 <_PHYregs> */
ffa020e2:	8a 5c       	P2 = P2 + (P1 << 0x1);
ffa020e4:	10 97       	W[P2] = R0;
ffa020e6:	01 e8 00 00 	UNLINK;
ffa020ea:	10 00       	RTS;

ffa020ec <_SoftResetPHY>:
ffa020ec:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00e70(-4190608) */
ffa020f0:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa020f4:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa020f8:	10 91       	R0 = [P2];
ffa020fa:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa020fc:	09 18       	IF CC JUMP 0xffa0210e <_SoftResetPHY+0x22>;
ffa020fe:	00 00       	NOP;
ffa02100:	00 00       	NOP;
ffa02102:	42 34       	I0 = P2;
ffa02104:	00 00       	NOP;
ffa02106:	00 00       	NOP;
ffa02108:	00 9d       	R0 = [I0];
ffa0210a:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa0210c:	fc 17       	IF !CC JUMP 0xffa02104 <_SoftResetPHY+0x18> (BP);
ffa0210e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02112:	80 e1 00 80 	R0 = 0x8000 (Z);		/*		R0=0x8000(32768) */
ffa02116:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa0211a:	10 93       	[P2] = R0;
ffa0211c:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa0211e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02120:	10 93       	[P2] = R0;
ffa02122:	10 91       	R0 = [P2];
ffa02124:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02126:	09 18       	IF CC JUMP 0xffa02138 <_SoftResetPHY+0x4c>;
ffa02128:	00 00       	NOP;
ffa0212a:	00 00       	NOP;
ffa0212c:	42 34       	I0 = P2;
ffa0212e:	00 00       	NOP;
ffa02130:	00 00       	NOP;
ffa02132:	00 9d       	R0 = [I0];
ffa02134:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02136:	fc 17       	IF !CC JUMP 0xffa0212e <_SoftResetPHY+0x42> (BP);
ffa02138:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa0213c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0213e:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02142:	10 93       	[P2] = R0;
ffa02144:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02146:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa02148:	10 93       	[P2] = R0;
ffa0214a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0214c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0214e:	ff e3 95 ff 	CALL 0xffa02078 <_RdPHYReg>;
ffa02152:	80 42       	R0 = R0.L (X);
ffa02154:	80 0c       	CC = R0 < 0x0;
ffa02156:	fa 1f       	IF CC JUMP 0xffa0214a <_SoftResetPHY+0x5e> (BP);
ffa02158:	01 e8 00 00 	UNLINK;
ffa0215c:	10 00       	RTS;
	...

ffa02160 <_NetCksum>:
ffa02160:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02164:	01 0d       	CC = R1 <= 0x0;
ffa02166:	0f 18       	IF CC JUMP 0xffa02184 <_NetCksum+0x24>;
ffa02168:	08 32       	P1 = R0;
ffa0216a:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0216c:	11 32       	P2 = R1;
ffa0216e:	b2 e0 03 20 	LSETUP(0xffa02172 <_NetCksum+0x12>, 0xffa02174 <_NetCksum+0x14>) LC1 = P2;
ffa02172:	08 94       	R0 = W[P1++] (Z);
ffa02174:	82 50       	R2 = R2 + R0;
ffa02176:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa0217a:	02 50       	R0 = R2 + R0;
ffa0217c:	c0 42       	R0 = R0.L (Z);
ffa0217e:	01 e8 00 00 	UNLINK;
ffa02182:	10 00       	RTS;
ffa02184:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02186:	fc 2f       	JUMP.S 0xffa0217e <_NetCksum+0x1e>;

ffa02188 <_htons>:
ffa02188:	c1 42       	R1 = R0.L (Z);
ffa0218a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0218e:	41 4e       	R1 >>= 0x8;
ffa02190:	40 4f       	R0 <<= 0x8;
ffa02192:	08 56       	R0 = R0 | R1;
ffa02194:	01 e8 00 00 	UNLINK;
ffa02198:	10 00       	RTS;
	...

ffa0219c <_htonl>:
ffa0219c:	10 30       	R2 = R0;
ffa0219e:	41 43       	R1 = R0.B (Z);
ffa021a0:	40 4e       	R0 >>= 0x8;
ffa021a2:	41 4f       	R1 <<= 0x8;
ffa021a4:	40 43       	R0 = R0.B (Z);
ffa021a6:	08 56       	R0 = R0 | R1;
ffa021a8:	82 c6 82 83 	R1 = R2 >> 0x10;
ffa021ac:	40 4f       	R0 <<= 0x8;
ffa021ae:	49 43       	R1 = R1.B (Z);
ffa021b0:	08 56       	R0 = R0 | R1;
ffa021b2:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021b6:	40 4f       	R0 <<= 0x8;
ffa021b8:	c2 4e       	R2 >>= 0x18;
ffa021ba:	10 56       	R0 = R0 | R2;
ffa021bc:	01 e8 00 00 	UNLINK;
ffa021c0:	10 00       	RTS;
	...

ffa021c4 <_pack4chars>:
ffa021c4:	08 32       	P1 = R0;
ffa021c6:	10 32       	P2 = R0;
ffa021c8:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021cc:	01 e8 00 00 	UNLINK;
ffa021d0:	88 e4 01 00 	R0 = B[P1 + 0x1] (Z);
ffa021d4:	11 98       	R1 = B[P2++] (Z);
ffa021d6:	40 4f       	R0 <<= 0x8;
ffa021d8:	08 50       	R0 = R0 + R1;
ffa021da:	91 e4 01 00 	R1 = B[P2 + 0x1] (Z);
ffa021de:	81 4f       	R1 <<= 0x10;
ffa021e0:	08 50       	R0 = R0 + R1;
ffa021e2:	91 e4 02 00 	R1 = B[P2 + 0x2] (Z);
ffa021e6:	c1 4f       	R1 <<= 0x18;
ffa021e8:	08 50       	R0 = R0 + R1;
ffa021ea:	10 00       	RTS;

ffa021ec <_ip_header_setup>:
ffa021ec:	00 32       	P0 = R0;
ffa021ee:	11 32       	P2 = R1;
ffa021f0:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa021f4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa021f8:	00 9b       	B[P0] = R0;
ffa021fa:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa021fc:	80 e6 01 00 	B[P0 + 0x1] = R0;
ffa02200:	11 91       	R1 = [P2];
ffa02202:	82 c6 41 80 	R0 = R1 << 0x8;
ffa02206:	93 e4 01 00 	R3 = B[P2 + 0x1] (Z);
ffa0220a:	61 67       	R1 += -0x14;		/* (-20) */
ffa0220c:	11 93       	[P2] = R1;
ffa0220e:	18 56       	R0 = R0 | R3;
ffa02210:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903018 */
ffa02214:	0a e1 ba 0e 	P2.L = 0xeba;		/* (3770)	P2=0xff900eba <_NetIPID> */
ffa02218:	40 b4       	W[P0 + 0x2] = R0;
ffa0221a:	10 95       	R0 = W[P2] (Z);
ffa0221c:	08 30       	R1 = R0;
ffa0221e:	09 64       	R1 += 0x1;		/* (  1) */
ffa02220:	11 97       	W[P2] = R1;
ffa02222:	c1 42       	R1 = R0.L (Z);
ffa02224:	41 4e       	R1 >>= 0x8;
ffa02226:	40 4f       	R0 <<= 0x8;
ffa02228:	08 56       	R0 = R0 | R1;
ffa0222a:	80 b4       	W[P0 + 0x4] = R0;
ffa0222c:	82 c6 42 01 	R0 = R2 >>> 0x18;
ffa02230:	c0 4f       	R0 <<= 0x18;
ffa02232:	21 e1 40 00 	R1 = 0x40 (X);		/*		R1=0x40( 64) */
ffa02236:	00 0c       	CC = R0 == 0x0;
ffa02238:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0223a:	c1 b4       	W[P0 + 0x6] = R1;
ffa0223c:	08 07       	IF CC R1 = R0;
ffa0223e:	b8 e5 14 00 	R0 = B[FP + 0x14] (X);
ffa02242:	80 e6 09 00 	B[P0 + 0x9] = R0;
ffa02246:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02248:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eba <_NetIPID> */
ffa0224c:	81 e6 08 00 	B[P0 + 0x8] = R1;
ffa02250:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa02254:	40 b5       	W[P0 + 0xa] = R0;
ffa02256:	10 91       	R0 = [P2];
ffa02258:	02 b1       	[P0 + 0x10] = R2;
ffa0225a:	50 30       	R2 = P0;
ffa0225c:	c0 b0       	[P0 + 0xc] = R0;
ffa0225e:	48 32       	P1 = P0;
ffa02260:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02262:	a2 64       	R2 += 0x14;		/* ( 20) */
ffa02264:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02266:	b2 e0 03 20 	LSETUP(0xffa0226a <_ip_header_setup+0x7e>, 0xffa0226c <_ip_header_setup+0x80>) LC1 = P2;
ffa0226a:	08 94       	R0 = W[P1++] (Z);
ffa0226c:	41 50       	R1 = R1 + R0;
ffa0226e:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa02272:	01 50       	R0 = R1 + R0;
ffa02274:	c0 42       	R0 = R0.L (Z);
ffa02276:	c0 43       	R0 =~ R0;
ffa02278:	40 b5       	W[P0 + 0xa] = R0;
ffa0227a:	02 30       	R0 = R2;
ffa0227c:	01 e8 00 00 	UNLINK;
ffa02280:	10 00       	RTS;
	...

ffa02284 <_ip_header_checksum>:
ffa02284:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02288:	08 32       	P1 = R0;
ffa0228a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0228c:	a2 68       	P2 = 0x14 (X);		/*		P2=0x14( 20) */
ffa0228e:	b2 e0 03 20 	LSETUP(0xffa02292 <_ip_header_checksum+0xe>, 0xffa02294 <_ip_header_checksum+0x10>) LC1 = P2;
ffa02292:	08 94       	R0 = W[P1++] (Z);
ffa02294:	41 50       	R1 = R1 + R0;
ffa02296:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa0229a:	01 50       	R0 = R1 + R0;
ffa0229c:	c0 42       	R0 = R0.L (Z);
ffa0229e:	08 02       	CC = R0;
ffa022a0:	00 02       	R0 = CC;
ffa022a2:	01 e8 00 00 	UNLINK;
ffa022a6:	10 00       	RTS;

ffa022a8 <_icmp_header_setup>:
ffa022a8:	00 32       	P0 = R0;
ffa022aa:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa022ac:	c5 04       	[--SP] = (P5:5);
ffa022ae:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa022b2:	29 32       	P5 = R1;
ffa022b4:	80 e6 01 00 	B[P0 + 0x1] = R0;
ffa022b8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa022ba:	40 b4       	W[P0 + 0x2] = R0;
ffa022bc:	38 ab       	R0 = W[FP + 0x18] (X);
ffa022be:	02 9b       	B[P0] = R2;
ffa022c0:	80 b4       	W[P0 + 0x4] = R0;
ffa022c2:	b8 ab       	R0 = W[FP + 0x1c] (X);
ffa022c4:	50 30       	R2 = P0;
ffa022c6:	c0 b4       	W[P0 + 0x6] = R0;
ffa022c8:	48 32       	P1 = P0;
ffa022ca:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa022cc:	42 64       	R2 += 0x8;		/* (  8) */
ffa022ce:	22 68       	P2 = 0x4 (X);		/*		P2=0x4(  4) */
ffa022d0:	b2 e0 03 20 	LSETUP(0xffa022d4 <_icmp_header_setup+0x2c>, 0xffa022d6 <_icmp_header_setup+0x2e>) LC1 = P2;
ffa022d4:	08 94       	R0 = W[P1++] (Z);
ffa022d6:	41 50       	R1 = R1 + R0;
ffa022d8:	c8 42       	R0 = R1.L (Z);
ffa022da:	81 4e       	R1 >>= 0x10;
ffa022dc:	41 50       	R1 = R1 + R0;
ffa022de:	28 91       	R0 = [P5];
ffa022e0:	c0 67       	R0 += -0x8;		/* ( -8) */
ffa022e2:	28 93       	[P5] = R0;
ffa022e4:	c9 43       	R1 =~ R1;
ffa022e6:	01 e8 00 00 	UNLINK;
ffa022ea:	82 ce 02 c0 	R0 = ROT R2 BY 0x0 || W[P0 + 0x2] = R1 || NOP;
ffa022ee:	41 b4 00 00 
ffa022f2:	85 04       	(P5:5) = [SP++];
ffa022f4:	10 00       	RTS;
	...

ffa022f8 <_udp_header_setup>:
ffa022f8:	10 32       	P2 = R0;
ffa022fa:	d0 42       	R0 = R2.L (Z);
ffa022fc:	09 32       	P1 = R1;
ffa022fe:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02302:	40 4e       	R0 >>= 0x8;
ffa02304:	42 4f       	R2 <<= 0x8;
ffa02306:	79 a1       	R1 = [FP + 0x14];
ffa02308:	82 56       	R2 = R2 | R0;
ffa0230a:	c8 42       	R0 = R1.L (Z);
ffa0230c:	40 4e       	R0 >>= 0x8;
ffa0230e:	41 4f       	R1 <<= 0x8;
ffa02310:	41 56       	R1 = R1 | R0;
ffa02312:	51 b4       	W[P2 + 0x2] = R1;
ffa02314:	09 91       	R1 = [P1];
ffa02316:	12 97       	W[P2] = R2;
ffa02318:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa0231c:	82 c6 41 80 	R0 = R1 << 0x8;
ffa02320:	10 56       	R0 = R0 | R2;
ffa02322:	90 b4       	W[P2 + 0x4] = R0;
ffa02324:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02326:	d0 b4       	W[P2 + 0x6] = R0;
ffa02328:	c1 67       	R1 += -0x8;		/* ( -8) */
ffa0232a:	42 6c       	P2 += 0x8;		/* (  8) */
ffa0232c:	42 30       	R0 = P2;
ffa0232e:	09 93       	[P1] = R1;
ffa02330:	01 e8 00 00 	UNLINK;
ffa02334:	10 00       	RTS;
	...

ffa02338 <_tcp_header_setup>:
ffa02338:	08 32       	P1 = R0;
ffa0233a:	20 e1 00 50 	R0 = 0x5000 (X);		/*		R0=0x5000(20480) */
ffa0233e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900004 */
ffa02342:	78 05       	[--SP] = (R7:7);
ffa02344:	0a e1 dc 0f 	P2.L = 0xfdc;		/* (4060)	P2=0xff900fdc <_TcpClientPort> */
ffa02348:	08 97       	W[P1] = R0;
ffa0234a:	10 95       	R0 = W[P2] (Z);
ffa0234c:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa02350:	bb a1       	R3 = [FP + 0x18];
ffa02352:	01 32       	P0 = R1;
ffa02354:	48 b4       	W[P1 + 0x2] = R0;
ffa02356:	59 43       	R1 = R3.B (Z);
ffa02358:	82 ce c3 81 	R0 = R3 >> 0x8 || R7 = [FP + 0x1c] || NOP;
ffa0235c:	ff a1 00 00 
ffa02360:	41 4f       	R1 <<= 0x8;
ffa02362:	40 43       	R0 = R0.B (Z);
ffa02364:	08 56       	R0 = R0 | R1;
ffa02366:	82 c6 83 83 	R1 = R3 >> 0x10;
ffa0236a:	49 43       	R1 = R1.B (Z);
ffa0236c:	40 4f       	R0 <<= 0x8;
ffa0236e:	08 56       	R0 = R0 | R1;
ffa02370:	40 4f       	R0 <<= 0x8;
ffa02372:	c3 4e       	R3 >>= 0x18;
ffa02374:	18 56       	R0 = R0 | R3;
ffa02376:	48 b0       	[P1 + 0x4] = R0;
ffa02378:	79 43       	R1 = R7.B (Z);
ffa0237a:	82 c6 c7 81 	R0 = R7 >> 0x8;
ffa0237e:	41 4f       	R1 <<= 0x8;
ffa02380:	40 43       	R0 = R0.B (Z);
ffa02382:	08 56       	R0 = R0 | R1;
ffa02384:	82 c6 87 83 	R1 = R7 >> 0x10;
ffa02388:	40 4f       	R0 <<= 0x8;
ffa0238a:	49 43       	R1 = R1.B (Z);
ffa0238c:	08 56       	R0 = R0 | R1;
ffa0238e:	c7 4e       	R7 >>= 0x18;
ffa02390:	40 4f       	R0 <<= 0x8;
ffa02392:	38 56       	R0 = R0 | R7;
ffa02394:	88 b0       	[P1 + 0x8] = R0;
ffa02396:	20 e1 50 00 	R0 = 0x50 (X);		/*		R0=0x50( 80) */
ffa0239a:	88 e6 0c 00 	B[P1 + 0xc] = R0;
ffa0239e:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa023a0:	c8 b5       	W[P1 + 0xe] = R0;
ffa023a2:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa023a4:	8a e6 0d 00 	B[P1 + 0xd] = R2;
ffa023a8:	08 b6       	W[P1 + 0x10] = R0;
ffa023aa:	48 b6       	W[P1 + 0x12] = R0;
ffa023ac:	00 91       	R0 = [P0];
ffa023ae:	60 67       	R0 += -0x14;		/* (-20) */
ffa023b0:	00 93       	[P0] = R0;
ffa023b2:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa023b4:	01 e8 00 00 	UNLINK;
ffa023b8:	41 30       	R0 = P1;
ffa023ba:	38 05       	(R7:7) = [SP++];
ffa023bc:	10 00       	RTS;
	...

ffa023c0 <_bfin_EMAC_send_nocopy>:
ffa023c0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00fdc(-4190244) */
ffa023c4:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa023c8:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa023ca:	0a e1 08 07 	P2.L = 0x708;		/* (1800)	P2=0xffc00708(-4192504) */
ffa023ce:	10 97       	W[P2] = R0;
ffa023d0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00708(-4192504) */
ffa023d4:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa023d8:	10 95       	R0 = W[P2] (Z);
ffa023da:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa023dc:	55 10       	IF !CC JUMP 0xffa02486 <_bfin_EMAC_send_nocopy+0xc6>;
ffa023de:	00 00       	NOP;
ffa023e0:	00 00       	NOP;
ffa023e2:	00 00       	NOP;
ffa023e4:	10 95       	R0 = W[P2] (Z);
ffa023e6:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa023e8:	16 18       	IF CC JUMP 0xffa02414 <_bfin_EMAC_send_nocopy+0x54>;
ffa023ea:	4a 32       	P1 = P2;
ffa023ec:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf0ca8 */
ffa023f0:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa023f2:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa023f6:	41 34       	I0 = P1;
ffa023f8:	b2 e0 06 20 	LSETUP(0xffa023fc <_bfin_EMAC_send_nocopy+0x3c>, 0xffa02404 <_bfin_EMAC_send_nocopy+0x44>) LC1 = P2;
ffa023fc:	20 9d       	R0.L = W[I0];
ffa023fe:	01 54       	R0 = R1 & R0;
ffa02400:	00 0c       	CC = R0 == 0x0;
ffa02402:	09 18       	IF CC JUMP 0xffa02414 <_bfin_EMAC_send_nocopy+0x54>;
ffa02404:	00 00       	NOP;
ffa02406:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900020(-7340000) */
ffa0240a:	00 e1 0c 01 	R0.L = 0x10c;		/* (268)	R0=0xff90010c(-7339764) */
ffa0240e:	ff e3 81 fb 	CALL 0xffa01b10 <_printf_str>;
ffa02412:	2d 20       	JUMP.S 0xffa0246c <_bfin_EMAC_send_nocopy+0xac>;
ffa02414:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900001 */
ffa02418:	08 e1 b8 0e 	P0.L = 0xeb8;		/* (3768)	P0=0xff900eb8 <_txIdx> */
ffa0241c:	02 95       	R2 = W[P0] (Z);
ffa0241e:	d1 42       	R1 = R2.L (Z);
ffa02420:	09 32       	P1 = R1;
ffa02422:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff904241 */
ffa02426:	0a e1 bc 0e 	P2.L = 0xebc;		/* (3772)	P2=0xff900ebc <_txbuf> */
ffa0242a:	11 0d       	CC = R1 <= 0x2;
ffa0242c:	8a 5e       	P2 = P2 + (P1 << 0x2);
ffa0242e:	51 91       	P1 = [P2];
ffa02430:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00ebc(-4190532) */
ffa02434:	0a e1 80 0c 	P2.L = 0xc80;		/* (3200)	P2=0xffc00c80(-4191104) */
ffa02438:	88 a1       	R0 = [P1 + 0x18];
ffa0243a:	48 b0       	[P1 + 0x4] = R0;
ffa0243c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0243e:	88 b2       	[P1 + 0x28] = R0;
ffa02440:	51 93       	[P2] = P1;
ffa02442:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c80 */
ffa02446:	0a e1 fe 04 	P2.L = 0x4fe;		/* (1278)	P2=0xff9004fe <_txdmacfg> */
ffa0244a:	10 95       	R0 = W[P2] (Z);
ffa0244c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc004fe(-4193026) */
ffa02450:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa02454:	10 97       	W[P2] = R0;
ffa02456:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa0245a:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa0245e:	10 91       	R0 = [P2];
ffa02460:	80 4a       	BITSET (R0, 0x10);		/* bit 16 */
ffa02462:	10 93       	[P2] = R0;
ffa02464:	0e 10       	IF !CC JUMP 0xffa02480 <_bfin_EMAC_send_nocopy+0xc0>;
ffa02466:	02 30       	R0 = R2;
ffa02468:	08 64       	R0 += 0x1;		/* (  1) */
ffa0246a:	00 97       	W[P0] = R0;
ffa0246c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa02470:	00 61       	R0 = 0x20 (X);		/*		R0=0x20( 32) */
ffa02472:	0a e1 04 07 	P2.L = 0x704;		/* (1796)	P2=0xffc00704(-4192508) */
ffa02476:	10 97       	W[P2] = R0;
ffa02478:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0247a:	01 e8 00 00 	UNLINK;
ffa0247e:	10 00       	RTS;
ffa02480:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02482:	00 97       	W[P0] = R0;
ffa02484:	f4 2f       	JUMP.S 0xffa0246c <_bfin_EMAC_send_nocopy+0xac>;
ffa02486:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa0248a:	00 e1 f4 00 	R0.L = 0xf4;		/* (244)	R0=0xff9000f4(-7339788) */
ffa0248e:	ff e3 41 fb 	CALL 0xffa01b10 <_printf_str>;
ffa02492:	ed 2f       	JUMP.S 0xffa0246c <_bfin_EMAC_send_nocopy+0xac>;

ffa02494 <_DHCP_tx>:
ffa02494:	60 05       	[--SP] = (R7:4);
ffa02496:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900704 */
ffa0249a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa0249e:	38 30       	R7 = R0;
ffa024a0:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa024a4:	10 95       	R0 = W[P2] (Z);
ffa024a6:	10 32       	P2 = R0;
ffa024a8:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900008 */
ffa024ac:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa024b0:	20 e1 1a 01 	R0 = 0x11a (X);		/*		R0=0x11a(282) */
ffa024b4:	fb 63       	R3 = -0x1 (X);		/*		R3=0xffffffff( -1) */
ffa024b6:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa024b8:	52 91       	P2 = [P2];
ffa024ba:	07 50       	R0 = R7 + R0;
ffa024bc:	19 34       	I3 = R1;
ffa024be:	90 ad       	P0 = [P2 + 0x18];
ffa024c0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa024c4:	0a e1 e0 0e 	P2.L = 0xee0;		/* (3808)	P2=0xff900ee0 <_NetOurMAC> */
ffa024c8:	00 97       	W[P0] = R0;
ffa024ca:	83 e6 02 00 	B[P0 + 0x2] = R3;
ffa024ce:	83 e6 03 00 	B[P0 + 0x3] = R3;
ffa024d2:	83 e6 04 00 	B[P0 + 0x4] = R3;
ffa024d6:	83 e6 05 00 	B[P0 + 0x5] = R3;
ffa024da:	83 e6 06 00 	B[P0 + 0x6] = R3;
ffa024de:	83 e6 07 00 	B[P0 + 0x7] = R3;
ffa024e2:	50 99       	R0 = B[P2] (X);
ffa024e4:	80 e6 08 00 	B[P0 + 0x8] = R0;
ffa024e8:	08 34       	I1 = R0;
ffa024ea:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa024ee:	80 e6 09 00 	B[P0 + 0x9] = R0;
ffa024f2:	94 e5 02 00 	R4 = B[P2 + 0x2] (X);
ffa024f6:	84 e6 0a 00 	B[P0 + 0xa] = R4;
ffa024fa:	95 e5 03 00 	R5 = B[P2 + 0x3] (X);
ffa024fe:	85 e6 0b 00 	B[P0 + 0xb] = R5;
ffa02502:	96 e5 04 00 	R6 = B[P2 + 0x4] (X);
ffa02506:	86 e6 0c 00 	B[P0 + 0xc] = R6;
ffa0250a:	00 34       	I0 = R0;
ffa0250c:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02510:	80 e6 0d 00 	B[P0 + 0xd] = R0;
ffa02514:	10 34       	I2 = R0;
ffa02516:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02518:	c0 b5       	W[P0 + 0xe] = R0;
ffa0251a:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa0251e:	80 e6 10 00 	B[P0 + 0x10] = R0;
ffa02522:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02524:	80 e6 11 00 	B[P0 + 0x11] = R0;
ffa02528:	20 e1 0c 01 	R0 = 0x10c (X);		/*		R0=0x10c(268) */
ffa0252c:	07 50       	R0 = R7 + R0;
ffa0252e:	c1 42       	R1 = R0.L (Z);
ffa02530:	41 4e       	R1 >>= 0x8;
ffa02532:	40 4f       	R0 <<= 0x8;
ffa02534:	08 56       	R0 = R0 | R1;
ffa02536:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee0 <_NetOurMAC> */
ffa0253a:	0a e1 ba 0e 	P2.L = 0xeba;		/* (3770)	P2=0xff900eba <_NetIPID> */
ffa0253e:	40 b6       	W[P0 + 0x12] = R0;
ffa02540:	10 95       	R0 = W[P2] (Z);
ffa02542:	08 30       	R1 = R0;
ffa02544:	09 64       	R1 += 0x1;		/* (  1) */
ffa02546:	11 97       	W[P2] = R1;
ffa02548:	c1 42       	R1 = R0.L (Z);
ffa0254a:	41 4e       	R1 >>= 0x8;
ffa0254c:	40 4f       	R0 <<= 0x8;
ffa0254e:	08 56       	R0 = R0 | R1;
ffa02550:	80 b6       	W[P0 + 0x14] = R0;
ffa02552:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa02556:	c0 b6       	W[P0 + 0x16] = R0;
ffa02558:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa0255a:	80 e6 19 00 	B[P0 + 0x19] = R0;
ffa0255e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02560:	40 b7       	W[P0 + 0x1a] = R0;
ffa02562:	00 cc 00 c0 	R0 = R0 -|- R0 || [P0 + 0x20] = R2 || NOP;
ffa02566:	02 b2 00 00 
ffa0256a:	48 32       	P1 = P0;
ffa0256c:	83 e6 18 00 	B[P0 + 0x18] = R3;
ffa02570:	c0 b1       	[P0 + 0x1c] = R0;
ffa02572:	81 6c       	P1 += 0x10;		/* ( 16) */
ffa02574:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02576:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02578:	b2 e0 03 20 	LSETUP(0xffa0257c <_DHCP_tx+0xe8>, 0xffa0257e <_DHCP_tx+0xea>) LC1 = P2;
ffa0257c:	08 94       	R0 = W[P1++] (Z);
ffa0257e:	41 50       	R1 = R1 + R0;
ffa02580:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa02584:	01 50       	R0 = R1 + R0;
ffa02586:	c0 42       	R0 = R0.L (Z);
ffa02588:	c0 43       	R0 =~ R0;
ffa0258a:	40 b7       	W[P0 + 0x1a] = R0;
ffa0258c:	20 e1 00 44 	R0 = 0x4400 (X);		/*		R0=0x4400(17408) */
ffa02590:	40 e6 12 00 	W[P0 + 0x24] = R0;
ffa02594:	20 e1 00 43 	R0 = 0x4300 (X);		/*		R0=0x4300(17152) */
ffa02598:	40 e6 13 00 	W[P0 + 0x26] = R0;
ffa0259c:	20 e1 f8 00 	R0 = 0xf8 (X);		/*		R0=0xf8(248) */
ffa025a0:	07 50       	R0 = R7 + R0;
ffa025a2:	c1 42       	R1 = R0.L (Z);
ffa025a4:	41 4e       	R1 >>= 0x8;
ffa025a6:	40 4f       	R0 <<= 0x8;
ffa025a8:	08 56       	R0 = R0 | R1;
ffa025aa:	40 e6 14 00 	W[P0 + 0x28] = R0;
ffa025ae:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa025b0:	80 e6 2c 00 	B[P0 + 0x2c] = R0;
ffa025b4:	80 e6 2d 00 	B[P0 + 0x2d] = R0;
ffa025b8:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa025ba:	80 e6 2e 00 	B[P0 + 0x2e] = R0;
ffa025be:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa025c0:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc0000a(-4194294) */
ffa025c4:	0a e1 04 30 	P2.L = 0x3004;		/* (12292)	P2=0xffc03004(-4182012) */
ffa025c8:	80 e6 2f 00 	B[P0 + 0x2f] = R0;
ffa025cc:	10 91       	R0 = [P2];
ffa025ce:	00 b3       	[P0 + 0x30] = R0;
ffa025d0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa025d2:	80 b3       	[P0 + 0x38] = R0;
ffa025d4:	c0 b3       	[P0 + 0x3c] = R0;
ffa025d6:	00 e6 10 00 	[P0 + 0x40] = R0;
ffa025da:	00 e6 11 00 	[P0 + 0x44] = R0;
ffa025de:	40 e1 53 63 	R0.H = 0x6353;		/* (25427)	R0=0x63530000(1666383872) */
ffa025e2:	00 e1 63 82 	R0.L = 0x8263;		/* (-32157)	R0=0x63538263(1666417251) */
ffa025e6:	00 e6 46 00 	[P0 + 0x118] = R0;
ffa025ea:	81 30       	R0 = I1;
ffa025ec:	80 e6 48 00 	B[P0 + 0x48] = R0;
ffa025f0:	80 30       	R0 = I0;
ffa025f2:	80 e6 49 00 	B[P0 + 0x49] = R0;
ffa025f6:	82 30       	R0 = I2;
ffa025f8:	2a e1 4e 00 	P2 = 0x4e (X);		/*		P2=0x4e( 78) */
ffa025fc:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa025fe:	80 e6 4d 00 	B[P0 + 0x4d] = R0;
ffa02602:	50 5a       	P1 = P0 + P2;
ffa02604:	41 e6 15 00 	W[P0 + 0x2a] = R1;
ffa02608:	41 e6 1a 00 	W[P0 + 0x34] = R1;
ffa0260c:	41 e6 1b 00 	W[P0 + 0x36] = R1;
ffa02610:	84 e6 4a 00 	B[P0 + 0x4a] = R4;
ffa02614:	85 e6 4b 00 	B[P0 + 0x4b] = R5;
ffa02618:	86 e6 4c 00 	B[P0 + 0x4c] = R6;
ffa0261c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0261e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02620:	b2 e0 02 20 	LSETUP(0xffa02624 <_DHCP_tx+0x190>, 0xffa02624 <_DHCP_tx+0x190>) LC1 = P2;
ffa02624:	08 9a       	B[P1++] = R0;
ffa02626:	2a e1 58 00 	P2 = 0x58 (X);		/*		P2=0x58( 88) */
ffa0262a:	50 5a       	P1 = P0 + P2;
ffa0262c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0262e:	82 68       	P2 = 0x10 (X);		/*		P2=0x10( 16) */
ffa02630:	b2 e0 02 20 	LSETUP(0xffa02634 <_DHCP_tx+0x1a0>, 0xffa02634 <_DHCP_tx+0x1a0>) LC1 = P2;
ffa02634:	08 92       	[P1++] = R0;
ffa02636:	2a e1 98 00 	P2 = 0x98 (X);		/*		P2=0x98(152) */
ffa0263a:	50 5a       	P1 = P0 + P2;
ffa0263c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0263e:	02 69       	P2 = 0x20 (X);		/*		P2=0x20( 32) */
ffa02640:	b2 e0 02 20 	LSETUP(0xffa02644 <_DHCP_tx+0x1b0>, 0xffa02644 <_DHCP_tx+0x1b0>) LC1 = P2;
ffa02644:	08 92       	[P1++] = R0;
ffa02646:	40 30       	R0 = P0;
ffa02648:	21 e1 1c 01 	R1 = 0x11c (X);		/*		R1=0x11c(284) */
ffa0264c:	48 50       	R1 = R0 + R1;
ffa0264e:	17 30       	R2 = R7;
ffa02650:	83 30       	R0 = I3;
ffa02652:	ff e3 ad fa 	CALL 0xffa01bac <_memcpy_>;
ffa02656:	01 e8 00 00 	UNLINK;
ffa0265a:	20 05       	(R7:4) = [SP++];
ffa0265c:	ff e2 b2 fe 	JUMP.L 0xffa023c0 <_bfin_EMAC_send_nocopy>;

ffa02660 <_DHCP_tx_discover>:
ffa02660:	c5 04       	[--SP] = (P5:5);
ffa02662:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa02666:	0d e1 b4 0e 	P5.L = 0xeb4;		/* (3764)	P5=0xff900eb4 <_NetDHCPserv> */
ffa0266a:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa0266c:	28 93       	[P5] = R0;
ffa0266e:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa02672:	a8 61       	R0 = 0x35 (X);		/*		R0=0x35( 53) */
ffa02674:	b8 e6 fc ff 	B[FP + -0x4] = R0;
ffa02678:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0267a:	b8 e6 fd ff 	B[FP + -0x3] = R0;
ffa0267e:	b8 e6 fe ff 	B[FP + -0x2] = R0;
ffa02682:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02684:	b8 e6 ff ff 	B[FP + -0x1] = R0;
ffa02688:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90ffff(-7274497) */
ffa0268c:	00 e1 24 01 	R0.L = 0x124;		/* (292)	R0=0xff900124(-7339740) */
ffa02690:	ff e3 40 fa 	CALL 0xffa01b10 <_printf_str>;
ffa02694:	4f 30       	R1 = FP;
ffa02696:	2a 91       	R2 = [P5];
ffa02698:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa0269a:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa0269c:	ff e3 fc fe 	CALL 0xffa02494 <_DHCP_tx>;
ffa026a0:	01 e8 00 00 	UNLINK;
ffa026a4:	85 04       	(P5:5) = [SP++];
ffa026a6:	10 00       	RTS;

ffa026a8 <_DHCP_parse>:
ffa026a8:	eb 05       	[--SP] = (R7:5, P5:3);
ffa026aa:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900eb4 <_NetDHCPserv> */
ffa026ae:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900e68 <_printf_temp> */
ffa026b2:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900e6c <_printf_out> */
ffa026b6:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa026ba:	10 30       	R2 = R0;
ffa026bc:	0d e1 0c 04 	P5.L = 0x40c;		/* (1036)	P5=0xff90040c */
ffa026c0:	0c e1 b4 0e 	P4.L = 0xeb4;		/* (3764)	P4=0xff900eb4 <_NetDHCPserv> */
ffa026c4:	0b e1 e8 0e 	P3.L = 0xee8;		/* (3816)	P3=0xff900ee8 <_NetSubnetMask> */
ffa026c8:	09 0d       	CC = R1 <= 0x1;
ffa026ca:	0b 18       	IF CC JUMP 0xffa026e0 <_DHCP_parse+0x38>;
ffa026cc:	12 32       	P2 = R2;
ffa026ce:	31 30       	R6 = R1;
ffa026d0:	fe 67       	R6 += -0x1;		/* ( -1) */
ffa026d2:	11 98       	R1 = B[P2++] (Z);
ffa026d4:	01 0c       	CC = R1 == 0x0;
ffa026d6:	0d 10       	IF !CC JUMP 0xffa026f0 <_DHCP_parse+0x48>;
ffa026d8:	0e 32       	P1 = R6;
ffa026da:	f9 6f       	P1 += -0x1;		/* ( -1) */
ffa026dc:	41 0c       	CC = P1 == 0x0;
ffa026de:	05 10       	IF !CC JUMP 0xffa026e8 <_DHCP_parse+0x40>;
ffa026e0:	01 e8 00 00 	UNLINK;
ffa026e4:	ab 05       	(R7:5, P5:3) = [SP++];
ffa026e6:	10 00       	RTS;
ffa026e8:	11 98       	R1 = B[P2++] (Z);
ffa026ea:	fe 67       	R6 += -0x1;		/* ( -1) */
ffa026ec:	01 0c       	CC = R1 == 0x0;
ffa026ee:	f6 1f       	IF CC JUMP 0xffa026da <_DHCP_parse+0x32> (BP);
ffa026f0:	20 e1 ff 00 	R0 = 0xff (X);		/*		R0=0xff(255) */
ffa026f4:	57 99       	R7 = B[P2] (X);
ffa026f6:	01 08       	CC = R1 == R0;
ffa026f8:	f4 1b       	IF CC JUMP 0xffa026e0 <_DHCP_parse+0x38>;
ffa026fa:	6a 30       	R5 = P2;
ffa026fc:	d8 61       	R0 = 0x3b (X);		/*		R0=0x3b( 59) */
ffa026fe:	0d 64       	R5 += 0x1;		/* (  1) */
ffa02700:	01 0a       	CC = R1 <= R0 (IU);
ffa02702:	19 1c       	IF CC JUMP 0xffa02734 <_DHCP_parse+0x8c> (BP);
ffa02704:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90003b(-7339973) */
ffa02708:	00 e1 e0 01 	R0.L = 0x1e0;		/* (480)	R0=0xff9001e0(-7339552) */
ffa0270c:	ff e3 5a f9 	CALL 0xffa019c0 <_printf_int>;
ffa02710:	7f 43       	R7 = R7.B (Z);
ffa02712:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001e0(-7339552) */
ffa02716:	00 e1 f4 01 	R0.L = 0x1f4;		/* (500)	R0=0xff9001f4(-7339532) */
ffa0271a:	0f 30       	R1 = R7;
ffa0271c:	ff e3 52 f9 	CALL 0xffa019c0 <_printf_int>;
ffa02720:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001f4(-7339532) */
ffa02724:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa02728:	ff e3 f4 f9 	CALL 0xffa01b10 <_printf_str>;
ffa0272c:	f8 43       	R0 =~ R7;
ffa0272e:	bd 50       	R2 = R5 + R7;
ffa02730:	70 50       	R1 = R0 + R6;
ffa02732:	cb 2f       	JUMP.S 0xffa026c8 <_DHCP_parse+0x20>;
ffa02734:	09 32       	P1 = R1;
ffa02736:	8d 5e       	P2 = P5 + (P1 << 0x2);
ffa02738:	52 91       	P2 = [P2];
ffa0273a:	52 00       	JUMP (P2);
ffa0273c:	0d 32       	P1 = R5;
ffa0273e:	15 32       	P2 = R5;
ffa02740:	7f 43       	R7 = R7.B (Z);
ffa02742:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa02746:	10 98       	R0 = B[P2++] (Z);
ffa02748:	42 4f       	R2 <<= 0x8;
ffa0274a:	82 50       	R2 = R2 + R0;
ffa0274c:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02750:	80 4f       	R0 <<= 0x10;
ffa02752:	82 50       	R2 = R2 + R0;
ffa02754:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02758:	c0 4f       	R0 <<= 0x18;
ffa0275a:	82 50       	R2 = R2 + R0;
ffa0275c:	50 43       	R0 = R2.B (Z);
ffa0275e:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa02762:	40 4f       	R0 <<= 0x8;
ffa02764:	49 43       	R1 = R1.B (Z);
ffa02766:	41 56       	R1 = R1 | R0;
ffa02768:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa0276c:	40 43       	R0 = R0.B (Z);
ffa0276e:	41 4f       	R1 <<= 0x8;
ffa02770:	41 56       	R1 = R1 | R0;
ffa02772:	c2 4e       	R2 >>= 0x18;
ffa02774:	41 4f       	R1 <<= 0x8;
ffa02776:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90079c(-7338084) */
ffa0277a:	51 56       	R1 = R1 | R2;
ffa0277c:	00 e1 c8 01 	R0.L = 0x1c8;		/* (456)	R0=0xff9001c8(-7339576) */
ffa02780:	ff e3 20 f9 	CALL 0xffa019c0 <_printf_int>;
ffa02784:	ce 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa02786:	0d 32       	P1 = R5;
ffa02788:	15 32       	P2 = R5;
ffa0278a:	7f 43       	R7 = R7.B (Z);
ffa0278c:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa02790:	10 98       	R0 = B[P2++] (Z);
ffa02792:	42 4f       	R2 <<= 0x8;
ffa02794:	82 50       	R2 = R2 + R0;
ffa02796:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa0279a:	80 4f       	R0 <<= 0x10;
ffa0279c:	82 50       	R2 = R2 + R0;
ffa0279e:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa027a2:	c0 4f       	R0 <<= 0x18;
ffa027a4:	82 50       	R2 = R2 + R0;
ffa027a6:	50 43       	R0 = R2.B (Z);
ffa027a8:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa027ac:	40 4f       	R0 <<= 0x8;
ffa027ae:	49 43       	R1 = R1.B (Z);
ffa027b0:	41 56       	R1 = R1 | R0;
ffa027b2:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa027b6:	40 43       	R0 = R0.B (Z);
ffa027b8:	41 4f       	R1 <<= 0x8;
ffa027ba:	41 56       	R1 = R1 | R0;
ffa027bc:	c2 4e       	R2 >>= 0x18;
ffa027be:	41 4f       	R1 <<= 0x8;
ffa027c0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001c8(-7339576) */
ffa027c4:	51 56       	R1 = R1 | R2;
ffa027c6:	00 e1 b4 01 	R0.L = 0x1b4;		/* (436)	R0=0xff9001b4(-7339596) */
ffa027ca:	ff e3 fb f8 	CALL 0xffa019c0 <_printf_int>;
ffa027ce:	a9 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa027d0:	0d 32       	P1 = R5;
ffa027d2:	15 32       	P2 = R5;
ffa027d4:	7f 43       	R7 = R7.B (Z);
ffa027d6:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa027da:	10 98       	R0 = B[P2++] (Z);
ffa027dc:	41 4f       	R1 <<= 0x8;
ffa027de:	41 50       	R1 = R1 + R0;
ffa027e0:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa027e4:	80 4f       	R0 <<= 0x10;
ffa027e6:	41 50       	R1 = R1 + R0;
ffa027e8:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa027ec:	c0 4f       	R0 <<= 0x18;
ffa027ee:	41 50       	R1 = R1 + R0;
ffa027f0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001b4(-7339596) */
ffa027f4:	21 93       	[P4] = R1;
ffa027f6:	00 e1 a0 01 	R0.L = 0x1a0;		/* (416)	R0=0xff9001a0(-7339616) */
ffa027fa:	ff e3 91 f9 	CALL 0xffa01b1c <_printf_ip>;
ffa027fe:	91 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa02800:	15 32       	P2 = R5;
ffa02802:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9001a0(-7339616) */
ffa02806:	00 e1 8c 01 	R0.L = 0x18c;		/* (396)	R0=0xff90018c(-7339636) */
ffa0280a:	7f 43       	R7 = R7.B (Z);
ffa0280c:	11 99       	R1 = B[P2] (Z);
ffa0280e:	ff e3 d9 f8 	CALL 0xffa019c0 <_printf_int>;
ffa02812:	87 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa02814:	0d 32       	P1 = R5;
ffa02816:	15 32       	P2 = R5;
ffa02818:	7f 43       	R7 = R7.B (Z);
ffa0281a:	8a e4 01 00 	R2 = B[P1 + 0x1] (Z);
ffa0281e:	10 98       	R0 = B[P2++] (Z);
ffa02820:	42 4f       	R2 <<= 0x8;
ffa02822:	82 50       	R2 = R2 + R0;
ffa02824:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02828:	80 4f       	R0 <<= 0x10;
ffa0282a:	82 50       	R2 = R2 + R0;
ffa0282c:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02830:	c0 4f       	R0 <<= 0x18;
ffa02832:	82 50       	R2 = R2 + R0;
ffa02834:	50 43       	R0 = R2.B (Z);
ffa02836:	82 c6 c2 83 	R1 = R2 >> 0x8;
ffa0283a:	40 4f       	R0 <<= 0x8;
ffa0283c:	49 43       	R1 = R1.B (Z);
ffa0283e:	41 56       	R1 = R1 | R0;
ffa02840:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa02844:	40 43       	R0 = R0.B (Z);
ffa02846:	41 4f       	R1 <<= 0x8;
ffa02848:	41 56       	R1 = R1 | R0;
ffa0284a:	c2 4e       	R2 >>= 0x18;
ffa0284c:	41 4f       	R1 <<= 0x8;
ffa0284e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90018c(-7339636) */
ffa02852:	51 56       	R1 = R1 | R2;
ffa02854:	00 e1 78 01 	R0.L = 0x178;		/* (376)	R0=0xff900178(-7339656) */
ffa02858:	ff e3 b4 f8 	CALL 0xffa019c0 <_printf_int>;
ffa0285c:	62 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa0285e:	0d 32       	P1 = R5;
ffa02860:	15 32       	P2 = R5;
ffa02862:	7f 43       	R7 = R7.B (Z);
ffa02864:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa02868:	10 98       	R0 = B[P2++] (Z);
ffa0286a:	41 4f       	R1 <<= 0x8;
ffa0286c:	41 50       	R1 = R1 + R0;
ffa0286e:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa02872:	80 4f       	R0 <<= 0x10;
ffa02874:	41 50       	R1 = R1 + R0;
ffa02876:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa0287a:	c0 4f       	R0 <<= 0x18;
ffa0287c:	41 50       	R1 = R1 + R0;
ffa0287e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900178(-7339656) */
ffa02882:	00 e1 68 01 	R0.L = 0x168;		/* (360)	R0=0xff900168(-7339672) */
ffa02886:	ff e3 4b f9 	CALL 0xffa01b1c <_printf_ip>;
ffa0288a:	4b 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa0288c:	0d 32       	P1 = R5;
ffa0288e:	15 32       	P2 = R5;
ffa02890:	7f 43       	R7 = R7.B (Z);
ffa02892:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa02896:	10 98       	R0 = B[P2++] (Z);
ffa02898:	41 4f       	R1 <<= 0x8;
ffa0289a:	41 50       	R1 = R1 + R0;
ffa0289c:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa028a0:	80 4f       	R0 <<= 0x10;
ffa028a2:	41 50       	R1 = R1 + R0;
ffa028a4:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa028a8:	c0 4f       	R0 <<= 0x18;
ffa028aa:	41 50       	R1 = R1 + R0;
ffa028ac:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900168(-7339672) */
ffa028b0:	00 e1 58 01 	R0.L = 0x158;		/* (344)	R0=0xff900158(-7339688) */
ffa028b4:	ff e3 34 f9 	CALL 0xffa01b1c <_printf_ip>;
ffa028b8:	34 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa028ba:	0d 32       	P1 = R5;
ffa028bc:	15 32       	P2 = R5;
ffa028be:	7f 43       	R7 = R7.B (Z);
ffa028c0:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa028c4:	10 98       	R0 = B[P2++] (Z);
ffa028c6:	41 4f       	R1 <<= 0x8;
ffa028c8:	41 50       	R1 = R1 + R0;
ffa028ca:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa028ce:	80 4f       	R0 <<= 0x10;
ffa028d0:	41 50       	R1 = R1 + R0;
ffa028d2:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa028d6:	c0 4f       	R0 <<= 0x18;
ffa028d8:	41 50       	R1 = R1 + R0;
ffa028da:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900158(-7339688) */
ffa028de:	00 e1 48 01 	R0.L = 0x148;		/* (328)	R0=0xff900148(-7339704) */
ffa028e2:	ff e3 1d f9 	CALL 0xffa01b1c <_printf_ip>;
ffa028e6:	1d 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;
ffa028e8:	0d 32       	P1 = R5;
ffa028ea:	15 32       	P2 = R5;
ffa028ec:	7f 43       	R7 = R7.B (Z);
ffa028ee:	89 e4 01 00 	R1 = B[P1 + 0x1] (Z);
ffa028f2:	10 98       	R0 = B[P2++] (Z);
ffa028f4:	41 4f       	R1 <<= 0x8;
ffa028f6:	41 50       	R1 = R1 + R0;
ffa028f8:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa028fc:	80 4f       	R0 <<= 0x10;
ffa028fe:	41 50       	R1 = R1 + R0;
ffa02900:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa02904:	c0 4f       	R0 <<= 0x18;
ffa02906:	41 50       	R1 = R1 + R0;
ffa02908:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900148(-7339704) */
ffa0290c:	19 93       	[P3] = R1;
ffa0290e:	00 e1 38 01 	R0.L = 0x138;		/* (312)	R0=0xff900138(-7339720) */
ffa02912:	ff e3 05 f9 	CALL 0xffa01b1c <_printf_ip>;
ffa02916:	05 2f       	JUMP.S 0xffa02720 <_DHCP_parse+0x78>;

ffa02918 <_bfin_EMAC_send>:
ffa02918:	c4 04       	[--SP] = (P5:4);
ffa0291a:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa0291e:	18 30       	R3 = R0;
ffa02920:	11 30       	R2 = R1;
ffa02922:	01 0d       	CC = R1 <= 0x0;
ffa02924:	86 18       	IF CC JUMP 0xffa02a30 <_bfin_EMAC_send+0x118>;
ffa02926:	00 00       	NOP;
ffa02928:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00020(-4194272) */
ffa0292c:	0a e1 a8 0c 	P2.L = 0xca8;		/* (3240)	P2=0xffc00ca8(-4191064) */
ffa02930:	10 95       	R0 = W[P2] (Z);
ffa02932:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa02934:	72 10       	IF !CC JUMP 0xffa02a18 <_bfin_EMAC_send+0x100>;
ffa02936:	00 00       	NOP;
ffa02938:	00 00       	NOP;
ffa0293a:	00 00       	NOP;
ffa0293c:	10 95       	R0 = W[P2] (Z);
ffa0293e:	18 48       	CC = !BITTST (R0, 0x3);		/* bit  3 */
ffa02940:	1b 18       	IF CC JUMP 0xffa02976 <_bfin_EMAC_send+0x5e>;
ffa02942:	4a 32       	P1 = P2;
ffa02944:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf0ca8 */
ffa02948:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa0294a:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa0294e:	41 34       	I0 = P1;
ffa02950:	b2 e0 06 20 	LSETUP(0xffa02954 <_bfin_EMAC_send+0x3c>, 0xffa0295c <_bfin_EMAC_send+0x44>) LC1 = P2;
ffa02954:	20 9d       	R0.L = W[I0];
ffa02956:	01 54       	R0 = R1 & R0;
ffa02958:	00 0c       	CC = R0 == 0x0;
ffa0295a:	0e 18       	IF CC JUMP 0xffa02976 <_bfin_EMAC_send+0x5e>;
ffa0295c:	00 00       	NOP;
ffa0295e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900138(-7339720) */
ffa02962:	00 e1 18 02 	R0.L = 0x218;		/* (536)	R0=0xff900218(-7339496) */
ffa02966:	ff e3 d5 f8 	CALL 0xffa01b10 <_printf_str>;
ffa0296a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0296c:	01 e8 00 00 	UNLINK;
ffa02970:	01 30       	R0 = R1;
ffa02972:	84 04       	(P5:4) = [SP++];
ffa02974:	10 00       	RTS;
ffa02976:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eb4 <_NetDHCPserv> */
ffa0297a:	0c e1 b8 0e 	P4.L = 0xeb8;		/* (3768)	P4=0xff900eb8 <_txIdx> */
ffa0297e:	20 95       	R0 = W[P4] (Z);
ffa02980:	10 32       	P2 = R0;
ffa02982:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff90040c */
ffa02986:	0d e1 bc 0e 	P5.L = 0xebc;		/* (3772)	P5=0xff900ebc <_txbuf> */
ffa0298a:	0b 30       	R1 = R3;
ffa0298c:	95 5e       	P2 = P5 + (P2 << 0x2);
ffa0298e:	52 91       	P2 = [P2];
ffa02990:	92 ad       	P2 = [P2 + 0x18];
ffa02992:	12 96       	W[P2++] = R2;
ffa02994:	42 30       	R0 = P2;
ffa02996:	ff e3 0b f9 	CALL 0xffa01bac <_memcpy_>;
ffa0299a:	23 95       	R3 = W[P4] (Z);
ffa0299c:	da 42       	R2 = R3.L (Z);
ffa0299e:	12 32       	P2 = R2;
ffa029a0:	55 5f       	P5 = P5 + (P2 << 0x2);
ffa029a2:	6d 91       	P5 = [P5];
ffa029a4:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc04241(-4177343) */
ffa029a8:	0a e1 80 0c 	P2.L = 0xc80;		/* (3200)	P2=0xffc00c80(-4191104) */
ffa029ac:	55 93       	[P2] = P5;
ffa029ae:	a8 a1       	R0 = [P5 + 0x18];
ffa029b0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c80 */
ffa029b4:	0a e1 fe 04 	P2.L = 0x4fe;		/* (1278)	P2=0xff9004fe <_txdmacfg> */
ffa029b8:	68 b0       	[P5 + 0x4] = R0;
ffa029ba:	10 95       	R0 = W[P2] (Z);
ffa029bc:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc004fe(-4193026) */
ffa029c0:	0a e1 88 0c 	P2.L = 0xc88;		/* (3208)	P2=0xffc00c88(-4191096) */
ffa029c4:	10 97       	W[P2] = R0;
ffa029c6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c88(-4191096) */
ffa029ca:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa029ce:	10 91       	R0 = [P2];
ffa029d0:	80 4a       	BITSET (R0, 0x10);		/* bit 16 */
ffa029d2:	10 93       	[P2] = R0;
ffa029d4:	a8 a2       	R0 = [P5 + 0x28];
ffa029d6:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa029d8:	13 10       	IF !CC JUMP 0xffa029fe <_bfin_EMAC_send+0xe6>;
ffa029da:	4a e1 0f 00 	P2.H = 0xf;		/* ( 15)	P2=0xf3000 */
ffa029de:	0a e1 41 42 	P2.L = 0x4241;		/* (16961)	P2=0xf4241 */
ffa029e2:	b2 e0 05 20 	LSETUP(0xffa029e6 <_bfin_EMAC_send+0xce>, 0xffa029ec <_bfin_EMAC_send+0xd4>) LC1 = P2;
ffa029e6:	a8 a2       	R0 = [P5 + 0x28];
ffa029e8:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa029ea:	0a 10       	IF !CC JUMP 0xffa029fe <_bfin_EMAC_send+0xe6>;
ffa029ec:	00 00       	NOP;
ffa029ee:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900218(-7339496) */
ffa029f2:	00 e1 30 02 	R0.L = 0x230;		/* (560)	R0=0xff900230(-7339472) */
ffa029f6:	ff e3 8d f8 	CALL 0xffa01b10 <_printf_str>;
ffa029fa:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa029fc:	09 20       	JUMP.S 0xffa02a0e <_bfin_EMAC_send+0xf6>;
ffa029fe:	a9 a2       	R1 = [P5 + 0x28];
ffa02a00:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02a02:	a8 b2       	[P5 + 0x28] = R0;
ffa02a04:	12 0d       	CC = R2 <= 0x2;
ffa02a06:	03 10       	IF !CC JUMP 0xffa02a0c <_bfin_EMAC_send+0xf4>;
ffa02a08:	03 30       	R0 = R3;
ffa02a0a:	08 64       	R0 += 0x1;		/* (  1) */
ffa02a0c:	20 97       	W[P4] = R0;
ffa02a0e:	01 e8 00 00 	UNLINK;
ffa02a12:	01 30       	R0 = R1;
ffa02a14:	84 04       	(P5:4) = [SP++];
ffa02a16:	10 00       	RTS;
ffa02a18:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa02a1c:	00 e1 f4 00 	R0.L = 0xf4;		/* (244)	R0=0xff9000f4(-7339788) */
ffa02a20:	ff e3 78 f8 	CALL 0xffa01b10 <_printf_str>;
ffa02a24:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02a26:	01 e8 00 00 	UNLINK;
ffa02a2a:	01 30       	R0 = R1;
ffa02a2c:	84 04       	(P5:4) = [SP++];
ffa02a2e:	10 00       	RTS;
ffa02a30:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9000f4(-7339788) */
ffa02a34:	00 e1 fc 01 	R0.L = 0x1fc;		/* (508)	R0=0xff9001fc(-7339524) */
ffa02a38:	ff e3 c4 f7 	CALL 0xffa019c0 <_printf_int>;
ffa02a3c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02a3e:	01 e8 00 00 	UNLINK;
ffa02a42:	01 30       	R0 = R1;
ffa02a44:	84 04       	(P5:4) = [SP++];
ffa02a46:	10 00       	RTS;

ffa02a48 <_ether_testUDP>:
ffa02a48:	c5 04       	[--SP] = (P5:5);
ffa02a4a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff904241 */
ffa02a4e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02a52:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa02a56:	11 95       	R1 = W[P2] (Z);
ffa02a58:	11 32       	P2 = R1;
ffa02a5a:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ebc <_txbuf> */
ffa02a5e:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa02a62:	21 e1 42 00 	R1 = 0x42 (X);		/*		R1=0x42( 66) */
ffa02a66:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa02a68:	52 91       	P2 = [P2];
ffa02a6a:	95 ad       	P5 = [P2 + 0x18];
ffa02a6c:	55 32       	P2 = P5;
ffa02a6e:	11 96       	W[P2++] = R1;
ffa02a70:	4a 30       	R1 = P2;
ffa02a72:	00 e3 11 09 	CALL 0xffa03c94 <_ARP_req>;
ffa02a76:	00 0c       	CC = R0 == 0x0;
ffa02a78:	7e 18       	IF CC JUMP 0xffa02b74 <_ether_testUDP+0x12c>;
ffa02a7a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa02a7e:	0a e1 e0 0e 	P2.L = 0xee0;		/* (3808)	P2=0xff900ee0 <_NetOurMAC> */
ffa02a82:	4d 32       	P1 = P5;
ffa02a84:	50 99       	R0 = B[P2] (X);
ffa02a86:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02a8a:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa02a8e:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02a92:	90 e5 02 00 	R0 = B[P2 + 0x2] (X);
ffa02a96:	a8 e6 0a 00 	B[P5 + 0xa] = R0;
ffa02a9a:	90 e5 03 00 	R0 = B[P2 + 0x3] (X);
ffa02a9e:	a8 e6 0b 00 	B[P5 + 0xb] = R0;
ffa02aa2:	90 e5 04 00 	R0 = B[P2 + 0x4] (X);
ffa02aa6:	a8 e6 0c 00 	B[P5 + 0xc] = R0;
ffa02aaa:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02aae:	a8 e6 0d 00 	B[P5 + 0xd] = R0;
ffa02ab2:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02ab4:	e8 b5       	W[P5 + 0xe] = R0;
ffa02ab6:	20 e1 45 00 	R0 = 0x45 (X);		/*		R0=0x45( 69) */
ffa02aba:	a8 e6 10 00 	B[P5 + 0x10] = R0;
ffa02abe:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02ac0:	a8 e6 11 00 	B[P5 + 0x11] = R0;
ffa02ac4:	20 e1 00 32 	R0 = 0x3200 (X);		/*		R0=0x3200(12800) */
ffa02ac8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee0 <_NetOurMAC> */
ffa02acc:	0a e1 ba 0e 	P2.L = 0xeba;		/* (3770)	P2=0xff900eba <_NetIPID> */
ffa02ad0:	68 b6       	W[P5 + 0x12] = R0;
ffa02ad2:	10 95       	R0 = W[P2] (Z);
ffa02ad4:	08 30       	R1 = R0;
ffa02ad6:	09 64       	R1 += 0x1;		/* (  1) */
ffa02ad8:	11 97       	W[P2] = R1;
ffa02ada:	c1 42       	R1 = R0.L (Z);
ffa02adc:	41 4e       	R1 >>= 0x8;
ffa02ade:	40 4f       	R0 <<= 0x8;
ffa02ae0:	08 56       	R0 = R0 | R1;
ffa02ae2:	a8 b6       	W[P5 + 0x14] = R0;
ffa02ae4:	20 e1 40 00 	R0 = 0x40 (X);		/*		R0=0x40( 64) */
ffa02ae8:	e8 b6       	W[P5 + 0x16] = R0;
ffa02aea:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02aec:	a8 e6 18 00 	B[P5 + 0x18] = R0;
ffa02af0:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa02af2:	a8 e6 19 00 	B[P5 + 0x19] = R0;
ffa02af6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02af8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eba <_NetIPID> */
ffa02afc:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa02b00:	68 b7       	W[P5 + 0x1a] = R0;
ffa02b02:	10 91       	R0 = [P2];
ffa02b04:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_NetOurIP> */
ffa02b08:	0a e1 b0 0e 	P2.L = 0xeb0;		/* (3760)	P2=0xff900eb0 <_NetDestIP> */
ffa02b0c:	e8 b1       	[P5 + 0x1c] = R0;
ffa02b0e:	10 91       	R0 = [P2];
ffa02b10:	28 b2       	[P5 + 0x20] = R0;
ffa02b12:	81 6c       	P1 += 0x10;		/* ( 16) */
ffa02b14:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02b16:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa02b18:	b2 e0 03 20 	LSETUP(0xffa02b1c <_ether_testUDP+0xd4>, 0xffa02b1e <_ether_testUDP+0xd6>) LC1 = P2;
ffa02b1c:	08 94       	R0 = W[P1++] (Z);
ffa02b1e:	41 50       	R1 = R1 + R0;
ffa02b20:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa02b24:	01 50       	R0 = R1 + R0;
ffa02b26:	c0 42       	R0 = R0.L (Z);
ffa02b28:	c0 43       	R0 =~ R0;
ffa02b2a:	68 b7       	W[P5 + 0x1a] = R0;
ffa02b2c:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa02b30:	68 e6 12 00 	W[P5 + 0x24] = R0;
ffa02b34:	20 e1 09 64 	R0 = 0x6409 (X);		/*		R0=0x6409(25609) */
ffa02b38:	68 e6 13 00 	W[P5 + 0x26] = R0;
ffa02b3c:	20 e1 00 1e 	R0 = 0x1e00 (X);		/*		R0=0x1e00(7680) */
ffa02b40:	68 e6 14 00 	W[P5 + 0x28] = R0;
ffa02b44:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02b46:	55 32       	P2 = P5;
ffa02b48:	68 e6 15 00 	W[P5 + 0x2a] = R0;
ffa02b4c:	62 6d       	P2 += 0x2c;		/* ( 44) */
ffa02b4e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02b50:	b1 68       	P1 = 0x16 (X);		/*		P1=0x16( 22) */
ffa02b52:	b2 e0 03 10 	LSETUP(0xffa02b56 <_ether_testUDP+0x10e>, 0xffa02b58 <_ether_testUDP+0x110>) LC1 = P1;
ffa02b56:	11 9a       	B[P2++] = R1;
ffa02b58:	09 64       	R1 += 0x1;		/* (  1) */
ffa02b5a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa02b5e:	00 e1 44 02 	R0.L = 0x244;		/* (580)	R0=0xff900244(-7339452) */
ffa02b62:	ff e3 d7 f7 	CALL 0xffa01b10 <_printf_str>;
ffa02b66:	ff e3 2d fc 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa02b6a:	01 e8 00 00 	UNLINK;
ffa02b6e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02b70:	85 04       	(P5:5) = [SP++];
ffa02b72:	10 00       	RTS;
ffa02b74:	01 e8 00 00 	UNLINK;
ffa02b78:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02b7a:	85 04       	(P5:5) = [SP++];
ffa02b7c:	10 00       	RTS;
	...

ffa02b80 <_eth_header_setup>:
ffa02b80:	c4 04       	[--SP] = (P5:4);
ffa02b82:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90000a */
ffa02b86:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02b8a:	00 32       	P0 = R0;
ffa02b8c:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa02b90:	10 95       	R0 = W[P2] (Z);
ffa02b92:	10 32       	P2 = R0;
ffa02b94:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900016 */
ffa02b98:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa02b9c:	00 91       	R0 = [P0];
ffa02b9e:	21 32       	P4 = R1;
ffa02ba0:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa02ba2:	52 91       	P2 = [P2];
ffa02ba4:	08 30       	R1 = R0;
ffa02ba6:	80 67       	R0 += -0x10;		/* (-16) */
ffa02ba8:	00 93       	[P0] = R0;
ffa02baa:	95 ad       	P5 = [P2 + 0x18];
ffa02bac:	82 c6 42 01 	R0 = R2 >>> 0x18;
ffa02bb0:	f1 67       	R1 += -0x2;		/* ( -2) */
ffa02bb2:	c0 4f       	R0 <<= 0x18;
ffa02bb4:	29 97       	W[P5] = R1;
ffa02bb6:	00 0c       	CC = R0 == 0x0;
ffa02bb8:	39 10       	IF !CC JUMP 0xffa02c2a <_eth_header_setup+0xaa>;
ffa02bba:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02bbc:	a8 e6 02 00 	B[P5 + 0x2] = R0;
ffa02bc0:	20 e1 5e 00 	R0 = 0x5e (X);		/*		R0=0x5e( 94) */
ffa02bc4:	a8 e6 04 00 	B[P5 + 0x4] = R0;
ffa02bc8:	68 60       	R0 = 0xd (X);		/*		R0=0xd( 13) */
ffa02bca:	a8 e6 06 00 	B[P5 + 0x6] = R0;
ffa02bce:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02bd0:	d8 63       	R0 = -0x5 (X);		/*		R0=0xfffffffb( -5) */
ffa02bd2:	a9 e6 03 00 	B[P5 + 0x3] = R1;
ffa02bd6:	a9 e6 05 00 	B[P5 + 0x5] = R1;
ffa02bda:	a8 e6 07 00 	B[P5 + 0x7] = R0;
ffa02bde:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa02be2:	0a e1 e0 0e 	P2.L = 0xee0;		/* (3808)	P2=0xff900ee0 <_NetOurMAC> */
ffa02be6:	50 99       	R0 = B[P2] (X);
ffa02be8:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02bec:	90 e5 01 00 	R0 = B[P2 + 0x1] (X);
ffa02bf0:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02bf4:	90 e5 02 00 	R0 = B[P2 + 0x2] (X);
ffa02bf8:	a8 e6 0a 00 	B[P5 + 0xa] = R0;
ffa02bfc:	90 e5 03 00 	R0 = B[P2 + 0x3] (X);
ffa02c00:	a8 e6 0b 00 	B[P5 + 0xb] = R0;
ffa02c04:	90 e5 04 00 	R0 = B[P2 + 0x4] (X);
ffa02c08:	a8 e6 0c 00 	B[P5 + 0xc] = R0;
ffa02c0c:	90 e5 05 00 	R0 = B[P2 + 0x5] (X);
ffa02c10:	a8 e6 0d 00 	B[P5 + 0xd] = R0;
ffa02c14:	40 60       	R0 = 0x8 (X);		/*		R0=0x8(  8) */
ffa02c16:	e8 b5       	W[P5 + 0xe] = R0;
ffa02c18:	4d 30       	R1 = P5;
ffa02c1a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02c1c:	81 64       	R1 += 0x10;		/* ( 16) */
ffa02c1e:	20 9b       	B[P4] = R0;
ffa02c20:	01 e8 00 00 	UNLINK;
ffa02c24:	01 30       	R0 = R1;
ffa02c26:	84 04       	(P5:4) = [SP++];
ffa02c28:	10 00       	RTS;
ffa02c2a:	4d 30       	R1 = P5;
ffa02c2c:	11 64       	R1 += 0x2;		/* (  2) */
ffa02c2e:	02 30       	R0 = R2;
ffa02c30:	00 e3 32 08 	CALL 0xffa03c94 <_ARP_req>;
ffa02c34:	00 0c       	CC = R0 == 0x0;
ffa02c36:	d4 17       	IF !CC JUMP 0xffa02bde <_eth_header_setup+0x5e> (BP);
ffa02c38:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02c3a:	20 9b       	B[P4] = R0;
ffa02c3c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02c3e:	f1 2f       	JUMP.S 0xffa02c20 <_eth_header_setup+0xa0>;

ffa02c40 <_icmp_packet_setup>:
ffa02c40:	e4 05       	[--SP] = (R7:4, P5:4);
ffa02c42:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa02c46:	29 32       	P5 = R1;
ffa02c48:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa02c4a:	7f 30       	R7 = FP;
ffa02c4c:	f0 bb       	[FP -0x4] = R0;
ffa02c4e:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa02c50:	22 32       	P4 = R2;
ffa02c52:	be e5 2c 00 	R6 = B[FP + 0x2c] (X);
ffa02c56:	7d e5 18 00 	R5 = W[FP + 0x30] (X);
ffa02c5a:	7c e5 1a 00 	R4 = W[FP + 0x34] (X);
ffa02c5e:	07 30       	R0 = R7;
ffa02c60:	ff e3 90 ff 	CALL 0xffa02b80 <_eth_header_setup>;
ffa02c64:	08 30       	R1 = R0;
ffa02c66:	68 99       	R0 = B[P5] (X);
ffa02c68:	80 0c       	CC = R0 < 0x0;
ffa02c6a:	14 18       	IF CC JUMP 0xffa02c92 <_icmp_packet_setup+0x52>;
ffa02c6c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02c6e:	f0 b0       	[SP + 0xc] = R0;
ffa02c70:	01 30       	R0 = R1;
ffa02c72:	0f 30       	R1 = R7;
ffa02c74:	54 30       	R2 = P4;
ffa02c76:	ff e3 bb fa 	CALL 0xffa021ec <_ip_header_setup>;
ffa02c7a:	e9 42       	R1 = R5.L (Z);
ffa02c7c:	f1 b0       	[SP + 0xc] = R1;
ffa02c7e:	e1 42       	R1 = R4.L (Z);
ffa02c80:	31 b1       	[SP + 0x10] = R1;
ffa02c82:	72 43       	R2 = R6.B (Z);
ffa02c84:	0f 30       	R1 = R7;
ffa02c86:	ff e3 11 fb 	CALL 0xffa022a8 <_icmp_header_setup>;
ffa02c8a:	01 e8 00 00 	UNLINK;
ffa02c8e:	a4 05       	(R7:4, P5:4) = [SP++];
ffa02c90:	10 00       	RTS;
ffa02c92:	01 e8 00 00 	UNLINK;
ffa02c96:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02c98:	a4 05       	(R7:4, P5:4) = [SP++];
ffa02c9a:	10 00       	RTS;

ffa02c9c <_icmp_rx>:
ffa02c9c:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02c9e:	28 32       	P5 = R0;
ffa02ca0:	39 30       	R7 = R1;
ffa02ca2:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa02ca4:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa02ca8:	e8 a5       	R0 = W[P5 + 0xe] (Z);
ffa02caa:	08 08       	CC = R0 == R1;
ffa02cac:	06 18       	IF CC JUMP 0xffa02cb8 <_icmp_rx+0x1c>;
ffa02cae:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02cb0:	01 e8 00 00 	UNLINK;
ffa02cb4:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02cb6:	10 00       	RTS;
ffa02cb8:	58 61       	R0 = 0x2b (X);		/*		R0=0x2b( 43) */
ffa02cba:	07 0a       	CC = R7 <= R0 (IU);
ffa02cbc:	f9 1b       	IF CC JUMP 0xffa02cae <_icmp_rx+0x12>;
ffa02cbe:	00 00       	NOP;
ffa02cc0:	00 00       	NOP;
ffa02cc2:	00 00       	NOP;
ffa02cc4:	a8 e4 19 00 	R0 = B[P5 + 0x19] (Z);
ffa02cc8:	08 0c       	CC = R0 == 0x1;
ffa02cca:	f2 17       	IF !CC JUMP 0xffa02cae <_icmp_rx+0x12> (BP);
ffa02ccc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee0 <_NetOurMAC> */
ffa02cd0:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa02cd4:	28 a2       	R0 = [P5 + 0x20];
ffa02cd6:	11 91       	R1 = [P2];
ffa02cd8:	08 08       	CC = R0 == R1;
ffa02cda:	ea 17       	IF !CC JUMP 0xffa02cae <_icmp_rx+0x12> (BP);
ffa02cdc:	68 e4 12 00 	R0 = W[P5 + 0x24] (Z);
ffa02ce0:	21 e1 03 03 	R1 = 0x303 (X);		/*		R1=0x303(771) */
ffa02ce4:	08 08       	CC = R0 == R1;
ffa02ce6:	3e 18       	IF CC JUMP 0xffa02d62 <_icmp_rx+0xc6>;
ffa02ce8:	00 00       	NOP;
ffa02cea:	00 00       	NOP;
ffa02cec:	41 60       	R1 = 0x8 (X);		/*		R1=0x8(  8) */
ffa02cee:	a8 e4 24 00 	R0 = B[P5 + 0x24] (Z);
ffa02cf2:	08 08       	CC = R0 == R1;
ffa02cf4:	dd 17       	IF !CC JUMP 0xffa02cae <_icmp_rx+0x12> (BP);
ffa02cf6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90002b(-7339989) */
ffa02cfa:	e9 a1       	R1 = [P5 + 0x1c];
ffa02cfc:	00 e1 5c 02 	R0.L = 0x25c;		/* (604)	R0=0xff90025c(-7339428) */
ffa02d00:	ff e3 0e f7 	CALL 0xffa01b1c <_printf_ip>;
ffa02d04:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_NetOurIP> */
ffa02d08:	0a e1 b0 0e 	P2.L = 0xeb0;		/* (3760)	P2=0xff900eb0 <_NetDestIP> */
ffa02d0c:	e8 a1       	R0 = [P5 + 0x1c];
ffa02d0e:	4d 30       	R1 = P5;
ffa02d10:	10 93       	[P2] = R0;
ffa02d12:	41 64       	R1 += 0x8;		/* (  8) */
ffa02d14:	00 e3 ae 05 	CALL 0xffa03870 <_ARP_lut_add>;
ffa02d18:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90025c(-7339428) */
ffa02d1c:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa02d20:	ff e3 f8 f6 	CALL 0xffa01b10 <_printf_str>;
ffa02d24:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P5 + 0x1c] || NOP;
ffa02d28:	ea a1 00 00 
ffa02d2c:	f0 b0       	[SP + 0xc] = R0;
ffa02d2e:	68 e4 14 00 	R0 = W[P5 + 0x28] (Z);
ffa02d32:	30 b1       	[SP + 0x10] = R0;
ffa02d34:	68 e4 15 00 	R0 = W[P5 + 0x2a] (Z);
ffa02d38:	70 b1       	[SP + 0x14] = R0;
ffa02d3a:	b7 66       	R7 += -0x2a;		/* (-42) */
ffa02d3c:	4f 30       	R1 = FP;
ffa02d3e:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa02d40:	07 30       	R0 = R7;
ffa02d42:	ff e3 7f ff 	CALL 0xffa02c40 <_icmp_packet_setup>;
ffa02d46:	08 30       	R1 = R0;
ffa02d48:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa02d4c:	00 0d       	CC = R0 <= 0x0;
ffa02d4e:	b0 1b       	IF CC JUMP 0xffa02cae <_icmp_rx+0x12>;
ffa02d50:	65 6d       	P5 += 0x2c;		/* ( 44) */
ffa02d52:	45 30       	R0 = P5;
ffa02d54:	17 30       	R2 = R7;
ffa02d56:	ff e3 2b f7 	CALL 0xffa01bac <_memcpy_>;
ffa02d5a:	ff e3 33 fb 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa02d5e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02d60:	a8 2f       	JUMP.S 0xffa02cb0 <_icmp_rx+0x14>;
ffa02d62:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb0 <_NetDestIP> */
ffa02d66:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02d68:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa02d6c:	10 9b       	B[P2] = R0;
ffa02d6e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa02d70:	a0 2f       	JUMP.S 0xffa02cb0 <_icmp_rx+0x14>;
	...

ffa02d74 <_udp_packet_setup>:
ffa02d74:	ec 05       	[--SP] = (R7:5, P5:4);
ffa02d76:	00 e8 05 00 	LINK 0x14;		/* (20) */
ffa02d7a:	29 32       	P5 = R1;
ffa02d7c:	60 65       	R0 += 0x2c;		/* ( 44) */
ffa02d7e:	77 30       	R6 = FP;
ffa02d80:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900eb8 <_txIdx> */
ffa02d84:	f0 bb       	[FP -0x4] = R0;
ffa02d86:	3a 30       	R7 = R2;
ffa02d88:	e6 67       	R6 += -0x4;		/* ( -4) */
ffa02d8a:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_NetDataDestIP> */
ffa02d8e:	82 ce 06 c0 	R0 = ROT R6 BY 0x0 || R2 = [P4] || NOP;
ffa02d92:	22 91 00 00 
ffa02d96:	ff e3 f5 fe 	CALL 0xffa02b80 <_eth_header_setup>;
ffa02d9a:	08 30       	R1 = R0;
ffa02d9c:	68 99       	R0 = B[P5] (X);
ffa02d9e:	80 0c       	CC = R0 < 0x0;
ffa02da0:	22 18       	IF CC JUMP 0xffa02de4 <_udp_packet_setup+0x70>;
ffa02da2:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa02da4:	f0 b0       	[SP + 0xc] = R0;
ffa02da6:	01 30       	R0 = R1;
ffa02da8:	82 ce 06 c2 	R1 = ROT R6 BY 0x0 || R2 = [P4] || NOP;
ffa02dac:	22 91 00 00 
ffa02db0:	ff e3 1e fa 	CALL 0xffa021ec <_ip_header_setup>;
ffa02db4:	10 32       	P2 = R0;
ffa02db6:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa02dba:	f9 42       	R1 = R7.L (Z);
ffa02dbc:	41 4e       	R1 >>= 0x8;
ffa02dbe:	10 97       	W[P2] = R0;
ffa02dc0:	82 c6 47 80 	R0 = R7 << 0x8;
ffa02dc4:	08 56       	R0 = R0 | R1;
ffa02dc6:	50 b4       	W[P2 + 0x2] = R0;
ffa02dc8:	f0 b9       	R0 = [FP -0x4];
ffa02dca:	b9 e4 fd ff 	R1 = B[FP + -0x3] (Z);
ffa02dce:	40 4f       	R0 <<= 0x8;
ffa02dd0:	08 56       	R0 = R0 | R1;
ffa02dd2:	90 b4       	W[P2 + 0x4] = R0;
ffa02dd4:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02dd6:	d0 b4       	W[P2 + 0x6] = R0;
ffa02dd8:	42 30       	R0 = P2;
ffa02dda:	01 e8 00 00 	UNLINK;
ffa02dde:	40 64       	R0 += 0x8;		/* (  8) */
ffa02de0:	ac 05       	(R7:5, P5:4) = [SP++];
ffa02de2:	10 00       	RTS;
ffa02de4:	01 e8 00 00 	UNLINK;
ffa02de8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02dea:	ac 05       	(R7:5, P5:4) = [SP++];
ffa02dec:	10 00       	RTS;
	...

ffa02df0 <_SetupTxBuffer>:
ffa02df0:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02df2:	38 30       	R7 = R0;
ffa02df4:	20 e1 3c 06 	R0 = 0x63c (X);		/*		R0=0x63c(1596) */
ffa02df8:	c7 40       	R7 *= R0;
ffa02dfa:	17 32       	P2 = R7;
ffa02dfc:	4d e1 80 ff 	P5.H = 0xff80;		/* (-128)	P5=0xff800ebc */
ffa02e00:	40 e1 80 ff 	R0.H = 0xff80;		/* (-128)	R0=0xff80063c(-8387012) */
ffa02e04:	00 e1 2c 30 	R0.L = 0x302c;		/* (12332)	R0=0xff80302c(-8376276) */
ffa02e08:	0d e1 00 30 	P5.L = 0x3000;		/* (12288)	P5=0xff803000 */
ffa02e0c:	6a 5b       	P5 = P2 + P5;
ffa02e0e:	c7 51       	R7 = R7 + R0;
ffa02e10:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02e14:	45 30       	R0 = P5;
ffa02e16:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02e18:	62 61       	R2 = 0x2c (X);		/*		R2=0x2c( 44) */
ffa02e1a:	ff e3 d9 f6 	CALL 0xffa01bcc <_memset_>;
ffa02e1e:	82 ce 07 c0 	R0 = ROT R7 BY 0x0 || [P5 + 0x18] = R7 || NOP;
ffa02e22:	af b1 00 00 
ffa02e26:	21 e1 aa 00 	R1 = 0xaa (X);		/*		R1=0xaa(170) */
ffa02e2a:	22 e1 10 06 	R2 = 0x610 (X);		/*		R2=0x610(1552) */
ffa02e2e:	ff e3 cf f6 	CALL 0xffa01bcc <_memset_>;
ffa02e32:	45 30       	R0 = P5;
ffa02e34:	60 64       	R0 += 0xc;		/* ( 12) */
ffa02e36:	28 93       	[P5] = R0;
ffa02e38:	a8 a1       	R0 = [P5 + 0x18];
ffa02e3a:	68 b0       	[P5 + 0x4] = R0;
ffa02e3c:	a8 e5 08 00 	R0 = B[P5 + 0x8] (X);
ffa02e40:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02e42:	9a 63       	R2 = -0xd (X);		/*		R2=0xfffffff3(-13) */
ffa02e44:	08 4c       	BITCLR (R0, 0x1);		/* bit  1 */
ffa02e46:	10 54       	R0 = R0 & R2;
ffa02e48:	18 4a       	BITSET (R0, 0x3);		/* bit  3 */
ffa02e4a:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02e4e:	a8 e5 09 00 	R0 = B[P5 + 0x9] (X);
ffa02e52:	83 63       	R3 = -0x10 (X);		/*		R3=0xfffffff0(-16) */
ffa02e54:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa02e56:	18 54       	R0 = R0 & R3;
ffa02e58:	08 56       	R0 = R0 | R1;
ffa02e5a:	21 e1 70 00 	R1 = 0x70 (X);		/*		R1=0x70(112) */
ffa02e5e:	08 56       	R0 = R0 | R1;
ffa02e60:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02e64:	45 30       	R0 = P5;
ffa02e66:	40 65       	R0 += 0x28;		/* ( 40) */
ffa02e68:	28 b1       	[P5 + 0x10] = R0;
ffa02e6a:	a8 e5 14 00 	R0 = B[P5 + 0x14] (X);
ffa02e6e:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02e70:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02e72:	21 e1 88 ff 	R1 = -0x78 (X);		/*		R1=0xffffff88(-120) */
ffa02e76:	10 54       	R0 = R0 & R2;
ffa02e78:	08 56       	R0 = R0 | R1;
ffa02e7a:	a8 e6 14 00 	B[P5 + 0x14] = R0;
ffa02e7e:	a8 e5 15 00 	R0 = B[P5 + 0x15] (X);
ffa02e82:	18 54       	R0 = R0 & R3;
ffa02e84:	39 64       	R1 += 0x7;		/* (  7) */
ffa02e86:	08 54       	R0 = R0 & R1;
ffa02e88:	a8 e6 15 00 	B[P5 + 0x15] = R0;
ffa02e8c:	ed bc       	[P5 + 0xc] = P5;
ffa02e8e:	45 30       	R0 = P5;
ffa02e90:	01 e8 00 00 	UNLINK;
ffa02e94:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02e96:	10 00       	RTS;

ffa02e98 <_SetupRxBuffer>:
ffa02e98:	fd 05       	[--SP] = (R7:7, P5:5);
ffa02e9a:	38 30       	R7 = R0;
ffa02e9c:	20 e1 3c 06 	R0 = 0x63c (X);		/*		R0=0x63c(1596) */
ffa02ea0:	c7 40       	R7 *= R0;
ffa02ea2:	17 32       	P2 = R7;
ffa02ea4:	4d e1 80 ff 	P5.H = 0xff80;		/* (-128)	P5=0xff803000 */
ffa02ea8:	40 e1 80 ff 	R0.H = 0xff80;		/* (-128)	R0=0xff80063c(-8387012) */
ffa02eac:	00 e1 2c 10 	R0.L = 0x102c;		/* (4140)	R0=0xff80102c(-8384468) */
ffa02eb0:	0d e1 00 10 	P5.L = 0x1000;		/* (4096)	P5=0xff801000 */
ffa02eb4:	6a 5b       	P5 = P2 + P5;
ffa02eb6:	c7 51       	R7 = R7 + R0;
ffa02eb8:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02ebc:	45 30       	R0 = P5;
ffa02ebe:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa02ec0:	62 61       	R2 = 0x2c (X);		/*		R2=0x2c( 44) */
ffa02ec2:	ff e3 85 f6 	CALL 0xffa01bcc <_memset_>;
ffa02ec6:	af b1       	[P5 + 0x18] = R7;
ffa02ec8:	07 30       	R0 = R7;
ffa02eca:	21 e1 fe 00 	R1 = 0xfe (X);		/*		R1=0xfe(254) */
ffa02ece:	22 e1 10 06 	R2 = 0x610 (X);		/*		R2=0x610(1552) */
ffa02ed2:	ff e3 7d f6 	CALL 0xffa01bcc <_memset_>;
ffa02ed6:	45 30       	R0 = P5;
ffa02ed8:	60 64       	R0 += 0xc;		/* ( 12) */
ffa02eda:	28 93       	[P5] = R0;
ffa02edc:	a8 a1       	R0 = [P5 + 0x18];
ffa02ede:	68 b0       	[P5 + 0x4] = R0;
ffa02ee0:	a8 e5 08 00 	R0 = B[P5 + 0x8] (X);
ffa02ee4:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02ee6:	99 63       	R1 = -0xd (X);		/*		R1=0xfffffff3(-13) */
ffa02ee8:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02eea:	08 54       	R0 = R0 & R1;
ffa02eec:	18 4a       	BITSET (R0, 0x3);		/* bit  3 */
ffa02eee:	a8 e6 08 00 	B[P5 + 0x8] = R0;
ffa02ef2:	a8 e5 09 00 	R0 = B[P5 + 0x9] (X);
ffa02ef6:	87 63       	R7 = -0x10 (X);		/*		R7=0xfffffff0(-16) */
ffa02ef8:	38 54       	R0 = R0 & R7;
ffa02efa:	2b 60       	R3 = 0x5 (X);		/*		R3=0x5(  5) */
ffa02efc:	22 e1 70 00 	R2 = 0x70 (X);		/*		R2=0x70(112) */
ffa02f00:	18 56       	R0 = R0 | R3;
ffa02f02:	10 56       	R0 = R0 | R2;
ffa02f04:	a8 e6 09 00 	B[P5 + 0x9] = R0;
ffa02f08:	45 30       	R0 = P5;
ffa02f0a:	20 65       	R0 += 0x24;		/* ( 36) */
ffa02f0c:	28 b1       	[P5 + 0x10] = R0;
ffa02f0e:	a8 e5 14 00 	R0 = B[P5 + 0x14] (X);
ffa02f12:	00 4a       	BITSET (R0, 0x0);		/* bit  0 */
ffa02f14:	08 4a       	BITSET (R0, 0x1);		/* bit  1 */
ffa02f16:	08 54       	R0 = R0 & R1;
ffa02f18:	21 e1 88 ff 	R1 = -0x78 (X);		/*		R1=0xffffff88(-120) */
ffa02f1c:	08 56       	R0 = R0 | R1;
ffa02f1e:	a8 e6 14 00 	B[P5 + 0x14] = R0;
ffa02f22:	a8 e5 15 00 	R0 = B[P5 + 0x15] (X);
ffa02f26:	38 54       	R0 = R0 & R7;
ffa02f28:	18 56       	R0 = R0 | R3;
ffa02f2a:	10 56       	R0 = R0 | R2;
ffa02f2c:	a8 e6 15 00 	B[P5 + 0x15] = R0;
ffa02f30:	ed bc       	[P5 + 0xc] = P5;
ffa02f32:	45 30       	R0 = P5;
ffa02f34:	01 e8 00 00 	UNLINK;
ffa02f38:	bd 05       	(R7:7, P5:5) = [SP++];
ffa02f3a:	10 00       	RTS;

ffa02f3c <_SetupSystemRegs>:
ffa02f3c:	f5 05       	[--SP] = (R7:6, P5:5);
ffa02f3e:	28 32       	P5 = R0;
ffa02f40:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90102c(-7335892) */
ffa02f44:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa02f48:	00 e1 78 02 	R0.L = 0x278;		/* (632)	R0=0xff900278(-7339400) */
ffa02f4c:	ff e3 e2 f5 	CALL 0xffa01b10 <_printf_str>;
ffa02f50:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c40(-4191168) */
ffa02f54:	0a e1 14 32 	P2.L = 0x3214;		/* (12820)	P2=0xffc03214(-4181484) */
ffa02f58:	11 95       	R1 = W[P2] (Z);
ffa02f5a:	20 e1 ff cf 	R0 = -0x3001 (X);		/*		R0=0xffffcfff(-12289) */
ffa02f5e:	08 54       	R0 = R0 & R1;
ffa02f60:	10 97       	W[P2] = R0;
ffa02f62:	10 95       	R0 = W[P2] (Z);
ffa02f64:	60 4a       	BITSET (R0, 0xc);		/* bit 12 */
ffa02f66:	10 97       	W[P2] = R0;
ffa02f68:	82 6f       	P2 += -0x10;		/* (-16) */
ffa02f6a:	11 95       	R1 = W[P2] (Z);
ffa02f6c:	20 e1 00 c0 	R0 = -0x4000 (X);		/*		R0=0xffffc000(-16384) */
ffa02f70:	08 56       	R0 = R0 | R1;
ffa02f72:	10 97       	W[P2] = R0;
ffa02f74:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa02f76:	22 6c       	P2 += 0x4;		/* (  4) */
ffa02f78:	10 97       	W[P2] = R0;
ffa02f7a:	a8 60       	R0 = 0x15 (X);		/*		R0=0x15( 21) */
ffa02f7c:	82 6c       	P2 += 0x10;		/* ( 16) */
ffa02f7e:	10 97       	W[P2] = R0;
ffa02f80:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03214(-4181484) */
ffa02f84:	0a e1 08 00 	P2.L = 0x8;		/* (  8)	P2=0xffc00008(-4194296) */
ffa02f88:	10 95       	R0 = W[P2] (Z);
ffa02f8a:	70 4a       	BITSET (R0, 0xe);		/* bit 14 */
ffa02f8c:	10 97       	W[P2] = R0;
ffa02f8e:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00008(-4194296) */
ffa02f92:	20 e1 06 18 	R0 = 0x1806 (X);		/*		R0=0x1806(6150) */
ffa02f96:	0a e1 60 30 	P2.L = 0x3060;		/* (12384)	P2=0xffc03060(-4181920) */
ffa02f9a:	10 93       	[P2] = R0;
ffa02f9c:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03060(-4181920) */
ffa02fa0:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa02fa4:	10 91       	R0 = [P2];
ffa02fa6:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02fa8:	09 18       	IF CC JUMP 0xffa02fba <_SetupSystemRegs+0x7e>;
ffa02faa:	00 00       	NOP;
ffa02fac:	00 00       	NOP;
ffa02fae:	42 34       	I0 = P2;
ffa02fb0:	00 00       	NOP;
ffa02fb2:	00 00       	NOP;
ffa02fb4:	00 9d       	R0 = [I0];
ffa02fb6:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa02fb8:	fc 17       	IF !CC JUMP 0xffa02fb0 <_SetupSystemRegs+0x74> (BP);
ffa02fba:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa02fbe:	20 e1 00 31 	R0 = 0x3100 (X);		/*		R0=0x3100(12544) */
ffa02fc2:	0a e1 18 30 	P2.L = 0x3018;		/* (12312)	P2=0xffc03018(-4181992) */
ffa02fc6:	10 93       	[P2] = R0;
ffa02fc8:	e2 6f       	P2 += -0x4;		/* ( -4) */
ffa02fca:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa02fcc:	10 93       	[P2] = R0;
ffa02fce:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa02fd2:	ff e3 cd f7 	CALL 0xffa01f6c <_udelay>;
ffa02fd6:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02fd8:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa02fda:	ff e3 4f f8 	CALL 0xffa02078 <_RdPHYReg>;
ffa02fde:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa02fe0:	26 60       	R6 = 0x4 (X);		/*		R6=0x4(  4) */
ffa02fe2:	0e 20       	JUMP.S 0xffa02ffe <_SetupSystemRegs+0xc2>;
ffa02fe4:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa02fe8:	ff e3 c2 f7 	CALL 0xffa01f6c <_udelay>;
ffa02fec:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa02fee:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa02ff0:	ff e3 44 f8 	CALL 0xffa02078 <_RdPHYReg>;
ffa02ff4:	0f 64       	R7 += 0x1;		/* (  1) */
ffa02ff6:	21 e1 b9 0b 	R1 = 0xbb9 (X);		/*		R1=0xbb9(3001) */
ffa02ffa:	0f 08       	CC = R7 == R1;
ffa02ffc:	36 18       	IF CC JUMP 0xffa03068 <_SetupSystemRegs+0x12c>;
ffa02ffe:	06 54       	R0 = R6 & R0;
ffa03000:	00 0c       	CC = R0 == 0x0;
ffa03002:	f1 1f       	IF CC JUMP 0xffa02fe4 <_SetupSystemRegs+0xa8> (BP);
ffa03004:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa03006:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03008:	ff e3 38 f8 	CALL 0xffa02078 <_RdPHYReg>;
ffa0300c:	21 e1 40 01 	R1 = 0x140 (X);		/*		R1=0x140(320) */
ffa03010:	41 54       	R1 = R1 & R0;
ffa03012:	01 0c       	CC = R1 == 0x0;
ffa03014:	26 14       	IF !CC JUMP 0xffa03060 <_SetupSystemRegs+0x124> (BP);
ffa03016:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03018:	28 93       	[P5] = R0;
ffa0301a:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03018(-4181992) */
ffa0301e:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa03020:	0a e1 80 30 	P2.L = 0x3080;		/* (12416)	P2=0xffc03080(-4181888) */
ffa03024:	10 93       	[P2] = R0;
ffa03026:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03080(-4181888) */
ffa0302a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0302c:	0a e1 90 0c 	P2.L = 0xc90;		/* (3216)	P2=0xffc00c90(-4191088) */
ffa03030:	10 97       	W[P2] = R0;
ffa03032:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa03034:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03036:	11 97       	W[P2] = R1;
ffa03038:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0303a:	10 97       	W[P2] = R0;
ffa0303c:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0303e:	10 97       	W[P2] = R0;
ffa03040:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c90(-4191088) */
ffa03044:	0a e1 50 0c 	P2.L = 0xc50;		/* (3152)	P2=0xffc00c50(-4191152) */
ffa03048:	10 97       	W[P2] = R0;
ffa0304a:	22 6c       	P2 += 0x4;		/* (  4) */
ffa0304c:	11 97       	W[P2] = R1;
ffa0304e:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03050:	10 97       	W[P2] = R0;
ffa03052:	22 6c       	P2 += 0x4;		/* (  4) */
ffa03054:	10 97       	W[P2] = R0;
ffa03056:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03058:	01 e8 00 00 	UNLINK;
ffa0305c:	b5 05       	(R7:6, P5:5) = [SP++];
ffa0305e:	10 00       	RTS;
ffa03060:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03062:	d0 4f       	R0 <<= 0x1a;
ffa03064:	28 93       	[P5] = R0;
ffa03066:	da 2f       	JUMP.S 0xffa0301a <_SetupSystemRegs+0xde>;
ffa03068:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa0306c:	00 e1 90 02 	R0.L = 0x290;		/* (656)	R0=0xff900290(-7339376) */
ffa03070:	ff e3 50 f5 	CALL 0xffa01b10 <_printf_str>;
ffa03074:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa03076:	f1 2f       	JUMP.S 0xffa03058 <_SetupSystemRegs+0x11c>;

ffa03078 <_SetupMacAddr>:
ffa03078:	10 32       	P2 = R0;
ffa0307a:	fd 05       	[--SP] = (R7:7, P5:5);
ffa0307c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03080:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03082:	01 63       	R1 = -0x20 (X);		/*		R1=0xffffffe0(-32) */
ffa03084:	10 9b       	B[P2] = R0;
ffa03086:	10 61       	R0 = 0x22 (X);		/*		R0=0x22( 34) */
ffa03088:	90 e6 02 00 	B[P2 + 0x2] = R0;
ffa0308c:	f0 63       	R0 = -0x2 (X);		/*		R0=0xfffffffe( -2) */
ffa0308e:	90 e6 03 00 	B[P2 + 0x3] = R0;
ffa03092:	20 e1 51 00 	R0 = 0x51 (X);		/*		R0=0x51( 81) */
ffa03096:	90 e6 04 00 	B[P2 + 0x4] = R0;
ffa0309a:	60 60       	R0 = 0xc (X);		/*		R0=0xc( 12) */
ffa0309c:	91 e6 01 00 	B[P2 + 0x1] = R1;
ffa030a0:	90 e6 05 00 	B[P2 + 0x5] = R0;
ffa030a4:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa030a8:	49 43       	R1 = R1.B (Z);
ffa030aa:	80 4f       	R0 <<= 0x10;
ffa030ac:	41 4f       	R1 <<= 0x8;
ffa030ae:	41 56       	R1 = R1 | R0;
ffa030b0:	10 99       	R0 = B[P2] (Z);
ffa030b2:	41 56       	R1 = R1 | R0;
ffa030b4:	90 e4 03 00 	R0 = B[P2 + 0x3] (Z);
ffa030b8:	c0 4f       	R0 <<= 0x18;
ffa030ba:	49 e1 c0 ff 	P1.H = 0xffc0;		/* (-64)	P1=0xffc00ebc(-4190532) */
ffa030be:	09 e1 04 30 	P1.L = 0x3004;		/* (12292)	P1=0xffc03004(-4182012) */
ffa030c2:	41 56       	R1 = R1 | R0;
ffa030c4:	09 93       	[P1] = R1;
ffa030c6:	90 e4 04 00 	R0 = B[P2 + 0x4] (Z);
ffa030ca:	21 e1 00 0c 	R1 = 0xc00 (X);		/*		R1=0xc00(3072) */
ffa030ce:	4d e1 c0 ff 	P5.H = 0xffc0;		/* (-64)	P5=0xffc01000(-4190208) */
ffa030d2:	08 56       	R0 = R0 | R1;
ffa030d4:	0d e1 08 30 	P5.L = 0x3008;		/* (12296)	P5=0xffc03008(-4182008) */
ffa030d8:	28 93       	[P5] = R0;
ffa030da:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000c(-7340020) */
ffa030de:	09 91       	R1 = [P1];
ffa030e0:	00 e1 c4 02 	R0.L = 0x2c4;		/* (708)	R0=0xff9002c4(-7339324) */
ffa030e4:	47 e1 90 ff 	R7.H = 0xff90;		/* (-112)	R7=0xff900000 <_l1_data_a>(-7340032) */
ffa030e8:	ff e3 10 f4 	CALL 0xffa01908 <_printf_hex>;
ffa030ec:	07 e1 9c 07 	R7.L = 0x79c;		/* (1948)	R7=0xff90079c(-7338084) */
ffa030f0:	07 30       	R0 = R7;
ffa030f2:	ff e3 0f f5 	CALL 0xffa01b10 <_printf_str>;
ffa030f6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9002c4(-7339324) */
ffa030fa:	29 91       	R1 = [P5];
ffa030fc:	00 e1 d0 02 	R0.L = 0x2d0;		/* (720)	R0=0xff9002d0(-7339312) */
ffa03100:	ff e3 04 f4 	CALL 0xffa01908 <_printf_hex>;
ffa03104:	07 30       	R0 = R7;
ffa03106:	01 e8 00 00 	UNLINK;
ffa0310a:	bd 05       	(R7:7, P5:5) = [SP++];
ffa0310c:	ff e2 02 f5 	JUMP.L 0xffa01b10 <_printf_str>;

ffa03110 <_bfin_EMAC_init>:
ffa03110:	fb 05       	[--SP] = (R7:7, P5:3);
ffa03112:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9002d0(-7339312) */
ffa03116:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0311a:	00 e1 dc 02 	R0.L = 0x2dc;		/* (732)	R0=0xff9002dc(-7339300) */
ffa0311e:	ff e3 f9 f4 	CALL 0xffa01b10 <_printf_str>;
ffa03122:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c50 */
ffa03126:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03128:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa0312c:	11 97       	W[P2] = R1;
ffa0312e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa03132:	0a e1 cc 0e 	P2.L = 0xecc;		/* (3788)	P2=0xff900ecc <_rxIdx> */
ffa03136:	11 97       	W[P2] = R1;
ffa03138:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ecc <_rxIdx> */
ffa0313c:	0a e1 ba 0e 	P2.L = 0xeba;		/* (3770)	P2=0xff900eba <_NetIPID> */
ffa03140:	11 97       	W[P2] = R1;
ffa03142:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eba <_NetIPID> */
ffa03146:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03148:	0a e1 e8 0e 	P2.L = 0xee8;		/* (3816)	P2=0xff900ee8 <_NetSubnetMask> */
ffa0314c:	17 93       	[P2] = R7;
ffa0314e:	40 e1 00 09 	R0.H = 0x900;		/* (2304)	R0=0x90002dc(150995676) */
ffa03152:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee8 <_NetSubnetMask> */
ffa03156:	00 e1 c0 a8 	R0.L = 0xa8c0;		/* (-22336)	R0=0x900a8c0(151038144) */
ffa0315a:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa0315e:	10 93       	[P2] = R0;
ffa03160:	80 e1 c0 a8 	R0 = 0xa8c0 (Z);		/*		R0=0xa8c0(43200) */
ffa03164:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_NetOurIP> */
ffa03168:	c0 4a       	BITSET (R0, 0x18);		/* bit 24 */
ffa0316a:	0a e1 b0 0e 	P2.L = 0xeb0;		/* (3760)	P2=0xff900eb0 <_NetDestIP> */
ffa0316e:	10 93       	[P2] = R0;
ffa03170:	40 e1 e5 36 	R0.H = 0x36e5;		/* (14053)	R0=0x36e5a8c0(921020608) */
ffa03174:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb0 <_NetDestIP> */
ffa03178:	00 e1 98 10 	R0.L = 0x1098;		/* (4248)	R0=0x36e51098(920981656) */
ffa0317c:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa03180:	10 93       	[P2] = R0;
ffa03182:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ef0 <_NetDataDestIP> */
ffa03186:	0a e1 d0 0f 	P2.L = 0xfd0;		/* (4048)	P2=0xff900fd0 <_TcpState> */
ffa0318a:	17 93       	[P2] = R7;
ffa0318c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fd0 <_TcpState> */
ffa03190:	0a e1 c8 0f 	P2.L = 0xfc8;		/* (4040)	P2=0xff900fc8 <_TcpSeqClient> */
ffa03194:	17 93       	[P2] = R7;
ffa03196:	40 e1 da 09 	R0.H = 0x9da;		/* (2522)	R0=0x9da1098(165286040) */
ffa0319a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc8 <_TcpSeqClient> */
ffa0319e:	00 e1 b5 24 	R0.L = 0x24b5;		/* (9397)	R0=0x9da24b5(165291189) */
ffa031a2:	0a e1 c4 0f 	P2.L = 0xfc4;		/* (4036)	P2=0xff900fc4 <_TcpSeqHost> */
ffa031a6:	10 93       	[P2] = R0;
ffa031a8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc4 <_TcpSeqHost> */
ffa031ac:	0a e1 dc 0f 	P2.L = 0xfdc;		/* (4060)	P2=0xff900fdc <_TcpClientPort> */
ffa031b0:	11 97       	W[P2] = R1;
ffa031b2:	00 e3 0f 03 	CALL 0xffa037d0 <_ARP_init>;
ffa031b6:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00fdc(-4190244) */
ffa031ba:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa031be:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9024b5(-7330635) */
ffa031c2:	17 93       	[P2] = R7;
ffa031c4:	00 e1 e0 0e 	R0.L = 0xee0;		/* (3808)	R0=0xff900ee0 <_NetOurMAC>(-7336224) */
ffa031c8:	ff e3 58 ff 	CALL 0xffa03078 <_SetupMacAddr>;
ffa031cc:	47 30       	R0 = FP;
ffa031ce:	e0 67       	R0 += -0x4;		/* ( -4) */
ffa031d0:	ff e3 b6 fe 	CALL 0xffa02f3c <_SetupSystemRegs>;
ffa031d4:	80 0c       	CC = R0 < 0x0;
ffa031d6:	79 18       	IF CC JUMP 0xffa032c8 <_bfin_EMAC_init+0x1b8>;
ffa031d8:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900ee8 <_NetSubnetMask> */
ffa031dc:	0b e1 d0 0e 	P3.L = 0xed0;		/* (3792)	P3=0xff900ed0 <_rxbuf> */
ffa031e0:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa031e2:	63 32       	P4 = P3;
ffa031e4:	45 30       	R0 = P5;
ffa031e6:	ff e3 59 fe 	CALL 0xffa02e98 <_SetupRxBuffer>;
ffa031ea:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff903004 */
ffa031ee:	ab 5e       	P2 = P3 + (P5 << 0x2);
ffa031f0:	09 e1 d0 0e 	P1.L = 0xed0;		/* (3792)	P1=0xff900ed0 <_rxbuf> */
ffa031f4:	10 93       	[P2] = R0;
ffa031f6:	45 0c       	CC = P5 == 0x0;
ffa031f8:	5e 18       	IF CC JUMP 0xffa032b4 <_bfin_EMAC_init+0x1a4>;
ffa031fa:	00 00       	NOP;
ffa031fc:	ac 5e       	P2 = P4 + (P5 << 0x2);
ffa031fe:	5d 0c       	CC = P5 == 0x3;
ffa03200:	12 e5 ff ff 	P2 = [P2 + -0x4];
ffa03204:	d0 b0       	[P2 + 0xc] = R0;
ffa03206:	5d 18       	IF CC JUMP 0xffa032c0 <_bfin_EMAC_init+0x1b0>;
ffa03208:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa0320a:	5d 0d       	CC = P5 <= 0x3;
ffa0320c:	ec 1f       	IF CC JUMP 0xffa031e4 <_bfin_EMAC_init+0xd4> (BP);
ffa0320e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ef0 <_NetDataDestIP> */
ffa03212:	0c e1 bc 0e 	P4.L = 0xebc;		/* (3772)	P4=0xff900ebc <_txbuf> */
ffa03216:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa03218:	7c 30       	R7 = P4;
ffa0321a:	45 30       	R0 = P5;
ffa0321c:	ff e3 ea fd 	CALL 0xffa02df0 <_SetupTxBuffer>;
ffa03220:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ed0 <_rxbuf> */
ffa03224:	ac 5e       	P2 = P4 + (P5 << 0x2);
ffa03226:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa0322a:	10 93       	[P2] = R0;
ffa0322c:	45 0c       	CC = P5 == 0x0;
ffa0322e:	41 18       	IF CC JUMP 0xffa032b0 <_bfin_EMAC_init+0x1a0>;
ffa03230:	07 32       	P0 = R7;
ffa03232:	5d 0c       	CC = P5 == 0x3;
ffa03234:	a8 5e       	P2 = P0 + (P5 << 0x2);
ffa03236:	12 e5 ff ff 	P2 = [P2 + -0x4];
ffa0323a:	d0 b0       	[P2 + 0xc] = R0;
ffa0323c:	3e 18       	IF CC JUMP 0xffa032b8 <_bfin_EMAC_init+0x1a8>;
ffa0323e:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa03240:	5d 0d       	CC = P5 <= 0x3;
ffa03242:	ec 1f       	IF CC JUMP 0xffa0321a <_bfin_EMAC_init+0x10a> (BP);
ffa03244:	59 91       	P1 = [P3];
ffa03246:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03000(-4182016) */
ffa0324a:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xffc00c40(-4191168) */
ffa0324e:	51 93       	[P2] = P1;
ffa03250:	08 a9       	R0 = W[P1 + 0x8] (X);
ffa03252:	42 6c       	P2 += 0x8;		/* (  8) */
ffa03254:	10 97       	W[P2] = R0;
ffa03256:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c40(-4191168) */
ffa0325a:	0a e1 14 30 	P2.L = 0x3014;		/* (12308)	P2=0xffc03014(-4181996) */
ffa0325e:	10 91       	R0 = [P2];
ffa03260:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa03262:	09 18       	IF CC JUMP 0xffa03274 <_bfin_EMAC_init+0x164>;
ffa03264:	00 00       	NOP;
ffa03266:	00 00       	NOP;
ffa03268:	42 34       	I0 = P2;
ffa0326a:	00 00       	NOP;
ffa0326c:	00 00       	NOP;
ffa0326e:	00 9d       	R0 = [I0];
ffa03270:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa03272:	fc 17       	IF !CC JUMP 0xffa0326a <_bfin_EMAC_init+0x15a> (BP);
ffa03274:	09 60       	R1 = 0x1 (X);		/*		R1=0x1(  1) */
ffa03276:	f0 b9       	R0 = [FP -0x4];
ffa03278:	d1 4f       	R1 <<= 0x1a;
ffa0327a:	08 08       	CC = R0 == R1;
ffa0327c:	2b 18       	IF CC JUMP 0xffa032d2 <_bfin_EMAC_init+0x1c2>;
ffa0327e:	20 e1 03 08 	R0 = 0x803 (X);		/*		R0=0x803(2051) */
ffa03282:	08 30       	R1 = R0;
ffa03284:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc03014(-4181996) */
ffa03288:	0a e1 00 30 	P2.L = 0x3000;		/* (12288)	P2=0xffc03000(-4182016) */
ffa0328c:	10 93       	[P2] = R0;
ffa0328e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900803(-7337981) */
ffa03292:	00 e1 ec 02 	R0.L = 0x2ec;		/* (748)	R0=0xff9002ec(-7339284) */
ffa03296:	ff e3 39 f3 	CALL 0xffa01908 <_printf_hex>;
ffa0329a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9002ec(-7339284) */
ffa0329e:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa032a2:	ff e3 37 f4 	CALL 0xffa01b10 <_printf_str>;
ffa032a6:	01 e8 00 00 	UNLINK;
ffa032aa:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa032ac:	bb 05       	(R7:7, P5:3) = [SP++];
ffa032ae:	10 00       	RTS;
ffa032b0:	0d 68       	P5 = 0x1 (X);		/*		P5=0x1(  1) */
ffa032b2:	b4 2f       	JUMP.S 0xffa0321a <_bfin_EMAC_init+0x10a>;
ffa032b4:	0d 68       	P5 = 0x1 (X);		/*		P5=0x1(  1) */
ffa032b6:	97 2f       	JUMP.S 0xffa031e4 <_bfin_EMAC_init+0xd4>;
ffa032b8:	ca ac       	P2 = [P1 + 0xc];
ffa032ba:	08 91       	R0 = [P1];
ffa032bc:	d0 b0       	[P2 + 0xc] = R0;
ffa032be:	c3 2f       	JUMP.S 0xffa03244 <_bfin_EMAC_init+0x134>;
ffa032c0:	ca ac       	P2 = [P1 + 0xc];
ffa032c2:	08 91       	R0 = [P1];
ffa032c4:	d0 b0       	[P2 + 0xc] = R0;
ffa032c6:	a4 2f       	JUMP.S 0xffa0320e <_bfin_EMAC_init+0xfe>;
ffa032c8:	01 e8 00 00 	UNLINK;
ffa032cc:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa032ce:	bb 05       	(R7:7, P5:3) = [SP++];
ffa032d0:	10 00       	RTS;
ffa032d2:	20 e1 03 08 	R0 = 0x803 (X);		/*		R0=0x803(2051) */
ffa032d6:	d0 4a       	BITSET (R0, 0x1a);		/* bit 26 */
ffa032d8:	08 30       	R1 = R0;
ffa032da:	d5 2f       	JUMP.S 0xffa03284 <_bfin_EMAC_init+0x174>;

ffa032dc <_bfin_EMAC_recv_poll>:
ffa032dc:	fb 05       	[--SP] = (R7:7, P5:3);
ffa032de:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ebc <_txbuf> */
ffa032e2:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900001 */
ffa032e6:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa032ea:	18 32       	P3 = R0;
ffa032ec:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa032ee:	0c e1 d0 0e 	P4.L = 0xed0;		/* (3792)	P4=0xff900ed0 <_rxbuf> */
ffa032f2:	0d e1 cc 0e 	P5.L = 0xecc;		/* (3788)	P5=0xff900ecc <_rxIdx> */
ffa032f6:	06 20       	JUMP.S 0xffa03302 <_bfin_EMAC_recv_poll+0x26>;
ffa032f8:	0f 64       	R7 += 0x1;		/* (  1) */
ffa032fa:	20 e1 64 00 	R0 = 0x64 (X);		/*		R0=0x64(100) */
ffa032fe:	07 08       	CC = R7 == R0;
ffa03300:	54 18       	IF CC JUMP 0xffa033a8 <_bfin_EMAC_recv_poll+0xcc>;
ffa03302:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03306:	ff e3 33 f6 	CALL 0xffa01f6c <_udelay>;
ffa0330a:	28 95       	R0 = W[P5] (Z);
ffa0330c:	10 32       	P2 = R0;
ffa0330e:	94 5e       	P2 = P4 + (P2 << 0x2);
ffa03310:	52 91       	P2 = [P2];
ffa03312:	90 a2       	R0 = [P2 + 0x28];
ffa03314:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa03316:	f1 1f       	IF CC JUMP 0xffa032f8 <_bfin_EMAC_recv_poll+0x1c> (BP);
ffa03318:	20 e1 ff 07 	R0 = 0x7ff (X);		/*		R0=0x7ff(2047) */
ffa0331c:	91 a2       	R1 = [P2 + 0x28];
ffa0331e:	41 54       	R1 = R1 & R0;
ffa03320:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03322:	01 09       	CC = R1 <= R0;
ffa03324:	07 10       	IF !CC JUMP 0xffa03332 <_bfin_EMAC_recv_poll+0x56>;
ffa03326:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03328:	07 30       	R0 = R7;
ffa0332a:	01 e8 00 00 	UNLINK;
ffa0332e:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03330:	10 00       	RTS;
ffa03332:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03334:	90 b2       	[P2 + 0x28] = R0;
ffa03336:	39 30       	R7 = R1;
ffa03338:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa0333a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa0333e:	0f 30       	R1 = R7;
ffa03340:	00 e1 f8 02 	R0.L = 0x2f8;		/* (760)	R0=0xff9002f8(-7339272) */
ffa03344:	ff e3 3e f3 	CALL 0xffa019c0 <_printf_int>;
ffa03348:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff903000 */
ffa0334c:	0a e1 cc 0e 	P2.L = 0xecc;		/* (3788)	P2=0xff900ecc <_rxIdx> */
ffa03350:	10 95       	R0 = W[P2] (Z);
ffa03352:	08 32       	P1 = R0;
ffa03354:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ecc <_rxIdx> */
ffa03358:	0a e1 d0 0e 	P2.L = 0xed0;		/* (3792)	P2=0xff900ed0 <_rxbuf> */
ffa0335c:	0f 30       	R1 = R7;
ffa0335e:	4a 5e       	P1 = P2 + (P1 << 0x2);
ffa03360:	4a 91       	P2 = [P1];
ffa03362:	90 a1       	R0 = [P2 + 0x18];
ffa03364:	18 93       	[P3] = R0;
ffa03366:	00 e3 03 03 	CALL 0xffa0396c <_ARP_rx>;
ffa0336a:	00 0c       	CC = R0 == 0x0;
ffa0336c:	17 18       	IF CC JUMP 0xffa0339a <_bfin_EMAC_recv_poll+0xbe>;
ffa0336e:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa03370:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ebc <_txbuf> */
ffa03374:	2a 95       	R2 = W[P5] (Z);
ffa03376:	d1 42       	R1 = R2.L (Z);
ffa03378:	01 32       	P0 = R1;
ffa0337a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0337c:	09 e1 cc 0e 	P1.L = 0xecc;		/* (3788)	P1=0xff900ecc <_rxIdx> */
ffa03380:	11 0d       	CC = R1 <= 0x2;
ffa03382:	84 5e       	P2 = P4 + (P0 << 0x2);
ffa03384:	52 91       	P2 = [P2];
ffa03386:	90 b2       	[P2 + 0x28] = R0;
ffa03388:	03 10       	IF !CC JUMP 0xffa0338e <_bfin_EMAC_recv_poll+0xb2>;
ffa0338a:	02 30       	R0 = R2;
ffa0338c:	08 64       	R0 += 0x1;		/* (  1) */
ffa0338e:	08 97       	W[P1] = R0;
ffa03390:	07 30       	R0 = R7;
ffa03392:	01 e8 00 00 	UNLINK;
ffa03396:	bb 05       	(R7:7, P5:3) = [SP++];
ffa03398:	10 00       	RTS;
ffa0339a:	18 91       	R0 = [P3];
ffa0339c:	0f 30       	R1 = R7;
ffa0339e:	ff e3 7f fc 	CALL 0xffa02c9c <_icmp_rx>;
ffa033a2:	00 0c       	CC = R0 == 0x0;
ffa033a4:	e6 1f       	IF CC JUMP 0xffa03370 <_bfin_EMAC_recv_poll+0x94> (BP);
ffa033a6:	e4 2f       	JUMP.S 0xffa0336e <_bfin_EMAC_recv_poll+0x92>;
ffa033a8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa033ac:	00 e1 04 03 	R0.L = 0x304;		/* (772)	R0=0xff900304(-7339260) */
ffa033b0:	ff e3 b0 f3 	CALL 0xffa01b10 <_printf_str>;
ffa033b4:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa033b6:	07 30       	R0 = R7;
ffa033b8:	01 e8 00 00 	UNLINK;
ffa033bc:	bb 05       	(R7:7, P5:3) = [SP++];
ffa033be:	10 00       	RTS;

ffa033c0 <_bridge_publish>:
ffa033c0:	e3 05       	[--SP] = (R7:4, P5:3);
ffa033c2:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa033c6:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa033c8:	b8 e6 ff ff 	B[FP + -0x1] = R0;
ffa033cc:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900ecc <_rxIdx> */
ffa033d0:	40 e1 c8 00 	R0.H = 0xc8;		/* (200)	R0=0xc80001(13107201) */
ffa033d4:	0d e1 f0 0e 	P5.L = 0xef0;		/* (3824)	P5=0xff900ef0 <_NetDataDestIP> */
ffa033d8:	00 e1 ef 00 	R0.L = 0xef;		/* (239)	R0=0xc800ef(13107439) */
ffa033dc:	67 32       	P4 = FP;
ffa033de:	5f 32       	P3 = FP;
ffa033e0:	77 30       	R6 = FP;
ffa033e2:	45 e1 0b e5 	R5.H = 0xe50b;		/* (-6901)	R5=0xe50b0009(-452263927) */
ffa033e6:	28 93       	[P5] = R0;
ffa033e8:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa033ea:	c4 6f       	P4 += -0x8;		/* ( -8) */
ffa033ec:	fb 6f       	P3 += -0x1;		/* ( -1) */
ffa033ee:	a6 67       	R6 += -0xc;		/* (-12) */
ffa033f0:	05 e1 81 f7 	R5.L = 0xf781;		/* (-2175)	R5=0xe50bf781(-452200575) */
ffa033f4:	b0 61       	R0 = 0x36 (X);		/*		R0=0x36( 54) */
ffa033f6:	e0 bb       	[FP -0x8] = R0;
ffa033f8:	4b 30       	R1 = P3;
ffa033fa:	44 30       	R0 = P4;
ffa033fc:	2a 91       	R2 = [P5];
ffa033fe:	ff e3 c1 fb 	CALL 0xffa02b80 <_eth_header_setup>;
ffa03402:	08 30       	R1 = R0;
ffa03404:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa03408:	80 0c       	CC = R0 < 0x0;
ffa0340a:	98 18       	IF CC JUMP 0xffa0353a <_bridge_publish+0x17a>;
ffa0340c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ed0 <_rxbuf> */
ffa03410:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa03414:	d1 bb       	[FP -0xc] = R1;
ffa03416:	12 91       	R2 = [P2];
ffa03418:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa0341a:	f0 b0       	[SP + 0xc] = R0;
ffa0341c:	01 30       	R0 = R1;
ffa0341e:	4c 30       	R1 = P4;
ffa03420:	ff e3 e6 f6 	CALL 0xffa021ec <_ip_header_setup>;
ffa03424:	10 32       	P2 = R0;
ffa03426:	21 e1 10 f4 	R1 = -0xbf0 (X);		/*		R1=0xfffff410(-3056) */
ffa0342a:	20 e1 10 f5 	R0 = -0xaf0 (X);		/*		R0=0xfffff510(-2800) */
ffa0342e:	ba e4 f9 ff 	R2 = B[FP + -0x7] (Z);
ffa03432:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa03434:	51 b4       	W[P2 + 0x2] = R1;
ffa03436:	10 97       	W[P2] = R0;
ffa03438:	e1 b9       	R1 = [FP -0x8];
ffa0343a:	82 c6 41 80 	R0 = R1 << 0x8;
ffa0343e:	10 56       	R0 = R0 | R2;
ffa03440:	90 b4       	W[P2 + 0x4] = R0;
ffa03442:	c1 67       	R1 += -0x8;		/* ( -8) */
ffa03444:	e1 bb       	[FP -0x8] = R1;
ffa03446:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03448:	d0 b4       	W[P2 + 0x6] = R0;
ffa0344a:	4a 30       	R1 = P2;
ffa0344c:	41 64       	R1 += 0x8;		/* (  8) */
ffa0344e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03452:	d1 bb       	[FP -0xc] = R1;
ffa03454:	52 60       	R2 = 0xa (X);		/*		R2=0xa( 10) */
ffa03456:	00 e1 14 03 	R0.L = 0x314;		/* (788)	R0=0xff900314(-7339244) */
ffa0345a:	ff e3 a9 f3 	CALL 0xffa01bac <_memcpy_>;
ffa0345e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900314(-7339244) */
ffa03462:	00 e1 20 03 	R0.L = 0x320;		/* (800)	R0=0xff900320(-7339232) */
ffa03466:	ff e3 55 f3 	CALL 0xffa01b10 <_printf_str>;
ffa0346a:	ff e3 ab f7 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa0346e:	05 20       	JUMP.S 0xffa03478 <_bridge_publish+0xb8>;
ffa03470:	0f 64       	R7 += 0x1;		/* (  1) */
ffa03472:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa03474:	07 08       	CC = R7 == R0;
ffa03476:	45 18       	IF CC JUMP 0xffa03500 <_bridge_publish+0x140>;
ffa03478:	06 30       	R0 = R6;
ffa0347a:	ff e3 31 ff 	CALL 0xffa032dc <_bfin_EMAC_recv_poll>;
ffa0347e:	59 61       	R1 = 0x2b (X);		/*		R1=0x2b( 43) */
ffa03480:	e0 bb       	[FP -0x8] = R0;
ffa03482:	da b9       	P2 = [FP -0xc];
ffa03484:	08 09       	CC = R0 <= R1;
ffa03486:	f5 1f       	IF CC JUMP 0xffa03470 <_bridge_publish+0xb0> (BP);
ffa03488:	d0 a9       	R0 = W[P2 + 0xe] (X);
ffa0348a:	91 e4 0f 00 	R1 = B[P2 + 0xf] (Z);
ffa0348e:	40 4f       	R0 <<= 0x8;
ffa03490:	08 56       	R0 = R0 | R1;
ffa03492:	c0 42       	R0 = R0.L (Z);
ffa03494:	21 e1 00 08 	R1 = 0x800 (X);		/*		R1=0x800(2048) */
ffa03498:	08 08       	CC = R0 == R1;
ffa0349a:	eb 17       	IF !CC JUMP 0xffa03470 <_bridge_publish+0xb0> (BP);
ffa0349c:	50 e4 12 00 	R0 = W[P2 + 0x24] (Z);
ffa034a0:	81 e1 10 f4 	R1 = 0xf410 (Z);		/*		R1=0xf410(62480) */
ffa034a4:	08 08       	CC = R0 == R1;
ffa034a6:	e5 17       	IF !CC JUMP 0xffa03470 <_bridge_publish+0xb0> (BP);
ffa034a8:	50 e4 13 00 	R0 = W[P2 + 0x26] (Z);
ffa034ac:	81 e1 10 f5 	R1 = 0xf510 (Z);		/*		R1=0xf510(62736) */
ffa034b0:	08 08       	CC = R0 == R1;
ffa034b2:	df 17       	IF !CC JUMP 0xffa03470 <_bridge_publish+0xb0> (BP);
ffa034b4:	d1 a1       	R1 = [P2 + 0x1c];
ffa034b6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000a(-7340022) */
ffa034ba:	29 93       	[P5] = R1;
ffa034bc:	00 e1 38 03 	R0.L = 0x338;		/* (824)	R0=0xff900338(-7339208) */
ffa034c0:	ff e3 2e f3 	CALL 0xffa01b1c <_printf_ip>;
ffa034c4:	da b9       	P2 = [FP -0xc];
ffa034c6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900338(-7339208) */
ffa034ca:	00 e1 44 03 	R0.L = 0x344;		/* (836)	R0=0xff900344(-7339196) */
ffa034ce:	62 6d       	P2 += 0x2c;		/* ( 44) */
ffa034d0:	da bb       	[FP -0xc] = P2;
ffa034d2:	a2 6e       	P2 += -0x2c;		/* (-44) */
ffa034d4:	91 e4 2c 00 	R1 = B[P2 + 0x2c] (Z);
ffa034d8:	ff e3 c2 f1 	CALL 0xffa0185c <_printf_hex_byte>;
ffa034dc:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900344(-7339196) */
ffa034e0:	00 e1 50 03 	R0.L = 0x350;		/* (848)	R0=0xff900350(-7339184) */
ffa034e4:	ff e3 16 f3 	CALL 0xffa01b10 <_printf_str>;
ffa034e8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ef0 <_NetDataDestIP> */
ffa034ec:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa034ee:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa034f2:	10 9b       	B[P2] = R0;
ffa034f4:	da b9       	P2 = [FP -0xc];
ffa034f6:	01 e8 00 00 	UNLINK;
ffa034fa:	a3 05       	(R7:4, P5:3) = [SP++];
ffa034fc:	50 99       	R0 = B[P2] (X);
ffa034fe:	10 00       	RTS;
ffa03500:	ff e3 54 e6 	CALL 0xffa001a8 <_ustimer>;
ffa03504:	08 4e       	R0 >>= 0x1;
ffa03506:	80 c0 05 18 	A1 = R0.L * R5.L (FU);
ffa0350a:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0350e:	81 c0 05 86 	A1 += R0.H * R5.L, A0 = R0.H * R5.H (FU);
ffa03512:	81 c0 28 98 	A1 += R5.H * R0.L (FU);
ffa03516:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa0351a:	0b c4 3f 80 	A0 += A1;
ffa0351e:	8b c0 00 38 	R0 = A0 (FU);
ffa03522:	58 4e       	R0 >>= 0xb;
ffa03524:	20 08       	CC = R0 == R4;
ffa03526:	67 1b       	IF CC JUMP 0xffa033f4 <_bridge_publish+0x34>;
ffa03528:	4a e1 c0 ff 	P2.H = 0xffc0;		/* (-64)	P2=0xffc00c40(-4191168) */
ffa0352c:	21 e1 00 80 	R1 = -0x8000 (X);		/*		R1=0xffff8000(-32768) */
ffa03530:	0a e1 0c 07 	P2.L = 0x70c;		/* (1804)	P2=0xffc0070c(-4192500) */
ffa03534:	11 97       	W[P2] = R1;
ffa03536:	20 30       	R4 = R0;
ffa03538:	5e 2f       	JUMP.S 0xffa033f4 <_bridge_publish+0x34>;
ffa0353a:	01 e8 00 00 	UNLINK;
ffa0353e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03540:	a3 05       	(R7:4, P5:3) = [SP++];
ffa03542:	10 00       	RTS;

ffa03544 <_DHCP_rx>:
ffa03544:	e3 05       	[--SP] = (R7:4, P5:3);
ffa03546:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0354a:	67 32       	P4 = FP;
ffa0354c:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc00ed0(-4190512) */
ffa03550:	e4 6f       	P4 += -0x4;		/* ( -4) */
ffa03552:	24 e1 e4 fe 	R4 = -0x11c (X);		/*		R4=0xfffffee4(-284) */
ffa03556:	0b e1 04 30 	P3.L = 0x3004;		/* (12292)	P3=0xffc03004(-4182012) */
ffa0355a:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa0355c:	0b 20       	JUMP.S 0xffa03572 <_DHCP_rx+0x2e>;
ffa0355e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03562:	00 e1 64 03 	R0.L = 0x364;		/* (868)	R0=0xff900364(-7339164) */
ffa03566:	ff e3 d5 f2 	CALL 0xffa01b10 <_printf_str>;
ffa0356a:	0e 64       	R6 += 0x1;		/* (  1) */
ffa0356c:	60 60       	R0 = 0xc (X);		/*		R0=0xc( 12) */
ffa0356e:	06 09       	CC = R6 <= R0;
ffa03570:	5a 10       	IF !CC JUMP 0xffa03624 <_DHCP_rx+0xe0>;
ffa03572:	44 30       	R0 = P4;
ffa03574:	ff e3 b4 fe 	CALL 0xffa032dc <_bfin_EMAC_recv_poll>;
ffa03578:	38 30       	R7 = R0;
ffa0357a:	60 51       	R5 = R0 + R4;
ffa0357c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000c(-7340020) */
ffa03580:	0d 30       	R1 = R5;
ffa03582:	00 e1 80 03 	R0.L = 0x380;		/* (896)	R0=0xff900380(-7339136) */
ffa03586:	ff e3 1d f2 	CALL 0xffa019c0 <_printf_int>;
ffa0358a:	21 e1 1b 01 	R1 = 0x11b (X);		/*		R1=0x11b(283) */
ffa0358e:	fd b9       	P5 = [FP -0x4];
ffa03590:	0f 09       	CC = R7 <= R1;
ffa03592:	e6 1b       	IF CC JUMP 0xffa0355e <_DHCP_rx+0x1a>;
ffa03594:	00 00       	NOP;
ffa03596:	00 00       	NOP;
ffa03598:	00 00       	NOP;
ffa0359a:	e8 a9       	R0 = W[P5 + 0xe] (X);
ffa0359c:	a9 e4 0f 00 	R1 = B[P5 + 0xf] (Z);
ffa035a0:	40 4f       	R0 <<= 0x8;
ffa035a2:	08 56       	R0 = R0 | R1;
ffa035a4:	c0 42       	R0 = R0.L (Z);
ffa035a6:	21 e1 00 08 	R1 = 0x800 (X);		/*		R1=0x800(2048) */
ffa035aa:	08 08       	CC = R0 == R1;
ffa035ac:	d9 17       	IF !CC JUMP 0xffa0355e <_DHCP_rx+0x1a> (BP);
ffa035ae:	68 e4 12 00 	R0 = W[P5 + 0x24] (Z);
ffa035b2:	21 e1 00 43 	R1 = 0x4300 (X);		/*		R1=0x4300(17152) */
ffa035b6:	08 08       	CC = R0 == R1;
ffa035b8:	da 17       	IF !CC JUMP 0xffa0356c <_DHCP_rx+0x28> (BP);
ffa035ba:	68 e4 13 00 	R0 = W[P5 + 0x26] (Z);
ffa035be:	21 e1 00 44 	R1 = 0x4400 (X);		/*		R1=0x4400(17408) */
ffa035c2:	08 08       	CC = R0 == R1;
ffa035c4:	d4 17       	IF !CC JUMP 0xffa0356c <_DHCP_rx+0x28> (BP);
ffa035c6:	19 91       	R1 = [P3];
ffa035c8:	28 a3       	R0 = [P5 + 0x30];
ffa035ca:	08 08       	CC = R0 == R1;
ffa035cc:	d0 17       	IF !CC JUMP 0xffa0356c <_DHCP_rx+0x28> (BP);
ffa035ce:	41 e1 53 63 	R1.H = 0x6353;		/* (25427)	R1=0x63534400(1666401280) */
ffa035d2:	28 e4 46 00 	R0 = [P5 + 0x118];
ffa035d6:	01 e1 63 82 	R1.L = 0x8263;		/* (-32157)	R1=0x63538263(1666417251) */
ffa035da:	08 08       	CC = R0 == R1;
ffa035dc:	c8 17       	IF !CC JUMP 0xffa0356c <_DHCP_rx+0x28> (BP);
ffa035de:	4d 30       	R1 = P5;
ffa035e0:	20 e1 1c 01 	R0 = 0x11c (X);		/*		R0=0x11c(284) */
ffa035e4:	01 50       	R0 = R1 + R0;
ffa035e6:	82 ce 05 c2 	R1 = ROT R5 BY 0x0 || [FP -0x4] = R0 || NOP;
ffa035ea:	f0 bb 00 00 
ffa035ee:	ff e3 5d f8 	CALL 0xffa026a8 <_DHCP_parse>;
ffa035f2:	e9 a3       	R1 = [P5 + 0x3c];
ffa035f4:	01 0c       	CC = R1 == 0x0;
ffa035f6:	12 1c       	IF CC JUMP 0xffa0361a <_DHCP_rx+0xd6> (BP);
ffa035f8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff90070c */
ffa035fc:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa03600:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90011c(-7339748) */
ffa03604:	11 93       	[P2] = R1;
ffa03606:	00 e1 54 03 	R0.L = 0x354;		/* (852)	R0=0xff900354(-7339180) */
ffa0360a:	ff e3 89 f2 	CALL 0xffa01b1c <_printf_ip>;
ffa0360e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900354(-7339180) */
ffa03612:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa03616:	ff e3 7d f2 	CALL 0xffa01b10 <_printf_str>;
ffa0361a:	01 e8 00 00 	UNLINK;
ffa0361e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03620:	a3 05       	(R7:4, P5:3) = [SP++];
ffa03622:	10 00       	RTS;
ffa03624:	ff e3 1e f8 	CALL 0xffa02660 <_DHCP_tx_discover>;
ffa03628:	99 2f       	JUMP.S 0xffa0355a <_DHCP_rx+0x16>;
	...

ffa0362c <_DHCP_req>:
ffa0362c:	c5 04       	[--SP] = (P5:5);
ffa0362e:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa03632:	ff e3 17 f8 	CALL 0xffa02660 <_DHCP_tx_discover>;
ffa03636:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900ef0 <_NetDataDestIP> */
ffa0363a:	ff e3 85 ff 	CALL 0xffa03544 <_DHCP_rx>;
ffa0363e:	0d e1 b4 0e 	P5.L = 0xeb4;		/* (3764)	P5=0xff900eb4 <_NetDHCPserv> */
ffa03642:	29 91       	R1 = [P5];
ffa03644:	39 0c       	CC = R1 == -0x1;
ffa03646:	42 18       	IF CC JUMP 0xffa036ca <_DHCP_req+0x9e>;
ffa03648:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_NetOurIP> */
ffa0364c:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa03650:	10 91       	R0 = [P2];
ffa03652:	00 0c       	CC = R0 == 0x0;
ffa03654:	08 18       	IF CC JUMP 0xffa03664 <_DHCP_req+0x38>;
ffa03656:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eec <_NetOurIP> */
ffa0365a:	0a e1 e8 0e 	P2.L = 0xee8;		/* (3816)	P2=0xff900ee8 <_NetSubnetMask> */
ffa0365e:	10 91       	R0 = [P2];
ffa03660:	00 0c       	CC = R0 == 0x0;
ffa03662:	2f 10       	IF !CC JUMP 0xffa036c0 <_DHCP_req+0x94>;
ffa03664:	a8 61       	R0 = 0x35 (X);		/*		R0=0x35( 53) */
ffa03666:	b8 e6 f4 ff 	B[FP + -0xc] = R0;
ffa0366a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0366c:	b8 e6 f5 ff 	B[FP + -0xb] = R0;
ffa03670:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa03672:	b8 e6 f6 ff 	B[FP + -0xa] = R0;
ffa03676:	b0 61       	R0 = 0x36 (X);		/*		R0=0x36( 54) */
ffa03678:	b8 e6 f7 ff 	B[FP + -0x9] = R0;
ffa0367c:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa0367e:	b8 e6 f8 ff 	B[FP + -0x8] = R0;
ffa03682:	82 c6 c1 81 	R0 = R1 >> 0x8;
ffa03686:	b8 e6 fa ff 	B[FP + -0x6] = R0;
ffa0368a:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa0368e:	b8 e6 fb ff 	B[FP + -0x5] = R0;
ffa03692:	82 c6 41 81 	R0 = R1 >> 0x18;
ffa03696:	b8 e6 fc ff 	B[FP + -0x4] = R0;
ffa0369a:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa0369c:	b8 e6 fd ff 	B[FP + -0x3] = R0;
ffa036a0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90ffff(-7274497) */
ffa036a4:	b9 e6 f9 ff 	B[FP + -0x7] = R1;
ffa036a8:	00 e1 b0 03 	R0.L = 0x3b0;		/* (944)	R0=0xff9003b0(-7339088) */
ffa036ac:	ff e3 32 f2 	CALL 0xffa01b10 <_printf_str>;
ffa036b0:	4f 30       	R1 = FP;
ffa036b2:	50 60       	R0 = 0xa (X);		/*		R0=0xa( 10) */
ffa036b4:	a1 67       	R1 += -0xc;		/* (-12) */
ffa036b6:	2a 91       	R2 = [P5];
ffa036b8:	ff e3 ee f6 	CALL 0xffa02494 <_DHCP_tx>;
ffa036bc:	ff e3 44 ff 	CALL 0xffa03544 <_DHCP_rx>;
ffa036c0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa036c2:	01 e8 00 00 	UNLINK;
ffa036c6:	85 04       	(P5:5) = [SP++];
ffa036c8:	10 00       	RTS;
ffa036ca:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa036ce:	00 e1 94 03 	R0.L = 0x394;		/* (916)	R0=0xff900394(-7339116) */
ffa036d2:	ff e3 1f f2 	CALL 0xffa01b10 <_printf_str>;
ffa036d6:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa036d8:	f5 2f       	JUMP.S 0xffa036c2 <_DHCP_req+0x96>;
	...

ffa036dc <_bfin_EMAC_recv>:
ffa036dc:	e3 05       	[--SP] = (R7:4, P5:3);
ffa036de:	46 e1 90 ff 	R6.H = 0xff90;		/* (-112)	R6=0xff900000 <_l1_data_a>(-7340032) */
ffa036e2:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff90f781(-7276671) */
ffa036e6:	06 e1 cc 0e 	R6.L = 0xecc;		/* (3788)	R6=0xff900ecc <_rxIdx>(-7336244) */
ffa036ea:	4b e1 c0 ff 	P3.H = 0xffc0;		/* (-64)	P3=0xffc03004(-4182012) */
ffa036ee:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa036f2:	28 32       	P5 = R0;
ffa036f4:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa036f6:	05 e1 d0 0e 	R5.L = 0xed0;		/* (3792)	R5=0xff900ed0 <_rxbuf>(-7336240) */
ffa036fa:	26 32       	P4 = R6;
ffa036fc:	0b e1 68 0c 	P3.L = 0xc68;		/* (3176)	P3=0xffc00c68(-4191128) */
ffa03700:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa03702:	06 32       	P0 = R6;
ffa03704:	0d 32       	P1 = R5;
ffa03706:	00 95       	R0 = W[P0] (Z);
ffa03708:	10 32       	P2 = R0;
ffa0370a:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa0370c:	52 91       	P2 = [P2];
ffa0370e:	90 a2       	R0 = [P2 + 0x28];
ffa03710:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa03712:	48 18       	IF CC JUMP 0xffa037a2 <_bfin_EMAC_recv+0xc6>;
ffa03714:	00 00       	NOP;
ffa03716:	00 00       	NOP;
ffa03718:	00 00       	NOP;
ffa0371a:	90 a2       	R0 = [P2 + 0x28];
ffa0371c:	a0 48       	CC = !BITTST (R0, 0x14);		/* bit 20 */
ffa0371e:	44 10       	IF !CC JUMP 0xffa037a6 <_bfin_EMAC_recv+0xca>;
ffa03720:	00 00       	NOP;
ffa03722:	00 00       	NOP;
ffa03724:	00 00       	NOP;
ffa03726:	90 a2       	R0 = [P2 + 0x28];
ffa03728:	68 48       	CC = !BITTST (R0, 0xd);		/* bit 13 */
ffa0372a:	45 18       	IF CC JUMP 0xffa037b4 <_bfin_EMAC_recv+0xd8>;
ffa0372c:	00 00       	NOP;
ffa0372e:	00 00       	NOP;
ffa03730:	21 e1 ff 07 	R1 = 0x7ff (X);		/*		R1=0x7ff(2047) */
ffa03734:	90 a2       	R0 = [P2 + 0x28];
ffa03736:	c8 55       	R7 = R0 & R1;
ffa03738:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa0373a:	07 09       	CC = R7 <= R0;
ffa0373c:	43 18       	IF CC JUMP 0xffa037c2 <_bfin_EMAC_recv+0xe6>;
ffa0373e:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa03740:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ecc <_rxIdx> */
ffa03744:	09 e1 d0 0e 	P1.L = 0xed0;		/* (3792)	P1=0xff900ed0 <_rxbuf> */
ffa03748:	90 a1       	R0 = [P2 + 0x18];
ffa0374a:	28 93       	[P5] = R0;
ffa0374c:	18 95       	R0 = W[P3] (Z);
ffa0374e:	01 56       	R0 = R1 | R0;
ffa03750:	18 97       	W[P3] = R0;
ffa03752:	21 95       	R1 = W[P4] (Z);
ffa03754:	c8 42       	R0 = R1.L (Z);
ffa03756:	00 32       	P0 = R0;
ffa03758:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa0375a:	10 0d       	CC = R0 <= 0x2;
ffa0375c:	81 5e       	P2 = P1 + (P0 << 0x2);
ffa0375e:	52 91       	P2 = [P2];
ffa03760:	94 b2       	[P2 + 0x28] = R4;
ffa03762:	1c 1c       	IF CC JUMP 0xffa0379a <_bfin_EMAC_recv+0xbe> (BP);
ffa03764:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03766:	20 97       	W[P4] = R0;
ffa03768:	28 91       	R0 = [P5];
ffa0376a:	0f 30       	R1 = R7;
ffa0376c:	00 e3 00 01 	CALL 0xffa0396c <_ARP_rx>;
ffa03770:	00 0c       	CC = R0 == 0x0;
ffa03772:	03 18       	IF CC JUMP 0xffa03778 <_bfin_EMAC_recv+0x9c>;
ffa03774:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa03776:	c6 2f       	JUMP.S 0xffa03702 <_bfin_EMAC_recv+0x26>;
ffa03778:	28 91       	R0 = [P5];
ffa0377a:	0f 30       	R1 = R7;
ffa0377c:	ff e3 90 fa 	CALL 0xffa02c9c <_icmp_rx>;
ffa03780:	00 0c       	CC = R0 == 0x0;
ffa03782:	f9 17       	IF !CC JUMP 0xffa03774 <_bfin_EMAC_recv+0x98> (BP);
ffa03784:	28 91       	R0 = [P5];
ffa03786:	0f 30       	R1 = R7;
ffa03788:	00 e3 88 04 	CALL 0xffa04098 <_tcp_rx>;
ffa0378c:	00 0c       	CC = R0 == 0x0;
ffa0378e:	f3 17       	IF !CC JUMP 0xffa03774 <_bfin_EMAC_recv+0x98> (BP);
ffa03790:	07 30       	R0 = R7;
ffa03792:	01 e8 00 00 	UNLINK;
ffa03796:	a3 05       	(R7:4, P5:3) = [SP++];
ffa03798:	10 00       	RTS;
ffa0379a:	01 30       	R0 = R1;
ffa0379c:	08 64       	R0 += 0x1;		/* (  1) */
ffa0379e:	20 97       	W[P4] = R0;
ffa037a0:	e4 2f       	JUMP.S 0xffa03768 <_bfin_EMAC_recv+0x8c>;
ffa037a2:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa037a4:	f6 2f       	JUMP.S 0xffa03790 <_bfin_EMAC_recv+0xb4>;
ffa037a6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa037aa:	00 e1 c4 03 	R0.L = 0x3c4;		/* (964)	R0=0xff9003c4(-7339068) */
ffa037ae:	ff e3 b1 f1 	CALL 0xffa01b10 <_printf_str>;
ffa037b2:	ef 2f       	JUMP.S 0xffa03790 <_bfin_EMAC_recv+0xb4>;
ffa037b4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003c4(-7339068) */
ffa037b8:	00 e1 e0 03 	R0.L = 0x3e0;		/* (992)	R0=0xff9003e0(-7339040) */
ffa037bc:	ff e3 aa f1 	CALL 0xffa01b10 <_printf_str>;
ffa037c0:	e8 2f       	JUMP.S 0xffa03790 <_bfin_EMAC_recv+0xb4>;
ffa037c2:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff9003e0(-7339040) */
ffa037c6:	00 e1 f4 03 	R0.L = 0x3f4;		/* (1012)	R0=0xff9003f4(-7339020) */
ffa037ca:	ff e3 a3 f1 	CALL 0xffa01b10 <_printf_str>;
ffa037ce:	e1 2f       	JUMP.S 0xffa03790 <_bfin_EMAC_recv+0xb4>;

ffa037d0 <_ARP_init>:
ffa037d0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee8 <_NetSubnetMask> */
ffa037d4:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa037d8:	0a e1 00 0f 	P2.L = 0xf00;		/* (3840)	P2=0xff900f00 */
ffa037dc:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa037de:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa037e0:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa037e2:	51 68       	P1 = 0xa (X);		/*		P1=0xa( 10) */
ffa037e4:	b2 e0 12 10 	LSETUP(0xffa037e8 <_ARP_init+0x18>, 0xffa03808 <_ARP_init+0x38>) LC1 = P1;
ffa037e8:	11 e6 fe ff 	[P2 + -0x8] = R1;
ffa037ec:	90 e6 fc ff 	B[P2 + -0x4] = R0;
ffa037f0:	90 e6 fd ff 	B[P2 + -0x3] = R0;
ffa037f4:	90 e6 fe ff 	B[P2 + -0x2] = R0;
ffa037f8:	90 e6 ff ff 	B[P2 + -0x1] = R0;
ffa037fc:	10 9b       	B[P2] = R0;
ffa037fe:	90 e6 01 00 	B[P2 + 0x1] = R0;
ffa03802:	52 b4       	W[P2 + 0x2] = R2;
ffa03804:	51 b0       	[P2 + 0x4] = R1;
ffa03806:	91 b0       	[P2 + 0x8] = R1;
ffa03808:	a2 6c       	P2 += 0x14;		/* ( 20) */
ffa0380a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900f00 */
ffa0380e:	20 e1 64 00 	R0 = 0x64 (X);		/*		R0=0x64(100) */
ffa03812:	0a e1 f4 0e 	P2.L = 0xef4;		/* (3828)	P2=0xff900ef4 <_NetArpLut_age> */
ffa03816:	10 97       	W[P2] = R0;
ffa03818:	01 e8 00 00 	UNLINK;
ffa0381c:	10 00       	RTS;
	...

ffa03820 <_ARP_lut_find>:
ffa03820:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900eb8 <_txIdx> */
ffa03824:	08 e1 f8 0e 	P0.L = 0xef8;		/* (3832)	P0=0xff900ef8 <_NetArpLut> */
ffa03828:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0382c:	48 32       	P1 = P0;
ffa0382e:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03830:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03832:	b2 e0 06 20 	LSETUP(0xffa03836 <_ARP_lut_find+0x16>, 0xffa0383e <_ARP_lut_find+0x1e>) LC1 = P2;
ffa03836:	08 91       	R0 = [P1];
ffa03838:	00 0c       	CC = R0 == 0x0;
ffa0383a:	0f 18       	IF CC JUMP 0xffa03858 <_ARP_lut_find+0x38>;
ffa0383c:	09 64       	R1 += 0x1;		/* (  1) */
ffa0383e:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03840:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff90000a */
ffa03844:	43 a5       	R3 = W[P0 + 0xa] (Z);
ffa03846:	09 e1 16 0f 	P1.L = 0xf16;		/* (3862)	P1=0xff900f16 */
ffa0384a:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0384c:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa0384e:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03850:	0a 64       	R2 += 0x1;		/* (  1) */
ffa03852:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03854:	42 0c       	CC = P2 == 0x0;
ffa03856:	05 10       	IF !CC JUMP 0xffa03860 <_ARP_lut_find+0x40>;
ffa03858:	01 30       	R0 = R1;
ffa0385a:	01 e8 00 00 	UNLINK;
ffa0385e:	10 00       	RTS;
ffa03860:	08 95       	R0 = W[P1] (Z);
ffa03862:	03 09       	CC = R3 <= R0;
ffa03864:	03 07       	IF CC R0 = R3;
ffa03866:	0a 06       	IF !CC R1 = R2;
ffa03868:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa0386a:	18 30       	R3 = R0;
ffa0386c:	f2 2f       	JUMP.S 0xffa03850 <_ARP_lut_find+0x30>;
	...

ffa03870 <_ARP_lut_add>:
ffa03870:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900ef8 <_NetArpLut> */
ffa03874:	fb 05       	[--SP] = (R7:7, P5:3);
ffa03876:	08 e1 f8 0e 	P0.L = 0xef8;		/* (3832)	P0=0xff900ef8 <_NetArpLut> */
ffa0387a:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0387e:	38 30       	R7 = R0;
ffa03880:	58 32       	P3 = P0;
ffa03882:	48 32       	P1 = P0;
ffa03884:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa03886:	fb 63       	R3 = -0x1 (X);		/*		R3=0xffffffff( -1) */
ffa03888:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa0388a:	00 00       	NOP;
ffa0388c:	08 91       	R0 = [P1];
ffa0388e:	38 08       	CC = R0 == R7;
ffa03890:	aa 07       	IF CC P5 = R2;
ffa03892:	ab 06       	IF !CC P5 = R3;
ffa03894:	0a 64       	R2 += 0x1;		/* (  1) */
ffa03896:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03898:	42 0c       	CC = P2 == 0x0;
ffa0389a:	1f 10       	IF !CC JUMP 0xffa038d8 <_ARP_lut_add+0x68>;
ffa0389c:	7d 0c       	CC = P5 == -0x1;
ffa0389e:	21 18       	IF CC JUMP 0xffa038e0 <_ARP_lut_add+0x70>;
ffa038a0:	6c 44       	P4 = P5 << 0x2;
ffa038a2:	ac 5a       	P2 = P4 + P5;
ffa038a4:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa038a6:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa038a8:	0f 93       	[P1] = R7;
ffa038aa:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa038ac:	01 32       	P0 = R1;
ffa038ae:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa038b0:	b2 e0 03 20 	LSETUP(0xffa038b4 <_ARP_lut_add+0x44>, 0xffa038b6 <_ARP_lut_add+0x46>) LC1 = P2;
ffa038b4:	40 98       	R0 = B[P0++] (X);
ffa038b6:	08 9a       	B[P1++] = R0;
ffa038b8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900006 */
ffa038bc:	0a e1 f4 0e 	P2.L = 0xef4;		/* (3828)	P2=0xff900ef4 <_NetArpLut_age> */
ffa038c0:	10 95       	R0 = W[P2] (Z);
ffa038c2:	08 64       	R0 += 0x1;		/* (  1) */
ffa038c4:	10 97       	W[P2] = R0;
ffa038c6:	ec 45       	P4 = (P4 + P5) << 0x2;
ffa038c8:	a3 5a       	P2 = P3 + P4;
ffa038ca:	50 b5       	W[P2 + 0xa] = R0;
ffa038cc:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa038ce:	10 b1       	[P2 + 0x10] = R0;
ffa038d0:	01 e8 00 00 	UNLINK;
ffa038d4:	bb 05       	(R7:7, P5:3) = [SP++];
ffa038d6:	10 00       	RTS;
ffa038d8:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa038da:	7d 0c       	CC = P5 == -0x1;
ffa038dc:	d7 1f       	IF CC JUMP 0xffa0388a <_ARP_lut_add+0x1a> (BP);
ffa038de:	e1 2f       	JUMP.S 0xffa038a0 <_ARP_lut_add+0x30>;
ffa038e0:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa038e2:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa038e4:	b2 e0 06 20 	LSETUP(0xffa038e8 <_ARP_lut_add+0x78>, 0xffa038f0 <_ARP_lut_add+0x80>) LC1 = P2;
ffa038e8:	00 91       	R0 = [P0];
ffa038ea:	00 0c       	CC = R0 == 0x0;
ffa038ec:	da 1b       	IF CC JUMP 0xffa038a0 <_ARP_lut_add+0x30>;
ffa038ee:	0d 6c       	P5 += 0x1;		/* (  1) */
ffa038f0:	a0 6c       	P0 += 0x14;		/* ( 20) */
ffa038f2:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f16 */
ffa038f6:	5b a5       	R3 = W[P3 + 0xa] (Z);
ffa038f8:	09 e1 16 0f 	P1.L = 0xf16;		/* (3862)	P1=0xff900f16 */
ffa038fc:	05 68       	P5 = 0x0 (X);		/*		P5=0x0(  0) */
ffa038fe:	02 60       	R2 = 0x0 (X);		/*		R2=0x0(  0) */
ffa03900:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03902:	0a 64       	R2 += 0x1;		/* (  1) */
ffa03904:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03906:	42 0c       	CC = P2 == 0x0;
ffa03908:	02 10       	IF !CC JUMP 0xffa0390c <_ARP_lut_add+0x9c>;
ffa0390a:	cb 2f       	JUMP.S 0xffa038a0 <_ARP_lut_add+0x30>;
ffa0390c:	08 95       	R0 = W[P1] (Z);
ffa0390e:	98 08       	CC = R0 < R3;
ffa03910:	03 06       	IF !CC R0 = R3;
ffa03912:	aa 07       	IF CC P5 = R2;
ffa03914:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03916:	18 30       	R3 = R0;
ffa03918:	f5 2f       	JUMP.S 0xffa03902 <_ARP_lut_add+0x92>;
	...

ffa0391c <_ARP_lu>:
ffa0391c:	c4 04       	[--SP] = (P5:4);
ffa0391e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900ed0 <_rxbuf> */
ffa03922:	0c e1 f8 0e 	P4.L = 0xef8;		/* (3832)	P4=0xff900ef8 <_NetArpLut> */
ffa03926:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa0392a:	10 30       	R2 = R0;
ffa0392c:	29 32       	P5 = R1;
ffa0392e:	4c 32       	P1 = P4;
ffa03930:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa03932:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03934:	b2 e0 06 20 	LSETUP(0xffa03938 <_ARP_lu+0x1c>, 0xffa03940 <_ARP_lu+0x24>) LC1 = P2;
ffa03938:	08 91       	R0 = [P1];
ffa0393a:	10 08       	CC = R0 == R2;
ffa0393c:	08 18       	IF CC JUMP 0xffa0394c <_ARP_lu+0x30>;
ffa0393e:	08 6c       	P0 += 0x1;		/* (  1) */
ffa03940:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03942:	01 e8 00 00 	UNLINK;
ffa03946:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03948:	84 04       	(P5:4) = [SP++];
ffa0394a:	10 00       	RTS;
ffa0394c:	08 a1       	R0 = [P1 + 0x10];
ffa0394e:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa03950:	f7 1f       	IF CC JUMP 0xffa0393e <_ARP_lu+0x22> (BP);
ffa03952:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa03954:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03956:	54 5e       	P1 = P4 + (P2 << 0x2);
ffa03958:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa0395a:	b2 e0 03 20 	LSETUP(0xffa0395e <_ARP_lu+0x42>, 0xffa03960 <_ARP_lu+0x44>) LC1 = P2;
ffa0395e:	48 98       	R0 = B[P1++] (X);
ffa03960:	28 9a       	B[P5++] = R0;
ffa03962:	01 e8 00 00 	UNLINK;
ffa03966:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03968:	84 04       	(P5:4) = [SP++];
ffa0396a:	10 00       	RTS;

ffa0396c <_ARP_rx>:
ffa0396c:	fb 05       	[--SP] = (R7:7, P5:3);
ffa0396e:	20 32       	P4 = R0;
ffa03970:	39 30       	R7 = R1;
ffa03972:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa03976:	e0 a5       	R0 = W[P4 + 0xe] (Z);
ffa03978:	ff e3 08 f4 	CALL 0xffa02188 <_htons>;
ffa0397c:	c0 42       	R0 = R0.L (Z);
ffa0397e:	21 e1 06 08 	R1 = 0x806 (X);		/*		R1=0x806(2054) */
ffa03982:	08 08       	CC = R0 == R1;
ffa03984:	06 18       	IF CC JUMP 0xffa03990 <_ARP_rx+0x24>;
ffa03986:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03988:	01 e8 00 00 	UNLINK;
ffa0398c:	bb 05       	(R7:7, P5:3) = [SP++];
ffa0398e:	10 00       	RTS;
ffa03990:	58 61       	R0 = 0x2b (X);		/*		R0=0x2b( 43) */
ffa03992:	07 0a       	CC = R7 <= R0 (IU);
ffa03994:	f9 1f       	IF CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa03996:	27 a6       	R7 = W[P4 + 0x10] (Z);
ffa03998:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0399a:	ff e3 f7 f3 	CALL 0xffa02188 <_htons>;
ffa0399e:	c0 42       	R0 = R0.L (Z);
ffa039a0:	07 08       	CC = R7 == R0;
ffa039a2:	f2 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa039a4:	67 a6       	R7 = W[P4 + 0x12] (Z);
ffa039a6:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa039aa:	ff e3 ef f3 	CALL 0xffa02188 <_htons>;
ffa039ae:	c0 42       	R0 = R0.L (Z);
ffa039b0:	07 08       	CC = R7 == R0;
ffa039b2:	ea 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa039b4:	a0 a6       	R0 = W[P4 + 0x14] (Z);
ffa039b6:	21 e1 06 04 	R1 = 0x406 (X);		/*		R1=0x406(1030) */
ffa039ba:	08 08       	CC = R0 == R1;
ffa039bc:	e5 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa039be:	e7 a6       	R7 = W[P4 + 0x16] (Z);
ffa039c0:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa039c2:	ff e3 e3 f3 	CALL 0xffa02188 <_htons>;
ffa039c6:	c0 42       	R0 = R0.L (Z);
ffa039c8:	07 08       	CC = R7 == R0;
ffa039ca:	0c 14       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa039cc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900006 */
ffa039d0:	0a e1 e0 0e 	P2.L = 0xee0;		/* (3808)	P2=0xff900ee0 <_NetOurMAC> */
ffa039d4:	a1 e4 22 00 	R1 = B[P4 + 0x22] (Z);
ffa039d8:	10 99       	R0 = B[P2] (Z);
ffa039da:	01 08       	CC = R1 == R0;
ffa039dc:	ad 18       	IF CC JUMP 0xffa03b36 <_ARP_rx+0x1ca>;
ffa039de:	00 00       	NOP;
ffa039e0:	00 00       	NOP;
ffa039e2:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa039e4:	27 a6       	R7 = W[P4 + 0x10] (Z);
ffa039e6:	ff e3 d1 f3 	CALL 0xffa02188 <_htons>;
ffa039ea:	c0 42       	R0 = R0.L (Z);
ffa039ec:	07 08       	CC = R7 == R0;
ffa039ee:	cc 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa039f0:	67 a6       	R7 = W[P4 + 0x12] (Z);
ffa039f2:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa039f6:	ff e3 c9 f3 	CALL 0xffa02188 <_htons>;
ffa039fa:	c0 42       	R0 = R0.L (Z);
ffa039fc:	07 08       	CC = R7 == R0;
ffa039fe:	c4 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa03a00:	a0 a6       	R0 = W[P4 + 0x14] (Z);
ffa03a02:	21 e1 06 04 	R1 = 0x406 (X);		/*		R1=0x406(1030) */
ffa03a06:	08 08       	CC = R0 == R1;
ffa03a08:	bf 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa03a0a:	e7 a6       	R7 = W[P4 + 0x16] (Z);
ffa03a0c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03a0e:	ff e3 bd f3 	CALL 0xffa02188 <_htons>;
ffa03a12:	c0 42       	R0 = R0.L (Z);
ffa03a14:	07 08       	CC = R7 == R0;
ffa03a16:	b8 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa03a18:	47 e1 90 ff 	R7.H = 0xff90;		/* (-112)	R7=0xff90ffff(-7274497) */
ffa03a1c:	07 e1 ec 0e 	R7.L = 0xeec;		/* (3820)	R7=0xff900eec <_NetOurIP>(-7336212) */
ffa03a20:	17 32       	P2 = R7;
ffa03a22:	a1 a2       	R1 = [P4 + 0x28];
ffa03a24:	10 91       	R0 = [P2];
ffa03a26:	01 08       	CC = R1 == R0;
ffa03a28:	af 17       	IF !CC JUMP 0xffa03986 <_ARP_rx+0x1a> (BP);
ffa03a2a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ee0 <_NetOurMAC> */
ffa03a2e:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa03a32:	10 95       	R0 = W[P2] (Z);
ffa03a34:	10 32       	P2 = R0;
ffa03a36:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900f16 */
ffa03a3a:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa03a3e:	50 61       	R0 = 0x2a (X);		/*		R0=0x2a( 42) */
ffa03a40:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900000 <_l1_data_a> */
ffa03a44:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03a46:	52 91       	P2 = [P2];
ffa03a48:	0d e1 e0 0e 	P5.L = 0xee0;		/* (3808)	P5=0xff900ee0 <_NetOurMAC> */
ffa03a4c:	93 ad       	P3 = [P2 + 0x18];
ffa03a4e:	18 97       	W[P3] = R0;
ffa03a50:	a0 e5 08 00 	R0 = B[P4 + 0x8] (X);
ffa03a54:	98 e6 02 00 	B[P3 + 0x2] = R0;
ffa03a58:	a0 e5 09 00 	R0 = B[P4 + 0x9] (X);
ffa03a5c:	98 e6 03 00 	B[P3 + 0x3] = R0;
ffa03a60:	a0 e5 0a 00 	R0 = B[P4 + 0xa] (X);
ffa03a64:	98 e6 04 00 	B[P3 + 0x4] = R0;
ffa03a68:	a0 e5 0b 00 	R0 = B[P4 + 0xb] (X);
ffa03a6c:	98 e6 05 00 	B[P3 + 0x5] = R0;
ffa03a70:	a0 e5 0c 00 	R0 = B[P4 + 0xc] (X);
ffa03a74:	98 e6 06 00 	B[P3 + 0x6] = R0;
ffa03a78:	a0 e5 0d 00 	R0 = B[P4 + 0xd] (X);
ffa03a7c:	98 e6 07 00 	B[P3 + 0x7] = R0;
ffa03a80:	68 99       	R0 = B[P5] (X);
ffa03a82:	98 e6 08 00 	B[P3 + 0x8] = R0;
ffa03a86:	a8 e5 01 00 	R0 = B[P5 + 0x1] (X);
ffa03a8a:	98 e6 09 00 	B[P3 + 0x9] = R0;
ffa03a8e:	a8 e5 02 00 	R0 = B[P5 + 0x2] (X);
ffa03a92:	98 e6 0a 00 	B[P3 + 0xa] = R0;
ffa03a96:	a8 e5 03 00 	R0 = B[P5 + 0x3] (X);
ffa03a9a:	98 e6 0b 00 	B[P3 + 0xb] = R0;
ffa03a9e:	a8 e5 04 00 	R0 = B[P5 + 0x4] (X);
ffa03aa2:	98 e6 0c 00 	B[P3 + 0xc] = R0;
ffa03aa6:	a8 e5 05 00 	R0 = B[P5 + 0x5] (X);
ffa03aaa:	98 e6 0d 00 	B[P3 + 0xd] = R0;
ffa03aae:	20 e1 06 08 	R0 = 0x806 (X);		/*		R0=0x806(2054) */
ffa03ab2:	ff e3 6b f3 	CALL 0xffa02188 <_htons>;
ffa03ab6:	d8 b5       	W[P3 + 0xe] = R0;
ffa03ab8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03aba:	ff e3 67 f3 	CALL 0xffa02188 <_htons>;
ffa03abe:	18 b6       	W[P3 + 0x10] = R0;
ffa03ac0:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03ac4:	ff e3 62 f3 	CALL 0xffa02188 <_htons>;
ffa03ac8:	58 b6       	W[P3 + 0x12] = R0;
ffa03aca:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03acc:	98 e6 14 00 	B[P3 + 0x14] = R0;
ffa03ad0:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03ad2:	98 e6 15 00 	B[P3 + 0x15] = R0;
ffa03ad6:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa03ad8:	ff e3 58 f3 	CALL 0xffa02188 <_htons>;
ffa03adc:	44 32       	P0 = P4;
ffa03ade:	d8 b6       	W[P3 + 0x16] = R0;
ffa03ae0:	53 32       	P2 = P3;
ffa03ae2:	c0 6c       	P0 += 0x18;		/* ( 24) */
ffa03ae4:	31 68       	P1 = 0x6 (X);		/*		P1=0x6(  6) */
ffa03ae6:	b2 e0 08 10 	LSETUP(0xffa03aea <_ARP_rx+0x17e>, 0xffa03af6 <_ARP_rx+0x18a>) LC1 = P1;
ffa03aea:	68 98       	R0 = B[P5++] (X);
ffa03aec:	90 e6 18 00 	B[P2 + 0x18] = R0;
ffa03af0:	40 98       	R0 = B[P0++] (X);
ffa03af2:	90 e6 22 00 	B[P2 + 0x22] = R0;
ffa03af6:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03af8:	17 32       	P2 = R7;
ffa03afa:	11 91       	R1 = [P2];
ffa03afc:	82 c6 c1 81 	R0 = R1 >> 0x8;
ffa03b00:	98 e6 1f 00 	B[P3 + 0x1f] = R0;
ffa03b04:	99 e6 1e 00 	B[P3 + 0x1e] = R1;
ffa03b08:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa03b0c:	c1 4e       	R1 >>= 0x18;
ffa03b0e:	98 e6 20 00 	B[P3 + 0x20] = R0;
ffa03b12:	99 e6 21 00 	B[P3 + 0x21] = R1;
ffa03b16:	a3 e4 21 00 	R3 = B[P4 + 0x21] (Z);
ffa03b1a:	a1 e4 1f 00 	R1 = B[P4 + 0x1f] (Z);
ffa03b1e:	a2 e4 20 00 	R2 = B[P4 + 0x20] (Z);
ffa03b22:	f3 b0       	[SP + 0xc] = R3;
ffa03b24:	a0 e4 1e 00 	R0 = B[P4 + 0x1e] (Z);
ffa03b28:	ff e3 42 f2 	CALL 0xffa01fac <_FormatIPAddress>;
ffa03b2c:	98 b2       	[P3 + 0x28] = R0;
ffa03b2e:	ff e3 49 f4 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa03b32:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03b34:	2a 2f       	JUMP.S 0xffa03988 <_ARP_rx+0x1c>;
ffa03b36:	a1 e4 23 00 	R1 = B[P4 + 0x23] (Z);
ffa03b3a:	90 e4 01 00 	R0 = B[P2 + 0x1] (Z);
ffa03b3e:	01 08       	CC = R1 == R0;
ffa03b40:	51 17       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa03b42:	a1 e4 24 00 	R1 = B[P4 + 0x24] (Z);
ffa03b46:	90 e4 02 00 	R0 = B[P2 + 0x2] (Z);
ffa03b4a:	01 08       	CC = R1 == R0;
ffa03b4c:	4b 17       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa03b4e:	a1 e4 25 00 	R1 = B[P4 + 0x25] (Z);
ffa03b52:	90 e4 03 00 	R0 = B[P2 + 0x3] (Z);
ffa03b56:	01 08       	CC = R1 == R0;
ffa03b58:	45 17       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa03b5a:	a1 e4 26 00 	R1 = B[P4 + 0x26] (Z);
ffa03b5e:	90 e4 04 00 	R0 = B[P2 + 0x4] (Z);
ffa03b62:	01 08       	CC = R1 == R0;
ffa03b64:	3f 17       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa03b66:	a0 e4 27 00 	R0 = B[P4 + 0x27] (Z);
ffa03b6a:	91 e4 05 00 	R1 = B[P2 + 0x5] (Z);
ffa03b6e:	08 08       	CC = R0 == R1;
ffa03b70:	39 17       	IF !CC JUMP 0xffa039e2 <_ARP_rx+0x76> (BP);
ffa03b72:	f4 6c       	P4 += 0x1e;		/* ( 30) */
ffa03b74:	44 30       	R0 = P4;
ffa03b76:	ff e3 27 f3 	CALL 0xffa021c4 <_pack4chars>;
ffa03b7a:	38 30       	R7 = R0;
ffa03b7c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa03b80:	0f 30       	R1 = R7;
ffa03b82:	00 e1 00 05 	R0.L = 0x500;		/* (1280)	R0=0xff900500(-7338752) */
ffa03b86:	ff e3 cb ef 	CALL 0xffa01b1c <_printf_ip>;
ffa03b8a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900500(-7338752) */
ffa03b8e:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa03b92:	ff e3 bf ef 	CALL 0xffa01b10 <_printf_str>;
ffa03b96:	d4 6f       	P4 += -0x6;		/* ( -6) */
ffa03b98:	07 30       	R0 = R7;
ffa03b9a:	4c 30       	R1 = P4;
ffa03b9c:	ff e3 6a fe 	CALL 0xffa03870 <_ARP_lut_add>;
ffa03ba0:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03ba2:	f3 2e       	JUMP.S 0xffa03988 <_ARP_rx+0x1c>;

ffa03ba4 <_ARP_tx>:
ffa03ba4:	fc 05       	[--SP] = (R7:7, P5:4);
ffa03ba6:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa03baa:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03bae:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa03bb2:	38 30       	R7 = R0;
ffa03bb4:	10 95       	R0 = W[P2] (Z);
ffa03bb6:	10 32       	P2 = R0;
ffa03bb8:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900006 */
ffa03bbc:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa03bc0:	60 61       	R0 = 0x2c (X);		/*		R0=0x2c( 44) */
ffa03bc2:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900ee0 <_NetOurMAC> */
ffa03bc6:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03bc8:	52 91       	P2 = [P2];
ffa03bca:	0d e1 e0 0e 	P5.L = 0xee0;		/* (3808)	P5=0xff900ee0 <_NetOurMAC> */
ffa03bce:	94 ad       	P4 = [P2 + 0x18];
ffa03bd0:	20 97       	W[P4] = R0;
ffa03bd2:	f8 63       	R0 = -0x1 (X);		/*		R0=0xffffffff( -1) */
ffa03bd4:	a0 e6 02 00 	B[P4 + 0x2] = R0;
ffa03bd8:	a0 e6 03 00 	B[P4 + 0x3] = R0;
ffa03bdc:	a0 e6 04 00 	B[P4 + 0x4] = R0;
ffa03be0:	a0 e6 05 00 	B[P4 + 0x5] = R0;
ffa03be4:	a0 e6 06 00 	B[P4 + 0x6] = R0;
ffa03be8:	a0 e6 07 00 	B[P4 + 0x7] = R0;
ffa03bec:	68 99       	R0 = B[P5] (X);
ffa03bee:	a0 e6 08 00 	B[P4 + 0x8] = R0;
ffa03bf2:	a8 e5 01 00 	R0 = B[P5 + 0x1] (X);
ffa03bf6:	a0 e6 09 00 	B[P4 + 0x9] = R0;
ffa03bfa:	a8 e5 02 00 	R0 = B[P5 + 0x2] (X);
ffa03bfe:	a0 e6 0a 00 	B[P4 + 0xa] = R0;
ffa03c02:	a8 e5 03 00 	R0 = B[P5 + 0x3] (X);
ffa03c06:	a0 e6 0b 00 	B[P4 + 0xb] = R0;
ffa03c0a:	a8 e5 04 00 	R0 = B[P5 + 0x4] (X);
ffa03c0e:	a0 e6 0c 00 	B[P4 + 0xc] = R0;
ffa03c12:	a8 e5 05 00 	R0 = B[P5 + 0x5] (X);
ffa03c16:	a0 e6 0d 00 	B[P4 + 0xd] = R0;
ffa03c1a:	20 e1 06 08 	R0 = 0x806 (X);		/*		R0=0x806(2054) */
ffa03c1e:	ff e3 b5 f2 	CALL 0xffa02188 <_htons>;
ffa03c22:	e0 b5       	W[P4 + 0xe] = R0;
ffa03c24:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03c26:	ff e3 b1 f2 	CALL 0xffa02188 <_htons>;
ffa03c2a:	20 b6       	W[P4 + 0x10] = R0;
ffa03c2c:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa03c30:	ff e3 ac f2 	CALL 0xffa02188 <_htons>;
ffa03c34:	60 b6       	W[P4 + 0x12] = R0;
ffa03c36:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03c38:	a0 e6 14 00 	B[P4 + 0x14] = R0;
ffa03c3c:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa03c3e:	a0 e6 15 00 	B[P4 + 0x15] = R0;
ffa03c42:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03c44:	ff e3 a2 f2 	CALL 0xffa02188 <_htons>;
ffa03c48:	e0 b6       	W[P4 + 0x16] = R0;
ffa03c4a:	54 32       	P2 = P4;
ffa03c4c:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03c4e:	31 68       	P1 = 0x6 (X);		/*		P1=0x6(  6) */
ffa03c50:	b2 e0 07 10 	LSETUP(0xffa03c54 <_ARP_tx+0xb0>, 0xffa03c5e <_ARP_tx+0xba>) LC1 = P1;
ffa03c54:	68 98       	R0 = B[P5++] (X);
ffa03c56:	90 e6 18 00 	B[P2 + 0x18] = R0;
ffa03c5a:	91 e6 22 00 	B[P2 + 0x22] = R1;
ffa03c5e:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03c60:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa03c64:	0a e1 ec 0e 	P2.L = 0xeec;		/* (3820)	P2=0xff900eec <_NetOurIP> */
ffa03c68:	11 91       	R1 = [P2];
ffa03c6a:	82 ce c1 81 	R0 = R1 >> 0x8 || [P4 + 0x28] = R7 || NOP;
ffa03c6e:	a7 b2 00 00 
ffa03c72:	a0 e6 1f 00 	B[P4 + 0x1f] = R0;
ffa03c76:	a1 e6 1e 00 	B[P4 + 0x1e] = R1;
ffa03c7a:	82 c6 81 81 	R0 = R1 >> 0x10;
ffa03c7e:	c1 4e       	R1 >>= 0x18;
ffa03c80:	a0 e6 20 00 	B[P4 + 0x20] = R0;
ffa03c84:	a1 e6 21 00 	B[P4 + 0x21] = R1;
ffa03c88:	01 e8 00 00 	UNLINK;
ffa03c8c:	bc 05       	(R7:7, P5:4) = [SP++];
ffa03c8e:	ff e2 99 f3 	JUMP.L 0xffa023c0 <_bfin_EMAC_send_nocopy>;
	...

ffa03c94 <_ARP_req>:
ffa03c94:	f3 05       	[--SP] = (R7:6, P5:3);
ffa03c96:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900ee0 <_NetOurMAC> */
ffa03c9a:	0d e1 f8 0e 	P5.L = 0xef8;		/* (3832)	P5=0xff900ef8 <_NetArpLut> */
ffa03c9e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03ca2:	38 30       	R7 = R0;
ffa03ca4:	21 32       	P4 = R1;
ffa03ca6:	5d 32       	P3 = P5;
ffa03ca8:	4d 32       	P1 = P5;
ffa03caa:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa03cac:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03cae:	b2 e0 06 20 	LSETUP(0xffa03cb2 <_ARP_req+0x1e>, 0xffa03cba <_ARP_req+0x26>) LC1 = P2;
ffa03cb2:	08 91       	R0 = [P1];
ffa03cb4:	07 08       	CC = R7 == R0;
ffa03cb6:	56 18       	IF CC JUMP 0xffa03d62 <_ARP_req+0xce>;
ffa03cb8:	08 6c       	P0 += 0x1;		/* (  1) */
ffa03cba:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03cbc:	ff e3 76 e2 	CALL 0xffa001a8 <_ustimer>;
ffa03cc0:	41 e1 e3 38 	R1.H = 0x38e3;		/* (14563)	R1=0x38e30000(954400768) */
ffa03cc4:	01 e1 39 8e 	R1.L = 0x8e39;		/* (-29127)	R1=0x38e38e39(954437177) */
ffa03cc8:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa03ccc:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa03cd0:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa03cd4:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa03cd8:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa03cdc:	0b c4 3f 80 	A0 += A1;
ffa03ce0:	8b c0 00 38 	R0 = A0 (FU);
ffa03ce4:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900006 */
ffa03ce8:	82 c6 f8 8d 	R6 = R0 >> 0x1;
ffa03cec:	09 e1 f8 0e 	P1.L = 0xef8;		/* (3832)	P1=0xff900ef8 <_NetArpLut> */
ffa03cf0:	00 68       	P0 = 0x0 (X);		/*		P0=0x0(  0) */
ffa03cf2:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03cf4:	b2 e0 06 20 	LSETUP(0xffa03cf8 <_ARP_req+0x64>, 0xffa03d00 <_ARP_req+0x6c>) LC1 = P2;
ffa03cf8:	08 91       	R0 = [P1];
ffa03cfa:	38 08       	CC = R0 == R7;
ffa03cfc:	43 18       	IF CC JUMP 0xffa03d82 <_ARP_req+0xee>;
ffa03cfe:	08 6c       	P0 += 0x1;		/* (  1) */
ffa03d00:	a1 6c       	P1 += 0x14;		/* ( 20) */
ffa03d02:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa03d04:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03d06:	b2 e0 06 20 	LSETUP(0xffa03d0a <_ARP_req+0x76>, 0xffa03d12 <_ARP_req+0x7e>) LC1 = P2;
ffa03d0a:	28 91       	R0 = [P5];
ffa03d0c:	00 0c       	CC = R0 == 0x0;
ffa03d0e:	0f 18       	IF CC JUMP 0xffa03d2c <_ARP_req+0x98>;
ffa03d10:	09 6c       	P1 += 0x1;		/* (  1) */
ffa03d12:	a5 6c       	P5 += 0x14;		/* ( 20) */
ffa03d14:	48 e1 90 ff 	P0.H = 0xff90;		/* (-112)	P0=0xff900000 <_l1_data_a> */
ffa03d18:	5a a5       	R2 = W[P3 + 0xa] (Z);
ffa03d1a:	08 e1 16 0f 	P0.L = 0xf16;		/* (3862)	P0=0xff900f16 */
ffa03d1e:	01 68       	P1 = 0x0 (X);		/*		P1=0x0(  0) */
ffa03d20:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa03d22:	52 68       	P2 = 0xa (X);		/*		P2=0xa( 10) */
ffa03d24:	09 64       	R1 += 0x1;		/* (  1) */
ffa03d26:	fa 6f       	P2 += -0x1;		/* ( -1) */
ffa03d28:	42 0c       	CC = P2 == 0x0;
ffa03d2a:	4a 10       	IF !CC JUMP 0xffa03dbe <_ARP_req+0x12a>;
ffa03d2c:	89 5e       	P2 = P1 + (P1 << 0x2);
ffa03d2e:	93 5e       	P2 = P3 + (P2 << 0x2);
ffa03d30:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa03d32:	10 b1       	[P2 + 0x10] = R0;
ffa03d34:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03d38:	04 cc 30 00 	R0 = R6 + R0 (NS) || [P2] = R7 || NOP;
ffa03d3c:	17 93 00 00 
ffa03d40:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900000 <_l1_data_a> */
ffa03d44:	09 e1 f4 0e 	P1.L = 0xef4;		/* (3828)	P1=0xff900ef4 <_NetArpLut_age> */
ffa03d48:	d0 b0       	[P2 + 0xc] = R0;
ffa03d4a:	08 95       	R0 = W[P1] (Z);
ffa03d4c:	08 64       	R0 += 0x1;		/* (  1) */
ffa03d4e:	08 97       	W[P1] = R0;
ffa03d50:	50 b5       	W[P2 + 0xa] = R0;
ffa03d52:	07 30       	R0 = R7;
ffa03d54:	ff e3 28 ff 	CALL 0xffa03ba4 <_ARP_tx>;
ffa03d58:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03d5a:	01 e8 00 00 	UNLINK;
ffa03d5e:	b3 05       	(R7:6, P5:3) = [SP++];
ffa03d60:	10 00       	RTS;
ffa03d62:	08 a1       	R0 = [P1 + 0x10];
ffa03d64:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa03d66:	a9 1f       	IF CC JUMP 0xffa03cb8 <_ARP_req+0x24> (BP);
ffa03d68:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa03d6a:	0a 6c       	P2 += 0x1;		/* (  1) */
ffa03d6c:	53 5e       	P1 = P3 + (P2 << 0x2);
ffa03d6e:	32 68       	P2 = 0x6 (X);		/*		P2=0x6(  6) */
ffa03d70:	b2 e0 03 20 	LSETUP(0xffa03d74 <_ARP_req+0xe0>, 0xffa03d76 <_ARP_req+0xe2>) LC1 = P2;
ffa03d74:	48 98       	R0 = B[P1++] (X);
ffa03d76:	20 9a       	B[P4++] = R0;
ffa03d78:	01 e8 00 00 	UNLINK;
ffa03d7c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03d7e:	b3 05       	(R7:6, P5:3) = [SP++];
ffa03d80:	10 00       	RTS;
ffa03d82:	08 a1       	R0 = [P1 + 0x10];
ffa03d84:	08 48       	CC = !BITTST (R0, 0x1);		/* bit  1 */
ffa03d86:	bc 1f       	IF CC JUMP 0xffa03cfe <_ARP_req+0x6a> (BP);
ffa03d88:	80 5e       	P2 = P0 + (P0 << 0x2);
ffa03d8a:	53 5f       	P5 = P3 + (P2 << 0x2);
ffa03d8c:	e8 a0       	R0 = [P5 + 0xc];
ffa03d8e:	86 09       	CC = R6 < R0 (IU);
ffa03d90:	e4 1f       	IF CC JUMP 0xffa03d58 <_ARP_req+0xc4> (BP);
ffa03d92:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa03d96:	0f 30       	R1 = R7;
ffa03d98:	00 e1 24 05 	R0.L = 0x524;		/* (1316)	R0=0xff900524(-7338716) */
ffa03d9c:	ff e3 c0 ee 	CALL 0xffa01b1c <_printf_ip>;
ffa03da0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900524(-7338716) */
ffa03da4:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa03da8:	ff e3 b4 ee 	CALL 0xffa01b10 <_printf_str>;
ffa03dac:	07 30       	R0 = R7;
ffa03dae:	ff e3 fb fe 	CALL 0xffa03ba4 <_ARP_tx>;
ffa03db2:	20 e1 e8 03 	R0 = 0x3e8 (X);		/*		R0=0x3e8(1000) */
ffa03db6:	06 50       	R0 = R6 + R0;
ffa03db8:	e8 b0       	[P5 + 0xc] = R0;
ffa03dba:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03dbc:	cf 2f       	JUMP.S 0xffa03d5a <_ARP_req+0xc6>;
ffa03dbe:	00 95       	R0 = W[P0] (Z);
ffa03dc0:	90 08       	CC = R0 < R2;
ffa03dc2:	02 06       	IF !CC R0 = R2;
ffa03dc4:	89 07       	IF CC P1 = R1;
ffa03dc6:	a0 6c       	P0 += 0x14;		/* ( 20) */
ffa03dc8:	10 30       	R2 = R0;
ffa03dca:	ad 2f       	JUMP.S 0xffa03d24 <_ARP_req+0x90>;

ffa03dcc <_tcp_length>:
ffa03dcc:	c5 04       	[--SP] = (P5:5);
ffa03dce:	28 32       	P5 = R0;
ffa03dd0:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03dd4:	68 a6       	R0 = W[P5 + 0x12] (Z);
ffa03dd6:	ff e3 d9 f1 	CALL 0xffa02188 <_htons>;
ffa03dda:	a9 e4 10 00 	R1 = B[P5 + 0x10] (Z);
ffa03dde:	7a 60       	R2 = 0xf (X);		/*		R2=0xf( 15) */
ffa03de0:	51 54       	R1 = R1 & R2;
ffa03de2:	11 4f       	R1 <<= 0x2;
ffa03de4:	c0 42       	R0 = R0.L (Z);
ffa03de6:	08 52       	R0 = R0 - R1;
ffa03de8:	a9 e4 30 00 	R1 = B[P5 + 0x30] (Z);
ffa03dec:	11 4d       	R1 >>>= 0x2;
ffa03dee:	e2 61       	R2 = 0x3c (X);		/*		R2=0x3c( 60) */
ffa03df0:	51 54       	R1 = R1 & R2;
ffa03df2:	01 e8 00 00 	UNLINK;
ffa03df6:	08 52       	R0 = R0 - R1;
ffa03df8:	85 04       	(P5:5) = [SP++];
ffa03dfa:	10 00       	RTS;

ffa03dfc <_tcp_checksum_calc>:
ffa03dfc:	08 32       	P1 = R0;
ffa03dfe:	ed 05       	[--SP] = (R7:5, P5:5);
ffa03e00:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03e04:	28 32       	P5 = R0;
ffa03e06:	29 30       	R5 = R1;
ffa03e08:	e1 6c       	P1 += 0x1c;		/* ( 28) */
ffa03e0a:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa03e0c:	22 68       	P2 = 0x4 (X);		/*		P2=0x4(  4) */
ffa03e0e:	b2 e0 03 20 	LSETUP(0xffa03e12 <_tcp_checksum_calc+0x16>, 0xffa03e14 <_tcp_checksum_calc+0x18>) LC1 = P2;
ffa03e12:	08 94       	R0 = W[P1++] (Z);
ffa03e14:	86 51       	R6 = R6 + R0;
ffa03e16:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03e1a:	10 4e       	R0 >>= 0x2;
ffa03e1c:	05 50       	R0 = R5 + R0;
ffa03e1e:	af e4 19 00 	R7 = B[P5 + 0x19] (Z);
ffa03e22:	c0 42       	R0 = R0.L (Z);
ffa03e24:	ff e3 b2 f1 	CALL 0xffa02188 <_htons>;
ffa03e28:	47 4f       	R7 <<= 0x8;
ffa03e2a:	fe 51       	R7 = R6 + R7;
ffa03e2c:	c0 42       	R0 = R0.L (Z);
ffa03e2e:	87 50       	R2 = R7 + R0;
ffa03e30:	05 48       	CC = !BITTST (R5, 0x0);		/* bit  0 */
ffa03e32:	0d 1c       	IF CC JUMP 0xffa03e4c <_tcp_checksum_calc+0x50> (BP);
ffa03e34:	0d 32       	P1 = R5;
ffa03e36:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03e3a:	25 6d       	P5 += 0x24;		/* ( 36) */
ffa03e3c:	10 4e       	R0 >>= 0x2;
ffa03e3e:	0d 64       	R5 += 0x1;		/* (  1) */
ffa03e40:	8d 5a       	P2 = P5 + P1;
ffa03e42:	08 32       	P1 = R0;
ffa03e44:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03e46:	e5 6e       	P5 += -0x24;		/* (-36) */
ffa03e48:	8a 5a       	P2 = P2 + P1;
ffa03e4a:	10 9b       	B[P2] = R0;
ffa03e4c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03e4e:	68 e6 1a 00 	W[P5 + 0x34] = R0;
ffa03e52:	82 c6 0d 83 	R1 = R5 >> 0x1f;
ffa03e56:	69 50       	R1 = R1 + R5;
ffa03e58:	a8 e4 30 00 	R0 = B[P5 + 0x30] (Z);
ffa03e5c:	09 4d       	R1 >>>= 0x1;
ffa03e5e:	18 4e       	R0 >>= 0x3;
ffa03e60:	01 50       	R0 = R1 + R0;
ffa03e62:	00 0d       	CC = R0 <= 0x0;
ffa03e64:	08 18       	IF CC JUMP 0xffa03e74 <_tcp_checksum_calc+0x78>;
ffa03e66:	55 32       	P2 = P5;
ffa03e68:	22 6d       	P2 += 0x24;		/* ( 36) */
ffa03e6a:	08 32       	P1 = R0;
ffa03e6c:	b2 e0 03 10 	LSETUP(0xffa03e70 <_tcp_checksum_calc+0x74>, 0xffa03e72 <_tcp_checksum_calc+0x76>) LC1 = P1;
ffa03e70:	10 94       	R0 = W[P2++] (Z);
ffa03e72:	82 50       	R2 = R2 + R0;
ffa03e74:	d1 42       	R1 = R2.L (Z);
ffa03e76:	82 c6 82 81 	R0 = R2 >> 0x10;
ffa03e7a:	08 50       	R0 = R0 + R1;
ffa03e7c:	01 e8 00 00 	UNLINK;
ffa03e80:	c0 43       	R0 =~ R0;
ffa03e82:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03e84:	10 00       	RTS;
	...

ffa03e88 <_tcp_checksum_set>:
ffa03e88:	c5 04       	[--SP] = (P5:5);
ffa03e8a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900004 */
ffa03e8e:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03e92:	08 30       	R1 = R0;
ffa03e94:	0a e1 b8 0e 	P2.L = 0xeb8;		/* (3768)	P2=0xff900eb8 <_txIdx> */
ffa03e98:	10 95       	R0 = W[P2] (Z);
ffa03e9a:	10 32       	P2 = R0;
ffa03e9c:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ef4 <_NetArpLut_age> */
ffa03ea0:	09 e1 bc 0e 	P1.L = 0xebc;		/* (3772)	P1=0xff900ebc <_txbuf> */
ffa03ea4:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa03ea6:	52 91       	P2 = [P2];
ffa03ea8:	95 ad       	P5 = [P2 + 0x18];
ffa03eaa:	45 30       	R0 = P5;
ffa03eac:	ff e3 a8 ff 	CALL 0xffa03dfc <_tcp_checksum_calc>;
ffa03eb0:	68 e6 1a 00 	W[P5 + 0x34] = R0;
ffa03eb4:	01 e8 00 00 	UNLINK;
ffa03eb8:	85 04       	(P5:5) = [SP++];
ffa03eba:	10 00       	RTS;

ffa03ebc <_tcp_checksum_check>:
ffa03ebc:	10 32       	P2 = R0;
ffa03ebe:	78 05       	[--SP] = (R7:7);
ffa03ec0:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa03ec4:	57 e4 1a 00 	R7 = W[P2 + 0x34] (Z);
ffa03ec8:	ff e3 9a ff 	CALL 0xffa03dfc <_tcp_checksum_calc>;
ffa03ecc:	0f 30       	R1 = R7;
ffa03ece:	c7 42       	R7 = R0.L (Z);
ffa03ed0:	39 08       	CC = R1 == R7;
ffa03ed2:	19 18       	IF CC JUMP 0xffa03f04 <_tcp_checksum_check+0x48>;
ffa03ed4:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa03ed8:	00 e1 44 05 	R0.L = 0x544;		/* (1348)	R0=0xff900544(-7338684) */
ffa03edc:	ff e3 16 ed 	CALL 0xffa01908 <_printf_hex>;
ffa03ee0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900544(-7338684) */
ffa03ee4:	0f 30       	R1 = R7;
ffa03ee6:	00 e1 60 05 	R0.L = 0x560;		/* (1376)	R0=0xff900560(-7338656) */
ffa03eea:	ff e3 0f ed 	CALL 0xffa01908 <_printf_hex>;
ffa03eee:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900560(-7338656) */
ffa03ef2:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa03ef6:	ff e3 0d ee 	CALL 0xffa01b10 <_printf_str>;
ffa03efa:	01 e8 00 00 	UNLINK;
ffa03efe:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03f00:	38 05       	(R7:7) = [SP++];
ffa03f02:	10 00       	RTS;
ffa03f04:	01 e8 00 00 	UNLINK;
ffa03f08:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa03f0a:	38 05       	(R7:7) = [SP++];
ffa03f0c:	10 00       	RTS;
	...

ffa03f10 <_tcp_packet_setup>:
ffa03f10:	ed 05       	[--SP] = (R7:5, P5:5);
ffa03f12:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa03f16:	29 32       	P5 = R1;
ffa03f18:	c0 65       	R0 += 0x38;		/* ( 56) */
ffa03f1a:	7f 30       	R7 = FP;
ffa03f1c:	f0 bb       	[FP -0x4] = R0;
ffa03f1e:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa03f20:	2a 30       	R5 = R2;
ffa03f22:	be e5 24 00 	R6 = B[FP + 0x24] (X);
ffa03f26:	07 30       	R0 = R7;
ffa03f28:	ff e3 2c f6 	CALL 0xffa02b80 <_eth_header_setup>;
ffa03f2c:	08 30       	R1 = R0;
ffa03f2e:	68 99       	R0 = B[P5] (X);
ffa03f30:	80 0c       	CC = R0 < 0x0;
ffa03f32:	14 18       	IF CC JUMP 0xffa03f5a <_tcp_packet_setup+0x4a>;
ffa03f34:	30 60       	R0 = 0x6 (X);		/*		R0=0x6(  6) */
ffa03f36:	f0 b0       	[SP + 0xc] = R0;
ffa03f38:	01 30       	R0 = R1;
ffa03f3a:	0f 30       	R1 = R7;
ffa03f3c:	15 30       	R2 = R5;
ffa03f3e:	ff e3 57 f1 	CALL 0xffa021ec <_ip_header_setup>;
ffa03f42:	b9 a2       	R1 = [FP + 0x28];
ffa03f44:	f1 b0       	[SP + 0xc] = R1;
ffa03f46:	f9 a2       	R1 = [FP + 0x2c];
ffa03f48:	31 b1       	[SP + 0x10] = R1;
ffa03f4a:	72 43       	R2 = R6.B (Z);
ffa03f4c:	0f 30       	R1 = R7;
ffa03f4e:	ff e3 f5 f1 	CALL 0xffa02338 <_tcp_header_setup>;
ffa03f52:	01 e8 00 00 	UNLINK;
ffa03f56:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03f58:	10 00       	RTS;
ffa03f5a:	01 e8 00 00 	UNLINK;
ffa03f5e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa03f60:	ad 05       	(R7:5, P5:5) = [SP++];
ffa03f62:	10 00       	RTS;

ffa03f64 <_tcp_burst>:
ffa03f64:	e3 05       	[--SP] = (R7:4, P5:3);
ffa03f66:	00 e8 08 00 	LINK 0x20;		/* (32) */
ffa03f6a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb8 <_txIdx> */
ffa03f6e:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ebc <_txbuf> */
ffa03f72:	78 b2       	[FP + 0x24] = R0;
ffa03f74:	31 30       	R6 = R1;
ffa03f76:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa03f7a:	09 e1 e0 0f 	P1.L = 0xfe0;		/* (4064)	P1=0xff900fe0 <_g_httpHeaderLen> */
ffa03f7e:	11 91       	R1 = [P2];
ffa03f80:	08 91       	R0 = [P1];
ffa03f82:	01 50       	R0 = R1 + R0;
ffa03f84:	e0 bb       	[FP -0x8] = R0;
ffa03f86:	78 a2       	R0 = [FP + 0x24];
ffa03f88:	00 0d       	CC = R0 <= 0x0;
ffa03f8a:	80 18       	IF CC JUMP 0xffa0408a <_tcp_burst+0x126>;
ffa03f8c:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900c68 <_g_samples> */
ffa03f90:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa03f92:	0b e1 c4 0f 	P3.L = 0xfc4;		/* (4036)	P3=0xff900fc4 <_TcpSeqHost> */
ffa03f96:	85 68       	P5 = 0x10 (X);		/*		P5=0x10( 16) */
ffa03f98:	e0 b9       	R0 = [FP -0x8];
ffa03f9a:	30 0a       	CC = R0 <= R6 (IU);
ffa03f9c:	66 18       	IF CC JUMP 0xffa04068 <_tcp_burst+0x104>;
ffa03f9e:	30 52       	R0 = R0 - R6;
ffa03fa0:	21 e1 00 04 	R1 = 0x400 (X);		/*		R1=0x400(1024) */
ffa03fa4:	08 09       	CC = R0 <= R1;
ffa03fa6:	07 c4 01 4a 	R5 = MIN (R0, R1);
ffa03faa:	04 02       	R4 = CC;
ffa03fac:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900fe0 <_g_httpHeaderLen> */
ffa03fb0:	09 e1 cc 0f 	P1.L = 0xfcc;		/* (4044)	P1=0xff900fcc <_TcpSeqHttpStart> */
ffa03fb4:	08 91       	R0 = [P1];
ffa03fb6:	0c 02       	CC = R4;
ffa03fb8:	06 50       	R0 = R6 + R0;
ffa03fba:	c1 60       	R1 = 0x18 (X);		/*		R1=0x18( 24) */
ffa03fbc:	18 93       	[P3] = R0;
ffa03fbe:	4d 06       	IF !CC R1 = P5;
ffa03fc0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe4 <_g_httpContentLen> */
ffa03fc4:	f1 b0       	[SP + 0xc] = R1;
ffa03fc6:	30 b1       	[SP + 0x10] = R0;
ffa03fc8:	0a e1 c8 0f 	P2.L = 0xfc8;		/* (4040)	P2=0xff900fc8 <_TcpSeqClient> */
ffa03fcc:	10 91       	R0 = [P2];
ffa03fce:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900fcc <_TcpSeqHttpStart> */
ffa03fd2:	70 b1       	[SP + 0x14] = R0;
ffa03fd4:	09 e1 b0 0e 	P1.L = 0xeb0;		/* (3760)	P1=0xff900eb0 <_NetDestIP> */
ffa03fd8:	4f 30       	R1 = FP;
ffa03fda:	82 ce 05 c0 	R0 = ROT R5 BY 0x0 || R2 = [P1] || NOP;
ffa03fde:	0a 91 00 00 
ffa03fe2:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa03fe4:	ff e3 96 ff 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa03fe8:	38 30       	R7 = R0;
ffa03fea:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa03fee:	00 0d       	CC = R0 <= 0x0;
ffa03ff0:	de 1f       	IF CC JUMP 0xffa03fac <_tcp_burst+0x48> (BP);
ffa03ff2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc8 <_TcpSeqClient> */
ffa03ff6:	0a e1 e0 0f 	P2.L = 0xfe0;		/* (4064)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa03ffa:	10 91       	R0 = [P2];
ffa03ffc:	30 0a       	CC = R0 <= R6 (IU);
ffa03ffe:	3a 10       	IF !CC JUMP 0xffa04072 <_tcp_burst+0x10e>;
ffa04000:	04 60       	R4 = 0x0 (X);		/*		R4=0x0(  0) */
ffa04002:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900eb0 <_NetDestIP> */
ffa04006:	09 e1 e0 0f 	P1.L = 0xfe0;		/* (4064)	P1=0xff900fe0 <_g_httpHeaderLen> */
ffa0400a:	08 91       	R0 = [P1];
ffa0400c:	06 52       	R0 = R6 - R0;
ffa0400e:	21 e1 00 41 	R1 = 0x4100 (X);		/*		R1=0x4100(16640) */
ffa04012:	08 50       	R0 = R0 + R1;
ffa04014:	0f 30       	R1 = R7;
ffa04016:	15 30       	R2 = R5;
ffa04018:	ff e3 ca ed 	CALL 0xffa01bac <_memcpy_>;
ffa0401c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa04020:	0a e1 cc 0f 	P2.L = 0xfcc;		/* (4044)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa04024:	10 91       	R0 = [P2];
ffa04026:	ae 51       	R6 = R6 + R5;
ffa04028:	06 50       	R0 = R6 + R0;
ffa0402a:	18 93       	[P3] = R0;
ffa0402c:	2c 50       	R0 = R4 + R5;
ffa0402e:	ff e3 2d ff 	CALL 0xffa03e88 <_tcp_checksum_set>;
ffa04032:	ff e3 c7 f1 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa04036:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900fe0 <_g_httpHeaderLen> */
ffa0403a:	09 e1 cc 0e 	P1.L = 0xecc;		/* (3788)	P1=0xff900ecc <_rxIdx> */
ffa0403e:	08 95       	R0 = W[P1] (Z);
ffa04040:	10 32       	P2 = R0;
ffa04042:	49 e1 90 ff 	P1.H = 0xff90;		/* (-112)	P1=0xff900ecc <_rxIdx> */
ffa04046:	09 e1 d0 0e 	P1.L = 0xed0;		/* (3792)	P1=0xff900ed0 <_rxbuf> */
ffa0404a:	0c 6c       	P4 += 0x1;		/* (  1) */
ffa0404c:	91 5e       	P2 = P1 + (P2 << 0x2);
ffa0404e:	52 91       	P2 = [P2];
ffa04050:	90 a2       	R0 = [P2 + 0x28];
ffa04052:	60 48       	CC = !BITTST (R0, 0xc);		/* bit 12 */
ffa04054:	07 1c       	IF CC JUMP 0xffa04062 <_tcp_burst+0xfe> (BP);
ffa04056:	90 a2       	R0 = [P2 + 0x28];
ffa04058:	68 48       	CC = !BITTST (R0, 0xd);		/* bit 13 */
ffa0405a:	4c 30       	R1 = P4;
ffa0405c:	7a a2       	R2 = [FP + 0x24];
ffa0405e:	11 50       	R0 = R1 + R2;
ffa04060:	a0 06       	IF !CC P4 = R0;
ffa04062:	79 ae       	P1 = [FP + 0x24];
ffa04064:	61 09       	CC = P1 <= P4;
ffa04066:	99 17       	IF !CC JUMP 0xffa03f98 <_tcp_burst+0x34> (BP);
ffa04068:	44 30       	R0 = P4;
ffa0406a:	01 e8 00 00 	UNLINK;
ffa0406e:	a3 05       	(R7:4, P5:3) = [SP++];
ffa04070:	10 00       	RTS;
ffa04072:	30 53       	R4 = R0 - R6;
ffa04074:	20 e1 00 40 	R0 = 0x4000 (X);		/*		R0=0x4000(16384) */
ffa04078:	06 50       	R0 = R6 + R0;
ffa0407a:	0f 30       	R1 = R7;
ffa0407c:	14 30       	R2 = R4;
ffa0407e:	ff e3 97 ed 	CALL 0xffa01bac <_memcpy_>;
ffa04082:	e7 51       	R7 = R7 + R4;
ffa04084:	65 53       	R5 = R5 - R4;
ffa04086:	a6 51       	R6 = R6 + R4;
ffa04088:	bd 2f       	JUMP.S 0xffa04002 <_tcp_burst+0x9e>;
ffa0408a:	04 68       	P4 = 0x0 (X);		/*		P4=0x0(  0) */
ffa0408c:	44 30       	R0 = P4;
ffa0408e:	01 e8 00 00 	UNLINK;
ffa04092:	a3 05       	(R7:4, P5:3) = [SP++];
ffa04094:	10 00       	RTS;
	...

ffa04098 <_tcp_rx>:
ffa04098:	e3 05       	[--SP] = (R7:4, P5:3);
ffa0409a:	20 32       	P4 = R0;
ffa0409c:	00 e8 07 00 	LINK 0x1c;		/* (28) */
ffa040a0:	20 e1 00 08 	R0 = 0x800 (X);		/*		R0=0x800(2048) */
ffa040a4:	e7 a5       	R7 = W[P4 + 0xe] (Z);
ffa040a6:	ff e3 71 f0 	CALL 0xffa02188 <_htons>;
ffa040aa:	c0 42       	R0 = R0.L (Z);
ffa040ac:	07 08       	CC = R7 == R0;
ffa040ae:	06 18       	IF CC JUMP 0xffa040ba <_tcp_rx+0x22>;
ffa040b0:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa040b2:	01 e8 00 00 	UNLINK;
ffa040b6:	a3 05       	(R7:4, P5:3) = [SP++];
ffa040b8:	10 00       	RTS;
ffa040ba:	a0 e4 19 00 	R0 = B[P4 + 0x19] (Z);
ffa040be:	31 60       	R1 = 0x6 (X);		/*		R1=0x6(  6) */
ffa040c0:	08 08       	CC = R0 == R1;
ffa040c2:	f7 17       	IF !CC JUMP 0xffa040b0 <_tcp_rx+0x18> (BP);
ffa040c4:	67 e4 13 00 	R7 = W[P4 + 0x26] (Z);
ffa040c8:	20 e1 50 00 	R0 = 0x50 (X);		/*		R0=0x50( 80) */
ffa040cc:	ff e3 5e f0 	CALL 0xffa02188 <_htons>;
ffa040d0:	c0 42       	R0 = R0.L (Z);
ffa040d2:	07 08       	CC = R7 == R0;
ffa040d4:	ee 17       	IF !CC JUMP 0xffa040b0 <_tcp_rx+0x18> (BP);
ffa040d6:	44 30       	R0 = P4;
ffa040d8:	80 64       	R0 += 0x10;		/* ( 16) */
ffa040da:	ff e3 d5 f0 	CALL 0xffa02284 <_ip_header_checksum>;
ffa040de:	40 43       	R0 = R0.B (Z);
ffa040e0:	00 0c       	CC = R0 == 0x0;
ffa040e2:	e7 1f       	IF CC JUMP 0xffa040b0 <_tcp_rx+0x18> (BP);
ffa040e4:	4c 30       	R1 = P4;
ffa040e6:	41 64       	R1 += 0x8;		/* (  8) */
ffa040e8:	e0 a1       	R0 = [P4 + 0x1c];
ffa040ea:	ff e3 c3 fb 	CALL 0xffa03870 <_ARP_lut_add>;
ffa040ee:	44 30       	R0 = P4;
ffa040f0:	ff e3 6e fe 	CALL 0xffa03dcc <_tcp_length>;
ffa040f4:	30 30       	R6 = R0;
ffa040f6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900050(-7339952) */
ffa040fa:	0e 30       	R1 = R6;
ffa040fc:	00 e1 70 05 	R0.L = 0x570;		/* (1392)	R0=0xff900570(-7338640) */
ffa04100:	ff e3 60 ec 	CALL 0xffa019c0 <_printf_int>;
ffa04104:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900570(-7338640) */
ffa04108:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa0410c:	ff e3 02 ed 	CALL 0xffa01b10 <_printf_str>;
ffa04110:	44 30       	R0 = P4;
ffa04112:	0e 30       	R1 = R6;
ffa04114:	ff e3 d4 fe 	CALL 0xffa03ebc <_tcp_checksum_check>;
ffa04118:	40 43       	R0 = R0.B (Z);
ffa0411a:	00 0c       	CC = R0 == 0x0;
ffa0411c:	ca 1b       	IF CC JUMP 0xffa040b0 <_tcp_rx+0x18>;
ffa0411e:	00 00       	NOP;
ffa04120:	00 00       	NOP;
ffa04122:	22 60       	R2 = 0x4 (X);		/*		R2=0x4(  4) */
ffa04124:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa04128:	10 08       	CC = R0 == R2;
ffa0412a:	3c 19       	IF CC JUMP 0xffa043a2 <_tcp_rx+0x30a>;
ffa0412c:	10 0c       	CC = R0 == 0x2;
ffa0412e:	f8 18       	IF CC JUMP 0xffa0431e <_tcp_rx+0x286>;
ffa04130:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa04132:	08 08       	CC = R0 == R1;
ffa04134:	80 18       	IF CC JUMP 0xffa04234 <_tcp_rx+0x19c>;
ffa04136:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa04138:	a6 10       	IF !CC JUMP 0xffa04284 <_tcp_rx+0x1ec>;
ffa0413a:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900010 */
ffa0413e:	0d e1 d0 0f 	P5.L = 0xfd0;		/* (4048)	P5=0xff900fd0 <_TcpState> */
ffa04142:	20 48       	CC = !BITTST (R0, 0x4);		/* bit  4 */
ffa04144:	38 10       	IF !CC JUMP 0xffa041b4 <_tcp_rx+0x11c>;
ffa04146:	28 91       	R0 = [P5];
ffa04148:	10 0c       	CC = R0 == 0x2;
ffa0414a:	b3 17       	IF !CC JUMP 0xffa040b0 <_tcp_rx+0x18> (BP);
ffa0414c:	a4 e5 30 00 	R4 = B[P4 + 0x30] (X);
ffa04150:	a0 a2       	R0 = [P4 + 0x28];
ffa04152:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff900ed0 <_rxbuf>(-7336240) */
ffa04156:	ff e3 23 f0 	CALL 0xffa0219c <_htonl>;
ffa0415a:	05 e1 b0 0e 	R5.L = 0xeb0;		/* (3760)	R5=0xff900eb0 <_NetDestIP>(-7336272) */
ffa0415e:	15 32       	P2 = R5;
ffa04160:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900fc4 <_TcpSeqHost> */
ffa04164:	30 50       	R0 = R0 + R6;
ffa04166:	0b e1 c8 0f 	P3.L = 0xfc8;		/* (4040)	P3=0xff900fc8 <_TcpSeqClient> */
ffa0416a:	18 93       	[P3] = R0;
ffa0416c:	e0 a1       	R0 = [P4 + 0x1c];
ffa0416e:	10 93       	[P2] = R0;
ffa04170:	e0 a2       	R0 = [P4 + 0x2c];
ffa04172:	ff e3 15 f0 	CALL 0xffa0219c <_htonl>;
ffa04176:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa0417a:	0a e1 cc 0f 	P2.L = 0xfcc;		/* (4044)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa0417e:	11 91       	R1 = [P2];
ffa04180:	c8 53       	R7 = R0 - R1;
ffa04182:	a1 e4 31 00 	R1 = B[P4 + 0x31] (Z);
ffa04186:	21 48       	CC = !BITTST (R1, 0x4);		/* bit  4 */
ffa04188:	28 1d       	IF CC JUMP 0xffa043d8 <_tcp_rx+0x340> (BP);
ffa0418a:	06 0c       	CC = R6 == 0x0;
ffa0418c:	26 15       	IF !CC JUMP 0xffa043d8 <_tcp_rx+0x340> (BP);
ffa0418e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa04192:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa04196:	10 91       	R0 = [P2];
ffa04198:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe4 <_g_httpContentLen> */
ffa0419c:	0a e1 e0 0f 	P2.L = 0xfe0;		/* (4064)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa041a0:	11 91       	R1 = [P2];
ffa041a2:	08 50       	R0 = R0 + R1;
ffa041a4:	38 08       	CC = R0 == R7;
ffa041a6:	ba 1c       	IF CC JUMP 0xffa0431a <_tcp_rx+0x282> (BP);
ffa041a8:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa041aa:	0f 30       	R1 = R7;
ffa041ac:	ff e3 dc fe 	CALL 0xffa03f64 <_tcp_burst>;
ffa041b0:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa041b2:	80 2f       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa041b4:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa041b6:	28 91       	R0 = [P5];
ffa041b8:	08 08       	CC = R0 == R1;
ffa041ba:	5d 19       	IF CC JUMP 0xffa04474 <_tcp_rx+0x3dc>;
ffa041bc:	00 0c       	CC = R0 == 0x0;
ffa041be:	c4 17       	IF !CC JUMP 0xffa04146 <_tcp_rx+0xae> (BP);
ffa041c0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa041c4:	00 e1 ec 05 	R0.L = 0x5ec;		/* (1516)	R0=0xff9005ec(-7338516) */
ffa041c8:	ff e3 a4 ec 	CALL 0xffa01b10 <_printf_str>;
ffa041cc:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa041d0:	0a e1 e8 0f 	P2.L = 0xfe8;		/* (4072)	P2=0xff900fe8 <_g_httpRxed> */
ffa041d4:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa041d6:	17 93       	[P2] = R7;
ffa041d8:	a0 a2       	R0 = [P4 + 0x28];
ffa041da:	ff e3 e1 ef 	CALL 0xffa0219c <_htonl>;
ffa041de:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe8 <_g_httpRxed> */
ffa041e2:	0a e1 c8 0f 	P2.L = 0xfc8;		/* (4040)	P2=0xff900fc8 <_TcpSeqClient> */
ffa041e6:	10 93       	[P2] = R0;
ffa041e8:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc8 <_TcpSeqClient> */
ffa041ec:	e2 a1       	R2 = [P4 + 0x1c];
ffa041ee:	0a e1 b0 0e 	P2.L = 0xeb0;		/* (3760)	P2=0xff900eb0 <_NetDestIP> */
ffa041f2:	12 93       	[P2] = R2;
ffa041f4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb0 <_NetDestIP> */
ffa041f8:	61 e5 12 00 	R1 = W[P4 + 0x24] (X);
ffa041fc:	0a e1 dc 0f 	P2.L = 0xfdc;		/* (4060)	P2=0xff900fdc <_TcpClientPort> */
ffa04200:	11 97       	W[P2] = R1;
ffa04202:	21 60       	R1 = 0x4 (X);		/*		R1=0x4(  4) */
ffa04204:	f1 b0       	[SP + 0xc] = R1;
ffa04206:	30 b1       	[SP + 0x10] = R0;
ffa04208:	4f 30       	R1 = FP;
ffa0420a:	77 b1       	[SP + 0x14] = R7;
ffa0420c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0420e:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa04210:	ff e3 80 fe 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa04214:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa04218:	00 0d       	CC = R0 <= 0x0;
ffa0421a:	96 1f       	IF CC JUMP 0xffa04146 <_tcp_rx+0xae> (BP);
ffa0421c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fdc <_TcpClientPort> */
ffa04220:	0a e1 d0 0f 	P2.L = 0xfd0;		/* (4048)	P2=0xff900fd0 <_TcpState> */
ffa04224:	17 93       	[P2] = R7;
ffa04226:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04228:	ff e3 30 fe 	CALL 0xffa03e88 <_tcp_checksum_set>;
ffa0422c:	ff e3 ca f0 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa04230:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04232:	40 2f       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa04234:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900fd0 <_TcpState> */
ffa04238:	0d e1 d0 0f 	P5.L = 0xfd0;		/* (4048)	P5=0xff900fd0 <_TcpState> */
ffa0423c:	28 91       	R0 = [P5];
ffa0423e:	08 0c       	CC = R0 == 0x1;
ffa04240:	ba 17       	IF !CC JUMP 0xffa041b4 <_tcp_rx+0x11c> (BP);
ffa04242:	e0 a2       	R0 = [P4 + 0x2c];
ffa04244:	ff e3 ac ef 	CALL 0xffa0219c <_htonl>;
ffa04248:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fd0 <_TcpState> */
ffa0424c:	0a e1 c4 0f 	P2.L = 0xfc4;		/* (4036)	P2=0xff900fc4 <_TcpSeqHost> */
ffa04250:	11 91       	R1 = [P2];
ffa04252:	08 08       	CC = R0 == R1;
ffa04254:	33 19       	IF CC JUMP 0xffa044ba <_tcp_rx+0x422>;
ffa04256:	00 00       	NOP;
ffa04258:	00 00       	NOP;
ffa0425a:	00 00       	NOP;
ffa0425c:	e0 a2       	R0 = [P4 + 0x2c];
ffa0425e:	ff e3 9f ef 	CALL 0xffa0219c <_htonl>;
ffa04262:	08 30       	R1 = R0;
ffa04264:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04268:	00 e1 9c 05 	R0.L = 0x59c;		/* (1436)	R0=0xff90059c(-7338596) */
ffa0426c:	ff e3 58 ec 	CALL 0xffa01b1c <_printf_ip>;
ffa04270:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04272:	28 93       	[P5] = R0;
ffa04274:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04278:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa0427c:	ff e3 4a ec 	CALL 0xffa01b10 <_printf_str>;
ffa04280:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04282:	18 2f       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa04284:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04288:	00 e1 c8 05 	R0.L = 0x5c8;		/* (1480)	R0=0xff9005c8(-7338552) */
ffa0428c:	ff e3 42 ec 	CALL 0xffa01b10 <_printf_str>;
ffa04290:	a0 a2       	R0 = [P4 + 0x28];
ffa04292:	45 e1 90 ff 	R5.H = 0xff90;		/* (-112)	R5=0xff900eb0 <_NetDestIP>(-7336272) */
ffa04296:	ff e3 83 ef 	CALL 0xffa0219c <_htonl>;
ffa0429a:	05 e1 b0 0e 	R5.L = 0xeb0;		/* (3760)	R5=0xff900eb0 <_NetDestIP>(-7336272) */
ffa0429e:	15 32       	P2 = R5;
ffa042a0:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900fd0 <_TcpState> */
ffa042a4:	82 ce 00 c2 	R1 = ROT R0 BY 0x0 || R2 = [P4 + 0x1c] || NOP;
ffa042a8:	e2 a1 00 00 
ffa042ac:	4b e1 90 ff 	P3.H = 0xff90;		/* (-112)	P3=0xff900fc8 <_TcpSeqClient> */
ffa042b0:	0d e1 d0 0f 	P5.L = 0xfd0;		/* (4048)	P5=0xff900fd0 <_TcpState> */
ffa042b4:	09 64       	R1 += 0x1;		/* (  1) */
ffa042b6:	0b e1 c8 0f 	P3.L = 0xfc8;		/* (4040)	P3=0xff900fc8 <_TcpSeqClient> */
ffa042ba:	28 91       	R0 = [P5];
ffa042bc:	12 93       	[P2] = R2;
ffa042be:	19 93       	[P3] = R1;
ffa042c0:	10 0c       	CC = R0 == 0x2;
ffa042c2:	03 18       	IF CC JUMP 0xffa042c8 <_tcp_rx+0x230>;
ffa042c4:	00 0c       	CC = R0 == 0x0;
ffa042c6:	13 14       	IF !CC JUMP 0xffa042ec <_tcp_rx+0x254> (BP);
ffa042c8:	88 60       	R0 = 0x11 (X);		/*		R0=0x11( 17) */
ffa042ca:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc4 <_TcpSeqHost> */
ffa042ce:	f0 b0       	[SP + 0xc] = R0;
ffa042d0:	0a e1 c4 0f 	P2.L = 0xfc4;		/* (4036)	P2=0xff900fc4 <_TcpSeqHost> */
ffa042d4:	10 91       	R0 = [P2];
ffa042d6:	71 b1       	[SP + 0x14] = R1;
ffa042d8:	30 b1       	[SP + 0x10] = R0;
ffa042da:	4f 30       	R1 = FP;
ffa042dc:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa042de:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa042e0:	ff e3 18 fe 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa042e4:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa042e8:	00 0d       	CC = R0 <= 0x0;
ffa042ea:	9d 10       	IF !CC JUMP 0xffa04424 <_tcp_rx+0x38c>;
ffa042ec:	28 91       	R0 = [P5];
ffa042ee:	18 0c       	CC = R0 == 0x3;
ffa042f0:	a3 18       	IF CC JUMP 0xffa04436 <_tcp_rx+0x39e>;
ffa042f2:	00 00       	NOP;
ffa042f4:	00 00       	NOP;
ffa042f6:	00 00       	NOP;
ffa042f8:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa042fc:	23 2f       	JUMP.S 0xffa04142 <_tcp_rx+0xaa>;
ffa042fe:	28 91       	R0 = [P5];
ffa04300:	08 64       	R0 += 0x1;		/* (  1) */
ffa04302:	28 93       	[P5] = R0;
ffa04304:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04306:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc4 <_TcpSeqHost> */
ffa0430a:	0a e1 d0 0f 	P2.L = 0xfd0;		/* (4048)	P2=0xff900fd0 <_TcpState> */
ffa0430e:	10 93       	[P2] = R0;
ffa04310:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04312:	ff e3 bb fd 	CALL 0xffa03e88 <_tcp_checksum_set>;
ffa04316:	ff e3 55 f0 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa0431a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0431c:	cb 2e       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa0431e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04322:	00 e1 90 05 	R0.L = 0x590;		/* (1424)	R0=0xff900590(-7338608) */
ffa04326:	ff e3 f5 eb 	CALL 0xffa01b10 <_printf_str>;
ffa0432a:	a0 a2       	R0 = [P4 + 0x28];
ffa0432c:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900fd0 <_TcpState> */
ffa04330:	ff e3 36 ef 	CALL 0xffa0219c <_htonl>;
ffa04334:	0d e1 c8 0f 	P5.L = 0xfc8;		/* (4040)	P5=0xff900fc8 <_TcpSeqClient> */
ffa04338:	28 93       	[P5] = R0;
ffa0433a:	44 30       	R0 = P4;
ffa0433c:	ff e3 48 fd 	CALL 0xffa03dcc <_tcp_length>;
ffa04340:	29 91       	R1 = [P5];
ffa04342:	09 64       	R1 += 0x1;		/* (  1) */
ffa04344:	41 50       	R1 = R1 + R0;
ffa04346:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fd0 <_TcpState> */
ffa0434a:	60 e5 12 00 	R0 = W[P4 + 0x24] (X);
ffa0434e:	0a e1 dc 0f 	P2.L = 0xfdc;		/* (4060)	P2=0xff900fdc <_TcpClientPort> */
ffa04352:	10 97       	W[P2] = R0;
ffa04354:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fdc <_TcpClientPort> */
ffa04358:	00 cc 00 c0 	R0 = R0 -|- R0 || [P5] = R1 || NOP;
ffa0435c:	29 93 00 00 
ffa04360:	0a e1 e8 0f 	P2.L = 0xfe8;		/* (4072)	P2=0xff900fe8 <_g_httpRxed> */
ffa04364:	10 93       	[P2] = R0;
ffa04366:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe8 <_g_httpRxed> */
ffa0436a:	e2 a1       	R2 = [P4 + 0x1c];
ffa0436c:	0a e1 b0 0e 	P2.L = 0xeb0;		/* (3760)	P2=0xff900eb0 <_NetDestIP> */
ffa04370:	12 93       	[P2] = R2;
ffa04372:	90 60       	R0 = 0x12 (X);		/*		R0=0x12( 18) */
ffa04374:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900fc8 <_TcpSeqClient> */
ffa04378:	f0 b0       	[SP + 0xc] = R0;
ffa0437a:	0d e1 c4 0f 	P5.L = 0xfc4;		/* (4036)	P5=0xff900fc4 <_TcpSeqHost> */
ffa0437e:	28 91       	R0 = [P5];
ffa04380:	71 b1       	[SP + 0x14] = R1;
ffa04382:	30 b1       	[SP + 0x10] = R0;
ffa04384:	4f 30       	R1 = FP;
ffa04386:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04388:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa0438a:	ff e3 c3 fd 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa0438e:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa04392:	00 0d       	CC = R0 <= 0x0;
ffa04394:	b5 13       	IF !CC JUMP 0xffa042fe <_tcp_rx+0x266>;
ffa04396:	00 00       	NOP;
ffa04398:	00 00       	NOP;
ffa0439a:	00 00       	NOP;
ffa0439c:	a0 e4 31 00 	R0 = B[P4 + 0x31] (Z);
ffa043a0:	c8 2e       	JUMP.S 0xffa04130 <_tcp_rx+0x98>;
ffa043a2:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa043a6:	00 e1 84 05 	R0.L = 0x584;		/* (1412)	R0=0xff900584(-7338620) */
ffa043aa:	ff e3 b3 eb 	CALL 0xffa01b10 <_printf_str>;
ffa043ae:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900eb0 <_NetDestIP> */
ffa043b2:	0a e1 d0 0f 	P2.L = 0xfd0;		/* (4048)	P2=0xff900fd0 <_TcpState> */
ffa043b6:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa043b8:	17 93       	[P2] = R7;
ffa043ba:	a0 a2       	R0 = [P4 + 0x28];
ffa043bc:	ff e3 f0 ee 	CALL 0xffa0219c <_htonl>;
ffa043c0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fd0 <_TcpState> */
ffa043c4:	0a e1 c8 0f 	P2.L = 0xfc8;		/* (4040)	P2=0xff900fc8 <_TcpSeqClient> */
ffa043c8:	10 93       	[P2] = R0;
ffa043ca:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc8 <_TcpSeqClient> */
ffa043ce:	0a e1 e8 0f 	P2.L = 0xfe8;		/* (4072)	P2=0xff900fe8 <_g_httpRxed> */
ffa043d2:	17 93       	[P2] = R7;
ffa043d4:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa043d6:	6e 2e       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa043d8:	20 e1 f0 00 	R0 = 0xf0 (X);		/*		R0=0xf0(240) */
ffa043dc:	24 6d       	P4 += 0x24;		/* ( 36) */
ffa043de:	20 54       	R0 = R0 & R4;
ffa043e0:	10 4d       	R0 >>>= 0x2;
ffa043e2:	54 30       	R2 = P4;
ffa043e4:	02 50       	R0 = R2 + R0;
ffa043e6:	19 48       	CC = !BITTST (R1, 0x3);		/* bit  3 */
ffa043e8:	4e 1c       	IF CC JUMP 0xffa04484 <_tcp_rx+0x3ec> (BP);
ffa043ea:	0e 30       	R1 = R6;
ffa043ec:	00 e3 3e 05 	CALL 0xffa04e68 <_httpCollate>;
ffa043f0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe8 <_g_httpRxed> */
ffa043f4:	0a e1 cc 0f 	P2.L = 0xfcc;		/* (4044)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa043f8:	10 91       	R0 = [P2];
ffa043fa:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900fc4 <_TcpSeqHost> */
ffa043fe:	07 50       	R0 = R7 + R0;
ffa04400:	0d e1 c4 0f 	P5.L = 0xfc4;		/* (4036)	P5=0xff900fc4 <_TcpSeqHost> */
ffa04404:	28 93       	[P5] = R0;
ffa04406:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900000 <_l1_data_a> */
ffa0440a:	0c e1 e8 0f 	P4.L = 0xfe8;		/* (4072)	P4=0xff900fe8 <_g_httpRxed> */
ffa0440e:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04410:	80 4f       	R0 <<= 0x10;
ffa04412:	21 91       	R1 = [P4];
ffa04414:	00 e3 12 03 	CALL 0xffa04a38 <_httpResp>;
ffa04418:	00 0c       	CC = R0 == 0x0;
ffa0441a:	62 10       	IF !CC JUMP 0xffa044de <_tcp_rx+0x446>;
ffa0441c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0441e:	20 93       	[P4] = R0;
ffa04420:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04422:	48 2e       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa04424:	18 60       	R0 = 0x3 (X);		/*		R0=0x3(  3) */
ffa04426:	28 93       	[P5] = R0;
ffa04428:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0442a:	ff e3 2f fd 	CALL 0xffa03e88 <_tcp_checksum_set>;
ffa0442e:	ff e3 c9 ef 	CALL 0xffa023c0 <_bfin_EMAC_send_nocopy>;
ffa04432:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04434:	3f 2e       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa04436:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa0443a:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0443c:	0a e1 e8 0f 	P2.L = 0xfe8;		/* (4072)	P2=0xff900fe8 <_g_httpRxed> */
ffa04440:	10 93       	[P2] = R0;
ffa04442:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa04444:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe8 <_g_httpRxed> */
ffa04448:	f0 b0       	[SP + 0xc] = R0;
ffa0444a:	0a e1 c4 0f 	P2.L = 0xfc4;		/* (4036)	P2=0xff900fc4 <_TcpSeqHost> */
ffa0444e:	10 91       	R0 = [P2];
ffa04450:	15 32       	P2 = R5;
ffa04452:	30 b1       	[SP + 0x10] = R0;
ffa04454:	18 91       	R0 = [P3];
ffa04456:	70 b1       	[SP + 0x14] = R0;
ffa04458:	4f 30       	R1 = FP;
ffa0445a:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P2] || NOP;
ffa0445e:	12 91 00 00 
ffa04462:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa04464:	ff e3 56 fd 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa04468:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa0446c:	00 0d       	CC = R0 <= 0x0;
ffa0446e:	44 1f       	IF CC JUMP 0xffa042f6 <_tcp_rx+0x25e> (BP);
ffa04470:	20 60       	R0 = 0x4 (X);		/*		R0=0x4(  4) */
ffa04472:	4a 2f       	JUMP.S 0xffa04306 <_tcp_rx+0x26e>;
ffa04474:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900004(-7340028) */
ffa04478:	00 e1 d8 05 	R0.L = 0x5d8;		/* (1496)	R0=0xff9005d8(-7338536) */
ffa0447c:	ff e3 4a eb 	CALL 0xffa01b10 <_printf_str>;
ffa04480:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04482:	18 2e       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa04484:	0e 30       	R1 = R6;
ffa04486:	00 e3 f1 04 	CALL 0xffa04e68 <_httpCollate>;
ffa0448a:	80 60       	R0 = 0x10 (X);		/*		R0=0x10( 16) */
ffa0448c:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc4 <_TcpSeqHost> */
ffa04490:	f0 b0       	[SP + 0xc] = R0;
ffa04492:	0a e1 c4 0f 	P2.L = 0xfc4;		/* (4036)	P2=0xff900fc4 <_TcpSeqHost> */
ffa04496:	10 91       	R0 = [P2];
ffa04498:	15 32       	P2 = R5;
ffa0449a:	30 b1       	[SP + 0x10] = R0;
ffa0449c:	18 91       	R0 = [P3];
ffa0449e:	70 b1       	[SP + 0x14] = R0;
ffa044a0:	4f 30       	R1 = FP;
ffa044a2:	00 cc 00 c0 	R0 = R0 -|- R0 || R2 = [P2] || NOP;
ffa044a6:	12 91 00 00 
ffa044aa:	f9 67       	R1 += -0x1;		/* ( -1) */
ffa044ac:	ff e3 32 fd 	CALL 0xffa03f10 <_tcp_packet_setup>;
ffa044b0:	b8 e5 ff ff 	R0 = B[FP + -0x1] (X);
ffa044b4:	00 0d       	CC = R0 <= 0x0;
ffa044b6:	2d 17       	IF !CC JUMP 0xffa04310 <_tcp_rx+0x278> (BP);
ffa044b8:	fc 2d       	JUMP.S 0xffa040b0 <_tcp_rx+0x18>;
ffa044ba:	10 60       	R0 = 0x2 (X);		/*		R0=0x2(  2) */
ffa044bc:	28 93       	[P5] = R0;
ffa044be:	a0 a2       	R0 = [P4 + 0x28];
ffa044c0:	ff e3 6e ee 	CALL 0xffa0219c <_htonl>;
ffa044c4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc4 <_TcpSeqHost> */
ffa044c8:	0a e1 c8 0f 	P2.L = 0xfc8;		/* (4040)	P2=0xff900fc8 <_TcpSeqClient> */
ffa044cc:	10 93       	[P2] = R0;
ffa044ce:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900002(-7340030) */
ffa044d2:	00 e1 b8 05 	R0.L = 0x5b8;		/* (1464)	R0=0xff9005b8(-7338568) */
ffa044d6:	ff e3 1d eb 	CALL 0xffa01b10 <_printf_str>;
ffa044da:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa044dc:	eb 2d       	JUMP.S 0xffa040b2 <_tcp_rx+0x1a>;
ffa044de:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fc8 <_TcpSeqClient> */
ffa044e2:	28 91       	R0 = [P5];
ffa044e4:	0a e1 cc 0f 	P2.L = 0xfcc;		/* (4044)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa044e8:	10 93       	[P2] = R0;
ffa044ea:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fcc <_TcpSeqHttpStart> */
ffa044ee:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa044f2:	11 91       	R1 = [P2];
ffa044f4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe4 <_g_httpContentLen> */
ffa044f8:	0a e1 e0 0f 	P2.L = 0xfe0;		/* (4064)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa044fc:	10 91       	R0 = [P2];
ffa044fe:	41 50       	R1 = R1 + R0;
ffa04500:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04504:	00 e1 08 06 	R0.L = 0x608;		/* (1544)	R0=0xff900608(-7338488) */
ffa04508:	ff e3 5c ea 	CALL 0xffa019c0 <_printf_int>;
ffa0450c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900608(-7338488) */
ffa04510:	00 e1 9c 07 	R0.L = 0x79c;		/* (1948)	R0=0xff90079c(-7338084) */
ffa04514:	ff e3 fe ea 	CALL 0xffa01b10 <_printf_str>;
ffa04518:	01 60       	R1 = 0x0 (X);		/*		R1=0x0(  0) */
ffa0451a:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa0451c:	ff e3 24 fd 	CALL 0xffa03f64 <_tcp_burst>;
ffa04520:	7e 2f       	JUMP.S 0xffa0441c <_tcp_rx+0x384>;
	...

ffa04524 <_htmlForm>:
ffa04524:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa04528:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900004(-7340028) */
ffa0452c:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa04530:	01 e8 00 00 	UNLINK;
ffa04534:	ff e2 6c eb 	JUMP.L 0xffa01c0c <_strcpy_>;

ffa04538 <_htmlDiv>:
ffa04538:	12 43       	R2 = R2.B (X);
ffa0453a:	23 e1 62 00 	R3 = 0x62 (X);		/*		R3=0x62( 98) */
ffa0453e:	00 e8 00 00 	LINK 0x0;		/* (0) */
ffa04542:	1a 08       	CC = R2 == R3;
ffa04544:	09 18       	IF CC JUMP 0xffa04556 <_htmlDiv+0x1e>;
ffa04546:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa0454a:	02 e1 78 06 	R2.L = 0x678;		/* (1656)	R2=0xff900678(-7338376) */
ffa0454e:	01 e8 00 00 	UNLINK;
ffa04552:	ff e2 5d eb 	JUMP.L 0xffa01c0c <_strcpy_>;
ffa04556:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900678(-7338376) */
ffa0455a:	02 e1 44 06 	R2.L = 0x644;		/* (1604)	R2=0xff900644(-7338428) */
ffa0455e:	01 e8 00 00 	UNLINK;
ffa04562:	ff e2 55 eb 	JUMP.L 0xffa01c0c <_strcpy_>;
	...

ffa04568 <_html404>:
ffa04568:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0456c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa0456e:	f0 bb       	[FP -0x4] = R0;
ffa04570:	4f 30       	R1 = FP;
ffa04572:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900644(-7338428) */
ffa04576:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa0457a:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa0457c:	02 e1 ac 06 	R2.L = 0x6ac;		/* (1708)	R2=0xff9006ac(-7338324) */
ffa04580:	ff e3 46 eb 	CALL 0xffa01c0c <_strcpy_>;
ffa04584:	f0 b9       	R0 = [FP -0x4];
ffa04586:	01 e8 00 00 	UNLINK;
ffa0458a:	10 00       	RTS;

ffa0458c <_htmlCursorOption>:
ffa0458c:	68 05       	[--SP] = (R7:5);
ffa0458e:	2a 30       	R5 = R2;
ffa04590:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa04594:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006ac(-7338324) */
ffa04598:	82 ce 01 cc 	R6 = ROT R1 BY 0x0 || R7 = [FP + 0x20] || NOP;
ffa0459c:	3f a2 00 00 
ffa045a0:	02 e1 c8 06 	R2.L = 0x6c8;		/* (1736)	R2=0xff9006c8(-7338296) */
ffa045a4:	ff e3 34 eb 	CALL 0xffa01c0c <_strcpy_>;
ffa045a8:	0e 30       	R1 = R6;
ffa045aa:	15 30       	R2 = R5;
ffa045ac:	ff e3 82 ec 	CALL 0xffa01eb0 <_strprintf_int>;
ffa045b0:	3d 08       	CC = R5 == R7;
ffa045b2:	16 18       	IF CC JUMP 0xffa045de <_htmlCursorOption+0x52>;
ffa045b4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006c8(-7338296) */
ffa045b8:	0e 30       	R1 = R6;
ffa045ba:	02 e1 f0 06 	R2.L = 0x6f0;		/* (1776)	R2=0xff9006f0(-7338256) */
ffa045be:	ff e3 27 eb 	CALL 0xffa01c0c <_strcpy_>;
ffa045c2:	0e 30       	R1 = R6;
ffa045c4:	15 30       	R2 = R5;
ffa045c6:	ff e3 75 ec 	CALL 0xffa01eb0 <_strprintf_int>;
ffa045ca:	0e 30       	R1 = R6;
ffa045cc:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006f0(-7338256) */
ffa045d0:	01 e8 00 00 	UNLINK;
ffa045d4:	02 e1 f4 06 	R2.L = 0x6f4;		/* (1780)	R2=0xff9006f4(-7338252) */
ffa045d8:	28 05       	(R7:5) = [SP++];
ffa045da:	ff e2 19 eb 	JUMP.L 0xffa01c0c <_strcpy_>;
ffa045de:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006f4(-7338252) */
ffa045e2:	0e 30       	R1 = R6;
ffa045e4:	02 e1 d8 06 	R2.L = 0x6d8;		/* (1752)	R2=0xff9006d8(-7338280) */
ffa045e8:	ff e3 12 eb 	CALL 0xffa01c0c <_strcpy_>;
ffa045ec:	e4 2f       	JUMP.S 0xffa045b4 <_htmlCursorOption+0x28>;
	...

ffa045f0 <_htmlCursorSelect>:
ffa045f0:	60 05       	[--SP] = (R7:4);
ffa045f2:	3a 30       	R7 = R2;
ffa045f4:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa045f8:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9006d8(-7338280) */
ffa045fc:	82 ce 01 ca 	R5 = ROT R1 BY 0x0 || R6 = [FP + 0x24] || NOP;
ffa04600:	7e a2 00 00 
ffa04604:	02 e1 00 07 	R2.L = 0x700;		/* (1792)	R2=0xff900700(-7338240) */
ffa04608:	bc a2       	R4 = [FP + 0x28];
ffa0460a:	ff e3 01 eb 	CALL 0xffa01c0c <_strcpy_>;
ffa0460e:	17 30       	R2 = R7;
ffa04610:	0d 30       	R1 = R5;
ffa04612:	ff e3 fd ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04616:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900700(-7338240) */
ffa0461a:	0d 30       	R1 = R5;
ffa0461c:	02 e1 0c 07 	R2.L = 0x70c;		/* (1804)	R2=0xff90070c(-7338228) */
ffa04620:	ff e3 f6 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04624:	0d 30       	R1 = R5;
ffa04626:	16 30       	R2 = R6;
ffa04628:	ff e3 f2 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa0462c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90070c(-7338228) */
ffa04630:	0d 30       	R1 = R5;
ffa04632:	02 e1 28 07 	R2.L = 0x728;		/* (1832)	R2=0xff900728(-7338200) */
ffa04636:	ff e3 eb ea 	CALL 0xffa01c0c <_strcpy_>;
ffa0463a:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa0463c:	82 ce 05 c2 	R1 = ROT R5 BY 0x0 || [SP + 0xc] = R4 || NOP;
ffa04640:	f4 b0 00 00 
ffa04644:	17 30       	R2 = R7;
ffa04646:	ff e3 a3 ff 	CALL 0xffa0458c <_htmlCursorOption>;
ffa0464a:	0f 64       	R7 += 0x1;		/* (  1) */
ffa0464c:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa0464e:	0f 08       	CC = R7 == R1;
ffa04650:	f6 17       	IF !CC JUMP 0xffa0463c <_htmlCursorSelect+0x4c> (BP);
ffa04652:	0d 30       	R1 = R5;
ffa04654:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900728(-7338200) */
ffa04658:	01 e8 00 00 	UNLINK;
ffa0465c:	02 e1 2c 07 	R2.L = 0x72c;		/* (1836)	R2=0xff90072c(-7338196) */
ffa04660:	20 05       	(R7:4) = [SP++];
ffa04662:	ff e2 d5 ea 	JUMP.L 0xffa01c0c <_strcpy_>;
	...

ffa04668 <_httpHeader>:
ffa04668:	78 05       	[--SP] = (R7:7);
ffa0466a:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa0466e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04670:	7f 30       	R7 = FP;
ffa04672:	e7 67       	R7 += -0x4;		/* ( -4) */
ffa04674:	f0 bb       	[FP -0x4] = R0;
ffa04676:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90072c(-7338196) */
ffa0467a:	0f 30       	R1 = R7;
ffa0467c:	02 e1 44 07 	R2.L = 0x744;		/* (1860)	R2=0xff900744(-7338172) */
ffa04680:	20 e1 00 40 	R0 = 0x4000 (X);		/*		R0=0x4000(16384) */
ffa04684:	ff e3 c4 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04688:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900744(-7338172) */
ffa0468c:	0f 30       	R1 = R7;
ffa0468e:	02 e1 58 07 	R2.L = 0x758;		/* (1880)	R2=0xff900758(-7338152) */
ffa04692:	ff e3 bd ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04696:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900758(-7338152) */
ffa0469a:	0f 30       	R1 = R7;
ffa0469c:	02 e1 6c 07 	R2.L = 0x76c;		/* (1900)	R2=0xff90076c(-7338132) */
ffa046a0:	ff e3 b6 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa046a4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa046a8:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa046ac:	12 91       	R2 = [P2];
ffa046ae:	0f 30       	R1 = R7;
ffa046b0:	ff e3 00 ec 	CALL 0xffa01eb0 <_strprintf_int>;
ffa046b4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90076c(-7338132) */
ffa046b8:	0f 30       	R1 = R7;
ffa046ba:	02 e1 80 07 	R2.L = 0x780;		/* (1920)	R2=0xff900780(-7338112) */
ffa046be:	ff e3 a7 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa046c2:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe4 <_g_httpContentLen> */
ffa046c6:	f0 b9       	R0 = [FP -0x4];
ffa046c8:	0a e1 e0 0f 	P2.L = 0xfe0;		/* (4064)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa046cc:	10 93       	[P2] = R0;
ffa046ce:	01 e8 00 00 	UNLINK;
ffa046d2:	38 05       	(R7:7) = [SP++];
ffa046d4:	10 00       	RTS;
	...

ffa046d8 <_htmlGeneric>:
ffa046d8:	10 30       	R2 = R0;
ffa046da:	00 e8 04 00 	LINK 0x10;		/* (16) */
ffa046de:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa046e0:	f0 bb       	[FP -0x4] = R0;
ffa046e2:	4f 30       	R1 = FP;
ffa046e4:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa046e6:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa046ea:	ff e3 91 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa046ee:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe0 <_g_httpHeaderLen> */
ffa046f2:	f0 b9       	R0 = [FP -0x4];
ffa046f4:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa046f8:	10 93       	[P2] = R0;
ffa046fa:	ff e3 b7 ff 	CALL 0xffa04668 <_httpHeader>;
ffa046fe:	f0 b9       	R0 = [FP -0x4];
ffa04700:	01 e8 00 00 	UNLINK;
ffa04704:	10 00       	RTS;
	...

ffa04708 <_htmlDefault>:
ffa04708:	e4 05       	[--SP] = (R7:4, P5:4);
ffa0470a:	00 e8 06 00 	LINK 0x18;		/* (24) */
ffa0470e:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04710:	6f 32       	P5 = FP;
ffa04712:	e5 6f       	P5 += -0x4;		/* ( -4) */
ffa04714:	f0 bb       	[FP -0x4] = R0;
ffa04716:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900780(-7338112) */
ffa0471a:	4d 30       	R1 = P5;
ffa0471c:	02 e1 a0 07 	R2.L = 0x7a0;		/* (1952)	R2=0xff9007a0(-7338080) */
ffa04720:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa04724:	ff e3 74 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04728:	4d 30       	R1 = P5;
ffa0472a:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa0472e:	ff e3 05 ff 	CALL 0xffa04538 <_htmlDiv>;
ffa04732:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa04736:	4d 30       	R1 = P5;
ffa04738:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa0473c:	ff e3 68 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04740:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa04744:	4d 30       	R1 = P5;
ffa04746:	02 e1 f0 07 	R2.L = 0x7f0;		/* (2032)	R2=0xff9007f0(-7338000) */
ffa0474a:	ff e3 61 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa0474e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900fe4 <_g_httpContentLen> */
ffa04752:	08 30       	R1 = R0;
ffa04754:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa04758:	10 99       	R0 = B[P2] (Z);
ffa0475a:	00 0c       	CC = R0 == 0x0;
ffa0475c:	5c 1d       	IF CC JUMP 0xffa04a14 <_htmlDefault+0x30c> (BP);
ffa0475e:	01 30       	R0 = R1;
ffa04760:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9007f0(-7338000) */
ffa04764:	4d 30       	R1 = P5;
ffa04766:	02 e1 40 08 	R2.L = 0x840;		/* (2112)	R2=0xff900840(-7337920) */
ffa0476a:	ff e3 51 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa0476e:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900840(-7337920) */
ffa04772:	4d 30       	R1 = P5;
ffa04774:	02 e1 58 08 	R2.L = 0x858;		/* (2136)	R2=0xff900858(-7337896) */
ffa04778:	ff e3 4a ea 	CALL 0xffa01c0c <_strcpy_>;
ffa0477c:	4d 30       	R1 = P5;
ffa0477e:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa04782:	ff e3 db fe 	CALL 0xffa04538 <_htmlDiv>;
ffa04786:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa0478a:	4d 30       	R1 = P5;
ffa0478c:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa04790:	ff e3 3e ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04794:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa04798:	4d 30       	R1 = P5;
ffa0479a:	02 e1 6c 08 	R2.L = 0x86c;		/* (2156)	R2=0xff90086c(-7337876) */
ffa0479e:	4c e1 90 ff 	P4.H = 0xff90;		/* (-112)	P4=0xff900fe8 <_g_httpRxed> */
ffa047a2:	ff e3 35 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa047a6:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa047a8:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa047aa:	0c e1 f0 0e 	P4.L = 0xef0;		/* (3824)	P4=0xff900ef0 <_NetDataDestIP> */
ffa047ae:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90086c(-7337876) */
ffa047b2:	4d 30       	R1 = P5;
ffa047b4:	02 e1 88 08 	R2.L = 0x888;		/* (2184)	R2=0xff900888(-7337848) */
ffa047b8:	ff e3 2a ea 	CALL 0xffa01c0c <_strcpy_>;
ffa047bc:	17 30       	R2 = R7;
ffa047be:	4d 30       	R1 = P5;
ffa047c0:	ff e3 78 eb 	CALL 0xffa01eb0 <_strprintf_int>;
ffa047c4:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900888(-7337848) */
ffa047c8:	4d 30       	R1 = P5;
ffa047ca:	02 e1 a4 08 	R2.L = 0x8a4;		/* (2212)	R2=0xff9008a4(-7337820) */
ffa047ce:	ff e3 1f ea 	CALL 0xffa01c0c <_strcpy_>;
ffa047d2:	22 91       	R2 = [P4];
ffa047d4:	72 40       	R2 >>= R6;
ffa047d6:	52 43       	R2 = R2.B (Z);
ffa047d8:	4d 30       	R1 = P5;
ffa047da:	ff e3 6b eb 	CALL 0xffa01eb0 <_strprintf_int>;
ffa047de:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008a4(-7337820) */
ffa047e2:	4d 30       	R1 = P5;
ffa047e4:	02 e1 b8 08 	R2.L = 0x8b8;		/* (2232)	R2=0xff9008b8(-7337800) */
ffa047e8:	ff e3 12 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa047ec:	0f 64       	R7 += 0x1;		/* (  1) */
ffa047ee:	29 60       	R1 = 0x5 (X);		/*		R1=0x5(  5) */
ffa047f0:	46 64       	R6 += 0x8;		/* (  8) */
ffa047f2:	0f 08       	CC = R7 == R1;
ffa047f4:	dd 17       	IF !CC JUMP 0xffa047ae <_htmlDefault+0xa6> (BP);
ffa047f6:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008b8(-7337800) */
ffa047fa:	4d 30       	R1 = P5;
ffa047fc:	02 e1 c0 08 	R2.L = 0x8c0;		/* (2240)	R2=0xff9008c0(-7337792) */
ffa04800:	ff e3 06 ea 	CALL 0xffa01c0c <_strcpy_>;
ffa04804:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008c0(-7337792) */
ffa04808:	4d 30       	R1 = P5;
ffa0480a:	02 e1 58 08 	R2.L = 0x858;		/* (2136)	R2=0xff900858(-7337896) */
ffa0480e:	ff e3 ff e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04812:	4d 30       	R1 = P5;
ffa04814:	22 e1 67 00 	R2 = 0x67 (X);		/*		R2=0x67(103) */
ffa04818:	ff e3 90 fe 	CALL 0xffa04538 <_htmlDiv>;
ffa0481c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900067(-7339929) */
ffa04820:	4d 30       	R1 = P5;
ffa04822:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa04826:	ff e3 f3 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa0482a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa0482e:	4d 30       	R1 = P5;
ffa04830:	02 e1 e4 08 	R2.L = 0x8e4;		/* (2276)	R2=0xff9008e4(-7337756) */
ffa04834:	ff e3 ec e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04838:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800c40 */
ffa0483c:	08 30       	R1 = R0;
ffa0483e:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa04842:	10 99       	R0 = B[P2] (Z);
ffa04844:	00 48       	CC = !BITTST (R0, 0x0);		/* bit  0 */
ffa04846:	f0 10       	IF !CC JUMP 0xffa04a26 <_htmlDefault+0x31e>;
ffa04848:	01 30       	R0 = R1;
ffa0484a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9008e4(-7337756) */
ffa0484e:	4d 30       	R1 = P5;
ffa04850:	02 e1 40 08 	R2.L = 0x840;		/* (2112)	R2=0xff900840(-7337920) */
ffa04854:	ff e3 dc e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04858:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900840(-7337920) */
ffa0485c:	4d 30       	R1 = P5;
ffa0485e:	02 e1 58 08 	R2.L = 0x858;		/* (2136)	R2=0xff900858(-7337896) */
ffa04862:	ff e3 d5 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04866:	4d 30       	R1 = P5;
ffa04868:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa0486c:	ff e3 66 fe 	CALL 0xffa04538 <_htmlDiv>;
ffa04870:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa04874:	4d 30       	R1 = P5;
ffa04876:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa0487a:	ff e3 c9 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa0487e:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa04882:	4d 30       	R1 = P5;
ffa04884:	02 e1 24 09 	R2.L = 0x924;		/* (2340)	R2=0xff900924(-7337692) */
ffa04888:	ff e3 c2 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa0488c:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff900005(-7340027) */
ffa04890:	01 e1 54 09 	R1.L = 0x954;		/* (2388)	R1=0xff900954(-7337644) */
ffa04894:	00 cc 3f ce 	R7 = R7 -|- R7 || [SP + 0xc] = R1 || NOP;
ffa04898:	f1 b0 00 00 
ffa0489c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900924(-7337692) */
ffa048a0:	37 b1       	[SP + 0x10] = R7;
ffa048a2:	4d 30       	R1 = P5;
ffa048a4:	02 e1 48 09 	R2.L = 0x948;		/* (2376)	R2=0xff900948(-7337656) */
ffa048a8:	ff e3 a4 fe 	CALL 0xffa045f0 <_htmlCursorSelect>;
ffa048ac:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff900954(-7337644) */
ffa048b0:	01 e1 6c 09 	R1.L = 0x96c;		/* (2412)	R1=0xff90096c(-7337620) */
ffa048b4:	f1 b0       	[SP + 0xc] = R1;
ffa048b6:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900948(-7337656) */
ffa048ba:	37 b1       	[SP + 0x10] = R7;
ffa048bc:	4d 30       	R1 = P5;
ffa048be:	02 e1 60 09 	R2.L = 0x960;		/* (2400)	R2=0xff900960(-7337632) */
ffa048c2:	ff e3 97 fe 	CALL 0xffa045f0 <_htmlCursorSelect>;
ffa048c6:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff90096c(-7337620) */
ffa048ca:	01 e1 84 09 	R1.L = 0x984;		/* (2436)	R1=0xff900984(-7337596) */
ffa048ce:	f1 b0       	[SP + 0xc] = R1;
ffa048d0:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900960(-7337632) */
ffa048d4:	37 b1       	[SP + 0x10] = R7;
ffa048d6:	4d 30       	R1 = P5;
ffa048d8:	02 e1 78 09 	R2.L = 0x978;		/* (2424)	R2=0xff900978(-7337608) */
ffa048dc:	ff e3 8a fe 	CALL 0xffa045f0 <_htmlCursorSelect>;
ffa048e0:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff900984(-7337596) */
ffa048e4:	01 e1 98 09 	R1.L = 0x998;		/* (2456)	R1=0xff900998(-7337576) */
ffa048e8:	f1 b0       	[SP + 0xc] = R1;
ffa048ea:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900978(-7337608) */
ffa048ee:	37 b1       	[SP + 0x10] = R7;
ffa048f0:	4d 30       	R1 = P5;
ffa048f2:	02 e1 90 09 	R2.L = 0x990;		/* (2448)	R2=0xff900990(-7337584) */
ffa048f6:	ff e3 7d fe 	CALL 0xffa045f0 <_htmlCursorSelect>;
ffa048fa:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900990(-7337584) */
ffa048fe:	4d 30       	R1 = P5;
ffa04900:	02 e1 a4 09 	R2.L = 0x9a4;		/* (2468)	R2=0xff9009a4(-7337564) */
ffa04904:	ff e3 84 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04908:	4d 30       	R1 = P5;
ffa0490a:	22 e1 67 00 	R2 = 0x67 (X);		/*		R2=0x67(103) */
ffa0490e:	ff e3 15 fe 	CALL 0xffa04538 <_htmlDiv>;
ffa04912:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900067(-7339929) */
ffa04916:	4d 30       	R1 = P5;
ffa04918:	02 e1 24 06 	R2.L = 0x624;		/* (1572)	R2=0xff900624(-7338460) */
ffa0491c:	ff e3 78 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04920:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900624(-7338460) */
ffa04924:	4d 30       	R1 = P5;
ffa04926:	02 e1 e0 09 	R2.L = 0x9e0;		/* (2528)	R2=0xff9009e0(-7337504) */
ffa0492a:	ff e3 71 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa0492e:	4d 30       	R1 = P5;
ffa04930:	22 e1 62 00 	R2 = 0x62 (X);		/*		R2=0x62( 98) */
ffa04934:	ff e3 02 fe 	CALL 0xffa04538 <_htmlDiv>;
ffa04938:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900062(-7339934) */
ffa0493c:	4d 30       	R1 = P5;
ffa0493e:	02 e1 38 0a 	R2.L = 0xa38;		/* (2616)	R2=0xff900a38(-7337416) */
ffa04942:	ff e3 65 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04946:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900a38(-7337416) */
ffa0494a:	4d 30       	R1 = P5;
ffa0494c:	02 e1 60 0a 	R2.L = 0xa60;		/* (2656)	R2=0xff900a60(-7337376) */
ffa04950:	ff e3 5e e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04954:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900a60(-7337376) */
ffa04958:	4d 30       	R1 = P5;
ffa0495a:	02 e1 58 08 	R2.L = 0x858;		/* (2136)	R2=0xff900858(-7337896) */
ffa0495e:	ff e3 57 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04962:	38 30       	R7 = R0;
ffa04964:	ff e3 22 dc 	CALL 0xffa001a8 <_ustimer>;
ffa04968:	41 e1 e3 38 	R1.H = 0x38e3;		/* (14563)	R1=0x38e30998(954403224) */
ffa0496c:	01 e1 39 8e 	R1.L = 0x8e39;		/* (-29127)	R1=0x38e38e39(954437177) */
ffa04970:	80 c0 01 18 	A1 = R0.L * R1.L (FU);
ffa04974:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa04978:	81 c0 01 86 	A1 += R0.H * R1.L, A0 = R0.H * R1.H (FU);
ffa0497c:	81 c0 08 98 	A1 += R1.H * R0.L (FU);
ffa04980:	83 c6 80 51 	A1 = A1 >> 0x10;
ffa04984:	0b c4 3f 80 	A0 += A1;
ffa04988:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900858(-7337896) */
ffa0498c:	8b c0 00 39 	R4 = A0 (FU);
ffa04990:	02 e1 a8 0a 	R2.L = 0xaa8;		/* (2728)	R2=0xff900aa8(-7337304) */
ffa04994:	4d 30       	R1 = P5;
ffa04996:	07 30       	R0 = R7;
ffa04998:	ff e3 3a e9 	CALL 0xffa01c0c <_strcpy_>;
ffa0499c:	0c 4e       	R4 >>= 0x1;
ffa0499e:	28 30       	R5 = R0;
ffa049a0:	04 30       	R0 = R4;
ffa049a2:	21 e1 e8 03 	R1 = 0x3e8 (X);		/*		R1=0x3e8(1000) */
ffa049a6:	ff e3 ef e5 	CALL 0xffa01584 <___divsi3>;
ffa049aa:	30 30       	R6 = R0;
ffa049ac:	e1 61       	R1 = 0x3c (X);		/*		R1=0x3c( 60) */
ffa049ae:	ff e3 eb e5 	CALL 0xffa01584 <___divsi3>;
ffa049b2:	38 30       	R7 = R0;
ffa049b4:	4d 30       	R1 = P5;
ffa049b6:	17 30       	R2 = R7;
ffa049b8:	05 30       	R0 = R5;
ffa049ba:	ff e3 7b ea 	CALL 0xffa01eb0 <_strprintf_int>;
ffa049be:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900aa8(-7337304) */
ffa049c2:	4d 30       	R1 = P5;
ffa049c4:	02 e1 ac 00 	R2.L = 0xac;		/* (172)	R2=0xff9000ac(-7339860) */
ffa049c8:	ff e3 22 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa049cc:	82 c6 27 82 	R1 = R7 << 0x4;
ffa049d0:	cf 53       	R7 = R7 - R1;
ffa049d2:	07 32       	P0 = R7;
ffa049d4:	0e 32       	P1 = R6;
ffa049d6:	4d 30       	R1 = P5;
ffa049d8:	81 5e       	P2 = P1 + (P0 << 0x2);
ffa049da:	52 30       	R2 = P2;
ffa049dc:	ff e3 6a ea 	CALL 0xffa01eb0 <_strprintf_int>;
ffa049e0:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff9000ac(-7339860) */
ffa049e4:	4d 30       	R1 = P5;
ffa049e6:	02 e1 f0 00 	R2.L = 0xf0;		/* (240)	R2=0xff9000f0(-7339792) */
ffa049ea:	ff e3 11 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa049ee:	22 e1 18 fc 	R2 = -0x3e8 (X);		/*		R2=0xfffffc18(-1000) */
ffa049f2:	f2 40       	R2 *= R6;
ffa049f4:	4d 30       	R1 = P5;
ffa049f6:	a2 50       	R2 = R2 + R4;
ffa049f8:	ff e3 5c ea 	CALL 0xffa01eb0 <_strprintf_int>;
ffa049fc:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90fc18(-7275496) */
ffa04a00:	4d 30       	R1 = P5;
ffa04a02:	02 e1 b4 0a 	R2.L = 0xab4;		/* (2740)	R2=0xff900ab4(-7337292) */
ffa04a06:	ff e3 03 e9 	CALL 0xffa01c0c <_strcpy_>;
ffa04a0a:	f0 b9       	R0 = [FP -0x4];
ffa04a0c:	01 e8 00 00 	UNLINK;
ffa04a10:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04a12:	10 00       	RTS;
ffa04a14:	01 30       	R0 = R1;
ffa04a16:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900ab4(-7337292) */
ffa04a1a:	4d 30       	R1 = P5;
ffa04a1c:	02 e1 4c 08 	R2.L = 0x84c;		/* (2124)	R2=0xff90084c(-7337908) */
ffa04a20:	ff e3 f6 e8 	CALL 0xffa01c0c <_strcpy_>;
ffa04a24:	a5 2e       	JUMP.S 0xffa0476e <_htmlDefault+0x66>;
ffa04a26:	01 30       	R0 = R1;
ffa04a28:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90084c(-7337908) */
ffa04a2c:	4d 30       	R1 = P5;
ffa04a2e:	02 e1 4c 08 	R2.L = 0x84c;		/* (2124)	R2=0xff90084c(-7337908) */
ffa04a32:	ff e3 ed e8 	CALL 0xffa01c0c <_strcpy_>;
ffa04a36:	11 2f       	JUMP.S 0xffa04858 <_htmlDefault+0x150>;

ffa04a38 <_httpResp>:
ffa04a38:	e4 05       	[--SP] = (R7:4, P5:4);
ffa04a3a:	30 30       	R6 = R0;
ffa04a3c:	70 60       	R0 = 0xe (X);		/*		R0=0xe( 14) */
ffa04a3e:	00 e8 14 00 	LINK 0x50;		/* (80) */
ffa04a42:	39 30       	R7 = R1;
ffa04a44:	01 09       	CC = R1 <= R0;
ffa04a46:	1e 10       	IF !CC JUMP 0xffa04a82 <_httpResp+0x4a>;
ffa04a48:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff90000e(-7340018) */
ffa04a4c:	00 e1 c4 0a 	R0.L = 0xac4;		/* (2756)	R0=0xff900ac4(-7337276) */
ffa04a50:	0e 30       	R1 = R6;
ffa04a52:	17 30       	R2 = R7;
ffa04a54:	ff e3 54 e9 	CALL 0xffa01cfc <_substr>;
ffa04a58:	00 0c       	CC = R0 == 0x0;
ffa04a5a:	06 10       	IF !CC JUMP 0xffa04a66 <_httpResp+0x2e>;
ffa04a5c:	01 e8 00 00 	UNLINK;
ffa04a60:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04a62:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04a64:	10 00       	RTS;
ffa04a66:	ff e3 81 fd 	CALL 0xffa04568 <_html404>;
ffa04a6a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900808 */
ffa04a6e:	0a e1 e4 0f 	P2.L = 0xfe4;		/* (4068)	P2=0xff900fe4 <_g_httpContentLen> */
ffa04a72:	10 93       	[P2] = R0;
ffa04a74:	ff e3 fa fd 	CALL 0xffa04668 <_httpHeader>;
ffa04a78:	01 e8 00 00 	UNLINK;
ffa04a7c:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04a7e:	a4 05       	(R7:4, P5:4) = [SP++];
ffa04a80:	10 00       	RTS;
ffa04a82:	41 e1 90 ff 	R1.H = 0xff90;		/* (-112)	R1=0xff90003c(-7339972) */
ffa04a86:	06 30       	R0 = R6;
ffa04a88:	01 e1 cc 0a 	R1.L = 0xacc;		/* (2764)	R1=0xff900acc(-7337268) */
ffa04a8c:	ff e3 0a e9 	CALL 0xffa01ca0 <_strcmp>;
ffa04a90:	00 0c       	CC = R0 == 0x0;
ffa04a92:	34 11       	IF !CC JUMP 0xffa04cfa <_httpResp+0x2c2>;
ffa04a94:	89 60       	R1 = 0x11 (X);		/*		R1=0x11( 17) */
ffa04a96:	0f 09       	CC = R7 <= R1;
ffa04a98:	d8 1b       	IF CC JUMP 0xffa04a48 <_httpResp+0x10>;
ffa04a9a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900001(-7340031) */
ffa04a9e:	00 e1 d8 0a 	R0.L = 0xad8;		/* (2776)	R0=0xff900ad8(-7337256) */
ffa04aa2:	0e 30       	R1 = R6;
ffa04aa4:	17 30       	R2 = R7;
ffa04aa6:	ff e3 2b e9 	CALL 0xffa01cfc <_substr>;
ffa04aaa:	00 0c       	CC = R0 == 0x0;
ffa04aac:	f3 10       	IF !CC JUMP 0xffa04c92 <_httpResp+0x25a>;
ffa04aae:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900ad8(-7337256) */
ffa04ab2:	00 e1 18 0b 	R0.L = 0xb18;		/* (2840)	R0=0xff900b18(-7337192) */
ffa04ab6:	0e 30       	R1 = R6;
ffa04ab8:	17 30       	R2 = R7;
ffa04aba:	ff e3 21 e9 	CALL 0xffa01cfc <_substr>;
ffa04abe:	00 0c       	CC = R0 == 0x0;
ffa04ac0:	c4 1f       	IF CC JUMP 0xffa04a48 <_httpResp+0x10> (BP);
ffa04ac2:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b18(-7337192) */
ffa04ac6:	0e 30       	R1 = R6;
ffa04ac8:	17 30       	R2 = R7;
ffa04aca:	00 e1 18 0b 	R0.L = 0xb18;		/* (2840)	R0=0xff900b18(-7337192) */
ffa04ace:	ff e3 17 e9 	CALL 0xffa01cfc <_substr>;
ffa04ad2:	46 51       	R5 = R6 + R0;
ffa04ad4:	07 53       	R4 = R7 - R0;
ffa04ad6:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b18(-7337192) */
ffa04ada:	00 e1 20 0b 	R0.L = 0xb20;		/* (2848)	R0=0xff900b20(-7337184) */
ffa04ade:	0d 30       	R1 = R5;
ffa04ae0:	14 30       	R2 = R4;
ffa04ae2:	ff e3 0d e9 	CALL 0xffa01cfc <_substr>;
ffa04ae6:	00 0c       	CC = R0 == 0x0;
ffa04ae8:	51 11       	IF !CC JUMP 0xffa04d8a <_httpResp+0x352>;
ffa04aea:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa04aec:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b20(-7337184) */
ffa04af0:	00 e1 44 0b 	R0.L = 0xb44;		/* (2884)	R0=0xff900b44(-7337148) */
ffa04af4:	0d 30       	R1 = R5;
ffa04af6:	14 30       	R2 = R4;
ffa04af8:	ff e3 02 e9 	CALL 0xffa01cfc <_substr>;
ffa04afc:	00 0c       	CC = R0 == 0x0;
ffa04afe:	75 11       	IF !CC JUMP 0xffa04de8 <_httpResp+0x3b0>;
ffa04b00:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b44(-7337148) */
ffa04b04:	0d 30       	R1 = R5;
ffa04b06:	00 e1 50 0b 	R0.L = 0xb50;		/* (2896)	R0=0xff900b50(-7337136) */
ffa04b0a:	14 30       	R2 = R4;
ffa04b0c:	ff e3 f8 e8 	CALL 0xffa01cfc <_substr>;
ffa04b10:	00 0c       	CC = R0 == 0x0;
ffa04b12:	0f 60       	R7 = 0x1 (X);		/*		R7=0x1(  1) */
ffa04b14:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b50(-7337136) */
ffa04b18:	37 06       	IF !CC R6 = R7;
ffa04b1a:	0d 30       	R1 = R5;
ffa04b1c:	14 30       	R2 = R4;
ffa04b1e:	00 e1 5c 0b 	R0.L = 0xb5c;		/* (2908)	R0=0xff900b5c(-7337124) */
ffa04b22:	ff e3 ed e8 	CALL 0xffa01cfc <_substr>;
ffa04b26:	00 0c       	CC = R0 == 0x0;
ffa04b28:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b5c(-7337124) */
ffa04b2c:	37 06       	IF !CC R6 = R7;
ffa04b2e:	0d 30       	R1 = R5;
ffa04b30:	14 30       	R2 = R4;
ffa04b32:	00 e1 68 0b 	R0.L = 0xb68;		/* (2920)	R0=0xff900b68(-7337112) */
ffa04b36:	ff e3 e3 e8 	CALL 0xffa01cfc <_substr>;
ffa04b3a:	00 0c       	CC = R0 == 0x0;
ffa04b3c:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b68(-7337112) */
ffa04b40:	37 06       	IF !CC R6 = R7;
ffa04b42:	0d 30       	R1 = R5;
ffa04b44:	14 30       	R2 = R4;
ffa04b46:	00 e1 74 0b 	R0.L = 0xb74;		/* (2932)	R0=0xff900b74(-7337100) */
ffa04b4a:	ff e3 d9 e8 	CALL 0xffa01cfc <_substr>;
ffa04b4e:	00 0c       	CC = R0 == 0x0;
ffa04b50:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b74(-7337100) */
ffa04b54:	37 06       	IF !CC R6 = R7;
ffa04b56:	00 e1 80 0b 	R0.L = 0xb80;		/* (2944)	R0=0xff900b80(-7337088) */
ffa04b5a:	0d 30       	R1 = R5;
ffa04b5c:	14 30       	R2 = R4;
ffa04b5e:	ff e3 cf e8 	CALL 0xffa01cfc <_substr>;
ffa04b62:	00 0c       	CC = R0 == 0x0;
ffa04b64:	30 11       	IF !CC JUMP 0xffa04dc4 <_httpResp+0x38c>;
ffa04b66:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b80(-7337088) */
ffa04b6a:	00 e1 88 0b 	R0.L = 0xb88;		/* (2952)	R0=0xff900b88(-7337080) */
ffa04b6e:	0d 30       	R1 = R5;
ffa04b70:	14 30       	R2 = R4;
ffa04b72:	ff e3 c5 e8 	CALL 0xffa01cfc <_substr>;
ffa04b76:	00 0c       	CC = R0 == 0x0;
ffa04b78:	e3 10       	IF !CC JUMP 0xffa04d3e <_httpResp+0x306>;
ffa04b7a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b88(-7337080) */
ffa04b7e:	00 e1 90 0b 	R0.L = 0xb90;		/* (2960)	R0=0xff900b90(-7337072) */
ffa04b82:	0d 30       	R1 = R5;
ffa04b84:	14 30       	R2 = R4;
ffa04b86:	ff e3 bb e8 	CALL 0xffa01cfc <_substr>;
ffa04b8a:	00 0c       	CC = R0 == 0x0;
ffa04b8c:	c4 10       	IF !CC JUMP 0xffa04d14 <_httpResp+0x2dc>;
ffa04b8e:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b90(-7337072) */
ffa04b92:	00 e1 98 0b 	R0.L = 0xb98;		/* (2968)	R0=0xff900b98(-7337064) */
ffa04b96:	0d 30       	R1 = R5;
ffa04b98:	14 30       	R2 = R4;
ffa04b9a:	ff e3 b1 e8 	CALL 0xffa01cfc <_substr>;
ffa04b9e:	00 0c       	CC = R0 == 0x0;
ffa04ba0:	e4 10       	IF !CC JUMP 0xffa04d68 <_httpResp+0x330>;
ffa04ba2:	30 43       	R0 = R6.B (X);
ffa04ba4:	00 0c       	CC = R0 == 0x0;
ffa04ba6:	b4 10       	IF !CC JUMP 0xffa04d0e <_httpResp+0x2d6>;
ffa04ba8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b98(-7337064) */
ffa04bac:	00 e1 a0 0b 	R0.L = 0xba0;		/* (2976)	R0=0xff900ba0(-7337056) */
ffa04bb0:	0d 30       	R1 = R5;
ffa04bb2:	14 30       	R2 = R4;
ffa04bb4:	ff e3 a4 e8 	CALL 0xffa01cfc <_substr>;
ffa04bb8:	00 0c       	CC = R0 == 0x0;
ffa04bba:	51 1b       	IF CC JUMP 0xffa04a5c <_httpResp+0x24>;
ffa04bbc:	2a e1 bc ff 	P2 = -0x44 (X);		/*		P2=0xffffffbc(-68) */
ffa04bc0:	17 5b       	P4 = FP + P2;
ffa04bc2:	77 30       	R6 = FP;
ffa04bc4:	44 32       	P0 = P4;
ffa04bc6:	e6 67       	R6 += -0x4;		/* ( -4) */
ffa04bc8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04bca:	82 68       	P2 = 0x10 (X);		/*		P2=0x10( 16) */
ffa04bcc:	b2 e0 02 20 	LSETUP(0xffa04bd0 <_httpResp+0x198>, 0xffa04bd0 <_httpResp+0x198>) LC1 = P2;
ffa04bd0:	00 92       	[P0++] = R0;
ffa04bd2:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800010 */
ffa04bd6:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04bda:	21 e1 ff 1f 	R1 = 0x1fff (X);		/*		R1=0x1fff(8191) */
ffa04bde:	29 4f       	R1 <<= 0x5;
ffa04be0:	10 91       	R0 = [P2];
ffa04be2:	08 54       	R0 = R0 & R1;
ffa04be4:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04be6:	81 4f       	R1 <<= 0x10;
ffa04be8:	08 50       	R0 = R0 + R1;
ffa04bea:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04bec:	41 e1 03 00 	R1.H = 0x3;		/* (  3)	R1=0x3ffff(262143) */
ffa04bf0:	08 54       	R0 = R0 & R1;
ffa04bf2:	11 30       	R2 = R1;
ffa04bf4:	2d e1 00 08 	P5 = 0x800 (X);		/*		P5=0x800(2048) */
ffa04bf8:	b2 e0 0c 50 	LSETUP(0xffa04bfc <_httpResp+0x1c4>, 0xffa04c10 <_httpResp+0x1d8>) LC1 = P5;
ffa04bfc:	4c 32       	P1 = P4;
ffa04bfe:	10 32       	P2 = R0;
ffa04c00:	08 91       	R0 = [P1];
ffa04c02:	11 94       	R1 = W[P2++] (Z);
ffa04c04:	08 50       	R0 = R0 + R1;
ffa04c06:	08 92       	[P1++] = R0;
ffa04c08:	4a 30       	R1 = P2;
ffa04c0a:	11 54       	R0 = R1 & R2;
ffa04c0c:	48 08       	CC = P0 == P1;
ffa04c0e:	f8 17       	IF !CC JUMP 0xffa04bfe <_httpResp+0x1c6> (BP);
ffa04c10:	00 00       	NOP;
ffa04c12:	00 00       	NOP;
ffa04c14:	20 91       	R0 = [P4];
ffa04c16:	58 4d       	R0 >>>= 0xb;
ffa04c18:	20 92       	[P4++] = R0;
ffa04c1a:	44 08       	CC = P4 == P0;
ffa04c1c:	fb 17       	IF !CC JUMP 0xffa04c12 <_httpResp+0x1da> (BP);
ffa04c1e:	ff e3 75 fd 	CALL 0xffa04708 <_htmlDefault>;
ffa04c22:	68 67       	R0 += -0x13;		/* (-19) */
ffa04c24:	f0 bb       	[FP -0x4] = R0;
ffa04c26:	21 e1 00 41 	R1 = 0x4100 (X);		/*		R1=0x4100(16640) */
ffa04c2a:	08 50       	R0 = R0 + R1;
ffa04c2c:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90084c(-7337908) */
ffa04c30:	0e 30       	R1 = R6;
ffa04c32:	02 e1 b0 0b 	R2.L = 0xbb0;		/* (2992)	R2=0xff900bb0(-7337040) */
ffa04c36:	ff e3 eb e7 	CALL 0xffa01c0c <_strcpy_>;
ffa04c3a:	f5 b8       	R5 = [FP -0x44];
ffa04c3c:	07 60       	R7 = 0x0 (X);		/*		R7=0x0(  0) */
ffa04c3e:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900bb0(-7337040) */
ffa04c42:	0e 30       	R1 = R6;
ffa04c44:	02 e1 bc 0b 	R2.L = 0xbbc;		/* (3004)	R2=0xff900bbc(-7337028) */
ffa04c48:	ff e3 e2 e7 	CALL 0xffa01c0c <_strcpy_>;
ffa04c4c:	17 30       	R2 = R7;
ffa04c4e:	0e 30       	R1 = R6;
ffa04c50:	ff e3 30 e9 	CALL 0xffa01eb0 <_strprintf_int>;
ffa04c54:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900bbc(-7337028) */
ffa04c58:	0e 30       	R1 = R6;
ffa04c5a:	02 e1 d0 0b 	R2.L = 0xbd0;		/* (3024)	R2=0xff900bd0(-7337008) */
ffa04c5e:	ff e3 d7 e7 	CALL 0xffa01c0c <_strcpy_>;
ffa04c62:	0e 30       	R1 = R6;
ffa04c64:	15 30       	R2 = R5;
ffa04c66:	ff e3 25 e9 	CALL 0xffa01eb0 <_strprintf_int>;
ffa04c6a:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900bd0(-7337008) */
ffa04c6e:	0e 30       	R1 = R6;
ffa04c70:	02 e1 e0 0b 	R2.L = 0xbe0;		/* (3040)	R2=0xff900be0(-7336992) */
ffa04c74:	ff e3 cc e7 	CALL 0xffa01c0c <_strcpy_>;
ffa04c78:	0f 64       	R7 += 0x1;		/* (  1) */
ffa04c7a:	81 60       	R1 = 0x10 (X);		/*		R1=0x10( 16) */
ffa04c7c:	0f 08       	CC = R7 == R1;
ffa04c7e:	e0 17       	IF !CC JUMP 0xffa04c3e <_httpResp+0x206> (BP);
ffa04c80:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff900be0(-7336992) */
ffa04c84:	0e 30       	R1 = R6;
ffa04c86:	02 e1 ec 0b 	R2.L = 0xbec;		/* (3052)	R2=0xff900bec(-7336980) */
ffa04c8a:	ff e3 c1 e7 	CALL 0xffa01c0c <_strcpy_>;
ffa04c8e:	f0 b9       	R0 = [FP -0x4];
ffa04c90:	ed 2e       	JUMP.S 0xffa04a6a <_httpResp+0x32>;
ffa04c92:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04c96:	00 e1 e4 0a 	R0.L = 0xae4;		/* (2788)	R0=0xff900ae4(-7337244) */
ffa04c9a:	0e 30       	R1 = R6;
ffa04c9c:	17 30       	R2 = R7;
ffa04c9e:	ff e3 2f e8 	CALL 0xffa01cfc <_substr>;
ffa04ca2:	00 0c       	CC = R0 == 0x0;
ffa04ca4:	dc 1e       	IF CC JUMP 0xffa04a5c <_httpResp+0x24> (BP);
ffa04ca6:	51 60       	R1 = 0xa (X);		/*		R1=0xa( 10) */
ffa04ca8:	06 50       	R0 = R6 + R0;
ffa04caa:	ff e3 2b e9 	CALL 0xffa01f00 <_atoi_>;
ffa04cae:	10 30       	R2 = R0;
ffa04cb0:	00 67       	R0 += -0x20;		/* (-32) */
ffa04cb2:	21 e1 80 0f 	R1 = 0xf80 (X);		/*		R1=0xf80(3968) */
ffa04cb6:	08 0a       	CC = R0 <= R1 (IU);
ffa04cb8:	ca 10       	IF !CC JUMP 0xffa04e4c <_httpResp+0x414>;
ffa04cba:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800800 */
ffa04cbe:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04cc2:	82 c6 1a 86 	R3 = R2 << 0x3;
ffa04cc6:	17 91       	R7 = [P2];
ffa04cc8:	03 0d       	CC = R3 <= 0x0;
ffa04cca:	15 18       	IF CC JUMP 0xffa04cf4 <_httpResp+0x2bc>;
ffa04ccc:	20 e1 ff 1f 	R0 = 0x1fff (X);		/*		R0=0x1fff(8191) */
ffa04cd0:	28 4f       	R0 <<= 0x5;
ffa04cd2:	07 54       	R0 = R7 & R0;
ffa04cd4:	82 c6 2a 82 	R1 = R2 << 0x5;
ffa04cd8:	ff 63       	R7 = -0x1 (X);		/*		R7=0xffffffff( -1) */
ffa04cda:	48 52       	R1 = R0 - R1;
ffa04cdc:	29 e1 00 41 	P1 = 0x4100 (X);		/*		P1=0x4100(16640) */
ffa04ce0:	47 e1 03 00 	R7.H = 0x3;		/* (  3)	R7=0x3ffff(262143) */
ffa04ce4:	13 32       	P2 = R3;
ffa04ce6:	b2 e0 06 20 	LSETUP(0xffa04cea <_httpResp+0x2b2>, 0xffa04cf2 <_httpResp+0x2ba>) LC1 = P2;
ffa04cea:	79 54       	R1 = R1 & R7;
ffa04cec:	01 32       	P0 = R1;
ffa04cee:	21 64       	R1 += 0x4;		/* (  4) */
ffa04cf0:	00 90       	R0 = [P0++];
ffa04cf2:	08 92       	[P1++] = R0;
ffa04cf4:	82 c6 2a 80 	R0 = R2 << 0x5;
ffa04cf8:	b9 2e       	JUMP.S 0xffa04a6a <_httpResp+0x32>;
ffa04cfa:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff901fff(-7331841) */
ffa04cfe:	00 e1 c4 0a 	R0.L = 0xac4;		/* (2756)	R0=0xff900ac4(-7337276) */
ffa04d02:	0e 30       	R1 = R6;
ffa04d04:	17 30       	R2 = R7;
ffa04d06:	ff e3 fb e7 	CALL 0xffa01cfc <_substr>;
ffa04d0a:	00 0c       	CC = R0 == 0x0;
ffa04d0c:	a8 1e       	IF CC JUMP 0xffa04a5c <_httpResp+0x24> (BP);
ffa04d0e:	ff e3 fd fc 	CALL 0xffa04708 <_htmlDefault>;
ffa04d12:	ac 2e       	JUMP.S 0xffa04a6a <_httpResp+0x32>;
ffa04d14:	45 51       	R5 = R5 + R0;
ffa04d16:	04 53       	R4 = R4 - R0;
ffa04d18:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04d1a:	05 30       	R0 = R5;
ffa04d1c:	ff e3 f2 e8 	CALL 0xffa01f00 <_atoi_>;
ffa04d20:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900800 */
ffa04d24:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04d28:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04d2a:	12 91       	R2 = [P2];
ffa04d2c:	41 e1 00 ff 	R1.H = 0xff00;		/* (-256)	R1=0xff00ffff(-16711681) */
ffa04d30:	40 43       	R0 = R0.B (Z);
ffa04d32:	8a 54       	R2 = R2 & R1;
ffa04d34:	80 4f       	R0 <<= 0x10;
ffa04d36:	10 50       	R0 = R0 + R2;
ffa04d38:	10 93       	[P2] = R0;
ffa04d3a:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04d3c:	29 2f       	JUMP.S 0xffa04b8e <_httpResp+0x156>;
ffa04d3e:	45 51       	R5 = R5 + R0;
ffa04d40:	04 53       	R4 = R4 - R0;
ffa04d42:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04d44:	05 30       	R0 = R5;
ffa04d46:	ff e3 dd e8 	CALL 0xffa01f00 <_atoi_>;
ffa04d4a:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04d4e:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04d52:	f9 63       	R1 = -0x1 (X);		/*		R1=0xffffffff( -1) */
ffa04d54:	12 91       	R2 = [P2];
ffa04d56:	01 e1 ff 00 	R1.L = 0xff;		/* (255)	R1=0xffff00ff(-65281) */
ffa04d5a:	40 43       	R0 = R0.B (Z);
ffa04d5c:	8a 54       	R2 = R2 & R1;
ffa04d5e:	40 4f       	R0 <<= 0x8;
ffa04d60:	10 50       	R0 = R0 + R2;
ffa04d62:	10 93       	[P2] = R0;
ffa04d64:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04d66:	0a 2f       	JUMP.S 0xffa04b7a <_httpResp+0x142>;
ffa04d68:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04d6a:	05 50       	R0 = R5 + R0;
ffa04d6c:	ff e3 ca e8 	CALL 0xffa01f00 <_atoi_>;
ffa04d70:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04d74:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04d78:	fa 63       	R2 = -0x1 (X);		/*		R2=0xffffffff( -1) */
ffa04d7a:	11 91       	R1 = [P2];
ffa04d7c:	42 e1 ff 00 	R2.H = 0xff;		/* (255)	R2=0xffffff(16777215) */
ffa04d80:	51 54       	R1 = R1 & R2;
ffa04d82:	c0 4f       	R0 <<= 0x18;
ffa04d84:	08 50       	R0 = R0 + R1;
ffa04d86:	10 93       	[P2] = R0;
ffa04d88:	c3 2f       	JUMP.S 0xffa04d0e <_httpResp+0x2d6>;
ffa04d8a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900ac4(-7337276) */
ffa04d8e:	00 e1 30 0b 	R0.L = 0xb30;		/* (2864)	R0=0xff900b30(-7337168) */
ffa04d92:	0d 30       	R1 = R5;
ffa04d94:	14 30       	R2 = R4;
ffa04d96:	ff e3 b3 e7 	CALL 0xffa01cfc <_substr>;
ffa04d9a:	00 0c       	CC = R0 == 0x0;
ffa04d9c:	49 14       	IF !CC JUMP 0xffa04e2e <_httpResp+0x3f6> (BP);
ffa04d9e:	06 60       	R6 = 0x0 (X);		/*		R6=0x0(  0) */
ffa04da0:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900b30(-7337168) */
ffa04da4:	00 e1 38 0b 	R0.L = 0xb38;		/* (2872)	R0=0xff900b38(-7337160) */
ffa04da8:	0d 30       	R1 = R5;
ffa04daa:	14 30       	R2 = R4;
ffa04dac:	ff e3 a8 e7 	CALL 0xffa01cfc <_substr>;
ffa04db0:	00 0c       	CC = R0 == 0x0;
ffa04db2:	9d 1e       	IF CC JUMP 0xffa04aec <_httpResp+0xb4> (BP);
ffa04db4:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04db8:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04dba:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa04dbe:	10 9b       	B[P2] = R0;
ffa04dc0:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04dc2:	95 2e       	JUMP.S 0xffa04aec <_httpResp+0xb4>;
ffa04dc4:	45 51       	R5 = R5 + R0;
ffa04dc6:	04 53       	R4 = R4 - R0;
ffa04dc8:	19 60       	R1 = 0x3 (X);		/*		R1=0x3(  3) */
ffa04dca:	05 30       	R0 = R5;
ffa04dcc:	ff e3 9a e8 	CALL 0xffa01f00 <_atoi_>;
ffa04dd0:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900c40 <_g_streamEnabled> */
ffa04dd4:	0a e1 f0 0e 	P2.L = 0xef0;		/* (3824)	P2=0xff900ef0 <_NetDataDestIP> */
ffa04dd8:	11 91       	R1 = [P2];
ffa04dda:	41 4d       	R1 >>>= 0x8;
ffa04ddc:	41 4f       	R1 <<= 0x8;
ffa04dde:	40 43       	R0 = R0.B (Z);
ffa04de0:	08 50       	R0 = R0 + R1;
ffa04de2:	10 93       	[P2] = R0;
ffa04de4:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04de6:	c0 2e       	JUMP.S 0xffa04b66 <_httpResp+0x12e>;
ffa04de8:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04dec:	00 e1 30 0b 	R0.L = 0xb30;		/* (2864)	R0=0xff900b30(-7337168) */
ffa04df0:	0d 30       	R1 = R5;
ffa04df2:	14 30       	R2 = R4;
ffa04df4:	ff e3 84 e7 	CALL 0xffa01cfc <_substr>;
ffa04df8:	00 0c       	CC = R0 == 0x0;
ffa04dfa:	08 1c       	IF CC JUMP 0xffa04e0a <_httpResp+0x3d2> (BP);
ffa04dfc:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800ef0 */
ffa04e00:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04e02:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa04e06:	10 9b       	B[P2] = R0;
ffa04e08:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e0a:	40 e1 90 ff 	R0.H = 0xff90;		/* (-112)	R0=0xff900000 <_l1_data_a>(-7340032) */
ffa04e0e:	00 e1 38 0b 	R0.L = 0xb38;		/* (2872)	R0=0xff900b38(-7337160) */
ffa04e12:	0d 30       	R1 = R5;
ffa04e14:	14 30       	R2 = R4;
ffa04e16:	ff e3 73 e7 	CALL 0xffa01cfc <_substr>;
ffa04e1a:	00 0c       	CC = R0 == 0x0;
ffa04e1c:	72 1e       	IF CC JUMP 0xffa04b00 <_httpResp+0xc8> (BP);
ffa04e1e:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800808 */
ffa04e22:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04e24:	0a e1 08 08 	P2.L = 0x808;		/* (2056)	P2=0xff800808 */
ffa04e28:	10 9b       	B[P2] = R0;
ffa04e2a:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e2c:	6a 2e       	JUMP.S 0xffa04b00 <_httpResp+0xc8>;
ffa04e2e:	4a e1 90 ff 	P2.H = 0xff90;		/* (-112)	P2=0xff900808 */
ffa04e32:	08 60       	R0 = 0x1 (X);		/*		R0=0x1(  1) */
ffa04e34:	0a e1 40 0c 	P2.L = 0xc40;		/* (3136)	P2=0xff900c40 <_g_streamEnabled> */
ffa04e38:	10 9b       	B[P2] = R0;
ffa04e3a:	4a e1 80 ff 	P2.H = 0xff80;		/* (-128)	P2=0xff800c40 */
ffa04e3e:	0a e1 00 08 	P2.L = 0x800;		/* (2048)	P2=0xff800800 */
ffa04e42:	10 91       	R0 = [P2];
ffa04e44:	22 6c       	P2 += 0x4;		/* (  4) */
ffa04e46:	10 93       	[P2] = R0;
ffa04e48:	0e 60       	R6 = 0x1 (X);		/*		R6=0x1(  1) */
ffa04e4a:	ab 2f       	JUMP.S 0xffa04da0 <_httpResp+0x368>;
ffa04e4c:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04e4e:	f0 bb       	[FP -0x4] = R0;
ffa04e50:	4f 30       	R1 = FP;
ffa04e52:	42 e1 90 ff 	R2.H = 0xff90;		/* (-112)	R2=0xff90ffff(-7274497) */
ffa04e56:	20 e1 00 41 	R0 = 0x4100 (X);		/*		R0=0x4100(16640) */
ffa04e5a:	e1 67       	R1 += -0x4;		/* ( -4) */
ffa04e5c:	02 e1 ec 0a 	R2.L = 0xaec;		/* (2796)	R2=0xff900aec(-7337236) */
ffa04e60:	ff e3 d6 e6 	CALL 0xffa01c0c <_strcpy_>;
ffa04e64:	f0 b9       	R0 = [FP -0x4];
ffa04e66:	02 2e       	JUMP.S 0xffa04a6a <_httpResp+0x32>;

ffa04e68 <_httpCollate>:
ffa04e68:	fd 05       	[--SP] = (R7:7, P5:5);
ffa04e6a:	4d e1 90 ff 	P5.H = 0xff90;		/* (-112)	P5=0xff900800 */
ffa04e6e:	0d e1 e8 0f 	P5.L = 0xfe8;		/* (4072)	P5=0xff900fe8 <_g_httpRxed> */
ffa04e72:	39 30       	R7 = R1;
ffa04e74:	0a 60       	R2 = 0x1 (X);		/*		R2=0x1(  1) */
ffa04e76:	29 91       	R1 = [P5];
ffa04e78:	82 4f       	R2 <<= 0x10;
ffa04e7a:	51 50       	R1 = R1 + R2;
ffa04e7c:	00 e8 03 00 	LINK 0xc;		/* (12) */
ffa04e80:	17 30       	R2 = R7;
ffa04e82:	ff e3 95 e6 	CALL 0xffa01bac <_memcpy_>;
ffa04e86:	28 91       	R0 = [P5];
ffa04e88:	c7 51       	R7 = R7 + R0;
ffa04e8a:	2f 93       	[P5] = R7;
ffa04e8c:	01 e8 00 00 	UNLINK;
ffa04e90:	00 60       	R0 = 0x0 (X);		/*		R0=0x0(  0) */
ffa04e92:	bd 05       	(R7:7, P5:5) = [SP++];
ffa04e94:	10 00       	RTS;
	...
