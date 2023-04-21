/*******************************************************************************
*                                                                              *
* System      : Liq_Ar_TPC_RO_Digital module                                   *
* Version     : ver2                                          				   *
*                                                                              *
* Description : Top Module                                                     *
*                                                                              *
* Designer    : Yuya Iwazaki												   *
*					 Tomohisa Uchida                                           *
*                                                                              *
*               Copyright (c) 2012 Tomohisa Uchida                             *
*               All rights reserved                                            *
*                                                                              *
*******************************************************************************/
`define SYN_DATE	32'h1803_0501
`define FPGA_VER	8'h01
`define PACKET_HD_RAW_TYPE	8'h01

//`define SPARTAN_SERIES

//`include "../Src/sys_dcm.v"
//`include "../Src/mem_64_256.v"
					//�R�A�W�F�l���[�^�ōĐ��������B

//`include "../Src/ADC_SiTCP_RING.v"
//`include "../Src/ADC_SiTCP_RAW.v"

//`include "../Src/WRAP_SiTCP_MII_XC6S_8K.v"
//`include "../Src/WRAP_SiTCP_GMII_XC7A_32K.V"
//`include "../Src/TIMER.v"
//`include "../Src/SiTCP_XC6S_8K_BBT_V40.v"
//`include "../Src/SiTCP_XC7A_32K_BBT_V80.V"
//`include "../Src/LOC_REG.v"
//`include "../AD_ADC_SIF/Src/AD_ADC_SIF.v"
//`include "../AD_ADC_SIF/Src/AD_ADC_SPI.v"

module ADC_SiTCP_V20(
// System			,	// in
    CLK75mp				,
    CLK75mn				,
// EEPROM
	EEPROM_CS			,	// out	: Chip select //delete my circuit
	EEPROM_SK			,	// out	: Serial data clock
	EEPROM_DI			,	// out	: Serial write data
	EEPROM_DO			,	// in		: Serial read data
// MII interface
	ETH_RSTn			,	// in		: Tx clock(2.5 or 25MHz)
	LED_1000,
	// TX
	GTX_CLK             ,
	ETH_TX_CLK			,	// in		: Tx clock(2.5 or 25MHz)
	ETH_TX_EN			,	// out	: Tx enable
	ETH_TXD				,	// out	: Tx data[3:0] 2016/9/13 change[7:0]?
	ETH_TX_ER			,	// out	: TX error
	// RX
	ETH_RX_CLK			,	// in	: Rx clock(2.5 or 25MHz)
	ETH_RX_DV			,	// in	: Rx data valid
	ETH_RXD				,	// in	: Rx data[3:0] 2016/9/13 change[7:0]
	ETH_RX_ER			,	// in	: Rx error
	ETH_CRS				,	// in	: Carrier sense
	ETH_COL				,	// in	: Collision detected
	// Management IF
	ETH_MDC				,	// out	: Clock for MDIO
	ETH_MDIO		    ,	// in		: data in
// ADC Interface 
	ADC_D_P				,   // Data (+) [31:0] 2016/9/13 change[23:0]?
	ADC_D_N				,   // Data (-) [31:0] 2016/9/13 change[23:0]?
	ADC_DCO_P			,   // Data Clock from ADC (+)[4:1] 2016/9/13 chqnge[3:1]
	ADC_DCO_N			,   // Data Clock from ADC (-)[4:1] same as above
	ADC_FCO_P			,   // Frame Clock from ADC (+)[4:1] same as above
	ADC_FCO_N			,   // Frame Clock from ADC (-)[4:1] same as above
	ADC_CLK_P			,   // ADC Clock (+)[4:1] same as avobe
	ADC_CLK_N			,   // ADC Clock (-)[4:1] same as avobe
	ADC_SCLK			,   // ADC SClock[4:1] same as above
	ADC_CSB				,   // ADC Chip Slect[4:1] same as avobe
	ADC_SDIO			,   // ADC Data[4:1] same as above
//  I/O
	NIM_INn				,	// in   : NIM inputs[4:1]
	NIM_OUT_P			,	// out	: NIM output
	NIM_OUT_N           ,   //
	DIP_SW 				,	// in   : DIP_SW[3:0]
	X_LED	            ,	// out	: LED[3:0]
	ATT_MUX             ,	// out	:Attenuator multiplexer switch
	INTERLOCK           ,	// out	:Interlock signal
	J0S                 ,	// in	:event tag from VME J0
	C						// out	:                  
);	

//-------- Input/Output -------------

	input 			CLK75mp			;
	input 			CLK75mn			;

	output			EEPROM_CS		;
	output			EEPROM_SK		;
	output			EEPROM_DI		;
	input		    EEPROM_DO		;

	output			ETH_RSTn		;
	output          GTX_CLK         ;
	input			ETH_TX_CLK		;
	output			ETH_TX_EN		;
	output	[7:0]	ETH_TXD			;
	output			ETH_TX_ER		;
	input			ETH_RX_CLK		;
	input			ETH_RX_DV		;
	input	[7:0]	ETH_RXD			;
	input			ETH_RX_ER		;
	input			ETH_CRS			;
	input			ETH_COL			;
	output			ETH_MDC			;
	inout			ETH_MDIO		;
	input          LED_1000         ;

	input	[23:0]	ADC_D_P			;
	input	[23:0]	ADC_D_N			;

	input	[3:1]	ADC_DCO_P		;
	input	[3:1]	ADC_DCO_N		;
	input	[3:1]	ADC_FCO_P		;
	input	[3:1]	ADC_FCO_N		;
	output	[3:1]	ADC_CLK_P		;
	output	[3:1]	ADC_CLK_N		;
	output	[3:1]	ADC_SCLK		;
	output	[3:1]	ADC_CSB			;
	inout	[3:1]	ADC_SDIO		;

	input	[4:1]	NIM_INn			;
	output			NIM_OUT_N		;
	output          NIM_OUT_P       ;
	input	[3:0]	DIP_SW			;
	output [3:0] X_LED;
	output  [47:0]  ATT_MUX         ;
	(* mark_debug = "true" *) output INTERLOCK;
	
	input   [7:2]  J0S              ;
	output  [1:0]  C                ;

   parameter DATA_WIDTH   = 16;
   parameter CH_NUM       = 24;

