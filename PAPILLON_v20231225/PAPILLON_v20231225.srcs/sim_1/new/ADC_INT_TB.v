`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/15 17:16:03
// Design Name: 
// Module Name: ADC_INT_TB
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


module ADC_INT_TB;

    //Inputs
    reg         SYSCLK;
    reg         ENABLE;
    reg         sRST;
    reg [15:0]  DATA_LENGTH;
    reg [191:0] ADC_PDSTL;
    reg [383:0] STRIP_POSITION;
    reg [1:0]   REG_INTERLOCK;
    reg [287:0] WRITE_DATA;
    reg         WRITE_ENABLE;
    reg         REINIT;
    reg [15:0]  THRESHOLD;
    reg [23:0]  THRESHOLD_WIDTH;
    reg [15:0]  OFFSET;

    //Outputs
    wire        INT_TAG;
    wire        INT_END;
    wire [15:0] BEAM_POSITION;
    wire [23:0] BEAM_WIDTH;
    wire        INT_INTERLOCK;


    //input raw data from .txt file
    //Prepare arraies which has 640 12bit elements
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

    integer i;
    initial begin
      WRITE_DATA[12*24-1:0] = 0;  //initialization
   
      //extracting raw ADC data from given .txt files
      /*
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_0ch.txt",data0000);          
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_1ch.txt",data0001);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_2ch.txt",data0002);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_3ch.txt",data0003);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_4ch.txt",data0004);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_5ch.txt",data0005);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_6ch.txt",data0006);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_7ch.txt",data0007);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_8ch.txt",data0008);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_9ch.txt",data0009);       
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_10ch.txt",data0010);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_11ch.txt",data0011);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_12ch.txt",data0012);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_13ch.txt",data0013);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_14ch.txt",data0014);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_15ch.txt",data0015);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_16ch.txt",data0016);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_17ch.txt",data0017);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_18ch.txt",data0018);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_19ch.txt",data0019);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_20ch.txt",data0020);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_21ch.txt",data0021);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_22ch.txt",data0022);      
      $readmemh("C:/Users/Tohoku/Desktop/PAPILLON_FW/yamasu_data/evt749_P101_23ch.txt",data0023);
      */

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


      @(posedge SYSCLK);                    //wait 1 SYSCLK
      while (sRST==1'b1) @(posedge SYSCLK); //If sRST is ON, wait one more 1 SYSCLK
      repeat(12) @(posedge SYSCLK);         //After that, wait 12 SYSCLKs

      for (i=0; i<640; i=i+1) begin
        WRITE_DATA[11:0]    <= data0000[i]; //Fill ith 12bit data for ch.0
        WRITE_DATA[23:12]   <= data0001[i]; //Fill ith 12bit data for ch.1
        WRITE_DATA[35:24]   <= data0002[i]; //Fill ith 12bit data for ch.2
        WRITE_DATA[47:36]   <= data0003[i]; //Fill ith 12bit data for ch.3
        WRITE_DATA[59:48]   <= data0004[i]; //Fill ith 12bit data for ch.4
        WRITE_DATA[71:60]   <= data0005[i]; //Fill ith 12bit data for ch.5
        WRITE_DATA[83:72]   <= data0006[i]; //Fill ith 12bit data for ch.6
        WRITE_DATA[95:84]   <= data0007[i]; //Fill ith 12bit data for ch.7
        WRITE_DATA[107:96]  <= data0008[i]; //Fill ith 12bit data for ch.8
        WRITE_DATA[119:108] <= data0009[i]; //Fill ith 12bit data for ch.9
        WRITE_DATA[131:120] <= data0010[i]; //Fill ith 12bit data for ch.10
        WRITE_DATA[143:132] <= data0011[i]; //Fill ith 12bit data for ch.11
        WRITE_DATA[155:144] <= data0012[i]; //Fill ith 12bit data for ch.12
        WRITE_DATA[167:156] <= data0013[i]; //Fill ith 12bit data for ch.13
        WRITE_DATA[179:168] <= data0014[i]; //Fill ith 12bit data for ch.14
        WRITE_DATA[191:180] <= data0015[i]; //Fill ith 12bit data for ch.15
        WRITE_DATA[203:192] <= data0016[i]; //Fill ith 12bit data for ch.16
        WRITE_DATA[215:204] <= data0017[i]; //Fill ith 12bit data for ch.17
        WRITE_DATA[227:216] <= data0018[i]; //Fill ith 12bit data for ch.18
        WRITE_DATA[239:228] <= data0019[i]; //Fill ith 12bit data for ch.19
        WRITE_DATA[251:240] <= data0020[i]; //Fill ith 12bit data for ch.20
        WRITE_DATA[263:252] <= data0021[i]; //Fill ith 12bit data for ch.21
        WRITE_DATA[275:264] <= data0022[i]; //Fill ith 12bit data for ch.22
        WRITE_DATA[287:276] <= data0023[i]; //Fill ith 12bit data for ch.23

        @(negedge ENABLE);  //Wait until ENABLE OFF, and move on the next sample
      end

    end


    //Instantiate the Unit Under Test (UUT)
    ADC_INT uut (
      .SYSCLK(SYSCLK),
      .ENABLE(ENABLE),
      .sRST(sRST),
      .DATA_LENGTH(DATA_LENGTH),
      .ADC_PDSTL(ADC_PDSTL),
      .STRIP_POSITION(STRIP_POSITION),
      .REG_INTERLOCK(REG_INTERLOCK),
      .WRITE_DATA(WRITE_DATA),
      .WRITE_ENABLE(WRITE_ENABLE),
      .REINIT(REINIT),
      .THRESHOLD(THRESHOLD),
      .THRESHOLD_WIDTH(THRESHOLD_WIDTH),
      .OFFSET(OFFSET),
      .INT_TAG(INT_TAG),
      .INT_END(INT_END),
      .BEAM_POSITION(BEAM_POSITION),
      .BEAM_WIDTH(BEAM_WIDTH),
      .INT_INTERLOCK(INT_INTERLOCK)
    );
    

    //Clocl design
    parameter STEP = 6.25; //nsec (160 MHz)
    always begin
      SYSCLK = 0; #(STEP/2);
      SYSCLK = 1; #(STEP/2);
    end

    //Enable design
    reg [3:0] clk_count;
    always begin
      clk_count = clk_count + 1; #(STEP);
      if (clk_count==2) begin
        ENABLE    = 1;
        clk_count = 0;
      end else begin
        ENABLE = 0;
      end
    end

    //Parameter configurations
    initial begin

      //Initialization
      SYSCLK       = 0;
      sRST         = 1;
      ENABLE       = 0;
      WRITE_ENABLE = 0;
      clk_count    = 1;
      REINIT       = 0;
      

      //Strip posiotion
      //SSEM06 X
      /*
      STRIP_POSITION[16*1-1 : 16*0] <= 16'hE542;
      STRIP_POSITION[16*2-1:16*1]   <= 16'hE79A;
      STRIP_POSITION[16*3-1:16*2]   <= 16'hE9F2;
      STRIP_POSITION[16*4-1:16*3]   <= 16'hEC4A;
      STRIP_POSITION[16*5-1:16*4]   <= 16'hEEA2;
      STRIP_POSITION[16*6-1:16*5]   <= 16'hF0FA;
      STRIP_POSITION[16*7-1:16*6]   <= 16'hF352;
      STRIP_POSITION[16*8-1:16*7]   <= 16'hF5AA;
      STRIP_POSITION[16*9-1:16*8]   <= 16'hF802;
      STRIP_POSITION[16*10-1:16*9]  <= 16'hFA5A;
      STRIP_POSITION[16*11-1:16*10] <= 16'hFCB2;
      STRIP_POSITION[16*12-1:16*11] <= 16'hFF0A;
      STRIP_POSITION[16*13-1:16*12] <= 16'h0161;
      STRIP_POSITION[16*14-1:16*13] <= 16'h03B9;
      STRIP_POSITION[16*15-1:16*14] <= 16'h0611;
      STRIP_POSITION[16*16-1:16*15] <= 16'h0869;
      STRIP_POSITION[16*17-1:16*16] <= 16'h0AC1;
      STRIP_POSITION[16*18-1:16*17] <= 16'h0D19;
      STRIP_POSITION[16*19-1:16*18] <= 16'h0F71;
      STRIP_POSITION[16*20-1:16*19] <= 16'h11C9;
      STRIP_POSITION[16*21-1:16*20] <= 16'h1421;
      STRIP_POSITION[16*22-1:16*21] <= 16'h1679;
      STRIP_POSITION[16*23-1:16*22] <= 16'h18D1;
      STRIP_POSITION[16*24-1:16*23] <= 16'h1B29;
      */
      
      //SSEM19 X
      ///*
      STRIP_POSITION[16*1-1 : 16*0] <= 16'hEBF4;
      STRIP_POSITION[16*2-1:16*1]   <= 16'hEDB6;
      STRIP_POSITION[16*3-1:16*2]   <= 16'hEF78;
      STRIP_POSITION[16*4-1:16*3]   <= 16'hF13A;
      STRIP_POSITION[16*5-1:16*4]   <= 16'hF2FC;
      STRIP_POSITION[16*6-1:16*5]   <= 16'hF4BE;
      STRIP_POSITION[16*7-1:16*6]   <= 16'hF680;
      STRIP_POSITION[16*8-1:16*7]   <= 16'hF842;
      STRIP_POSITION[16*9-1:16*8]   <= 16'hFA04;
      STRIP_POSITION[16*10-1:16*9]  <= 16'hFBC6;
      STRIP_POSITION[16*11-1:16*10] <= 16'hFD88;
      STRIP_POSITION[16*12-1:16*11] <= 16'hFF4A;
      STRIP_POSITION[16*13-1:16*12] <= 16'h010B;
      STRIP_POSITION[16*14-1:16*13] <= 16'h02CD;
      STRIP_POSITION[16*15-1:16*14] <= 16'h048F;
      STRIP_POSITION[16*16-1:16*15] <= 16'h0651;
      STRIP_POSITION[16*17-1:16*16] <= 16'h0813;
      STRIP_POSITION[16*18-1:16*17] <= 16'h09D5;
      STRIP_POSITION[16*19-1:16*18] <= 16'h0B97;
      STRIP_POSITION[16*20-1:16*19] <= 16'h0D59;
      STRIP_POSITION[16*21-1:16*20] <= 16'h0F1B;
      STRIP_POSITION[16*22-1:16*21] <= 16'h10DD;
      STRIP_POSITION[16*23-1:16*22] <= 16'h129F;
      STRIP_POSITION[16*24-1:16*23] <= 16'h1461;
      //*/

      //Pedestal
      ADC_PDSTL[8*1-1:8*0]   <= 8'h86;
      ADC_PDSTL[8*2-1:8*1]   <= 8'h85;
      ADC_PDSTL[8*3-1:8*2]   <= 8'h84;
      ADC_PDSTL[8*4-1:8*3]   <= 8'h87;
      ADC_PDSTL[8*5-1:8*4]   <= 8'h88;
      ADC_PDSTL[8*6-1:8*5]   <= 8'h8D;
      ADC_PDSTL[8*7-1:8*6]   <= 8'h93;
      ADC_PDSTL[8*8-1:8*7]   <= 8'h8A;
      ADC_PDSTL[8*9-1:8*8]   <= 8'h8C;
      ADC_PDSTL[8*10-1:8*9]  <= 8'h8C;
      ADC_PDSTL[8*11-1:8*10] <= 8'h8F;
      ADC_PDSTL[8*12-1:8*11] <= 8'h87;
      ADC_PDSTL[8*13-1:8*12] <= 8'h8A;
      ADC_PDSTL[8*14-1:8*13] <= 8'h89;
      ADC_PDSTL[8*15-1:8*14] <= 8'h82;
      ADC_PDSTL[8*16-1:8*15] <= 8'h8B;
      ADC_PDSTL[8*17-1:8*16] <= 8'h87;
      ADC_PDSTL[8*18-1:8*17] <= 8'h89;
      ADC_PDSTL[8*19-1:8*18] <= 8'h93;
      ADC_PDSTL[8*20-1:8*19] <= 8'h85;
      ADC_PDSTL[8*21-1:8*20] <= 8'h85;
      ADC_PDSTL[8*22-1:8*21] <= 8'h8E;
      ADC_PDSTL[8*23-1:8*22] <= 8'h89;
      ADC_PDSTL[8*24-1:8*23] <= 8'h8A;

      //Data length
      DATA_LENGTH[15:0] = 16'd640;

      //Offset
      OFFSET[15:0] = 16'd0;

      //Threshold
      //THRESHOLD       = 16'd129;
      THRESHOLD       = 16'd150;  //1.5 mm
      //THRESHOLD_WIDTH = 24'd200;  //2mm
      THRESHOLD_WIDTH = 24'd300;  //2mm

      //Interlock
      REG_INTERLOCK =2'b0;

      // Wait 6.25 nsec * 3 = 18.75 nsec for global reset to finish
	  #(STEP*3) sRST = 0;

      //Timing design of WRITE_ENABLE
      #(STEP*13.5) WRITE_ENABLE = 1'b1;
      
      // REINIT is ON after 6.5 ms (too long)
      //#(STEP*1040000) REINIT = 1'b1;
      #(STEP*4000) REINIT = 1'b1;
      
      #(STEP*4000) REINIT = 1'b0;
      
      ////////   2nd event   ///////////
      // Wait 6.25 nsec * 3 = 18.75 nsec for global reset to finish
      #(STEP*3) sRST = 0;

      //Timing design of WRITE_ENABLE
      #(STEP*13.5) WRITE_ENABLE = 1'b1;
      
      // REINIT is ON after 6.5 ms (too long)
      //#(STEP*1040000) REINIT = 1'b1;
      #(STEP*4000) REINIT = 1'b1;
      
      #(STEP*4000) REINIT = 1'b0;
      
      
      ////////   3rd event   ///////////
      // Wait 6.25 nsec * 3 = 18.75 nsec for global reset to finish
      #(STEP*3) sRST = 0;

      //Timing design of WRITE_ENABLE
      #(STEP*13.5) WRITE_ENABLE = 1'b1;
      
      // REINIT is ON after 6.5 ms (too long)
      //#(STEP*1040000) REINIT = 1'b1;
      #(STEP*4000) REINIT = 1'b1;
      
      #(STEP*4000) REINIT = 1'b0;
      

      //Finish simulation
	  #(STEP*4000) $finish;
      
    end

endmodule
