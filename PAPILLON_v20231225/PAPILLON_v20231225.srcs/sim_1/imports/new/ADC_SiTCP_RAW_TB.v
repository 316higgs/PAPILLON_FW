`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/28 13:35:01
// Design Name: 
// Module Name: ADC_SiTCP_RAW_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ADC_SiTCP_RAW_TB;

  // Inputs
  reg        		SYSCLK;
  reg        		sRST;
  reg	          tag_mode;
  reg	       		RAW_TRG_TAG;
  reg	[2:0] 		RAW_NUM_TAG;
	
  reg [23:0] 		REG_HD_ID;
  reg [15:0] 		REG_WINDOW;
  reg [15:0] 		REG_LEN;
  reg [1:0] 		REG_MODE;
  reg [8*24-1:0]    REG_ADC_PDSTL;
  reg [16*24-1:0]	REG_STRIP_POSITION;
  reg [15:0]		REG_THRESHOLD;
  reg [23:0]		REG_THRESHOLD_WIDTH;
  reg [3:0]     REG_INT_NUM;
  reg [15:0]        REG_OFFSET;
  reg [1:0]		    REG_INTERLOCK;
  reg [7:0]		    REG_TAG_COUNT;

  reg 			    ENABLE;

  reg 			    RING_SOD;
  reg [31:0] 		RING_TRG_NUM;
  reg [287:0] 	    RING_ADC;

  reg 			    SiTCP_TX_AFULL;

  // Outputs
  wire 			    SiTCP_TX_WE;
  wire [7:0] 	    SiTCP_TX_WD;
  wire 			    RAW_INTERLOCK;


  //input raw data from .txt file
  reg  [11:0] data0000 [0:639];
  reg  [11:0] data0001 [0:639];
  reg  [11:0] data0002 [0:639];
  reg  [11:0] data0003 [0:639];
  reg  [11:0] data0004 [0:639];
  reg  [11:0] data0005 [0:639];
  reg  [11:0] data0006 [0:639];
  reg  [11:0] data0007 [0:639];
  reg  [11:0] data0008 [0:639];
  reg  [11:0] data0009 [0:639];
  reg  [11:0] data0010 [0:639];
  reg  [11:0] data0011 [0:639];
  reg  [11:0] data0012 [0:639];
  reg  [11:0] data0013 [0:639];
  reg  [11:0] data0014 [0:639];
  reg  [11:0] data0015 [0:639];
  reg  [11:0] data0016 [0:639];
  reg  [11:0] data0017 [0:639];
  reg  [11:0] data0018 [0:639];
  reg  [11:0] data0019 [0:639];
  reg  [11:0] data0020 [0:639];
  reg  [11:0] data0021 [0:639];
  reg  [11:0] data0022 [0:639];
  reg  [11:0] data0023 [0:639];

  reg  [11:0] data0100 [0:639];
  reg  [11:0] data0101 [0:639];
  reg  [11:0] data0102 [0:639];
  reg  [11:0] data0103 [0:639];
  reg  [11:0] data0104 [0:639];
  reg  [11:0] data0105 [0:639];
  reg  [11:0] data0106 [0:639];
  reg  [11:0] data0107 [0:639];
  reg  [11:0] data0108 [0:639];
  reg  [11:0] data0109 [0:639];
  reg  [11:0] data0110 [0:639];
  reg  [11:0] data0111 [0:639];
  reg  [11:0] data0112 [0:639];
  reg  [11:0] data0113 [0:639];
  reg  [11:0] data0114 [0:639];
  reg  [11:0] data0115 [0:639];
  reg  [11:0] data0116 [0:639];
  reg  [11:0] data0117 [0:639];
  reg  [11:0] data0118 [0:639];
  reg  [11:0] data0119 [0:639];
  reg  [11:0] data0120 [0:639];
  reg  [11:0] data0121 [0:639];
  reg  [11:0] data0122 [0:639];
  reg  [11:0] data0123 [0:639];
   
  reg  [11:0] data0200 [0:639];
  reg  [11:0] data0201 [0:639];
  reg  [11:0] data0202 [0:639];
  reg  [11:0] data0203 [0:639];
  reg  [11:0] data0204 [0:639];
  reg  [11:0] data0205 [0:639];
  reg  [11:0] data0206 [0:639];
  reg  [11:0] data0207 [0:639];
  reg  [11:0] data0208 [0:639];
  reg  [11:0] data0209 [0:639];
  reg  [11:0] data0210 [0:639];
  reg  [11:0] data0211 [0:639];
  reg  [11:0] data0212 [0:639];
  reg  [11:0] data0213 [0:639];
  reg  [11:0] data0214 [0:639];
  reg  [11:0] data0215 [0:639];
  reg  [11:0] data0216 [0:639];
  reg  [11:0] data0217 [0:639];
  reg  [11:0] data0218 [0:639];
  reg  [11:0] data0219 [0:639];
  reg  [11:0] data0220 [0:639];
  reg  [11:0] data0221 [0:639];
  reg  [11:0] data0222 [0:639];
  reg  [11:0] data0223 [0:639];

  reg  [11:0] data0300 [0:639];
  reg  [11:0] data0301 [0:639];
  reg  [11:0] data0302 [0:639];
  reg  [11:0] data0303 [0:639];
  reg  [11:0] data0304 [0:639];
  reg  [11:0] data0305 [0:639];
  reg  [11:0] data0306 [0:639];
  reg  [11:0] data0307 [0:639];
  reg  [11:0] data0308 [0:639];
  reg  [11:0] data0309 [0:639];
  reg  [11:0] data0310 [0:639];
  reg  [11:0] data0311 [0:639];
  reg  [11:0] data0312 [0:639];
  reg  [11:0] data0313 [0:639];
  reg  [11:0] data0314 [0:639];
  reg  [11:0] data0315 [0:639];
  reg  [11:0] data0316 [0:639];
  reg  [11:0] data0317 [0:639];
  reg  [11:0] data0318 [0:639];
  reg  [11:0] data0319 [0:639];
  reg  [11:0] data0320 [0:639];
  reg  [11:0] data0321 [0:639];
  reg  [11:0] data0322 [0:639];
  reg  [11:0] data0323 [0:639];

  reg  [11:0] data0400 [0:639];
  reg  [11:0] data0401 [0:639];
  reg  [11:0] data0402 [0:639];
  reg  [11:0] data0403 [0:639];
  reg  [11:0] data0404 [0:639];
  reg  [11:0] data0405 [0:639];
  reg  [11:0] data0406 [0:639];
  reg  [11:0] data0407 [0:639];
  reg  [11:0] data0408 [0:639];
  reg  [11:0] data0409 [0:639];
  reg  [11:0] data0410 [0:639];
  reg  [11:0] data0411 [0:639];
  reg  [11:0] data0412 [0:639];
  reg  [11:0] data0413 [0:639];
  reg  [11:0] data0414 [0:639];
  reg  [11:0] data0415 [0:639];
  reg  [11:0] data0416 [0:639];
  reg  [11:0] data0417 [0:639];
  reg  [11:0] data0418 [0:639];
  reg  [11:0] data0419 [0:639];
  reg  [11:0] data0420 [0:639];
  reg  [11:0] data0421 [0:639];
  reg  [11:0] data0422 [0:639];
  reg  [11:0] data0423 [0:639];

  reg  [11:0] data0500 [0:639];
  reg  [11:0] data0501 [0:639];
  reg  [11:0] data0502 [0:639];
  reg  [11:0] data0503 [0:639];
  reg  [11:0] data0504 [0:639];
  reg  [11:0] data0505 [0:639];
  reg  [11:0] data0506 [0:639];
  reg  [11:0] data0507 [0:639];
  reg  [11:0] data0508 [0:639];
  reg  [11:0] data0509 [0:639];
  reg  [11:0] data0510 [0:639];
  reg  [11:0] data0511 [0:639];
  reg  [11:0] data0512 [0:639];
  reg  [11:0] data0513 [0:639];
  reg  [11:0] data0514 [0:639];
  reg  [11:0] data0515 [0:639];
  reg  [11:0] data0516 [0:639];
  reg  [11:0] data0517 [0:639];
  reg  [11:0] data0518 [0:639];
  reg  [11:0] data0519 [0:639];
  reg  [11:0] data0520 [0:639];
  reg  [11:0] data0521 [0:639];
  reg  [11:0] data0522 [0:639];
  reg  [11:0] data0523 [0:639];
   

  integer i;
  initial begin
    RING_ADC[12*24-1:0] = 0;  //initialization
    
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch0.txt",data0000);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch1.txt",data0001);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch2.txt",data0002);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch3.txt",data0003);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch4.txt",data0004);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch5.txt",data0005);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch6.txt",data0006);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch7.txt",data0007);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch8.txt",data0008);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch9.txt",data0009);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch10.txt",data0010);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch11.txt",data0011);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch12.txt",data0012);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch13.txt",data0013);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch14.txt",data0014);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch15.txt",data0015);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch16.txt",data0016);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch17.txt",data0017);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch18.txt",data0018);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch19.txt",data0019);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch20.txt",data0020);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch21.txt",data0021);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch22.txt",data0022);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt3/run910247.papillonX.evt3.ch23.txt",data0023);

    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch0.txt",data0100);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch1.txt",data0101);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch2.txt",data0102);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch3.txt",data0103);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch4.txt",data0104);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch5.txt",data0105);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch6.txt",data0106);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch7.txt",data0107);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch8.txt",data0108);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch9.txt",data0109);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch10.txt",data0110);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch11.txt",data0111);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch12.txt",data0112);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch13.txt",data0113);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch14.txt",data0114);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch15.txt",data0115);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch16.txt",data0116);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch17.txt",data0117);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch18.txt",data0118);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch19.txt",data0119);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch20.txt",data0120);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch21.txt",data0121);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch22.txt",data0122);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910248forTB/papillonX/evt0/run910248.papillonX.evt0.ch23.txt",data0123);

    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch0.txt",data0200);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch1.txt",data0201);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch2.txt",data0202);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch3.txt",data0203);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch4.txt",data0204);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch5.txt",data0205);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch6.txt",data0206);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch7.txt",data0207);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch8.txt",data0208);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch9.txt",data0209);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch10.txt",data0210);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch11.txt",data0211);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch12.txt",data0212);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch13.txt",data0213);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch14.txt",data0214);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch15.txt",data0215);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch16.txt",data0216);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch17.txt",data0217);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch18.txt",data0218);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch19.txt",data0219);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch20.txt",data0220);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch21.txt",data0221);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch22.txt",data0222);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt4/run910247.papillonX.evt4.ch23.txt",data0223);
    
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch0.txt",data0300);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch1.txt",data0301);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch2.txt",data0302);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch3.txt",data0303);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch4.txt",data0304);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch5.txt",data0305);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch6.txt",data0306);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch7.txt",data0307);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch8.txt",data0308);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch9.txt",data0309);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch10.txt",data0310);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch11.txt",data0311);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch12.txt",data0312);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch13.txt",data0313);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch14.txt",data0314);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch15.txt",data0315);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch16.txt",data0316);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch17.txt",data0317);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch18.txt",data0318);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch19.txt",data0319);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch20.txt",data0320);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch21.txt",data0321);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch22.txt",data0322);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt5/run910247.papillonX.evt5.ch23.txt",data0323);

    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch0.txt",data0400);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch1.txt",data0401);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch2.txt",data0402);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch3.txt",data0403);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch4.txt",data0404);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch5.txt",data0405);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch6.txt",data0406);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch7.txt",data0407);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch8.txt",data0408);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch9.txt",data0409);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch10.txt",data0410);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch11.txt",data0411);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch12.txt",data0412);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch13.txt",data0413);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch14.txt",data0414);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch15.txt",data0415);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch16.txt",data0416);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch17.txt",data0417);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch18.txt",data0418);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch19.txt",data0419);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch20.txt",data0420);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch21.txt",data0421);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch22.txt",data0422);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonX/evt6/run910247.papillonX.evt6.ch23.txt",data0423);
    
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch0.txt",data0500);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch1.txt",data0501);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch2.txt",data0502);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch3.txt",data0503);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch4.txt",data0504);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch5.txt",data0505);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch6.txt",data0506);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch7.txt",data0507);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch8.txt",data0508);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch9.txt",data0509);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch10.txt",data0510);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch11.txt",data0511);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch12.txt",data0512);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch13.txt",data0513);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch14.txt",data0514);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch15.txt",data0515);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch16.txt",data0516);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch17.txt",data0517);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch18.txt",data0518);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch19.txt",data0519);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch20.txt",data0520);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch21.txt",data0521);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch22.txt",data0522);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/Run910247forTB/papillonY/evt7/run910247.papillonY.evt7.ch23.txt",data0523);

    @(posedge SYSCLK);
	
    while( sRST == 1'b1 ) @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin            //loop 640 samples
      RING_ADC[11:0]  <= data0000[i];   //12 bit for ch0
      RING_ADC[23:12] <= data0001[i];   //12 bit for ch1
      RING_ADC[35:24]	<= data0002[i];   //12 bit for ch3
      RING_ADC[47:36] <= data0003[i];
      RING_ADC[59:48]	<= data0004[i];
      RING_ADC[71:60]	<= data0005[i];
      RING_ADC[83:72]	<= data0006[i];
      RING_ADC[95:84]	<= data0007[i];
      RING_ADC[107:96]  <= data0008[i];
      RING_ADC[119:108] <= data0009[i];
      RING_ADC[131:120] <= data0010[i];
      RING_ADC[143:132] <= data0011[i];
      RING_ADC[155:144] <= data0012[i];
      RING_ADC[167:156] <= data0013[i];
      RING_ADC[179:168] <= data0014[i];
      RING_ADC[191:180] <= data0015[i];
      RING_ADC[203:192] <= data0016[i];
      RING_ADC[215:204] <= data0017[i];
      RING_ADC[227:216] <= data0018[i];
      RING_ADC[239:228] <= data0019[i];
      RING_ADC[251:240] <= data0020[i];   //12 bit for ch20
      RING_ADC[263:252] <= data0021[i];   //12 bit for ch21
      RING_ADC[275:264] <= data0022[i];   //12 bit for ch22
      RING_ADC[287:276] <= data0023[i];   //12 bit for ch23
      @(negedge ENABLE);
    end
	   
	while(RING_SOD==1'b0)@(posedge SYSCLK); 
    //repeat( 1 )  @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]	<=data0100[i];
      RING_ADC[23:12]	<=data0101[i];
      RING_ADC[35:24]	<=data0102[i];
      RING_ADC[47:36]	<=data0103[i];
      RING_ADC[59:48]	<=data0104[i];
      RING_ADC[71:60]	<=data0105[i];
      RING_ADC[83:72]	<=data0106[i];
      RING_ADC[95:84]	<=data0107[i];
      RING_ADC[107:96]	<=data0108[i];
      RING_ADC[119:108]	<=data0109[i];
      RING_ADC[131:120]	<=data0110[i];
      RING_ADC[143:132]	<=data0111[i];
      RING_ADC[155:144]	<=data0112[i];
      RING_ADC[167:156]	<=data0113[i];
      RING_ADC[179:168]	<=data0114[i];
      RING_ADC[191:180]	<=data0115[i];
      RING_ADC[203:192]	<=data0116[i];
      RING_ADC[215:204]	<=data0117[i];
      RING_ADC[227:216]	<=data0118[i];
      RING_ADC[239:228]	<=data0119[i];
      RING_ADC[251:240]	<=data0120[i];
      RING_ADC[263:252]	<=data0121[i];
      RING_ADC[275:264]	<=data0122[i];
      RING_ADC[287:276]	<=data0123[i];
      @(negedge ENABLE);
    end
    
    while(RING_SOD==1'b0)@(posedge SYSCLK); 
    //repeat( 1 )  @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]	<=data0200[i];
      RING_ADC[23:12]	<=data0201[i];
      RING_ADC[35:24]	<=data0202[i];
      RING_ADC[47:36]	<=data0203[i];
      RING_ADC[59:48]	<=data0204[i];
      RING_ADC[71:60]	<=data0205[i];
      RING_ADC[83:72]	<=data0206[i];
      RING_ADC[95:84]	<=data0207[i];
      RING_ADC[107:96]	<=data0208[i];
      RING_ADC[119:108]	<=data0209[i];
      RING_ADC[131:120]	<=data0210[i];
      RING_ADC[143:132]	<=data0211[i];
      RING_ADC[155:144]	<=data0212[i];
      RING_ADC[167:156]	<=data0213[i];
      RING_ADC[179:168]	<=data0214[i];
      RING_ADC[191:180]	<=data0215[i];
      RING_ADC[203:192]	<=data0216[i];
      RING_ADC[215:204]	<=data0217[i];
      RING_ADC[227:216]	<=data0218[i];
      RING_ADC[239:228]	<=data0219[i];
      RING_ADC[251:240]	<=data0220[i];
      RING_ADC[263:252]	<=data0221[i];
      RING_ADC[275:264]	<=data0222[i];
      RING_ADC[287:276]	<=data0223[i];
      @(negedge ENABLE);
    end
    
    while(RING_SOD==1'b0)@(posedge SYSCLK); 
    //repeat( 1 )  @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]	<=data0300[i];
      RING_ADC[23:12]	<=data0301[i];
      RING_ADC[35:24]	<=data0302[i];
      RING_ADC[47:36]	<=data0303[i];
      RING_ADC[59:48]	<=data0304[i];
      RING_ADC[71:60]	<=data0305[i];
      RING_ADC[83:72]	<=data0306[i];
      RING_ADC[95:84]	<=data0307[i];
      RING_ADC[107:96]	<=data0308[i];
      RING_ADC[119:108]	<=data0309[i];
      RING_ADC[131:120]	<=data0310[i];
      RING_ADC[143:132]	<=data0311[i];
      RING_ADC[155:144]	<=data0312[i];
      RING_ADC[167:156]	<=data0313[i];
      RING_ADC[179:168]	<=data0314[i];
      RING_ADC[191:180]	<=data0315[i];
      RING_ADC[203:192]	<=data0316[i];
      RING_ADC[215:204]	<=data0317[i];
      RING_ADC[227:216]	<=data0318[i];
      RING_ADC[239:228]	<=data0319[i];
      RING_ADC[251:240]	<=data0320[i];
      RING_ADC[263:252]	<=data0321[i];
      RING_ADC[275:264]	<=data0322[i];
      RING_ADC[287:276]	<=data0323[i];
      @(negedge ENABLE);
    end

    while(RING_SOD==1'b0)@(posedge SYSCLK); 
    //repeat( 1 )  @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]	<=data0400[i];
      RING_ADC[23:12]	<=data0401[i];
      RING_ADC[35:24]	<=data0402[i];
      RING_ADC[47:36]	<=data0403[i];
      RING_ADC[59:48]	<=data0404[i];
      RING_ADC[71:60]	<=data0405[i];
      RING_ADC[83:72]	<=data0406[i];
      RING_ADC[95:84]	<=data0407[i];
      RING_ADC[107:96]	<=data0408[i];
      RING_ADC[119:108]	<=data0409[i];
      RING_ADC[131:120]	<=data0410[i];
      RING_ADC[143:132]	<=data0411[i];
      RING_ADC[155:144]	<=data0412[i];
      RING_ADC[167:156]	<=data0413[i];
      RING_ADC[179:168]	<=data0414[i];
      RING_ADC[191:180]	<=data0415[i];
      RING_ADC[203:192]	<=data0416[i];
      RING_ADC[215:204]	<=data0417[i];
      RING_ADC[227:216]	<=data0418[i];
      RING_ADC[239:228]	<=data0419[i];
      RING_ADC[251:240]	<=data0420[i];
      RING_ADC[263:252]	<=data0421[i];
      RING_ADC[275:264]	<=data0422[i];
      RING_ADC[287:276]	<=data0423[i];
      @(negedge ENABLE);
    end

    while(RING_SOD==1'b0)@(posedge SYSCLK); 
    //repeat( 1 )  @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]	<=data0500[i];
      RING_ADC[23:12]	<=data0501[i];
      RING_ADC[35:24]	<=data0502[i];
      RING_ADC[47:36]	<=data0503[i];
      RING_ADC[59:48]	<=data0504[i];
      RING_ADC[71:60]	<=data0505[i];
      RING_ADC[83:72]	<=data0506[i];
      RING_ADC[95:84]	<=data0507[i];
      RING_ADC[107:96]	<=data0508[i];
      RING_ADC[119:108]	<=data0509[i];
      RING_ADC[131:120]	<=data0510[i];
      RING_ADC[143:132]	<=data0511[i];
      RING_ADC[155:144]	<=data0512[i];
      RING_ADC[167:156]	<=data0513[i];
      RING_ADC[179:168]	<=data0514[i];
      RING_ADC[191:180]	<=data0515[i];
      RING_ADC[203:192]	<=data0516[i];
      RING_ADC[215:204]	<=data0517[i];
      RING_ADC[227:216]	<=data0518[i];
      RING_ADC[239:228]	<=data0519[i];
      RING_ADC[251:240]	<=data0520[i];
      RING_ADC[263:252]	<=data0521[i];
      RING_ADC[275:264]	<=data0522[i];
      RING_ADC[287:276]	<=data0523[i];
      @(negedge ENABLE);
    end

  end   
   
 
  ADC_SiTCP_RAW uut_RAW (
	.SYSCLK(SYSCLK), 
	.sRST(sRST), 
	.tag_mode(tag_mode),
	.RAW_TRG_TAG(RAW_TRG_TAG),   //in:trigger from GP-IO
	.RAW_NUM_TAG(RAW_NUM_TAG),   //in:TAG number from GP-IO
	.REG_HD_ID(REG_HD_ID), 
	.REG_WINDOW(REG_WINDOW), 
	.REG_LEN(REG_LEN),
	.REG_MODE(REG_MODE),
	.REG_ADC_PDSTL(REG_ADC_PDSTL),
	.REG_STRIP_POSITION(REG_STRIP_POSITION) ,
  .REG_THRESHOLD(REG_THRESHOLD),
	.REG_THRESHOLD_WIDTH(REG_THRESHOLD_WIDTH),
  .REG_INT_NUM(REG_INT_NUM),
  .REG_OFFSET(REG_OFFSET),
  .REG_INTERLOCK(REG_INTERLOCK),
  .REG_TAG_COUNT(REG_TAG_COUNT),
	.ENABLE(ENABLE),
	.RING_SOD(RING_SOD), 
	.RING_TRG_NUM(RING_TRG_NUM), 
	.RING_ADC(RING_ADC), 
	.SiTCP_TX_AFULL(SiTCP_TX_AFULL), 
	.SiTCP_TX_WE(SiTCP_TX_WE), 
	.SiTCP_TX_WD(SiTCP_TX_WD),
	.RAW_INTERLOCK(RAW_INTERLOCK)
  );


  //CLOCK 25MHz 
  parameter STEP = 6.25;  //nsec -> 160MHz

  always begin
    SYSCLK = 0; #(STEP/2);
	  SYSCLK = 1; #(STEP/2);	
  end
	

  //THINNING	
  reg  [3:0] clk_count;
  always begin
    clk_count = clk_count + 1; #(STEP);
    if ( clk_count == 2 ) begin  
      ENABLE = 1;
      clk_count  = 0;
    end else begin
      ENABLE = 0;
    end
  end
	
	
  initial begin
	  // Initialize Inputs
	  SYSCLK = 0;
	  sRST = 1;

    //Setting register variables 
	  REG_HD_ID  = 24'h012345;

    //Original config
	  REG_WINDOW = 16'd640;
	  REG_LEN    = 16'd1279;

    //Test1
    //REG_WINDOW = 16'd320;
	  //REG_LEN    = 16'd639;

    //Test2
    //REG_WINDOW = 16'd1280;
	  //REG_LEN    = 16'd2559;
		
	  REG_STRIP_POSITION[16*1-1:16*0]  <=16'hEBF4;
    REG_STRIP_POSITION[16*2-1:16*1]  <=16'hEDB6;
    REG_STRIP_POSITION[16*3-1:16*2]  <=16'hEF78;
    REG_STRIP_POSITION[16*4-1:16*3]  <=16'hF13A;
    REG_STRIP_POSITION[16*5-1:16*4]  <=16'hF2FC;
    REG_STRIP_POSITION[16*6-1:16*5]  <=16'hF4BE;
    REG_STRIP_POSITION[16*7-1:16*6]  <=16'hF680;
    REG_STRIP_POSITION[16*8-1:16*7]  <=16'hF842;
    REG_STRIP_POSITION[16*9-1:16*8]  <=16'hFA04;
    REG_STRIP_POSITION[16*10-1:16*9] <=16'hFBC6;
    REG_STRIP_POSITION[16*11-1:16*10]<=16'hFD88;
    REG_STRIP_POSITION[16*12-1:16*11]<=16'hFF4A;
    REG_STRIP_POSITION[16*13-1:16*12]<=16'h010B;
    REG_STRIP_POSITION[16*14-1:16*13]<=16'h02CD;
    REG_STRIP_POSITION[16*15-1:16*14]<=16'h048F;
    REG_STRIP_POSITION[16*16-1:16*15]<=16'h0651;
    REG_STRIP_POSITION[16*17-1:16*16]<=16'h0813;
    REG_STRIP_POSITION[16*18-1:16*17]<=16'h09D5;
    REG_STRIP_POSITION[16*19-1:16*18]<=16'h0B97;
    REG_STRIP_POSITION[16*20-1:16*19]<=16'h0D59;
    REG_STRIP_POSITION[16*21-1:16*20]<=16'h0F1B;
    REG_STRIP_POSITION[16*22-1:16*21]<=16'h10DD;
    REG_STRIP_POSITION[16*23-1:16*22]<=16'h129F;
    REG_STRIP_POSITION[16*24-1:16*23]<=16'h1461;

    REG_ADC_PDSTL[8*1-1:8*0]  <=8'h86;
    REG_ADC_PDSTL[8*2-1:8*1]  <=8'h85;
    REG_ADC_PDSTL[8*3-1:8*2]  <=8'h84;
    REG_ADC_PDSTL[8*4-1:8*3]  <=8'h87;
    REG_ADC_PDSTL[8*5-1:8*4]  <=8'h88;
    REG_ADC_PDSTL[8*6-1:8*5]  <=8'h8D;
    REG_ADC_PDSTL[8*7-1:8*6]  <=8'h93;
    REG_ADC_PDSTL[8*8-1:8*7]  <=8'h8A;
    REG_ADC_PDSTL[8*9-1:8*8]  <=8'h8C;
    REG_ADC_PDSTL[8*10-1:8*9] <=8'h8C;
    REG_ADC_PDSTL[8*11-1:8*10]<=8'h8F;
    REG_ADC_PDSTL[8*12-1:8*11]<=8'h87;
    REG_ADC_PDSTL[8*13-1:8*12]<=8'h8A;
    REG_ADC_PDSTL[8*14-1:8*13]<=8'h89;
    REG_ADC_PDSTL[8*15-1:8*14]<=8'h82;
    REG_ADC_PDSTL[8*16-1:8*15]<=8'h8B;
    REG_ADC_PDSTL[8*17-1:8*16]<=8'h87;
    REG_ADC_PDSTL[8*18-1:8*17]<=8'h89;
    REG_ADC_PDSTL[8*19-1:8*18]<=8'h93;
    REG_ADC_PDSTL[8*20-1:8*19]<=8'h85;
    REG_ADC_PDSTL[8*21-1:8*20]<=8'h85;
    REG_ADC_PDSTL[8*22-1:8*21]<=8'h8E;
    REG_ADC_PDSTL[8*23-1:8*22]<=8'h89;
    REG_ADC_PDSTL[8*24-1:8*23]<=8'h8A;
		                                          
    REG_INTERLOCK=2'b00;  
    //REG_INTERLOCK=2'b01;
	  REG_TAG_COUNT=8'd10;
                                                  
    REG_THRESHOLD=16'd150;       // 1.5 mm
	  REG_THRESHOLD_WIDTH=24'd500; // 5.0 mm

    REG_INT_NUM = 4'd2;

	  tag_mode       = 1'b1;
    //tag_mode       = 1'b0;
	  RAW_TRG_TAG    = 1'b0;
	  RAW_NUM_TAG    = 3'd0;
    REG_OFFSET     = 16'd0;
	  REG_MODE       =  1;

	  ENABLE         = 0;

	  RING_SOD       = 0;
	  RING_TRG_NUM   = 100; //0d100 = 0x64
    //RING_ADC = 0;
	  SiTCP_TX_AFULL = 0;
    //counter = 12'h0;
    clk_count      = 1;

    // Wait 100 ns for global reset to finish
	  #(STEP*3) 		sRST = 0;

    //Trigger design (1st)
    #(STEP*8)      RING_SOD = 1;  //50nsec
	  #(STEP*2)   	RING_SOD = 0;
		
    //VME event tag (1st)
	  #(STEP*32000) RAW_TRG_TAG=1'b1;
	  #(STEP*16)	RAW_TRG_TAG=1'b0;
	  #(STEP*8)		RAW_NUM_TAG=2'd1;


    //Trigger design (2nd)
	  #(STEP*62500-STEP)    RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
		
    //VME event tag (2nd)
	  #(STEP*32000) 	RAW_TRG_TAG=1'b1;
	  #(STEP*16)		RAW_TRG_TAG=1'b0;
	  #(STEP*8)		RAW_NUM_TAG=2'd2;
		
    //Trigger design (3rd)
	  #(STEP*62500-STEP)    RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
        
    //VME event tag (3rd)
    #(STEP*32000)   RAW_TRG_TAG=1'b1;
    #(STEP*16)      RAW_TRG_TAG=1'b0;
    #(STEP*8)       RAW_NUM_TAG=2'd3;
        
    //Trigger design (4th)
	  #(STEP*62500-STEP)    RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
        
    //VME event tag (4th)
    #(STEP*32000)     RAW_TRG_TAG=1'b1;
    #(STEP*16)        RAW_TRG_TAG=1'b0;
    #(STEP*8)        RAW_NUM_TAG=2'd0;
		
    //Interlock signal
	  #(STEP*62500-STEP) 	REG_INTERLOCK=2'b10;  // reset
    #(STEP*20000) 	REG_INTERLOCK=2'b00;  // reset
	  
	  #(STEP*30000) 	REG_INTERLOCK=2'b01;  // manual interlock
	  
	  #(STEP*20000) 	REG_INTERLOCK=2'b10;  // reset
    #(STEP*20000) 	REG_INTERLOCK=2'b00;  // reset

    #(STEP*30000) 	REG_INTERLOCK=2'b01;  // manual interlock

    #(STEP*20000) 	REG_INTERLOCK=2'b10;  // reset
    #(STEP*20000) 	REG_INTERLOCK=2'b00;  // reset

    #(STEP*30000) 	sRST = 1;
    #(STEP*3) 		sRST = 0;


    //Trigger design (5th)
	  #(STEP*62500-STEP)    RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
        
    //VME event tag (5th)
    #(STEP*32000)     RAW_TRG_TAG=1'b1;
    #(STEP*16)        RAW_TRG_TAG=1'b0;
    #(STEP*8)        RAW_NUM_TAG=2'd0;


    REG_STRIP_POSITION[16*1-1:16*0]  <=16'hE9D9;
    REG_STRIP_POSITION[16*2-1:16*1]  <=16'hEB9A;
    REG_STRIP_POSITION[16*3-1:16*2]  <=16'hED5B;
    REG_STRIP_POSITION[16*4-1:16*3]  <=16'hEF1C;
    REG_STRIP_POSITION[16*5-1:16*4]  <=16'hF0DD;
    REG_STRIP_POSITION[16*6-1:16*5]  <=16'hF29F;
    REG_STRIP_POSITION[16*7-1:16*6]  <=16'hF460;
    REG_STRIP_POSITION[16*8-1:16*7]  <=16'hF621;
    REG_STRIP_POSITION[16*9-1:16*8]  <=16'hF7E2;
    REG_STRIP_POSITION[16*10-1:16*9] <=16'hF9A3;
    REG_STRIP_POSITION[16*11-1:16*10]<=16'hFB64;
    REG_STRIP_POSITION[16*12-1:16*11]<=16'hFD25;
    REG_STRIP_POSITION[16*13-1:16*12]<=16'hFEE6;
    REG_STRIP_POSITION[16*14-1:16*13]<=16'h00A6;
    REG_STRIP_POSITION[16*15-1:16*14]<=16'h0267;
    REG_STRIP_POSITION[16*16-1:16*15]<=16'h0429;
    REG_STRIP_POSITION[16*17-1:16*16]<=16'h05EA;
    REG_STRIP_POSITION[16*18-1:16*17]<=16'h07AB;
    REG_STRIP_POSITION[16*19-1:16*18]<=16'h096C;
    REG_STRIP_POSITION[16*20-1:16*19]<=16'h0B2D;
    REG_STRIP_POSITION[16*21-1:16*20]<=16'h0CEE;
    REG_STRIP_POSITION[16*22-1:16*21]<=16'h0EAF;
    REG_STRIP_POSITION[16*23-1:16*22]<=16'h1070;
    REG_STRIP_POSITION[16*24-1:16*23]<=16'h1231;

    //Trigger design (6th)
	  #(STEP*62500-STEP)    RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
        
    //VME event tag (6th)
    #(STEP*32000)     RAW_TRG_TAG=1'b1;
    #(STEP*16)        RAW_TRG_TAG=1'b0;
    #(STEP*8)        RAW_NUM_TAG=2'd0;

    #(STEP*62500-STEP) 	sRST = 1;
    #(STEP*3) 		sRST = 0;
		
    //Finish simulation
	  #(STEP*40000) $finish;
  end
      
endmodule