//------------------------------------------------------------------------------
//	Buffers
//------------------------------------------------------------------------------
	//wire			ETH_MDOE		;
	wire			ETH_MDOUT		;
	wire			NIM_OUT			;
    
	//assign	ETH_MDIO	= (ETH_MDOE	? ETH_MDOUT : 1'bz);
				//ETH_MDOE���^�Ȃ�ETH_MDIO=MDOUT�A�ہ@1'bz 2016/9/13 what's z?9/14 z is high�@�C���s�[�_���X
				
	wire			FORCE_DEFAULTn	;

	assign	FORCE_DEFAULTn	= DIP_SW[0];
				//DIP�X�C�b�`�̈���������Z�b�g�̃X�C�b�`�Ƃ��Ďw��
				
//test pin input trgger or NIM trigger SW				
				
	wire    	TRG_INn				;
    wire    	TEST_SW    			;  // for LOC_REG
    //wire    	TriG_In  			;
    wire    	TesT_In  			;
    reg    		Trig_IN_sync		;
    
    assign	TesT_In	= ( TEST_SW ? NIM_INn[1] : 1'b0);
    
    assign	TRG_INn = (~TEST_SW ? NIM_INn[1] : Trig_IN_sync);
//------------------------------------------------------------------------------
//	System management
//------------------------------------------------------------------------------

//outside clock

    wire			RST_PLL				;
    //wire           	RSL_PLL_2           ;

	assign	RST_PLL		= DIP_SW[2];
	//assign	RST_PLL_2   = DIP_SW[2];
                                //sysFd[2:0]�̎O�[�qOR��H
                                //DIP�X�C�b�`�ŋ������Z�b�g
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1____20.000______0.000______50.0______249.363____164.985
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary__________50.000____________0.010

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
	wire           SYSCLK_2		;
	wire           CLK160M		;
	wire           CLK200M     	;
	wire           CLK80M      	;
	
	SYSCLK0 SYSCLK0
      (
      // Clock in ports
       .clk_in1_p(CLK75mp),    // input clk_in1_p
       .clk_in1_n(CLK75mn),    // input clk_in1_n
       // Clock out ports
       .clk_out1(CLK160M),     // output clk_out1
       .clk_out2(CLK125M),     // output clk_out2
       .clk_out3(SYSCLK_2),     // output clk_out3
       // Status and control signals
       .reset(RST_PLL), // input reset
       .locked(sysDcmLocked));      // output locked
       
    SYSCLK2 SYSCLK2
      (
        // Clock in ports
        .clk_in1(SYSCLK_2),      // input clk_in1
        // Clock out ports
        .clk_out1(CLK200M),     // output clk_out1
        .clk_out2(CLK80M),     // output clk_out2
        // Status and control signals
        //.reset(RST_PLL_2), // input reset
        .reset(RST_PLL), // input reset
        .locked(sysDcmLocked_2));      // output locked
           
	ODDR	GMII_ODDR (.Q(GTX_CLK), .C(CLK125M), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0));
	


	wire			aRstN	;
	wire			RST		;

	assign	aRstN	= (sysDcmLocked||sysDcmLocked_2);
	assign	RST	= ~(sysDcmLocked|sysDcmLocked_2);

	reg		[4:0]	rstCntr		;

	always@ (posedge CLK160M or negedge aRstN) begin
		if(!aRstN)begin
			rstCntr[4:0]	<= 5'd0;
		end else begin
			rstCntr[4:0]	<= (rstCntr[4] ? 5'h1F : rstCntr[4:0] + 5'd1);
											 //rstCntr[4]���^�Ȃ�rstCntr[4:0]=5'h1F�A�ہ@rstCntr[4:0] + 5'd1
		end
	end

	wire	sRST		;
	wire	aRST		;

	FD	RST_FD1 (.D(~rstCntr[4]), .C(CLK160M), .Q(sRST));
                      //rstCntr[4]���^�̂Ƃ�����sRST���L��
	FD	RST_FD2 (.D(sRST), .C(CLK160M), .Q(aRST));

