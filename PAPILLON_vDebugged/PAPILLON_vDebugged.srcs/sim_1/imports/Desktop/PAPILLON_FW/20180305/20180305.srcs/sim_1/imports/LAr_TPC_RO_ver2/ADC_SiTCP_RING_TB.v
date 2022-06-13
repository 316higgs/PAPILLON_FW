`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:54:04 04/24/2014
// Design Name:   ADC_SiTCP_RING
// Module Name:   C:/Users/yuya/Desktop/LTARS_asic/LAr_FPGA/Work/ISE/LAr_TPC_RO_ver2/ADC_SiTCP_RING_TB.v
// Project Name:  LAr_TPC_RO_ver2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADC_SiTCP_RING
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADC_SiTCP_RING_TB;

	// Inputs
	reg SYSCLK;
	reg sRST;
	reg [15:0] REG_DELAY;
	reg ENABLE;
	reg [287:0] ADC_DATA;
	reg [287:0] NewADC_DATA;
	reg TRIGGER;

	// Outputs
	wire RAW_SOD;
	wire [31:0] RAW_TRG_NUM;
	wire [287:0] RAW_ADC;

	// Instantiate the Unit Under Test (UUT)
	ADC_SiTCP_RING uut (
		.SYSCLK(SYSCLK), 
		.sRST(sRST), 
		.REG_DELAY(REG_DELAY), 
		.ENABLE(ENABLE),
		//.ADC_DATA(ADC_DATA),
		.ADC_DATA(NewADC_DATA), 
		.TRIGGER(TRIGGER), 
		.RAW_SOD(RAW_SOD), 
		.RAW_TRG_NUM(RAW_TRG_NUM), 
		.RAW_ADC(RAW_ADC)
	);
 
	parameter STEP = 100;  //1ŽüŠú?@40ns (MHz)
	
	always begin
		SYSCLK = 1; #(STEP/2);
		SYSCLK = 0; #(STEP/2);	
	end
	
	//RING_ADC
	reg [11:0] counter;
	always begin
		counter = counter + 1; #(STEP);
		ADC_DATA = {24{counter[11:0]}};
	end

    //THINNING	
	reg [3:0]  clk_count;
	reg [11:0] enablecounter;
    always begin
        clk_count = clk_count + 1; //#(STEP);
        if(clk_count == 2)begin 
            #(STEP); 
            ENABLE = 1;
            enablecounter[11:0] = enablecounter[11:0] + 12'd1; //#(STEP);
            NewADC_DATA[287:0]  = {24{enablecounter[11:0]-12'd1}};
            //#(STEP); clk_count = 0;
            clk_count = 0;
        end else begin
            #(STEP);
            ENABLE = 0;
            
        end
    end

	initial begin
		// Initialize Inputs
		SYSCLK        = 0;
		sRST          = 1;
		REG_DELAY     = 0;
		ENABLE        = 0;
		ADC_DATA      = 0;
		NewADC_DATA   = 0;
		TRIGGER       = 0;
		counter       = 0;
		clk_count     = 0;
		enablecounter = 0;
		
		
		// Wait 100 ns for global reset to finish

		#(STEP*10) sRST = 0;

	//	#(STEP*99) TRIGGER = 1;
	//	#(STEP*4)	  TRIGGER = 0;
		
    	#(STEP*11) TRIGGER = 1;
        #(STEP*2)	  TRIGGER = 0;
		
		//#(STEP*100000) $finish;
		#(STEP*10) $finish;
        
		// Add stimulus here

	end
      
endmodule