/*******************************************************************************
*                                                                              *
* System      : BELLE-II CDC readout module                                    *
* Module      : LOC_REG                                                        *
* Version     : v 3.2.0 2011/04/04                                             *
*                                                                              *
* Description : Slow control; registers, ADC controls, DAC controls            *
*                                                                              *
* Designer    : Tomohisa Uchida                                                *
*                                                                              *
*                Copyright (c) 2011 Tomohisa Uchida                            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/

//////////////////////////////////////
// PAPILLON FW ver. 2023.04.13
// -Added X_LED[1] for debug of J0S[2]
//
//////////////////////////////////////
`define SYN_DATE	32'h2023_0413
`define FPGA_VER	8'h01


module LOC_REG(
	CLK					,	// in	: Clock
	RST					,	// in	: System reset
	TIM_1US				,	// in	: Timer 1us
	TIM_1MS             ,
	// ADC I/F
	ADC_SCLK			,	// out	: SPI clock[2:1]
	ADC_CSB				,	// out	: SPI Chip enable
	ADC_SDIO_IN			,	// out	: SPI data input[2:1]
	ADC_SDIO_OUT		,	// out	: SPI data output
	ADC_SDIO_EN			,	// out	: SPI data direction
	//NIM_OUT             ,
	//TEST ON/OFF
	TEST_SW             ,
 	// Register I/F
	LOC_ADDR			,	// in	: Address[31:0]
	LOC_WD				,	// in	: Data[7:0]
	LOC_WE				,	// in	: Write enable
	LOC_RE				,	// in	: Read enable
	LOC_ACK				,	// out	: Access acknowledge
	LOC_RD				,	// out	: Read data[7:0]
	// Registers
	REG_STATUS0			,   // in   : STATUS0
	REG_TRG_STATUS		,	// in	: Trigger status[15:0]
	REG_MODE				,	// out	: Processing mode[1:0]
	REG_WINDOW			,	// out	: Window size[15:0]  �������̊֌W����0�`4000�ɐݒ�
	REG_DELAY			,	// out	: Delay time[15:0]  �������̊֌W����0�`4000�ɐݒ�
	REG_LEN				,	// out	: Data length[15:0] REG_WINDOW�Ɠ���
	REG_0AX				,	// out	: 
	REG_0BX				,	// out	: 
	REG_0CX				,	// out	: 
	REG_0DX				,	// out	: 
	//ADC sum calculation
	REG_ADC_PDSTL		,	// out	: Pedestal[16*24-1:0]
	REG_ATT_MUX			,   //out   :attenuator mux[47:0]
	REG_STRIP_POSITION	,
	REG_THRESHOLD,
	REG_THRESHOLD_WIDTH,
	//adc_if,
	adc1_if_en,   
    adc1_if_reset,
    adc2_if_en,   
    adc2_if_reset,
    adc3_if_en,   
    adc3_if_reset,
	REG_OFFSET,
	REG_INTERLOCK,
	in_delay_reset_1,        
    tap_fco_1,          
    in_delay_reset_2,   
    tap_fco_2,          
    in_delay_reset_3,   
    tap_fco_3,
	tap_1,            
    tap_2,            
    tap_3,            
    tap_4,            
    tap_5,            
    tap_6,            
    tap_7,            
    tap_8,
	REG_TAG_COUNT	
);

//-------- Input/Output -------------
	input			CLK				;
	input			RST				;
	input			TIM_1US			;
    input           TIM_1MS         ;

	output	[3:1]	ADC_SCLK		;
	output	[3:1]	ADC_CSB			;
	input	[3:1]	ADC_SDIO_IN		;
	output			ADC_SDIO_OUT	;
	output			ADC_SDIO_EN		;

	//output          NIM_OUT         ;
	
	output          TEST_SW         ;

	input	[31:0]	LOC_ADDR		;
	input	[7:0]	LOC_WD			;
	input			LOC_WE			;
	input			LOC_RE			;
	output			LOC_ACK			;
	output	[7:0]	LOC_RD			;

    input 	[7:0]	REG_STATUS0		;
    input	[15:0]	REG_TRG_STATUS	;
	output	[1:0]	REG_MODE		;
	output  [15:0]	REG_WINDOW		;
	output	[15:0]	REG_LEN			;
	output  [15:0]	REG_DELAY		;
	output  [7:0]	REG_0AX			;
	output  [7:0]	REG_0BX			;
	output  [7:0]	REG_0CX			;
	output  [7:0]	REG_0DX			;

    output	[8*24-1:0]	REG_ADC_PDSTL	;
	output  [47:0]  REG_ATT_MUX     ;
	output	[16*24-1:0] REG_STRIP_POSITION;
	(* mark_debug = "true" *) output [15:0]	REG_THRESHOLD;
	(* mark_debug = "true" *) output [23:0]  REG_THRESHOLD_WIDTH;
	//output	[15:0]	REG_THRESHOLD;
	//output  [23:0]  REG_THRESHOLD_WIDTH;
	//output	[23:0] adc_if;
	output adc1_if_en;  
    output adc1_if_reset;
    output adc2_if_en;   
    output adc2_if_reset;
    output adc3_if_en;   
    output adc3_if_reset;
    
	output	[15:0]	REG_OFFSET;
	output	[1:0]	REG_INTERLOCK;
	
	output 	[1:0]   in_delay_reset_1;         
	output  [4:0]   tap_fco_1;         
                                      
	output 	[1:0]   in_delay_reset_2;            
	output 	[4:0]   tap_fco_2;          
										
	output 	[1:0]   in_delay_reset_3;   
	output 	[4:0]   tap_fco_3;

	output 	[4:0]   tap_1;            
	output 	[4:0]   tap_2;            
	output 	[4:0]   tap_3;            
	output 	[4:0]   tap_4;            
	output 	[4:0]   tap_5;            
	output 	[4:0]   tap_6;            
	output 	[4:0]   tap_7;            
	output 	[4:0]   tap_8; 
	output	[7:0]	REG_TAG_COUNT;
	
//---------- Buffer ----------
	//wire	[9:0]	REG_ADC_TH		;
	/*
	wire	[8*24-1:0]     REG_ADC_PDSTL;
	wire   	[47:0]         REG_ATT_MUX ;
	wire	[1:0]	       REG_MODE;

	wire			REG_ACK			;
	wire			REG_RV			;
	wire	[7:0]	REG_RD			;

	wire	[1:0]	in_delay_reset_1;                    
	wire	[4:0]	tap_fco_1;                      
														
	wire	[1:0]	in_delay_reset_2;                                   
	wire	[4:0]	tap_fco_2;                      
												
	wire	[1:0]   in_delay_reset_3;                         
	wire	[4:0]   tap_fco_3;   

	wire	[4:0]	tap_2_1;                        
	wire	[4:0]	tap_2_2;                        
	wire	[4:0]	tap_2_3;                        
	wire	[4:0]	tap_2_4;                        
	wire	[4:0]	tap_2_5;                        
	wire	[4:0]	tap_2_6;                        
	wire	[4:0]	tap_2_7;                        
	wire	[4:0]	tap_2_8;    	

	wire	[7:0]	trg_tag_count;
	*/