//---------------------------------------------------------------------------------
//  THINNING
//---------------------------------------------------------------------------------

	wire    [7:0]  REG_THINNING ;     //Thinning adc data [7:0]  default 8  2.5Msps  SYSCLK 20Msps
    reg     [8:0]  clk_count;
    reg            clk_enable;
              

    always@ (posedge CLK160M) begin
        if(sRST)begin
            clk_count[8:0] <= 9'd0;
            clk_enable <= 1'd0;
        end else begin
            if(clk_count[8:0] == ({REG_THINNING[7:0],1'h0}-9'h1))begin //�Ȃ���REG_THINNING+1����1�ɂȂ��Ă��܂����� 
                clk_enable <= 1'd1;
                clk_count[8:0]  <= 9'd0;
            end else begin
                clk_enable <= 1'd0;
                clk_count[8:0] <= clk_count[8:0] + 9'd1;
            end
        end
    end


//------------------------------------------------------------------------------
//  Trigger
//------------------------------------------------------------------------------
    wire		irTrgInN	;
	reg			intTrgIn	;
    reg	[1:0]   srTrgInN    ;
    reg        trg_start    ;
    
    //�^�C�~���O��clk_enable�ɍ��킹��  �����TRG_INn��width��REG_THINNING�N���b�N�ȏ��ݒ肷��
    FD	TRG_FD_0	(.D(TRG_INn), .C(CLK160M), .Q(irTrgInN)); 

    always@ (posedge CLK160M) begin
        if(sRST)begin
            srTrgInN[1:0] <= 2'd0;
            intTrgIn <= 1'b0;
        end else begin
            if(clk_enable)begin
                srTrgInN[1:0] <= {srTrgInN[0],irTrgInN};
                trg_start <= (srTrgInN[1:0]==2'b01);
                intTrgIn <= (srTrgInN[1:0]==2'b10);//trigger���̊m��
            end
        end
    end
	
	
	reg 		trg_led;
	reg	[26:0]	trg_counter;
	
	always@ (posedge CLK160M) begin
        if(sRST)begin
			trg_led<=1'b0;
            trg_counter <= 27'd0;
        end else begin
			if(trg_start)begin
			trg_counter[26:0]<={1'b1,26'b0};
			end else
			if(trg_counter[26]==1'b1)begin
			trg_counter[26:0] <= trg_counter[26:0]+27'd1;
			trg_led <= 1'b1;
			end else 
			if(trg_counter[26]==1'b0)begin
			trg_counter[26:0] <= 27'd0;
			trg_led <= 1'b0;
			end
		end
    end

      		
//------------------------------------------------------------------------------
//  ADC interface
//------------------------------------------------------------------------------
    wire    [3:1]   intAdcClk; //24ch
 //24ch
	ODDR	ADC_CLK_ODDR_1 (.Q(intAdcClk[1]), .C(CLK80M), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0));
    ODDR    ADC_CLK_ODDR_2 (.Q(intAdcClk[2]), .C(CLK80M), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0));
    ODDR    ADC_CLK_ODDR_3 (.Q(intAdcClk[3]), .C(CLK80M), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0));

//24ch
	OBUFDS ADC_OBUFDS_1  ( .O(ADC_CLK_P[1]), .OB(ADC_CLK_N[1]), .I(intAdcClk[1]) );
	OBUFDS ADC_OBUFDS_2  ( .O(ADC_CLK_P[2]), .OB(ADC_CLK_N[2]), .I(intAdcClk[2]) );
	OBUFDS ADC_OBUFDS_3  ( .O(ADC_CLK_P[3]), .OB(ADC_CLK_N[3]), .I(intAdcClk[3]) );


/////////////ADC_CLK�̔ԍ��ɒ���////////////////////

    reg                    clk_en ;
    wire    [12*24-1:0]	    adcData;

    wire delay_locked;
    
    IDELAYCTRL delayctrl(
        .REFCLK(CLK200M),
        .RST(sRST),
        .RDY    (delay_locked)
    );
    
    wire    	adc1_if_en; 
    wire    	adc1_if_reset;
    wire    	adc2_if_en;   
    wire    	adc2_if_reset;
    wire    	adc3_if_en; 
    wire    	adc3_if_reset;
    
    wire [1:0]  in_delay_reset_1;    
    wire [4:0]  delay_tap_in_fco_1;
                                   
    wire [1:0]  in_delay_reset_2;  
    wire [4:0]  delay_tap_in_fco_2;                                   
                                   
    wire [1:0]  in_delay_reset_3;    
    wire [4:0]  delay_tap_in_fco_3;
	
	wire [4:0]  delay_tap_in_1;  
    wire [4:0]  delay_tap_in_2;  
    wire [4:0]  delay_tap_in_3;  
    wire [4:0]  delay_tap_in_4;  
    wire [4:0]  delay_tap_in_5;  
    wire [4:0]  delay_tap_in_6;  
    wire [4:0]  delay_tap_in_7;  
    wire [4:0]  delay_tap_in_8;  
    

    ADC_IF ADC1_IF(
       // System
       .clk          		(CLK160M),
       .clk_en       		(clk_en),
       // From ADC Signal
       .DCO_P        		(ADC_DCO_P[1]   ),        //inversion for circuit design
       .DCO_N        		(ADC_DCO_N[1]   ),        //inversion for circuit design
       .FCO_P        		(ADC_FCO_P[1]   ),        //inversion for circuit design
       .FCO_N        		(ADC_FCO_N[1]   ),        //inversion for circuit design
       .sADC_Data_P  		(ADC_D_P[7:0]   ),        //inversion for circuit design
       .sADC_Data_N  		(ADC_D_N[7:0]   ),        //inversion for circuit design
       .IO_RESET     		(sRST           ),      
       // After Convert Output
       .ADC_Data1    		(adcData[12*1-1:12*0]  ),
       .ADC_Data2    		(adcData[12*2-1:12*1]  ),
       .ADC_Data3    		(adcData[12*3-1:12*2]  ),
       .ADC_Data4    		(adcData[12*4-1:12*3]  ),
       .ADC_Data5    		(adcData[12*5-1:12*4]  ),
       .ADC_Data6    		(adcData[12*6-1:12*5]  ),
       .ADC_Data7    		(adcData[12*7-1:12*6]  ),
       .ADC_Data8    		(adcData[12*8-1:12*7]  ),
       .frame_ok     		(),
       .in_delay_reset   	(in_delay_reset_1[0]),   
       .delay_tap_in1 		(delay_tap_in_1[4:0]),
       .delay_tap_in2 		(delay_tap_in_2[4:0]),
       .delay_tap_in3 		(delay_tap_in_3[4:0]),
       .delay_tap_in4 		(delay_tap_in_4[4:0]),
       .delay_tap_in5 		(delay_tap_in_5[4:0]),
       .delay_tap_in6 		(delay_tap_in_6[4:0]),
       .delay_tap_in7 		(delay_tap_in_7[4:0]),
       .delay_tap_in8 		(delay_tap_in_8[4:0]),
       .delay_tap_in_fco 	(delay_tap_in_fco_1[4:0]),
       .adc_if_en			(adc1_if_en),
       .adc_if_reset		(adc1_if_reset)
    );

    
    ADC_IF ADC2_IF(
       // System
       .clk          		(CLK160M),
       .clk_en       		(clk_en),
       // From ADC Signal
       .DCO_P        		(ADC_DCO_P[2]      ),        //inversion for circuit design
       .DCO_N        		(ADC_DCO_N[2]      ),        //inversion for circuit design
       .FCO_P        		(ADC_FCO_P[2]      ),        //inversion for circuit design
       .FCO_N        		(ADC_FCO_N[2]      ),        //inversion for circuit design
       .sADC_Data_P  		({ADC_D_P[15:12],ADC_D_N[11],ADC_D_P[10],ADC_D_N[9],ADC_D_P[8]}),        //inversion for circuit design
       .sADC_Data_N  		({ADC_D_N[15:12],ADC_D_P[11],ADC_D_N[10],ADC_D_P[9],ADC_D_N[8]}),        //inversion for circuit design
       .IO_RESET     		(sRST          ),      
       // After Convert Output
       .ADC_Data1    		(adcData[12* 9-1:12* 8]  ),
       .ADC_Data2    		(adcData[12*10-1:12* 9]  ),
       .ADC_Data3    		(adcData[12*11-1:12*10]  ),
       .ADC_Data4    		(adcData[12*12-1:12*11]  ),
       .ADC_Data5    		(adcData[12*13-1:12*12]  ),
       .ADC_Data6    		(adcData[12*14-1:12*13]  ),
       .ADC_Data7    		(adcData[12*15-1:12*14]  ),
       .ADC_Data8    		(adcData[12*16-1:12*15]  ),
       .frame_ok     		(),
       .in_delay_reset		(in_delay_reset_2[0]),   
       .delay_tap_in1 		(delay_tap_in_1[4:0] ),
       .delay_tap_in2 		(delay_tap_in_2[4:0] ),
       .delay_tap_in3 		(delay_tap_in_3[4:0] ),
       .delay_tap_in4 		(delay_tap_in_4[4:0] ),
       .delay_tap_in5 		(delay_tap_in_5[4:0] ),
       .delay_tap_in6 		(delay_tap_in_6[4:0] ),
       .delay_tap_in7 		(delay_tap_in_7[4:0] ),
       .delay_tap_in8 		(delay_tap_in_8[4:0] ),
       .delay_tap_in_fco 	(delay_tap_in_fco_2[4:0]),
       .adc_if_en			(adc2_if_en),
       .adc_if_reset		(adc2_if_reset)
    );
    
     ADC_IF ADC3_IF(
          // System
          .clk          	(CLK160M),
          .clk_en       	(clk_en),
          // From ADC Signal
          .DCO_P        	(ADC_DCO_P[3]     ),        //inversion for circuit design
          .DCO_N        	(ADC_DCO_N[3]     ),        //inversion for circuit design
          .FCO_P        	(ADC_FCO_P[3]     ),        //inversion for circuit design
          .FCO_N        	(ADC_FCO_N[3]     ),        //inversion for circuit design
          .sADC_Data_P  	(ADC_D_N[23:16]   ),        //inversion for circuit design
          .sADC_Data_N  	(ADC_D_P[23:16]   ),        //inversion for circuit design
          .IO_RESET     	(sRST             ),      
          // After Convert Output
          .ADC_Data1    	(adcData[12*17-1:12*16]  ),
          .ADC_Data2    	(adcData[12*18-1:12*17]  ),
          .ADC_Data3    	(adcData[12*19-1:12*18]  ),
          .ADC_Data4    	(adcData[12*20-1:12*19]  ),
          .ADC_Data5    	(adcData[12*21-1:12*20]  ),
          .ADC_Data6    	(adcData[12*22-1:12*21]  ),
          .ADC_Data7    	(adcData[12*23-1:12*22]  ),
          .ADC_Data8    	(adcData[12*24-1:12*23]  ),
          .frame_ok     	(),
          .in_delay_reset   (in_delay_reset_3[0]),   
         .delay_tap_in1 	(delay_tap_in_1[4:0]),
         .delay_tap_in2 	(delay_tap_in_2[4:0] ),
         .delay_tap_in3 	(delay_tap_in_3[4:0] ),
         .delay_tap_in4 	(delay_tap_in_4[4:0] ),
         .delay_tap_in5 	(delay_tap_in_5[4:0] ),
         .delay_tap_in6 	(delay_tap_in_6[4:0] ),
         .delay_tap_in7 	(delay_tap_in_7[4:0] ),
         .delay_tap_in8 	(delay_tap_in_8[4:0] ),
         .delay_tap_in_fco	(delay_tap_in_fco_3[4:0]),
         .adc_if_en			(adc3_if_en),
         .adc_if_reset		(adc3_if_reset)
       );
    
    
    //   
    always@(posedge CLK160M) begin
       if (sRST) begin
          clk_en <= 1'b0 ;
       end else begin
          clk_en <= ~clk_en ;
       end
    end  


    //
      wire		[12*24-1:0]	Data	; 
      
      assign     Data[12*1-1:12*0]		= adcData[12*1-1:12*0];
      assign     Data[12*2-1:12*1]		= adcData[12*2-1:12*1];
      assign     Data[12*3-1:12*2]		= adcData[12*3-1:12*2];
      assign     Data[12*4-1:12*3]		= adcData[12*4-1:12*3];
      assign     Data[12*5-1:12*4]		= adcData[12*5-1:12*4];
      assign     Data[12*6-1:12*5]		= adcData[12*6-1:12*5];
      assign     Data[12*7-1:12*6]		= adcData[12*7-1:12*6];
      assign     Data[12*8-1:12*7]		= adcData[12*8-1:12*7];
		
      assign     Data[12*9-1:12*8]		= adcData[12*9-1:12*8]; 
      assign     Data[12*10-1:12* 9]	= ~adcData[12*10-1:12*9];
      assign     Data[12*11-1:12*10]	= adcData[12*11-1:12*10];
      assign     Data[12*12-1:12*11]	= ~adcData[12*12-1:12*11];
      assign     Data[12*13-1:12*12]	= adcData[12*13-1:12*12];
      assign     Data[12*14-1:12*13]	= adcData[12*14-1:12*13];
      assign     Data[12*15-1:12*14]	= adcData[12*15-1:12*14];
      assign     Data[12*16-1:12*15]	= adcData[12*16-1:12*15]; 
			
      assign     Data[12*17-1:12*16]	= ~adcData[12*17-1:12*16];
      assign     Data[12*18-1:12*17]	= ~adcData[12*18-1:12*17];
      assign     Data[12*19-1:12*18]	= ~adcData[12*19-1:12*18];
      assign     Data[12*20-1:12*19]	= ~adcData[12*20-1:12*19];
      assign     Data[12*21-1:12*20]	= ~adcData[12*21-1:12*20];
      assign     Data[12*22-1:12*21]	= ~adcData[12*22-1:12*21];
      assign     Data[12*23-1:12*22]	= ~adcData[12*23-1:12*22];
      assign     Data[12*24-1:12*23]	= ~adcData[12*24-1:12*23];
	  
//--------------------------------------------------------------------
//TEST PIN INPUT
//--------------------------------------------------------------------

     reg [9:0]	Test_count;  
     reg 		test_127US;  
     reg [1:0]	test_sync;
    // reg Trig_IN_sync;
     reg [1:0] 	Trig_sync; 
     reg [5:0]  tp_NIM;     
     wire 		NIM_in;
     wire 		TIM_1US;
     
     FD	NIM_FD_0	(.D(TesT_In), .C(CLK160M), .Q(NIM_in)); 
     
     always@(posedge CLK160M)begin
        if (RST) begin
          Test_count <= 0;
        end else begin
             if(TIM_1US)begin
                 Test_count[9:0] <= Test_count[9:0] + 10'b1; //test count[6]�͎���=127us��CLK
             end  
        end         
     end     

     always@(posedge CLK160M)begin
        test_sync[1:0] <= {test_sync[0],Test_count[6]};
        test_127US <= (test_sync[1:0]==2'b10);
     end  
     
     
     always@(posedge CLK160M)begin
        if (RST) begin
          Trig_IN_sync <= 0;
        end else begin
            if(test_127US)begin
              Trig_sync[1:0] <= {Trig_sync[0],NIM_in};
              Trig_IN_sync <= (Trig_sync[1:0]==2'b10);      
            end  
        end         
     end          


     always@(posedge CLK160M)begin
        if (RST) begin
          tp_NIM[5:0] <= 0;
        end else begin
            if(test_127US)begin
              tp_NIM[0]   <=  Trig_IN_sync  ;
              tp_NIM[1]   <=  tp_NIM[0]   ;
              tp_NIM[2]   <=  tp_NIM[1]   ;
              tp_NIM[3]   <=  tp_NIM[2]   ;
              tp_NIM[4]   <=  tp_NIM[3]   ;
              tp_NIM[5]   <=  tp_NIM[4]   ;            
            end 
        end         
     end          
 
     assign X_LED[3] = (TEST_SW ? tp_NIM[5] :trg_led);
	
//------------------------------------------------------------------------------
//	Data Buffer
//------------------------------------------------------------------------------
	wire [15:0] REG_DELAY;//�g���K�[�����b�`���Ă���ǂꂾ���O�̃f�[�^��]�����邩
												//�T���v�����A���W�X�^�̑���ŕύX�\�B

`ifdef SIM								//�_���V�~�����[�V�������s���Ƃ�SIM���`����Ɗy�H
	reg				SiTCP_ACTIVE;
`else
	wire			SiTCP_ACTIVE;

`endif

	wire				 RAW_SOD;
	wire	[31:0]       RAW_TRG_NUM;
    wire   [12*24-1:0]  RAW_ADC;//24ch


	ADC_SiTCP_RING		ADC_SiTCP_RING(
	// System
		.SYSCLK				(CLK160M			),	// in	: System clock
		.sRST				(~SiTCP_ACTIVE		),	// in	: System reset
	// Parameters
		.REG_DELAY			(REG_DELAY[15:0]	),	// in	: TRG delay [15:0]
    // Enable
		.ENABLE		        (clk_enable	),	// in	: Enable
	// ADC I/F
        .ADC_DATA            (Data[12*24-1:0]),    // in    : ADC data[767:0]  24ch
	// Trigger I/F
		.TRIGGER			(intTrgIn			),	// in	: Trigger
	// Event buffer module I/F
		.RAW_SOD			(RAW_SOD			),	// out	: Start of data
		.RAW_TRG_NUM		(RAW_TRG_NUM[31:0]	),	// out	: Trigger Number[31:0]
        .RAW_ADC            (RAW_ADC[12*24-1:0] )    // out    : Delayed ADC data[767:0] 24ch
    );


//------------------------------------------------------------------------------
// receive trigger tag from VME J0 
//------------------------------------------------------------------------------
    wire           RAW_TRG_TAG;
    wire   [2:0]   RAW_NUM_TAG;
	assign		RAW_TRG_TAG=J0S[2];
    // assign RAW_TRG_TAG=NIM_INn[2];
    assign		RAW_NUM_TAG[2:0]=J0S[7:5];
    // assign RAW_NUM_TAG[2:0]=3'd4;
	
	wire tag_mode;
	assign tag_mode = DIP_SW[1];
    assign X_LED[0] = DIP_SW[1];

    //LED for debugging of J0S[2]
    reg beam_trg_led;
    reg [26:0] beam_trg_conuter;
    always@ (posedge CLK160M) begin
      if (sRST) begin
        beam_trg_led <= 1'b0;
        beam_trg_conuter <= 27'd0;
      end

      else begin
        //If trigger is HIGH, set the counter
        if (J0S[2]==1'b1) begin
          beam_trg_conuter[26:0] <= {1'b1, 26'b0}; 
        end
        //After the counter is set, count it until the maximum
        //LED is ON during count up.
        else if (beam_trg_conuter[26]==1'b1) begin
          beam_trg_conuter[26:0] <= beam_trg_conuter[26:0] + 27'd1;
          beam_trg_led <= 1'b1;
        end
        //If the counter reaches the maximum, reset the counter and turn OFF the LED
        else if (beam_trg_conuter[26]==1'b0) begin
          beam_trg_conuter[26:0] <= 27'd0;
          beam_trg_led <= 1'b0;
        end
      end

    end
    assign X_LED[1] = beam_trg_led;


//------------------------------------------------------------------------------
//	Data Formatter
//-----------------------------------------------------------------------------

	wire				SiTCP_TX_AFULL	;
	wire				SiTCP_TX_WE		;
	wire	[7:0]		SiTCP_TX_WD		;

	wire	[23:0]		REG_HD_ID		;
	wire	[15:0]		REG_LEN			;
	wire	[15:0]  	REG_WINDOW      ;
	wire	[1:0]		REG_MODE		;
	
	wire 	[47:0]		REG_ATT_MUX	;
    wire	[16*24-1:0]	REG_STRIP_POSITION;
    wire	[8*24-1:0]	REG_ADC_PDSTL;
    wire	[15:0]		REG_THRESHOLD;
	wire	[23:0]		REG_THRESHOLD_WIDTH;
    wire	[15:0]		REG_OFFSET;
    wire	[1:0]		REG_INTERLOCK;
	wire	[7:0]		REG_TAG_COUNT;
	wire				RAW_INTERLOCK;


	ADC_SiTCP_RAW		ADC_SiTCP_RAW(
	// System
		.SYSCLK				(CLK160M				),	// in	: System clock
		.sRST				(~SiTCP_ACTIVE		),	// in	: System reset
		.tag_mode           (tag_mode),
    //receive trigger tag
        .RAW_TRG_TAG        (RAW_TRG_TAG),
        .RAW_NUM_TAG        (RAW_NUM_TAG[2:0]),
	// Parameters
		.REG_HD_ID			(REG_HD_ID[23:0]	),	// in	: Header ID[23:0]
		.REG_WINDOW			(REG_WINDOW[15:0]	),	// in	: Window size [7:0] sample count
		.REG_LEN            (REG_LEN[15:0]      ),//data length
		.REG_MODE			(REG_MODE[1:0]		),	// in	: Mode [1:0]
		.REG_ADC_PDSTL      (REG_ADC_PDSTL[8*24-1:0]),
		.REG_STRIP_POSITION	(REG_STRIP_POSITION[16*24-1:0]),//in SSEM strip position
		.REG_THRESHOLD		(REG_THRESHOLD[15:0]),//in beam position threshold level
		.REG_THRESHOLD_WIDTH(REG_THRESHOLD_WIDTH[23:0]),//in beam width threshold level
		.REG_OFFSET			(REG_OFFSET[15:0]),//in beam position offset
		.REG_INTERLOCK		(REG_INTERLOCK[1:0]),//in interlock signal control
		.REG_TAG_COUNT		(REG_TAG_COUNT[7:0]),
	// Enable
        .ENABLE		        (clk_enable         ),	// in	: Enable
	// BUF_DELAY I/F
		.RING_SOD			(RAW_SOD			),	// in	: Start of data
		.RING_TRG_NUM		(RAW_TRG_NUM[31:0]	),	// in	: Trigger Number[31:0]
		.RING_ADC			(RAW_ADC[12*24-1:0]	),	// in	: Delayed ADC data
	// SiTCP I/F
		.SiTCP_TX_AFULL	    (SiTCP_TX_AFULL	    ),	// in	: Almost full flag of a TCP Tx FIFO
		.SiTCP_TX_WE		(SiTCP_TX_WE		),	// out	: TCP Tx Data write enable
		.SiTCP_TX_WD		(SiTCP_TX_WD[7:0]	),	// out	: TCP Tx Data[7:0]
		
		.RAW_INTERLOCK		(RAW_INTERLOCK)//out interlock signal shot
	);
	
	
	OBUFDS OBUFDS_inst(
	    .O(NIM_OUT_P),
	    .OB(NIM_OUT_N),
	    .I(NIM_OUT)
	); 
	
	assign	INTERLOCK	= 	RAW_INTERLOCK;
    //assign	INTERLOCK	= 	1'b1;
    assign	X_LED[2]    = 	RAW_INTERLOCK;
	assign  NIM_OUT		=	RAW_INTERLOCK;
	//assign NIM_OUT=1'b1;
	
	
`ifdef SIM
	assign	REG_DELAY[15:0]		= 8'd10;
	assign	REG_HD_ID[23:0]	= 24'h012345;
	assign	REG_LEN[15:0]		= 16'd0;
	assign  REG_WINDOW[15:0]   =16'd0;
	
	assign	SiTCP_TX_AFULL 	= 1'b0;

`else
/*******************************************************************************
*     Network Processor, Tomohisa Uchida                                       *
*******************************************************************************/
	
	//LAN8810 LEDMODE
	wire        MDIO_LEDSet;
    wire        LEDSet_en;
    wire        MDC_LEDSet;
    wire		SiTCP_RST;
 
    LEDSet LEDSet(
        .SYSCLK(CLK160M),
        .RST(RST),
        .MDIO_LEDSet(MDIO_LEDSet),
        .MDC_LEDSet(MDC_LEDSet),
        .LEDSet_start(SiTCP_RST),
        .LEDSet_en(LEDSet_en),
        .CountStart_out(CountStart_out)
    ); 
	
	wire       SiTCP_MDC;
    wire       SiTCP_MDIO;
	//buffer
    wire       ETH_MDIO_OE;
    wire       ETH_MDIO_OUT;   
	//assign	ETH_MDIO  = (ETH_MDIO_OE ? ETH_MDIO_OUT  : 1'bz);
	assign	    ETH_MDIO    = LEDSet_en ? MDIO_LEDSet : 
	                       ETH_MDIO_OE ? SiTCP_MDIO :
	                       1'bz;
    assign 	    ETH_MDC		= LEDSet_en ? MDC_LEDSet : SiTCP_MDC;                  

	wire			SiTCP_CLOSE_REQ     ;
	wire            TIM_1MS            ;
	wire           	reg_RST             ;    //���W�X�^�̃��Z�b�g

	wire	[31:0]	RBCP_ADDR			;
	wire	[7:0]	RBCP_WD				;
	wire			RBCP_WE				;
	wire			RBCP_RE				;
	wire			RBCP_ACK			;
	wire	[7:0]	RBCP_RD				;
	
	wire   			GMII_TX_CLK        	;
		
BUFGCTRL BUFGCTRL_CLK0(
    .O(GMII_TX_CLK),
    .I0(ETH_TX_CLK),
    .I1(CLK125M),
    .S0(1'b1),
    .S1(1'b1),
    .CE0(~LED_1000),
    .CE1(LED_1000),
    .IGNORE0(1'b1),
    .IGNORE1(1'b1)
    );
    
    //assign        NIM_OUT = DAC_STRI; 
    
    //     WRAP_SiTCP_MII_XC6S_8K    #(.TIM_PERIOD (8'd25))
     WRAP_SiTCP_GMII_XC7A_32K    #(.TIM_PERIOD (8'd160))   //MII�g�p
     SiTCP(
        .CLK                    (CLK160M            ),    // in    : System Clock >15MHz
        .RST                    (RST                ),    // in    : System reset
        .TIM_1MS                (TIM_1MS            ),    // out    :
        .TIM_1US                (TIM_1US            ),
    // Configuration parameters
        .FORCE_DEFAULTn        (FORCE_DEFAULTn    ),    // in    : Load default parameters
        .EXT_IP_ADDR            (32'h0            ),    // in    : IP address[31:0]
        .EXT_TCP_PORT            (16'h0            ),    // in    : TCP port #[15:0]
        .EXT_RBCP_PORT            (16'h0            ),    // in    : RBCP port #[15:0]
        .PHY_ADDR                (5'd0                ),    // in    : PHY-device MIF address[4:0]
    // EEPROM
        .EEPROM_CS                (EEPROM_CS        ),    // out    : Chip select
        .EEPROM_SK                (EEPROM_SK        ),    // out    : Serial data clock
        .EEPROM_DI                (EEPROM_DI        ),    // out    : Serial write data
        .EEPROM_DO                (EEPROM_DO        ),    // in    : Serial read data
        // user data, intialial values are stored in the EEPROM, 0xFFFF_FC3C-3F
        .USR_REG_X3C            (),    // out    : Stored at 0xFFFF_FF3C
        .USR_REG_X3D            (),    // out    : Stored at 0xFFFF_FF3D
        .USR_REG_X3E            (),    // out    : Stored at 0xFFFF_FF3E
        .USR_REG_X3F            (),    // out    : Stored at 0xFFFF_FF3F
        
    // MII interface
        .GMII_RSTn                (ETH_RSTn        ),    // out    : PHY reset
        .GMII_1000M                (LED_1000            ), // in    : GMII mode(1000Mbps) 
        //.GMII_1000M                (DIP_SW[3]            ), // in    : GMII mode(1000Mbps) 
        // TX
        .GMII_TX_CLK            (GMII_TX_CLK    ),    // in    : Tx clock
        .GMII_TX_EN                (ETH_TX_EN        ),    // out    : Tx enable
        .GMII_TXD                (ETH_TXD[7:0]    ),    // out    : Tx data[3:0]
        .GMII_TX_ER                (ETH_TX_ER        ),    // out    : TX error
        // RX
        .GMII_RX_CLK            (ETH_RX_CLK        ),    // in    : Rx clock
        .GMII_RX_DV                (ETH_RX_DV        ),    // in    : Rx data valid
        .GMII_RXD                (ETH_RXD[7:0]    ),    // in    : Rx data[3:0]
        .GMII_RX_ER                (ETH_RX_ER        ),    // in    : Rx error
        .GMII_CRS                (ETH_CRS        ),    // in    : Carrier sense
        .GMII_COL                (ETH_COL        ),    // in    : Collision detected
        // Management IF
        .GMII_MDC                (SiTCP_MDC        ),    // out    : Clock for MDIO
        .GMII_MDIO_IN            (SiTCP_MDIO        ),    // in    : Data
        .GMII_MDIO_OUT            (ETH_MDOUT        ),    // out    : Data
        .GMII_MDIO_OE            (ETH_MDIO_OE        ),    // out    : MDIO output enable
    
    // User I/F
        .SiTCP_RST                (SiTCP_RST        ),    // out    : Reset for SiTCP and related circuits
        // TCP connection control
        .TCP_OPEN_REQ            (1'b0                ),    // in    : Reserved input, shoud be 0
        .TCP_OPEN_ACK            (SiTCP_ACTIVE    ),    // out    : Acknowledge for open (=Socket busy)
        .TCP_ERROR                (),    // out    : TCP error, its active period is equal to MSL
        .TCP_CLOSE_REQ            (SiTCP_CLOSE_REQ        ),    // out    : Connection close request
        .TCP_CLOSE_ACK            (SiTCP_CLOSE_REQ        ),    // in    : Acknowledge for closing
        // FIFO I/F
        .TCP_RX_WC                (16'h0            ),    // in    : Rx FIFO write count[15:0] (Unused bits should be set 1)
        .TCP_RX_WR                (),    // out    : Write enable
        .TCP_RX_DATA            (),    // out    : Write data[7:0]
        .TCP_TX_FULL            (SiTCP_TX_AFULL            ),    // out    : Almost full flag
        .TCP_TX_WR                (SiTCP_TX_WE            ),    // in    : Write enable
        .TCP_TX_DATA            (SiTCP_TX_WD[7:0]        ),    // in    : Write data[7:0]
        // RBCP
        .RBCP_ACT                (),    // out    : RBCP active
        .RBCP_ADDR                (RBCP_ADDR[31:0]        ),    // out    : Address[31:0]
        .RBCP_WD                (RBCP_WD[7:0]            ),    // out    : Data[7:0]
        .RBCP_WE                (RBCP_WE                ),    // out    : Write enable
        .RBCP_RE                (RBCP_RE                ),    // out    : Read enable
        .RBCP_ACK                (RBCP_ACK                ),    // in    : Access acknowledge
        .RBCP_RD                (RBCP_RD[7:0]            )    // in    : Read data[7:0]
    );
    
    wire	[4:1]	intAscSdioIn	;//24ch
	wire			intAscSdioOut	;
	wire			intAscSdioEn	;

     //24ch
    assign  ADC_SDIO[1] = (intAscSdioEn ? 1'bz : intAscSdioOut);
    assign  ADC_SDIO[2] = (intAscSdioEn ? 1'bz : intAscSdioOut);
    assign  ADC_SDIO[3] = (intAscSdioEn ? 1'bz : intAscSdioOut);
        
	LOC_REG				LOC_REG(
		.CLK					(CLK160M),	// in	: System clock
		.RST					(SiTCP_RST),// in	: System reset
		.TIM_1MS				(TIM_1MS),	// in	: 1us interrupt
        .TIM_1US                (TIM_1US), 	
		// ADC I/F		
//24ch		
        .ADC_SCLK				(ADC_SCLK[3:1]),// out	: SPI clock[4:1]
		.ADC_CSB				(ADC_CSB[3:1]),	// out	: SPI Chip enable
		.ADC_SDIO_IN			(ADC_SDIO[3:1]),// in 	: SPI data input[2:1]
		.ADC_SDIO_OUT			(intAscSdioOut),// out	: SPI data output
		.ADC_SDIO_EN			(intAscSdioEn),	// out	: SPI data direction
		//.NIM_OUT            	(NIM_OUT),		
		//TEST SW			
		.TEST_SW            	(TEST_SW),		
				
	// Register I/F		
		.LOC_ADDR				(RBCP_ADDR[31:0]),	// in	: Address[31:0]
		.LOC_WD					(RBCP_WD[7:0]),		// in	: Data[7:0]
		.LOC_WE					(RBCP_WE),			// in	: Write enable
		.LOC_RE					(RBCP_RE),			// in	: Read enable
		.LOC_ACK				(RBCP_ACK),			// out	: Access acknowledge
		.LOC_RD					(RBCP_RD[7:0]),		// out	: Read data[7:0]
	// Registers
		.REG_MODE				(REG_MODE[1:0]          ),	// out	: Processing mode[1:0]
		.REG_STATUS0			(                       ),
		.REG_TRG_STATUS			(0						),	//
		.REG_WINDOW				(REG_WINDOW[15:0]),			// out	: Window size
		.REG_LEN				(REG_LEN[15:0]			),	// out	: Data length[15:0]
		.REG_DELAY				(REG_DELAY[15:0]		),	// out	: Delay time[15:0]
		.REG_0AX				(REG_HD_ID[23:16]		),
		.REG_0BX				(REG_HD_ID[15: 8]		),
		.REG_0CX				(REG_HD_ID[ 7: 0]		),
		.REG_0DX				(REG_THINNING[7:0]	),		// in	: Thinning adc data [7:0]
	// ADC sum calculation
		.REG_ADC_PDSTL			(REG_ADC_PDSTL[8*24-1:0]),		// out  :ADC pedestal
		.REG_ATT_MUX			(REG_ATT_MUX[47:0]),			// out	:Attenuator
		.REG_STRIP_POSITION		(REG_STRIP_POSITION[16*24-1:0]),//out SSEM strip position
		.REG_THRESHOLD			(REG_THRESHOLD[15:0]),			//out beam position threshold level
		.REG_THRESHOLD_WIDTH    (REG_THRESHOLD_WIDTH[23:0]),
		.adc1_if_en       		(adc1_if_en   ),
        .adc1_if_reset    		(adc1_if_reset),
        .adc2_if_en       		(adc2_if_en   ),
        .adc2_if_reset    		(adc2_if_reset),
        .adc3_if_en       		(adc3_if_en   ),
        .adc3_if_reset    		(adc3_if_reset),
		.REG_OFFSET				(REG_OFFSET[15:0]),				//out beam position offset
		.REG_INTERLOCK			(REG_INTERLOCK[1:0]),			//out interlock signal control
		.in_delay_reset_1       (in_delay_reset_1[1:0]),                            
        .tap_fco_1     			(delay_tap_in_fco_1[4:0]) ,             
        .in_delay_reset_2       (in_delay_reset_2[1:0]),                                
        .tap_fco_2     			(delay_tap_in_fco_2[4:0]),              
        .in_delay_reset_3       (in_delay_reset_3[1:0]),                   
        .tap_fco_3     			(delay_tap_in_fco_3[4:0]),
		.tap_1         		(delay_tap_in_1[4:0]),              
        .tap_2         		(delay_tap_in_2[4:0] ),                                  
        .tap_3         		(delay_tap_in_3[4:0] ),                                  
        .tap_4         		(delay_tap_in_4[4:0] ),                                  
        .tap_5         		(delay_tap_in_5[4:0] ),                                  
        .tap_6         		(delay_tap_in_6[4:0] ),                                  
        .tap_7         		(delay_tap_in_7[4:0] ),                                  
        .tap_8         		(delay_tap_in_8[4:0] ),  
		.REG_TAG_COUNT			(REG_TAG_COUNT[7:0])
	);

`endif

	assign ATT_MUX[47:0]=REG_ATT_MUX[47:0] ;
	
	//
	assign C[1:0] = 2'b0;
	
endmodule
//-------------------------------------------------------------------