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
   
  /*reg  [11:0] data0200 [0:639];
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
  reg  [11:0] data0323 [0:639];*/
   

  integer i;
  initial begin
    RING_ADC[12*24-1:0] = 0;  //initialization
   
    //extracting raw ADC data from given .txt files 
    /*$readmemh("../../../../../yamasu_data/evt749_P101_0ch.txt",data0000);          
    $readmemh("../../../../../yamasu_data/evt749_P101_1ch.txt",data0001);       
    $readmemh("../../../../../yamasu_data/evt749_P101_2ch.txt",data0002);       
    $readmemh("../../../../../yamasu_data/evt749_P101_3ch.txt",data0003);       
    $readmemh("../../../../../yamasu_data/evt749_P101_4ch.txt",data0004);       
    $readmemh("../../../../../yamasu_data/evt749_P101_5ch.txt",data0005);       
    $readmemh("../../../../../yamasu_data/evt749_P101_6ch.txt",data0006);       
    $readmemh("../../../../../yamasu_data/evt749_P101_7ch.txt",data0007);       
    $readmemh("../../../../../yamasu_data/evt749_P101_8ch.txt",data0008);       
    $readmemh("../../../../../yamasu_data/evt749_P101_9ch.txt",data0009);       
    $readmemh("../../../../../yamasu_data/evt749_P101_10ch.txt",data0010);      
    $readmemh("../../../../../yamasu_data/evt749_P101_11ch.txt",data0011);      
    $readmemh("../../../../../yamasu_data/evt749_P101_12ch.txt",data0012);      
    $readmemh("../../../../../yamasu_data/evt749_P101_13ch.txt",data0013);      
    $readmemh("../../../../../yamasu_data/evt749_P101_14ch.txt",data0014);      
    $readmemh("../../../../../yamasu_data/evt749_P101_15ch.txt",data0015);      
    $readmemh("../../../../../yamasu_data/evt749_P101_16ch.txt",data0016);      
    $readmemh("../../../../../yamasu_data/evt749_P101_17ch.txt",data0017);      
    $readmemh("../../../../../yamasu_data/evt749_P101_18ch.txt",data0018);      
    $readmemh("../../../../../yamasu_data/evt749_P101_19ch.txt",data0019);      
    $readmemh("../../../../../yamasu_data/evt749_P101_20ch.txt",data0020);      
    $readmemh("../../../../../yamasu_data/evt749_P101_21ch.txt",data0021);      
    $readmemh("../../../../../yamasu_data/evt749_P101_22ch.txt",data0022);      
    $readmemh("../../../../../yamasu_data/evt749_P101_23ch.txt",data0023);*/
    
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_0ch.txt",data0000);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_1ch.txt",data0001);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_2ch.txt",data0002);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_3ch.txt",data0003);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_4ch.txt",data0004);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_5ch.txt",data0005);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_6ch.txt",data0006);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_7ch.txt",data0007);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_8ch.txt",data0008);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_9ch.txt",data0009);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_10ch.txt",data0010);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_11ch.txt",data0011);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_12ch.txt",data0012);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_13ch.txt",data0013);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_14ch.txt",data0014);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_15ch.txt",data0015);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_16ch.txt",data0016);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_17ch.txt",data0017);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_18ch.txt",data0018);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_19ch.txt",data0019);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_20ch.txt",data0020);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_21ch.txt",data0021);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_22ch.txt",data0022);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_23ch.txt",data0023);

	/*$readmemh("../../../../../yamasu_data/evt749_P102_0ch.txt",data0100);
    $readmemh("../../../../../yamasu_data/evt749_P102_1ch.txt",data0101);
    $readmemh("../../../../../yamasu_data/evt749_P102_2ch.txt",data0102);
    $readmemh("../../../../../yamasu_data/evt749_P102_3ch.txt",data0103);
    $readmemh("../../../../../yamasu_data/evt749_P102_4ch.txt",data0104);
    $readmemh("../../../../../yamasu_data/evt749_P102_5ch.txt",data0105);
    $readmemh("../../../../../yamasu_data/evt749_P102_6ch.txt",data0106);
    $readmemh("../../../../../yamasu_data/evt749_P102_7ch.txt",data0107);
    $readmemh("../../../../../yamasu_data/evt749_P102_8ch.txt",data0108);
    $readmemh("../../../../../yamasu_data/evt749_P102_9ch.txt",data0109);
    $readmemh("../../../../../yamasu_data/evt749_P102_10ch.txt",data0110);
    $readmemh("../../../../../yamasu_data/evt749_P102_11ch.txt",data0111);
    $readmemh("../../../../../yamasu_data/evt749_P102_12ch.txt",data0112);
    $readmemh("../../../../../yamasu_data/evt749_P102_13ch.txt",data0113);
    $readmemh("../../../../../yamasu_data/evt749_P102_14ch.txt",data0114);
    $readmemh("../../../../../yamasu_data/evt749_P102_15ch.txt",data0115);
    $readmemh("../../../../../yamasu_data/evt749_P102_16ch.txt",data0116);
    $readmemh("../../../../../yamasu_data/evt749_P102_17ch.txt",data0117);
    $readmemh("../../../../../yamasu_data/evt749_P102_18ch.txt",data0118);
    $readmemh("../../../../../yamasu_data/evt749_P102_19ch.txt",data0119);
    $readmemh("../../../../../yamasu_data/evt749_P102_20ch.txt",data0120);
    $readmemh("../../../../../yamasu_data/evt749_P102_21ch.txt",data0121);
    $readmemh("../../../../../yamasu_data/evt749_P102_22ch.txt",data0122);
    $readmemh("../../../../../yamasu_data/evt749_P102_23ch.txt",data0123);*/
    
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_0ch.txt",data0100);          
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_1ch.txt",data0101);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_2ch.txt",data0102);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_3ch.txt",data0103);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_4ch.txt",data0104);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_5ch.txt",data0105);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_6ch.txt",data0106);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_7ch.txt",data0107);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_8ch.txt",data0108);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_9ch.txt",data0109);       
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_10ch.txt",data0110);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_11ch.txt",data0111);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_12ch.txt",data0112);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_13ch.txt",data0113);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_14ch.txt",data0114);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_15ch.txt",data0115);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_16ch.txt",data0116);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_17ch.txt",data0117);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_18ch.txt",data0118);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_19ch.txt",data0119);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_20ch.txt",data0120);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_21ch.txt",data0121);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_22ch.txt",data0122);      
    $readmemh("C:/Users/81802/Desktop/PAPILLON_FW/yamasu_data/evt749_P102_23ch.txt",data0123);    
    /*$readmemh("../../../../run0770191/evt40_P101_0ch.txt",data0200);
    $readmemh("../../../../run0770191/evt40_P101_1ch.txt",data0201);
    $readmemh("../../../../run0770191/evt40_P101_2ch.txt",data0202);
    $readmemh("../../../../run0770191/evt40_P101_3ch.txt",data0203);
    $readmemh("../../../../run0770191/evt40_P101_4ch.txt",data0204);
    $readmemh("../../../../run0770191/evt40_P101_5ch.txt",data0205);
    $readmemh("../../../../run0770191/evt40_P101_6ch.txt",data0206);
    $readmemh("../../../../run0770191/evt40_P101_7ch.txt",data0207);
    $readmemh("../../../../run0770191/evt40_P101_8ch.txt",data0208);
    $readmemh("../../../../run0770191/evt40_P101_9ch.txt",data0209);
    $readmemh("../../../../run0770191/evt40_P101_10ch.txt",data0210);
    $readmemh("../../../../run0770191/evt40_P101_11ch.txt",data0211);
    $readmemh("../../../../run0770191/evt40_P101_12ch.txt",data0212);
    $readmemh("../../../../run0770191/evt40_P101_13ch.txt",data0213);
    $readmemh("../../../../run0770191/evt40_P101_14ch.txt",data0214);
    $readmemh("../../../../run0770191/evt40_P101_15ch.txt",data0215);
    $readmemh("../../../../run0770191/evt40_P101_16ch.txt",data0216);
    $readmemh("../../../../run0770191/evt40_P101_17ch.txt",data0217);
    $readmemh("../../../../run0770191/evt40_P101_18ch.txt",data0218);
    $readmemh("../../../../run0770191/evt40_P101_19ch.txt",data0219);
    $readmemh("../../../../run0770191/evt40_P101_20ch.txt",data0220);
    $readmemh("../../../../run0770191/evt40_P101_21ch.txt",data0221);
    $readmemh("../../../../run0770191/evt40_P101_22ch.txt",data0222);
    $readmemh("../../../../run0770191/evt40_P101_23ch.txt",data0223); 	
    
    $readmemh("../../../../run0770191/evt50_P101_0ch.txt",data0300);
    $readmemh("../../../../run0770191/evt50_P101_1ch.txt",data0301);
    $readmemh("../../../../run0770191/evt50_P101_2ch.txt",data0302);
    $readmemh("../../../../run0770191/evt50_P101_3ch.txt",data0303);
    $readmemh("../../../../run0770191/evt50_P101_4ch.txt",data0304);
    $readmemh("../../../../run0770191/evt50_P101_5ch.txt",data0305);
    $readmemh("../../../../run0770191/evt50_P101_6ch.txt",data0306);
    $readmemh("../../../../run0770191/evt50_P101_7ch.txt",data0307);
    $readmemh("../../../../run0770191/evt50_P101_8ch.txt",data0308);
    $readmemh("../../../../run0770191/evt50_P101_9ch.txt",data0309);
    $readmemh("../../../../run0770191/evt50_P101_10ch.txt",data0310);
    $readmemh("../../../../run0770191/evt50_P101_11ch.txt",data0311);
    $readmemh("../../../../run0770191/evt50_P101_12ch.txt",data0312);
    $readmemh("../../../../run0770191/evt50_P101_13ch.txt",data0313);
    $readmemh("../../../../run0770191/evt50_P101_14ch.txt",data0314);
    $readmemh("../../../../run0770191/evt50_P101_15ch.txt",data0315);
    $readmemh("../../../../run0770191/evt50_P101_16ch.txt",data0316);
    $readmemh("../../../../run0770191/evt50_P101_17ch.txt",data0317);
    $readmemh("../../../../run0770191/evt50_P101_18ch.txt",data0318);
    $readmemh("../../../../run0770191/evt50_P101_19ch.txt",data0319);
    $readmemh("../../../../run0770191/evt50_P101_20ch.txt",data0320);
    $readmemh("../../../../run0770191/evt50_P101_21ch.txt",data0321);
    $readmemh("../../../../run0770191/evt50_P101_22ch.txt",data0322);
    $readmemh("../../../../run0770191/evt50_P101_23ch.txt",data0323); */
    

    @(posedge SYSCLK);
	
    while( sRST == 1'b1 ) @(posedge SYSCLK);
    repeat( 12 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin            //loop 640 samples
      RING_ADC[11:0]    <= data0000[i];   //12 bit for ch0
      RING_ADC[23:12]   <= data0001[i];   //12 bit for ch1
      //RING_ADC[23:12]   <= data0001[i];   //12 bit for ch2
      RING_ADC[35:24]	<= data0002[i];   //12 bit for ch3
      RING_ADC[47:36]   <= data0003[i];
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
    repeat( 1 )  @(posedge SYSCLK);
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
        
    /*while(RING_SOD==1'b0)@(posedge SYSCLK); 
    repeat( 1 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]     <=data0200[i];
      RING_ADC[23:12]    <=data0201[i];
      RING_ADC[35:24]    <=data0202[i];
      RING_ADC[47:36]    <=data0203[i];
      RING_ADC[59:48]    <=data0204[i];
      RING_ADC[71:60]    <=data0205[i];
      RING_ADC[83:72]    <=data0206[i];
      RING_ADC[95:84]    <=data0207[i];
      RING_ADC[107:96]   <=data0208[i];
      RING_ADC[119:108]  <=data0209[i];
      RING_ADC[131:120]  <=data0210[i];
      RING_ADC[143:132]  <=data0211[i];
      RING_ADC[155:144]  <=data0212[i];
      RING_ADC[167:156]  <=data0213[i];
      RING_ADC[179:168]  <=data0214[i];
      RING_ADC[191:180]  <=data0215[i];
      RING_ADC[203:192]  <=data0216[i];
      RING_ADC[215:204]  <=data0217[i];
      RING_ADC[227:216]  <=data0218[i];
      RING_ADC[239:228]  <=data0219[i];
      RING_ADC[251:240]  <=data0220[i];
      RING_ADC[263:252]  <=data0221[i];
      RING_ADC[275:264]  <=data0222[i];
      RING_ADC[287:276]  <=data0223[i];
      @(negedge ENABLE);
    end
             
    while(RING_SOD==1'b0)@(posedge SYSCLK); 
    repeat( 1 )  @(posedge SYSCLK);
    for(i=0; i<640;i=i+1)begin 
      RING_ADC[11:0]     <=data0300[i];
      RING_ADC[23:12]    <=data0301[i];
      RING_ADC[35:24]    <=data0302[i];
      RING_ADC[47:36]    <=data0303[i];
      RING_ADC[59:48]    <=data0304[i];
      RING_ADC[71:60]    <=data0305[i];
      RING_ADC[83:72]    <=data0306[i];
      RING_ADC[95:84]    <=data0307[i];
      RING_ADC[107:96]   <=data0308[i];
      RING_ADC[119:108]  <=data0309[i];
      RING_ADC[131:120]  <=data0310[i];
      RING_ADC[143:132]  <=data0311[i];
      RING_ADC[155:144]  <=data0312[i];
      RING_ADC[167:156]  <=data0313[i];
      RING_ADC[179:168]  <=data0314[i];
      RING_ADC[191:180]  <=data0315[i];
      RING_ADC[203:192]  <=data0316[i];
      RING_ADC[215:204]  <=data0317[i];
      RING_ADC[227:216]  <=data0318[i];
      RING_ADC[239:228]  <=data0319[i];
      RING_ADC[251:240]  <=data0320[i];
      RING_ADC[263:252]  <=data0321[i];
      RING_ADC[275:264]  <=data0322[i];
      RING_ADC[287:276]  <=data0323[i];
      @(negedge ENABLE);
    end*/

  end   //initial begin-end
   
 
  // Instantiate the Unit Under Test (UUT)
  ADC_SiTCP_RAW uut (
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
		
	  REG_STRIP_POSITION[16*1-1:16*0]  <=16'hE542;
    REG_STRIP_POSITION[16*2-1:16*1]  <=16'hE79A;
    REG_STRIP_POSITION[16*3-1:16*2]  <=16'hE9F2;
    REG_STRIP_POSITION[16*4-1:16*3]  <=16'hEC4A;
    REG_STRIP_POSITION[16*5-1:16*4]  <=16'hEEA2;
    REG_STRIP_POSITION[16*6-1:16*5]  <=16'hF0FA;
    REG_STRIP_POSITION[16*7-1:16*6]  <=16'hF352;
    REG_STRIP_POSITION[16*8-1:16*7]  <=16'hF5AA;
    REG_STRIP_POSITION[16*9-1:16*8]  <=16'hF802;
    REG_STRIP_POSITION[16*10-1:16*9] <=16'hFA5A;
    REG_STRIP_POSITION[16*11-1:16*10]<=16'hFCB2;
    REG_STRIP_POSITION[16*12-1:16*11]<=16'hFF0A;
    REG_STRIP_POSITION[16*13-1:16*12]<=16'h0161;
    REG_STRIP_POSITION[16*14-1:16*13]<=16'h03B9;
    REG_STRIP_POSITION[16*15-1:16*14]<=16'h0611;
    REG_STRIP_POSITION[16*16-1:16*15]<=16'h0869;
    REG_STRIP_POSITION[16*17-1:16*16]<=16'h0AC1;
    REG_STRIP_POSITION[16*18-1:16*17]<=16'h0D19;
    REG_STRIP_POSITION[16*19-1:16*18]<=16'h0F71;
    REG_STRIP_POSITION[16*20-1:16*19]<=16'h11C9;
    REG_STRIP_POSITION[16*21-1:16*20]<=16'h1421;
    REG_STRIP_POSITION[16*22-1:16*21]<=16'h1679;
    REG_STRIP_POSITION[16*23-1:16*22]<=16'h18D1;
    REG_STRIP_POSITION[16*24-1:16*23]<=16'h1B29;

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
                                                  
    REG_THRESHOLD=16'd129;
	  REG_THRESHOLD_WIDTH=24'd0;

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
	//TEP*5) 		RING_SOD = 1;  //50nsec from the start point
      //#(STEP*11)      RING_SOD = 1;  //50nsec from the start point
   #(STEP*13)      RING_SOD = 1;  //50nsec
      
	  #(STEP*1)   	RING_SOD = 0;
		
    //VME event tag (1st)
	  #(STEP*32000) 	RAW_TRG_TAG=1'b1;
	  #(STEP*16)		RAW_TRG_TAG=1'b0;
	  #(STEP*8)		RAW_NUM_TAG=2'd1;

    //Trigger design (2nd)
	  #(STEP*399999) 	RING_SOD = 1;
	  #(STEP*1)   	RING_SOD = 0;
		
    //VME event tag (2nd)
	  #(STEP*32000) 	RAW_TRG_TAG=1'b1;
	  #(STEP*16)		RAW_TRG_TAG=1'b0;
	  #(STEP*8)		RAW_NUM_TAG=2'd2;
		
    //Trigger design (3rd)
	  #(STEP*399999) 	RING_SOD = 1;
    #(STEP*1)       RING_SOD = 0;
        
    //VME event tag (3rd)
    #(STEP*32000)   RAW_TRG_TAG=1'b1;
    #(STEP*16)      RAW_TRG_TAG=1'b0;
    #(STEP*8)       RAW_NUM_TAG=2'd3;
        
    //Trigger design (4th)
    #(STEP*399999) 	RING_SOD = 1;
    #(STEP*1)       RING_SOD = 0;
        
    //VME event tag (4th)
    #(STEP*32000)     RAW_TRG_TAG=1'b1;
    #(STEP*16)        RAW_TRG_TAG=1'b0;
    #(STEP*8)        RAW_NUM_TAG=2'd4;
		
    //Interlock signal
	  #(STEP*10) 	REG_INTERLOCK=2'b10;
		
    //Finish simulation
	  #(STEP*400) $finish;
			
	// Add stimulus here
  end
      
endmodule