//------------------------------------------------------------------------------
//	Input buffer
//------------------------------------------------------------------------------
	reg		[7:0]	regCs			;
	reg				adcCs			;
	reg		[10:0]	irAddr			;
	reg				irWe			;
	reg				irRe			;
	reg		[7:0]	irWd			;

	always@ (posedge CLK) begin
		regCs[0]	<= (LOC_ADDR[31:4]==28'h0);
		regCs[1]	<= (LOC_ADDR[31:4]==28'h1);
		regCs[2]	<= (LOC_ADDR[31:4]==28'h2);
		regCs[3]	<= (LOC_ADDR[31:4]==28'h3);
		regCs[4]	<= (LOC_ADDR[31:4]==28'h4);
		regCs[5]	<= (LOC_ADDR[31:4]==28'h5);
		regCs[6]	<= (LOC_ADDR[31:4]==28'h6);
		regCs[7]	<= (LOC_ADDR[31:4]==28'h7);
		adcCs		<= (LOC_ADDR[31:8]==24'h1);

		irAddr[10:0]	<= LOC_ADDR[10:0];
		irWe			<= LOC_WE;
		irRe			<= LOC_RE;
		irWd[7:0]		<= LOC_WD[7:0];
	end

//------------------------------------------------------------------------------
//	Receive
//------------------------------------------------------------------------------
    //Declaration of register memory address
//	reg		[7:0]	x00_Reg			;
//	reg		[7:0]	x01_Reg			;
//	reg		[7:0]	x02_Reg			;
//	reg		[7:0]	x03_Reg			;
//	reg		[7:0]	x04_Reg			;
	reg		[1:0]	x05_Reg			;
	reg		[7:0]	x06_Reg			;
	reg		[7:0]	x07_Reg			;
	reg		[7:0]	x08_Reg			;
	reg		[7:0]	x09_Reg			;
	reg		[7:0]	x0A_Reg			;
	reg		[7:0]	x0B_Reg			;
	reg		[7:0]	x0C_Reg			;
	reg		[7:0]	x0D_Reg			;
//	reg		[7:0]	x0E_Reg			;
//	reg		[7:0]	x0F_Reg			;

	reg		[7:0]	x10_Reg			;//32ch[2:0]??

//  reg     [7:0]   x1B_Reg         ;//new 32ch
//	reg		[7:0]	x1C_Reg			;
//	reg		[7:0]	x1D_Reg			;
	reg		[7:0]	x1E_Reg			;//new 32ch	

	reg		[7:0]	x20_Reg			;//ADC pedestal 0ch~7ch
	reg		[7:0]	x21_Reg			;
	reg		[7:0]	x22_Reg			;
	reg		[7:0]	x23_Reg			;
	reg		[7:0]	x24_Reg			;
	reg		[7:0]	x25_Reg			;
	reg		[7:0]	x26_Reg			;
	reg		[7:0]	x27_Reg			;
	
	reg		[7:0]	x28_Reg			;//ADC pedestal 8ch~15ch
	reg		[7:0]	x29_Reg			;
	reg		[7:0]	x2A_Reg			;
	reg		[7:0]	x2B_Reg			;
	reg		[7:0]	x2C_Reg			;
	reg		[7:0]	x2D_Reg			;
	reg		[7:0]	x2E_Reg			;
	reg		[7:0]	x2F_Reg			;

	reg		[7:0]	x30_Reg			;//ADC pedestal 16ch~23ch
	reg		[7:0]	x31_Reg			;
	reg		[7:0]	x32_Reg			;
	reg		[7:0]	x33_Reg			;
	reg		[7:0]	x34_Reg			;
	reg		[7:0]	x35_Reg			;
	reg		[7:0]	x36_Reg			;
	reg		[7:0]	x37_Reg			;
	
	reg		[7:0]	x38_Reg			;//Attenuator multiplexer level papillon 0ch~3ch
	reg		[7:0]	x39_Reg			;//Attenuator multiplexer level papillon 4ch~7ch
	reg		[7:0]	x3A_Reg			;//Attenuator multiplexer level papillon 8ch~11ch
	reg		[7:0]	x3B_Reg			;//Attenuator multiplexer level papillon 12ch~15ch
	reg		[7:0]	x3C_Reg			;//Attenuator multiplexer level papillon 16ch~19ch
	reg		[7:0]	x3D_Reg			;//Attenuator multiplexer level papillon 20ch~23ch
	reg		[7:0]	x3E_Reg			;//Beam position offset
	reg		[7:0]	x3F_Reg			;

	reg		[7:0]	x40_Reg			;//strip position 0ch-7ch
	reg		[7:0]	x41_Reg			;
	reg		[7:0]	x42_Reg			;
	reg		[7:0]	x43_Reg			;
	reg		[7:0]	x44_Reg			;
	reg		[7:0]	x45_Reg			;
	reg		[7:0]	x46_Reg			;
	reg		[7:0]	x47_Reg			;
	reg		[7:0]	x48_Reg			;
	reg		[7:0]	x49_Reg			;
	reg		[7:0]	x4A_Reg			;
	reg		[7:0]	x4B_Reg			;
	reg		[7:0]	x4C_Reg			;
	reg		[7:0]	x4D_Reg			;
	reg		[7:0]	x4E_Reg			;
	reg		[7:0]	x4F_Reg			;

	reg		[7:0]	x50_Reg			;//strip position 8ch-15ch
	reg		[7:0]	x51_Reg			;
	reg		[7:0]	x52_Reg			;
	reg		[7:0]	x53_Reg			;
	reg		[7:0]	x54_Reg			;
	reg		[7:0]	x55_Reg			;
	reg		[7:0]	x56_Reg			;
	reg		[7:0]	x57_Reg			;
	reg		[7:0]	x58_Reg			;
	reg		[7:0]	x59_Reg			;
	reg		[7:0]	x5A_Reg			;
	reg		[7:0]	x5B_Reg			;
	reg		[7:0]	x5C_Reg			;
	reg		[7:0]	x5D_Reg			;
	reg		[7:0]	x5E_Reg			;
	reg		[7:0]	x5F_Reg			;

	reg		[7:0]	x60_Reg			;//strip position 16ch-23ch
	reg		[7:0]	x61_Reg			;
	reg		[7:0]	x62_Reg			;
	reg		[7:0]	x63_Reg			;
	reg		[7:0]	x64_Reg			;
	reg		[7:0]	x65_Reg			;
	reg		[7:0]	x66_Reg			;
	reg		[7:0]	x67_Reg			;
	reg		[7:0]	x68_Reg			;
	reg		[7:0]	x69_Reg			;
	reg		[7:0]	x6A_Reg			;
	reg		[7:0]	x6B_Reg			;
	reg		[7:0]	x6C_Reg			;
	reg		[7:0]	x6D_Reg			;
	reg		[7:0]	x6E_Reg			;
	reg		[7:0]	x6F_Reg			;

	reg		[7:0]	x70_Reg			;//force interlock
	reg		[7:0]	x71_Reg			;//ADC1~3 inteeface enable and interface reset 
	reg		[7:0]	x72_Reg			;//ADC1 interface delay reset
	reg		[7:0]	x73_Reg			;//ADC2 interface delay reset
	reg		[7:0]	x74_Reg			;//ADC3 interface delay reset
	reg		[7:0]	x75_Reg			;//ADC1~3 interface fco delay [4:0]
	reg		[7:0]	x76_Reg			;//ADC1~3 interface 0ch delay [4:0]
	reg		[7:0]	x77_Reg			;//ADC1~3 interface 1ch delay [4:0]
	reg		[7:0]	x78_Reg			;//ADC1~3 interface 2ch delay [4:0]
	reg		[7:0]	x79_Reg			;//ADC1~3 interface 3ch delay [4:0]
	reg		[7:0]	x7A_Reg			;//ADC1~3 interface 4ch delay [4:0]
	reg		[7:0]	x7B_Reg			;//ADC1~3 interface 5ch delay [4:0]
	reg		[7:0]	x7C_Reg			;//ADC1~3 interface 6ch delay [4:0]
	reg		[7:0]	x7D_Reg			;//ADC1~3 interface 7ch delay [4:0]
	reg		[7:0]	x7E_Reg			;//threshold level
	reg		[7:0]	x7F_Reg			;//offset

    //Initialization
	always@ (posedge CLK or posedge RST) begin
		if(RST)begin
//			x00_Reg[7:0]	<= 8'd0;
//			x01_Reg[7:0]	<= 8'd0;
//			x02_Reg[7:0]	<= 8'd0;
//			x03_Reg[7:0]	<= 8'd0;
//			x04_Reg[7:0]	<= 8'd0;
			x05_Reg[1:0]	<= 2'b01;  	// MODE
			x06_Reg[7:0]	<= 8'h01;	// Window size[15:8]
			x07_Reg[7:0]	<= 8'h40;	// Window size[7:0]
			x08_Reg[7:0]	<= 8'h00;	// DELAY[15:8]
			x09_Reg[7:0]	<= 8'h00;	// DELAY[7:0]
			x0A_Reg[7:0]	<= 8'h01;	// Packet Header ID
			x0B_Reg[7:0]	<= 8'h23;	// Packet Header ID
			x0C_Reg[7:0]	<= 8'h45;	// Packet Header ID
			x0D_Reg[7:0]	<= 8'h01;   // Tinning adc data
//			x0E_Reg[7:0]	<= 8'h23;	// Trg monitor
//			x0F_Reg[7:0]	<= 8'h45;	// Trg Monitor

			x10_Reg[7:0]	<= 8'h80;	// ADC 32ch x10_Reg[2:0]  <=3'h00;

//			x1B_Reg[7:0]	<= 8'h00;   // DAC new 32ch
//			x1C_Reg[7:0]	<= 8'h00;	// DAC
//			x1D_Reg[7:0]	<= 8'h00;	// DAC
			x1E_Reg[7:0]	<= 8'h00;	// test on/off new 32ch
			
			x20_Reg[7:0]	<= 8'h00;//ADC pedestal 0ch~7ch
			x21_Reg[7:0]	<= 8'h00;
			x22_Reg[7:0]	<= 8'h00;
			x23_Reg[7:0]	<= 8'h00;
			x24_Reg[7:0]	<= 8'h00;
			x25_Reg[7:0]	<= 8'h00;
			x26_Reg[7:0]	<= 8'h00;
			x27_Reg[7:0]	<= 8'h00;
			
			x28_Reg[7:0]	<= 8'h00;//ADC pedestal 8ch~15ch
			x29_Reg[7:0]	<= 8'h00;
			x2A_Reg[7:0]	<= 8'h00;
			x2B_Reg[7:0]	<= 8'h00;
			x2C_Reg[7:0]	<= 8'h00;
			x2D_Reg[7:0]	<= 8'h00;
			x2E_Reg[7:0]	<= 8'h00;
			x2F_Reg[7:0]	<= 8'h00;
			
			x30_Reg[7:0]	<= 8'h00;//ADC pedestal 16ch~23ch
			x31_Reg[7:0]	<= 8'h00;
			x32_Reg[7:0]	<= 8'h00;
			x33_Reg[7:0]	<= 8'h00;
			x34_Reg[7:0]	<= 8'h00;
			x35_Reg[7:0]	<= 8'h00;
			x36_Reg[7:0]	<= 8'h00;
			x37_Reg[7:0]	<= 8'h00;
			
			x38_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 0ch~3ch               
			x39_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 4ch~7ch               
			x3A_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 8ch~11ch              
			x3B_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 12ch~15ch             
			x3C_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 16ch~19ch             
			x3D_Reg[7:0]	<= 8'h00;//Attenuator multiplexer level papillon 20ch~23ch             
			x3E_Reg[7:0]	<= 8'h00;//Beam position offset                          
			x3F_Reg[7:0]	<= 8'h00;

			x40_Reg[7:0]	<= 8'h00;//strip position 0ch-7ch
			x41_Reg[7:0]	<= 8'h00;
			x42_Reg[7:0]	<= 8'h00;
			x43_Reg[7:0]	<= 8'h00;
			x44_Reg[7:0]	<= 8'h00;
			x45_Reg[7:0]	<= 8'h00;
			x46_Reg[7:0]	<= 8'h00;
			x47_Reg[7:0]	<= 8'h00;
			x48_Reg[7:0]	<= 8'h00;
			x49_Reg[7:0]	<= 8'h00;
			x4A_Reg[7:0]	<= 8'h00;
			x4B_Reg[7:0]	<= 8'h00;
			x4C_Reg[7:0]	<= 8'h00;
			x4D_Reg[7:0]	<= 8'h00;
			x4E_Reg[7:0]	<= 8'h00;
			x4F_Reg[7:0]	<= 8'h00;

			x50_Reg[7:0]	<= 8'h00;//strip position 8ch-15ch
			x51_Reg[7:0]	<= 8'h00;//
			x52_Reg[7:0]	<= 8'h00;//
			x53_Reg[7:0]	<= 8'h00;//
			x54_Reg[7:0]	<= 8'h00;//
			x55_Reg[7:0]	<= 8'h00;//
			x56_Reg[7:0]	<= 8'h00;//
			x57_Reg[7:0]	<= 8'h00;//
			x58_Reg[7:0]	<= 8'h00;//
			x59_Reg[7:0]	<= 8'h00;//
			x5A_Reg[7:0]	<= 8'h00;//
			x5B_Reg[7:0]	<= 8'h00;//
			x5C_Reg[7:0]	<= 8'h00;//
			x5D_Reg[7:0]	<= 8'h00;//
			x5E_Reg[7:0]	<= 8'h00;//
			x5F_Reg[7:0]	<= 8'h00;//

			x60_Reg[7:0]	<= 8'h00;//strip position 16ch-23ch
			x61_Reg[7:0]	<= 8'h00;
			x62_Reg[7:0]	<= 8'h00;
			x63_Reg[7:0]	<= 8'h00;
			x64_Reg[7:0]	<= 8'h00;
			x65_Reg[7:0]	<= 8'h00;
			x66_Reg[7:0]	<= 8'h00;
			x67_Reg[7:0]	<= 8'h00;
			x68_Reg[7:0]	<= 8'h00;
			x69_Reg[7:0]	<= 8'h00;
			x6A_Reg[7:0]	<= 8'h00;
			x6B_Reg[7:0]	<= 8'h00;
			x6C_Reg[7:0]	<= 8'h00;
			x6D_Reg[7:0]	<= 8'h00;
			x6E_Reg[7:0]	<= 8'h00;
			x6F_Reg[7:0]	<= 8'h00;

			x70_Reg[7:0]	<= 8'h00;//Interlock reset/Interlock test                              
			x71_Reg[7:0]	<= 8'h02;//ADC1~3 interface enable and interface reset  
			x72_Reg[7:0]	<= 8'h00;//ADC1 interface delay reset                   
			x73_Reg[7:0]	<= 8'h00;//ADC2 interface delay reset                   
			x74_Reg[7:0]	<= 8'h00;//ADC3 interface delay reset                   
			x75_Reg[7:0]	<= 8'h00;//ADC1~3 interface fco delay [4:0]             
			x76_Reg[7:0]	<= 8'h00;//ADC1~3 interface 0ch delay [4:0]             
			x77_Reg[7:0]	<= 8'h00;//ADC1~3 interface 1ch delay [4:0]             
			x78_Reg[7:0]	<= 8'h00;//ADC1~3 interface 2ch delay [4:0]             
			x79_Reg[7:0]	<= 8'h00;//ADC1~3 interface 3ch delay [4:0]             
			x7A_Reg[7:0]	<= 8'h00;//ADC1~3 interface 4ch delay [4:0]             
			x7B_Reg[7:0]	<= 8'h00;//ADC1~3 interface 5ch delay [4:0]             
			x7C_Reg[7:0]	<= 8'h00;//ADC1~3 interface 6ch delay [4:0]             
			x7D_Reg[7:0]	<= 8'h00;//ADC1~3 interface 7ch delay [4:0]             
			x7E_Reg[7:0]	<= 8'h00;//threshold level                              
			x7F_Reg[7:0]	<= 8'h00;                                     
		end else begin
			if(irWe)begin
//				x00_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x00_Reg[7:0]);
//				x01_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x01_Reg[7:0]);
//				x02_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x02_Reg[7:0]);
//				x03_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x03_Reg[7:0]);
//				x04_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x04_Reg[7:0]);
				x05_Reg[1:0]	<= (regCs[0] & (irAddr[3:0]==4'h5) ? irWd[1:0] : x05_Reg[1:0]);
				x06_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x06_Reg[7:0]);
				x07_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x07_Reg[7:0]);
				x08_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x08_Reg[7:0]);
				x09_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x09_Reg[7:0]);
				x0A_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x0A_Reg[7:0]);
				x0B_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x0B_Reg[7:0]);
				x0C_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x0C_Reg[7:0]);
				x0D_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x0D_Reg[7:0]);
//				x0E_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x0E_Reg[7:0]);
//				x0F_Reg[7:0]	<= (regCs[0] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x0F_Reg[7:0]);

				x10_Reg[7:0]	<= (regCs[1] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x10_Reg[7:0]); //32ch x10_Reg[2:0] <=(regCs[1] & (irAddr[3:0]==4'h0) ? irWd[2:0] : x10_Reg[2:0]);
				
//				x1B_Reg[7:0]	<= (regCs[1] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x1B_Reg[7:0]); //new 32ch
//				x1C_Reg[7:0]	<= (regCs[1] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x1C_Reg[7:0]);
//				x1D_Reg[7:0]	<= (regCs[1] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x1D_Reg[7:0]);
				x1E_Reg[7:0]	<= (regCs[1] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x1E_Reg[7:0]); //new 32ch				

				x20_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x20_Reg[7:0]);//ADC pedestal 0ch~7ch
				x21_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x21_Reg[7:0]);
				x22_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x22_Reg[7:0]);
				x23_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x23_Reg[7:0]);
				x24_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x24_Reg[7:0]);
				x25_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x25_Reg[7:0]);
				x26_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x26_Reg[7:0]);
				x27_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x27_Reg[7:0]);
				
				x28_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x28_Reg[7:0]);//ADC pedestal 8ch~15ch
				x29_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x29_Reg[7:0]);
				x2A_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x2A_Reg[7:0]);
				x2B_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x2B_Reg[7:0]);
				x2C_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x2C_Reg[7:0]);
				x2D_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x2D_Reg[7:0]);
				x2E_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x2E_Reg[7:0]);
				x2F_Reg[7:0]	<= (regCs[2] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x2F_Reg[7:0]);

				x30_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x30_Reg[7:0]);//ADC pedestal 16ch~23ch
				x31_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x31_Reg[7:0]);
				x32_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x32_Reg[7:0]);
				x33_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x33_Reg[7:0]);
				x34_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x34_Reg[7:0]);
				x35_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x35_Reg[7:0]);
				x36_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x36_Reg[7:0]);
				x37_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x37_Reg[7:0]);
				
				x38_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x38_Reg[7:0]);//Attenuator multiplexer level papillon 0ch~3ch   
				x39_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x39_Reg[7:0]);//Attenuator multiplexer level papillon 4ch~7ch   
				x3A_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x3A_Reg[7:0]);//Attenuator multiplexer level papillon 8ch~11ch  
				x3B_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x3B_Reg[7:0]);//Attenuator multiplexer level papillon 12ch~15ch 
				x3C_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x3C_Reg[7:0]);//Attenuator multiplexer level papillon 16ch~19ch 
				x3D_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x3D_Reg[7:0]);//Attenuator multiplexer level papillon 20ch~23ch 
				x3E_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x3E_Reg[7:0]);//Beam position offset                
				x3F_Reg[7:0]	<= (regCs[3] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x3F_Reg[7:0]);

				x40_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x40_Reg[7:0]);
				x41_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x41_Reg[7:0]);
				x42_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x42_Reg[7:0]);
				x43_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x43_Reg[7:0]);
				x44_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x44_Reg[7:0]);
				x45_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x45_Reg[7:0]);
				x46_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x46_Reg[7:0]);
				x47_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x47_Reg[7:0]);
				x48_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x48_Reg[7:0]);
				x49_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x49_Reg[7:0]);
				x4A_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x4A_Reg[7:0]);
				x4B_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x4B_Reg[7:0]);
				x4C_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x4C_Reg[7:0]);
				x4D_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x4D_Reg[7:0]);
				x4E_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x4E_Reg[7:0]);
				x4F_Reg[7:0]	<= (regCs[4] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x4F_Reg[7:0]);

				x50_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x50_Reg[7:0]);
				x51_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x51_Reg[7:0]);
				x52_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x52_Reg[7:0]);
				x53_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x53_Reg[7:0]);
				x54_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x54_Reg[7:0]);
				x55_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x55_Reg[7:0]);
				x56_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x56_Reg[7:0]);
				x57_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x57_Reg[7:0]);
				x58_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x58_Reg[7:0]);
				x59_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x59_Reg[7:0]);
				x5A_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x5A_Reg[7:0]);
				x5B_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x5B_Reg[7:0]);
				x5C_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x5C_Reg[7:0]);
				x5D_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x5D_Reg[7:0]);
				x5E_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x5E_Reg[7:0]);
				x5F_Reg[7:0]	<= (regCs[5] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x5F_Reg[7:0]);

				x60_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x60_Reg[7:0]);
				x61_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x61_Reg[7:0]);
				x62_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x62_Reg[7:0]);
				x63_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x63_Reg[7:0]);
				x64_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x64_Reg[7:0]);
				x65_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x65_Reg[7:0]);
				x66_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x66_Reg[7:0]);
				x67_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x67_Reg[7:0]);
				x68_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x68_Reg[7:0]);
				x69_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x69_Reg[7:0]);
				x6A_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x6A_Reg[7:0]);
				x6B_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x6B_Reg[7:0]);
				x6C_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x6C_Reg[7:0]);
				x6D_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x6D_Reg[7:0]);
				x6E_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x6E_Reg[7:0]);
				x6F_Reg[7:0]	<= (regCs[6] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x6F_Reg[7:0]);

				x70_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h0) ? irWd[7:0] : x70_Reg[7:0]);//Force interlock                                 
				x71_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h1) ? irWd[7:0] : x71_Reg[7:0]);//ADC1~3 inteeface enable and interface reset       
				x72_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h2) ? irWd[7:0] : x72_Reg[7:0]);//ADC1 interface delay reset                        
				x73_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h3) ? irWd[7:0] : x73_Reg[7:0]);//ADC2 interface delay reset                        
				x74_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h4) ? irWd[7:0] : x74_Reg[7:0]);//ADC3 interface delay reset                        
				x75_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h5) ? irWd[7:0] : x75_Reg[7:0]);//ADC1~3 interface fco delay [4:0]                  
				x76_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h6) ? irWd[7:0] : x76_Reg[7:0]);//ADC1~3 interface 0ch delay [4:0]                  
				x77_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h7) ? irWd[7:0] : x77_Reg[7:0]);//ADC1~3 interface 1ch delay [4:0]                  
				x78_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h8) ? irWd[7:0] : x78_Reg[7:0]);//ADC1~3 interface 2ch delay [4:0]                  
				x79_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'h9) ? irWd[7:0] : x79_Reg[7:0]);//ADC1~3 interface 3ch delay [4:0]                  
				x7A_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hA) ? irWd[7:0] : x7A_Reg[7:0]);//ADC1~3 interface 4ch delay [4:0]                  
				x7B_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hB) ? irWd[7:0] : x7B_Reg[7:0]);//ADC1~3 interface 5ch delay [4:0]                  
				x7C_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hC) ? irWd[7:0] : x7C_Reg[7:0]);//ADC1~3 interface 6ch delay [4:0]                  
				x7D_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hD) ? irWd[7:0] : x7D_Reg[7:0]);//ADC1~3 interface 7ch delay [4:0]                  
				x7E_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hE) ? irWd[7:0] : x7E_Reg[7:0]);//threshold level                                   
				x7F_Reg[7:0]	<= (regCs[7] & (irAddr[3:0]==4'hF) ? irWd[7:0] : x7F_Reg[7:0]);                                           
			
			end 			
		end
	end

	wire	[31:0]	fpgaVer		;

	assign	fpgaVer[31:0]	= `SYN_DATE;

	reg		[7:0]	rdDataA		;
	reg		[7:0]	rdDataB		;
	reg		[7:0]	rdDataC		;
	reg		[7:0]	rdDataD		;
	reg		[7:0]	rdDataE		;
	reg		[7:0]	rdDataF		;
	reg		[7:0]	rdDataG		;
	reg		[7:0]	rdDataH		;
	reg		[7:0]	regRv			;
	reg				regAck		;
	//reg		[1:0]	smonAck		;
	reg		[15:0]	rdDataI		;

	reg		[7:0]	rd_data_s2	;

	always@ (posedge CLK) begin
		case(irAddr[3:0])
			4'h0:	rdDataA[7:0]	<= fpgaVer[31:24];
			4'h1:	rdDataA[7:0]	<= fpgaVer[23:16];
			4'h2:	rdDataA[7:0]	<= fpgaVer[15: 8];
			4'h3:	rdDataA[7:0]	<= fpgaVer[ 7: 0];
			4'h4:	rdDataA[7:0]	<= `FPGA_VER;
			4'h5:	rdDataA[7:0]	<= {6'd0,x05_Reg[1:0]};
			4'h6:	rdDataA[7:0]	<= x06_Reg[7:0];	// Window[15:8]
			4'h7:	rdDataA[7:0]	<= x07_Reg[7:0];	// Window[7:0]
			4'h8:	rdDataA[7:0]	<= x08_Reg[7:0];	// DELAY[15:8]
			4'h9:	rdDataA[7:0]	<= x09_Reg[7:0];	// DELAY[7:0]
			4'hA:	rdDataA[7:0]	<= x0A_Reg[7:0];	// ID
			4'hB:	rdDataA[7:0]	<= x0B_Reg[7:0];	// ID
			4'hC:	rdDataA[7:0]	<= x0C_Reg[7:0];	// ID
			4'hD:	rdDataA[7:0]	<= x0D_Reg[7:0];
			4'hE:	rdDataA[7:0]	<= REG_TRG_STATUS[7:0];
			4'hF:	rdDataA[7:0]	<= REG_TRG_STATUS[7:0];
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataB[7:0]	<= x10_Reg[7:0]; //32ch 4'h0:	rdDataB[7:0]	<= {5'd0,x10_Reg[2:0]};
			4'h1:	rdDataB[7:0]	<= 8'd0;
			4'h2:	rdDataB[7:0]	<= 8'd0;
			4'h3:	rdDataB[7:0]	<= 8'd0;
			4'h4:	rdDataB[7:0]	<= 8'd0;
			4'h5:	rdDataB[7:0]	<= 8'd0;
			4'h6:	rdDataB[7:0]	<= 8'd0;
			4'h7:	rdDataB[7:0]	<= 8'd0;
			4'h8:	rdDataB[7:0]	<= 8'd0;
			4'h9:	rdDataB[7:0]	<= 8'd0;
			4'hA:	rdDataB[7:0]	<= 8'd0;
//			4'hB:	rdDataB[7:0]	<= x1B_Reg[7:0]; //new 32ch
//			4'hC:	rdDataB[7:0]	<= x1C_Reg[7:0];
//			4'hD:	rdDataB[7:0]	<= x1D_Reg[7:0];
			4'hE:	rdDataB[7:0]	<= x1E_Reg[7:0]; //new 32ch
			4'hF:	rdDataB[7:0]	<= 8'd0;
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataC[7:0]	<= x20_Reg[7:0]; //ADC pedestal 0ch~7ch --> width threshold
			4'h1:	rdDataC[7:0]	<= x21_Reg[7:0]; // --> width threshold
			4'h2:	rdDataC[7:0]	<= x22_Reg[7:0]; // --> width threshold
			4'h3:	rdDataC[7:0]	<= x23_Reg[7:0];
			4'h4:	rdDataC[7:0]	<= x24_Reg[7:0];
			4'h5:	rdDataC[7:0]	<= x25_Reg[7:0];
			4'h6:	rdDataC[7:0]	<= x26_Reg[7:0];
			4'h7:	rdDataC[7:0]	<= x27_Reg[7:0];
			
			4'h8:	rdDataC[7:0]	<= x28_Reg[7:0]; //ADC pedestal 8ch~15ch  
			4'h9:	rdDataC[7:0]	<= x29_Reg[7:0];
			4'hA:	rdDataC[7:0]	<= x2A_Reg[7:0];
			4'hB:	rdDataC[7:0]	<= x2B_Reg[7:0];
			4'hC:	rdDataC[7:0]	<= x2C_Reg[7:0];
			4'hD:	rdDataC[7:0]	<= x2D_Reg[7:0];
			4'hE:	rdDataC[7:0]	<= x2E_Reg[7:0];
			4'hF:	rdDataC[7:0]	<= x2F_Reg[7:0];
		endcase
		case(irAddr[3:0])                            
			4'h0:	rdDataD[7:0]	<= x30_Reg[7:0];//ADC pedestal 16ch~23ch 
			4'h1:	rdDataD[7:0]	<= x31_Reg[7:0];
			4'h2:	rdDataD[7:0]	<= x32_Reg[7:0];
			4'h3:	rdDataD[7:0]	<= x33_Reg[7:0];
			4'h4:	rdDataD[7:0]	<= x34_Reg[7:0];
			4'h5:	rdDataD[7:0]	<= x35_Reg[7:0];
			4'h6:	rdDataD[7:0]	<= x36_Reg[7:0];
			4'h7:	rdDataD[7:0]	<= x37_Reg[7:0];
			
			4'h8:	rdDataD[7:0]	<= x38_Reg[7:0];//Attenuator multiplexer level papillon 0ch~3ch   
			4'h9:	rdDataD[7:0]	<= x39_Reg[7:0];//Attenuator multiplexer level papillon 4ch~7ch   
			4'hA:	rdDataD[7:0]	<= x3A_Reg[7:0];//Attenuator multiplexer level papillon 8ch~11ch  
			4'hB:	rdDataD[7:0]	<= x3B_Reg[7:0];//Attenuator multiplexer level papillon 12ch~15ch 
			4'hC:	rdDataD[7:0]	<= x3C_Reg[7:0];//Attenuator multiplexer level papillon 16ch~19ch 
			4'hD:	rdDataD[7:0]	<= x3D_Reg[7:0];//Attenuator multiplexer level papillon 20ch~23ch 
			4'hE:	rdDataD[7:0]	<= x3E_Reg[7:0];//Interlock reset/Interlock test                  
			4'hF:	rdDataD[7:0]	<= x3F_Reg[7:0];//offset
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataE[7:0]	<= x40_Reg[7:0];
			4'h1:	rdDataE[7:0]	<= x41_Reg[7:0];
			4'h2:	rdDataE[7:0]	<= x42_Reg[7:0];
			4'h3:	rdDataE[7:0]	<= x43_Reg[7:0];
			4'h4:	rdDataE[7:0]	<= x44_Reg[7:0];
			4'h5:	rdDataE[7:0]	<= x45_Reg[7:0];
			4'h6:	rdDataE[7:0]	<= x46_Reg[7:0];
			4'h7:	rdDataE[7:0]	<= x47_Reg[7:0];
			4'h8:	rdDataE[7:0]	<= x48_Reg[7:0];
			4'h9:	rdDataE[7:0]	<= x49_Reg[7:0];
			4'hA:	rdDataE[7:0]	<= x4A_Reg[7:0];
			4'hB:	rdDataE[7:0]	<= x4B_Reg[7:0];
			4'hC:	rdDataE[7:0]	<= x4C_Reg[7:0];
			4'hD:	rdDataE[7:0]	<= x4D_Reg[7:0];
			4'hE:	rdDataE[7:0]	<= x4E_Reg[7:0];
			4'hF:	rdDataE[7:0]	<= x4F_Reg[7:0];
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataF[7:0]	<= x50_Reg[7:0];
			4'h1:	rdDataF[7:0]	<= x51_Reg[7:0];
			4'h2:	rdDataF[7:0]	<= x52_Reg[7:0];
			4'h3:	rdDataF[7:0]	<= x53_Reg[7:0];
			4'h4:	rdDataF[7:0]	<= x54_Reg[7:0];
			4'h5:	rdDataF[7:0]	<= x55_Reg[7:0];
			4'h6:	rdDataF[7:0]	<= x56_Reg[7:0];
			4'h7:	rdDataF[7:0]	<= x57_Reg[7:0];
			4'h8:	rdDataF[7:0]	<= x58_Reg[7:0];
			4'h9:	rdDataF[7:0]	<= x59_Reg[7:0];
			4'hA:	rdDataF[7:0]	<= x5A_Reg[7:0];
			4'hB:	rdDataF[7:0]	<= x5B_Reg[7:0];
			4'hC:	rdDataF[7:0]	<= x5C_Reg[7:0];
			4'hD:	rdDataF[7:0]	<= x5D_Reg[7:0];
			4'hE:	rdDataF[7:0]	<= x5E_Reg[7:0];
			4'hF:	rdDataF[7:0]	<= x5F_Reg[7:0];
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataG[7:0]	<= x60_Reg[7:0];
			4'h1:	rdDataG[7:0]	<= x61_Reg[7:0];
			4'h2:	rdDataG[7:0]	<= x62_Reg[7:0];
			4'h3:	rdDataG[7:0]	<= x63_Reg[7:0];
			4'h4:	rdDataG[7:0]	<= x64_Reg[7:0];
			4'h5:	rdDataG[7:0]	<= x65_Reg[7:0];
			4'h6:	rdDataG[7:0]	<= x66_Reg[7:0];
			4'h7:	rdDataG[7:0]	<= x67_Reg[7:0];
			4'h8:	rdDataG[7:0]	<= x68_Reg[7:0];
			4'h9:	rdDataG[7:0]	<= x69_Reg[7:0];
			4'hA:	rdDataG[7:0]	<= x6A_Reg[7:0];
			4'hB:	rdDataG[7:0]	<= x6B_Reg[7:0];
			4'hC:	rdDataG[7:0]	<= x6C_Reg[7:0];
			4'hD:	rdDataG[7:0]	<= x6D_Reg[7:0];
			4'hE:	rdDataG[7:0]	<= x6E_Reg[7:0];
			4'hF:	rdDataG[7:0]	<= x6F_Reg[7:0];
		endcase
		case(irAddr[3:0])
			4'h0:	rdDataH[7:0]	<= x70_Reg[7:0];//trigger tag mode                             
			4'h1:	rdDataH[7:0]	<= x71_Reg[7:0];//ADC1~3 inteeface enable and interface reset  
			4'h2:	rdDataH[7:0]	<= x72_Reg[7:0];//ADC1 interface delay reset                   
			4'h3:	rdDataH[7:0]	<= x73_Reg[7:0];//ADC2 interface delay reset                   
			4'h4:	rdDataH[7:0]	<= x74_Reg[7:0];//ADC3 interface delay reset                   
			4'h5:	rdDataH[7:0]	<= x75_Reg[7:0];//ADC1~3 interface fco delay [4:0]             
			4'h6:	rdDataH[7:0]	<= x76_Reg[7:0];//ADC1~3 interface 0ch delay [4:0]             
			4'h7:	rdDataH[7:0]	<= x77_Reg[7:0];//ADC1~3 interface 1ch delay [4:0]             
			4'h8:	rdDataH[7:0]	<= x78_Reg[7:0];//ADC1~3 interface 2ch delay [4:0]             
			4'h9:	rdDataH[7:0]	<= x79_Reg[7:0];//ADC1~3 interface 3ch delay [4:0]             
			4'hA:	rdDataH[7:0]	<= x7A_Reg[7:0];//ADC1~3 interface 4ch delay [4:0]             
			4'hB:	rdDataH[7:0]	<= x7B_Reg[7:0];//ADC1~3 interface 5ch delay [4:0]             
			4'hC:	rdDataH[7:0]	<= x7C_Reg[7:0];//ADC1~3 interface 6ch delay [4:0]             
			4'hD:	rdDataH[7:0]	<= x7D_Reg[7:0];//ADC1~3 interface 7ch delay [4:0]             
			4'hE:	rdDataH[7:0]	<= x7E_Reg[7:0];//threshold level    [15:8]                          
			4'hF:	rdDataH[7:0]	<= x7F_Reg[7:0];//threshold level    [7:0]                                       
		endcase

		regRv[7:0]	<= (irRe	? regCs[7:0] : 8'd0);
		regAck		<= (|regCs[7:0]) & (irWe | irRe);
	end

	reg				orAck		;
	reg		[7:0]	orRd		;

	wire			adcAck		;
	wire	[7:0]	adcRd		;

	always@ (posedge CLK) begin
		//orAck		<= regAck | adcAck | (|smonAck[1:0]);
		orAck		<= regAck | adcAck ;
		orRd[7:0]	<=	(regRv[0]	? rdDataA[7:0]	: 8'd0)|
						(regRv[1]	? rdDataB[7:0]	: 8'd0)|
						(regRv[2]	? rdDataC[7:0]	: 8'd0)|
						(regRv[3]	? rdDataD[7:0]	: 8'd0)|
						(regRv[4]	? rdDataE[7:0]	: 8'd0)|
						(regRv[5]	? rdDataF[7:0]	: 8'd0)|
						(regRv[6]	? rdDataG[7:0]	: 8'd0)|
						(regRv[7]	? rdDataH[7:0]	: 8'd0)|
						(adcAck		? adcRd[7:0]	: 8'd0);
	end

	assign	LOC_ACK		= orAck;
	assign	LOC_RD[7:0] = orRd[7:0];

	reg		[15:0]	REG_DELAY	;
	reg		[15:0]	REG_LEN		;
	
	always@ (posedge CLK) begin
		REG_LEN[15:0]	<= {x06_Reg[6:0],x07_Reg[7:0],1'b0} - 1'b1;//REG_LEN=windowsize*2
//		REG_LEN[15:0]   <= {REG_LEN[14:0],1'b0} -1'b1;    //������̔F���Ƃ��Ă�4000,���ۂɎg���l��7999(*2-1)����K�v������
//		REG_DELAY[15:0]	<= {REG_LEN[15:0]} + {x08_Reg[7:0],x09_Reg[7:0]};
        REG_DELAY[15:0] <= {x08_Reg[7:0],x09_Reg[7:0]};
	end

	assign  REG_MODE[1:0] = x05_Reg[1:0];
	assign  REG_WINDOW[15:0] = {x06_Reg[7:0],x07_Reg[7:0]};

	assign  REG_0AX[7:0] = x0A_Reg[7:0];
	assign  REG_0BX[7:0] = x0B_Reg[7:0];
	assign  REG_0CX[7:0] = x0C_Reg[7:0];
	assign  REG_0DX[7:0] = x0D_Reg[7:0];


	//assign	REG_ADC_PDSTL[8*1-1:8*0]    = x20_Reg[7:0];//ADC pedestal 0ch~7ch   
	//assign	REG_ADC_PDSTL[8*2-1:8*1]    = x21_Reg[7:0];                         
	//assign	REG_ADC_PDSTL[8*3-1:8*2]    = x22_Reg[7:0];
	//assign  REG_THRESHOLD_WIDTH[8*1-1:8*0] = x20_Reg[7:0];
	//assign  REG_THRESHOLD_WIDTH[8*2-1:8*1] = x21_Reg[7:0];
	//assign  REG_THRESHOLD_WIDTH[8*3-1:8*2] = x22_Reg[7:0];
	assign  REG_THRESHOLD_WIDTH[8*3-1:8*2] = x20_Reg[7:0];
	assign  REG_THRESHOLD_WIDTH[8*2-1:8*1] = x21_Reg[7:0];
	assign  REG_THRESHOLD_WIDTH[8*1-1:8*0] = x22_Reg[7:0];    
	assign	REG_ADC_PDSTL[8*4-1:8*3]    = x23_Reg[7:0];                         
	assign  REG_ADC_PDSTL[8*5-1:8*4]    = x24_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*6-1:8*5]    = x25_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*7-1:8*6]    = x26_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*8-1:8*7]    = x27_Reg[7:0];                         
	
	assign	REG_ADC_PDSTL[8*9-1:8*8]    = x28_Reg[7:0];//ADC pedestal 8ch~15ch  
	assign	REG_ADC_PDSTL[8*10-1:8*9]   = x29_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*11-1:8*10]  = x2A_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*12-1:8*11]  = x2B_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*13-1:8*12]  = x2C_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*14-1:8*13]  = x2D_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*15-1:8*14]  = x2E_Reg[7:0];                         
	assign	REG_ADC_PDSTL[8*16-1:8*15]  = x2F_Reg[7:0];                         
	
	assign	REG_ADC_PDSTL[8*17-1:8*16] 	= x30_Reg[7:0];//ADC pedestal 16ch~23ch 
	assign	REG_ADC_PDSTL[8*18-1:8*17] 	= x31_Reg[7:0];
	assign	REG_ADC_PDSTL[8*19-1:8*18] 	= x32_Reg[7:0];
	assign	REG_ADC_PDSTL[8*20-1:8*19] 	= x33_Reg[7:0];
	assign	REG_ADC_PDSTL[8*21-1:8*20] 	= x34_Reg[7:0];
	assign	REG_ADC_PDSTL[8*22-1:8*21] 	= x35_Reg[7:0];
	assign	REG_ADC_PDSTL[8*23-1:8*22] 	= x36_Reg[7:0];
	assign	REG_ADC_PDSTL[8*24-1:8*23] 	= x37_Reg[7:0];
	
	assign	REG_ATT_MUX[7:0]	=	x38_Reg[7:0];//Attenuator multiplexer level papillon 0ch~3ch    
	assign	REG_ATT_MUX[15:8]   =	x39_Reg[7:0];//Attenuator multiplexer level papillon 4ch~7ch    
	assign	REG_ATT_MUX[23:16]  =	x3A_Reg[7:0];//Attenuator multiplexer level papillon 8ch~11ch   
	assign	REG_ATT_MUX[31:24]  =	x3B_Reg[7:0];//Attenuator multiplexer level papillon 12ch~15ch  
	assign	REG_ATT_MUX[39:32]  =	x3C_Reg[7:0];//Attenuator multiplexer level papillon 16ch~19ch  
	assign	REG_ATT_MUX[47:40]  =   x3D_Reg[7:0];//Attenuator multiplexer level papillon 20ch~23ch  
	assign	REG_OFFSET  [15:8]  =   x3E_Reg[7:0];//Beam position offset                   
	assign	REG_OFFSET	[7:0]  =    x3F_Reg[7:0];

	assign	REG_STRIP_POSITION[8*1-1:8*0]	=	x40_Reg[7:0];
	assign	REG_STRIP_POSITION[8*2-1:8*1]	=	x41_Reg[7:0];
	assign	REG_STRIP_POSITION[8*3-1:8*2]	=	x42_Reg[7:0];
	assign	REG_STRIP_POSITION[8*4-1:8*3]	=	x43_Reg[7:0];
	assign	REG_STRIP_POSITION[8*5-1:8*4]	=	x44_Reg[7:0];
	assign	REG_STRIP_POSITION[8*6-1:8*5]	=	x45_Reg[7:0];
	assign	REG_STRIP_POSITION[8*7-1:8*6]	=	x46_Reg[7:0];
	assign	REG_STRIP_POSITION[8*8-1:8*7]	=	x47_Reg[7:0];
	assign	REG_STRIP_POSITION[8*9-1:8*8]	=	x48_Reg[7:0];
	assign	REG_STRIP_POSITION[8*10-1:8*9]	=	x49_Reg[7:0];
	assign	REG_STRIP_POSITION[8*11-1:8*10]	=	x4A_Reg[7:0];
	assign	REG_STRIP_POSITION[8*12-1:8*11]	=	x4B_Reg[7:0];
	assign	REG_STRIP_POSITION[8*13-1:8*12]	=	x4C_Reg[7:0];
	assign	REG_STRIP_POSITION[8*14-1:8*13]	=	x4D_Reg[7:0];
	assign	REG_STRIP_POSITION[8*15-1:8*14]	=	x4E_Reg[7:0];
	assign	REG_STRIP_POSITION[8*16-1:8*15]	=	x4F_Reg[7:0];
	assign	REG_STRIP_POSITION[8*17-1:8*16]	=	x50_Reg[7:0];
	assign	REG_STRIP_POSITION[8*18-1:8*17]	=	x51_Reg[7:0];
	assign	REG_STRIP_POSITION[8*19-1:8*18]	=	x52_Reg[7:0];
	assign	REG_STRIP_POSITION[8*20-1:8*19]	=	x53_Reg[7:0];
	assign	REG_STRIP_POSITION[8*21-1:8*20]	=	x54_Reg[7:0];
	assign	REG_STRIP_POSITION[8*22-1:8*21]	=	x55_Reg[7:0];
	assign	REG_STRIP_POSITION[8*23-1:8*22]	=	x56_Reg[7:0];
	assign	REG_STRIP_POSITION[8*24-1:8*23]	=	x57_Reg[7:0];
	assign	REG_STRIP_POSITION[8*25-1:8*24]	=	x58_Reg[7:0];
	assign	REG_STRIP_POSITION[8*26-1:8*25]	=	x59_Reg[7:0];
	assign	REG_STRIP_POSITION[8*27-1:8*26]	=	x5A_Reg[7:0];
	assign	REG_STRIP_POSITION[8*28-1:8*27]	=	x5B_Reg[7:0];
	assign	REG_STRIP_POSITION[8*29-1:8*28]	=	x5C_Reg[7:0];
	assign	REG_STRIP_POSITION[8*30-1:8*29]	=	x5D_Reg[7:0];
	assign	REG_STRIP_POSITION[8*31-1:8*30]	=	x5E_Reg[7:0];
	assign	REG_STRIP_POSITION[8*32-1:8*31]	=	x5F_Reg[7:0];
	assign	REG_STRIP_POSITION[8*33-1:8*32]	=	x60_Reg[7:0];
	assign	REG_STRIP_POSITION[8*34-1:8*33]	=	x61_Reg[7:0];
	assign	REG_STRIP_POSITION[8*35-1:8*34]	=	x62_Reg[7:0];
	assign	REG_STRIP_POSITION[8*36-1:8*35]	=	x63_Reg[7:0];
	assign	REG_STRIP_POSITION[8*37-1:8*36]	=	x64_Reg[7:0];
	assign	REG_STRIP_POSITION[8*38-1:8*37]	=	x65_Reg[7:0];
	assign	REG_STRIP_POSITION[8*39-1:8*38]	=	x66_Reg[7:0];
	assign	REG_STRIP_POSITION[8*40-1:8*39]	=	x67_Reg[7:0];
	assign	REG_STRIP_POSITION[8*41-1:8*40]	=	x68_Reg[7:0];
	assign	REG_STRIP_POSITION[8*42-1:8*41]	=	x69_Reg[7:0];
	assign	REG_STRIP_POSITION[8*43-1:8*42]	=	x6A_Reg[7:0];
	assign	REG_STRIP_POSITION[8*44-1:8*43]	=	x6B_Reg[7:0];
	assign	REG_STRIP_POSITION[8*45-1:8*44]	=	x6C_Reg[7:0];
	assign	REG_STRIP_POSITION[8*46-1:8*45] =   x6D_Reg[7:0];
	assign	REG_STRIP_POSITION[8*47-1:8*46] =   x6E_Reg[7:0];
	assign	REG_STRIP_POSITION[8*48-1:8*47] =   x6F_Reg[7:0];
	
	assign REG_INTERLOCK[1:0] = x70_Reg[1:0];  
	     
//    assign adc1_if_en			    = x71_Reg[0];
//    assign adc1_if_reset		    = x71_Reg[1]; 
//    assign adc2_if_en			    = x71_Reg[0];
//    assign adc2_if_reset            = x71_Reg[1];
//    assign adc3_if_en			    = x71_Reg[0];
//    assign adc3_if_reset            = x71_Reg[1];      
                                                             
    assign adc1_if_en			    = (x71_Reg[0] ? 1'b1 : 1'b0);
    assign adc1_if_reset		    = (x71_Reg[1] ? 1'b1 : 1'b0);
    assign adc2_if_en			    = (x71_Reg[0] ? 1'b1 : 1'b0);
    assign adc2_if_reset            = (x71_Reg[1] ? 1'b1 : 1'b0);
    assign adc3_if_en			    = (x71_Reg[0] ? 1'b1 : 1'b0);
    assign adc3_if_reset            = (x71_Reg[1] ? 1'b1 : 1'b0);
                                                             
    assign in_delay_reset_1[1:0]	= x72_Reg[1:0];    
    assign in_delay_reset_2[1:0]    = x73_Reg[1:0]; 
    assign in_delay_reset_3[1:0]   	= x74_Reg[1:0];        
    assign tap_fco_1[4:0]          	= x75_Reg[4:0]; 
    assign tap_fco_2[4:0]          	= x75_Reg[4:0]; 
    assign tap_fco_3[4:0]          	= x75_Reg[4:0];
    assign tap_1[4:0]               = x76_Reg[4:0];          
    assign tap_2[4:0]               = x77_Reg[4:0];          
    assign tap_3[4:0]               = x78_Reg[4:0];          
    assign tap_4[4:0]               = x79_Reg[4:0];             
    assign tap_5[4:0]               = x7A_Reg[4:0];      
    assign tap_6[4:0]               = x7B_Reg[4:0];                                                                
    assign tap_7[4:0]               = x7C_Reg[4:0];   
    assign tap_8[4:0]               = x7D_Reg[4:0];   

	assign REG_THRESHOLD[15:8]      = x7E_Reg[7:0];
	assign REG_THRESHOLD[7:0]       = x7F_Reg[7:0];
	
	assign REG_TAG_COUNT[7:0]      = 8'd10;
	
	

//------------------------------------------------------------------------------
//	test in ON/OFF\\\\
//------------------------------------------------------------------------------

     wire   TEST_SW  ;
     
     assign TEST_SW  =   x1E_Reg[0]  ;

//------------------------------------------------------------------------------
//	ADC
//------------------------------------------------------------------------------

	wire	[2:0]	adcSel		;

	assign	adcSel[2:0]	= x10_Reg[2:0];

//	wire	[2:1]	ADC_CSB		;
//	wire	[8:1]	ADC_CSB		;//32ch[4:1] 24ch[3:1]??
	wire	[3:1]	ADC_CSB		;//32ch[4:1] 24ch[3:1]??
	wire			adcCsb		;

/*
	assign	ADC_CSB[1]		= (~adcSel[0] ? adcCsb	: 1'b1);
//	assign	ADC_CSB[2]		= ( adcSel[0] ? adcCsb	: 1'bz);
	assign	ADC_CSB[2]		= ( adcSel[0] & ~adcCsb ? 1'b0	: 1'bz);
*/
assign	  ADC_CSB[1]		= ( adcSel[2:0]==3'h0 & ~adcCsb ? 1'b0	  : 1'bz);
assign    ADC_CSB[2]        = ( adcSel[2:0]==3'h1 & ~adcCsb ? 1'b0    : 1'bz);
assign    ADC_CSB[3]        = ( adcSel[2:0]==3'h2 & ~adcCsb ? 1'b0    : 1'bz);
/*assign    ADC_CSB[4]        = ( adcSel[2:0]==3'h3 & ~adcCsb ? 1'b0    : 1'bz);
assign    ADC_CSB[5]        = ( adcSel[2:0]==3'h4 & ~adcCsb ? 1'b0    : 1'bz);
assign    ADC_CSB[6]        = ( adcSel[2:0]==3'h5 & ~adcCsb ? 1'b0    : 1'bz);
assign    ADC_CSB[7]        = ( adcSel[2:0]==3'h6 & ~adcCsb ? 1'b0    : 1'bz);
assign    ADC_CSB[8]        = ( adcSel[2:0]==3'h7 & ~adcCsb ? 1'b0    : 1'bz);
*/
//32ch ADC_CSB[1~4] 24ch ADC_CSB[1~3]??

	wire			adcSck		;

//	assign	ADC_SCLK[2:1]	= (adcSck	? 2'h3	: 2'h0);
//  assign	ADC_SCLK[8:1]	= (adcSck	? 8'b11111111	: 8'b00000000);
    assign	ADC_SCLK[3:1]	= (adcSck	? 8'b11111111	: 8'b00000000);

	wire			adcSdioIn		;
/*
	assign	adcSdioIn		=	(~adcSel[0] ? ADC_SDIO_IN[1]	: 1'b0)|
								( adcSel[0] ? ADC_SDIO_IN[2]	: 1'b0);
*/
	assign	adcSdioIn		=	    ( adcSel[2:0]==3'h0 ? ADC_SDIO_IN[1]	: 1'b0)|
                                    ( adcSel[2:0]==3'h1 ? ADC_SDIO_IN[2]    : 1'b0)|
                                    ( adcSel[2:0]==3'h2 ? ADC_SDIO_IN[3]    : 1'b0);
                                   /* ( adcSel[2:0]==3'h3 ? ADC_SDIO_IN[4]    : 1'b0)|
                                    ( adcSel[2:0]==3'h4 ? ADC_SDIO_IN[5]    : 1'b0)|
                                    ( adcSel[2:0]==3'h5 ? ADC_SDIO_IN[6]    : 1'b0)|
                                    ( adcSel[2:0]==3'h6 ? ADC_SDIO_IN[7]    : 1'b0)|
                                    ( adcSel[2:0]==3'h7 ? ADC_SDIO_IN[8]    : 1'b0);*/
//32ch 3'h0~3'h3 24ch 3'h0~3'h2? 2016/10/05

	AD_ADC_SPI			AD_ADC_SPI(
	// System
		.CLK				(CLK			),	// in	: System clock
		.RST				(RST			),	// in	: System reset(Asynchronous)
		.TIM				(TIM_1US		),	// in	: Periodic pulse for generating SPI-SCK
												//			(This period equals a half priod of SCK)
	// RBCP I/F
		.RBCP_SELECT	(adcCs					),	// in	: Module select
		.RBCP_ADDR		({5'd0,irAddr[7:0]}	),	// in	: Address[12:0]
		.RBCP_WE			(irWe						),	// in	: Write enable
		.RBCP_WD			(irWd[7:0]				),	// in	: Write data[7:0]
		.RBCP_RE			(irRe						),	// in	: Read enable
		.RBCP_RD			(adcRd[7:0]				),	// out	: Read data[7:0]
		.RBCP_ACK		(adcAck					),	// out	: Access acknowledge
	// ADC SPI
		.SCK				(adcSck				),	// out	: Clock
		.CSB				(adcCsb				),	// out	: Chip select
		.SDDIR			(ADC_SDIO_EN		),	// out	: Direction of the serial data line
		.SDIN				(adcSdioIn			),	// in	: Serial data input
		.SDOUT			(ADC_SDIO_OUT		)	// out	: Serial data output
	);

endmodule