`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/20 17:36:45
// Design Name: 
// Module Name: LEDSet
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


module LEDSet(
        SYSCLK,
        RST,
        MDIO_LEDSet,
        MDC_LEDSet,
        LEDSet_start,
        LEDSet_en,
        CountStart_out
    );
    
    input       SYSCLK;
    input       RST;
    output      MDIO_LEDSet;
    output      MDC_LEDSet;
    input       LEDSet_start;
    output      LEDSet_en;
    output      CountStart_out;
    
    
    
    //start 
    wire StartSig;
    wire StartSig_old;
    wire CountStart;
    
    FD  start_FD0(.Q(StartSig), .C(SYSCLK), .D(LEDSet_start));
    FD  start_FD1(.Q(StartSig_old), .C(SYSCLK), .D(StartSig));    
    assign CountStart = ~StartSig & StartSig_old;
    assign CountStart_out = CountStart;    
    
    reg [5:0]   Count;
    reg         Count_en;
    wire        Count_finish;
    
    always@(negedge SYSCLK or posedge RST) begin
        if(RST)begin
            Count_en <= 1'b0;
        end
        else if(CountStart)begin
            Count_en <= 1'b1;
        end
        else if(Count_finish)begin
            Count_en <= 1'b0;
        end       
    end
    

    
    reg [6:0] MDC_CLK_counter;
    always@(posedge SYSCLK or posedge RST)begin
        if(RST)begin
            MDC_CLK_counter[6:0] <= 7'h0;
        end
        else if(Count_en)begin
            MDC_CLK_counter[6:0] <= MDC_CLK_counter[6:0] + 1'b1;
        end
        else begin
            MDC_CLK_counter[6:0] <= 7'h0;
        end
    end
    

    wire count_up;
    wire MDC_CLK_rev;
    assign count_up = (MDC_CLK_counter[6:0] == 7'b111_1111) ? 1'b1 : 1'b0;
    assign MDC_CLK_rev = (MDC_CLK_counter[5:0] == 6'b11_1111) ? 1'b1 : 1'b0;
    
    //make MDC clk
    reg reg_MDC_LEDSet;        
    always@(posedge SYSCLK or posedge RST)begin
        if(RST)begin
            reg_MDC_LEDSet <= 1'b0;
        end
        else if(~Count_en)begin
            reg_MDC_LEDSet <= 1'b0;
        end
        else if(Count_en && MDC_CLK_rev)begin  
            reg_MDC_LEDSet <= ~reg_MDC_LEDSet;
        end
    end                    
    assign MDC_LEDSet = reg_MDC_LEDSet;
    
    always@(negedge SYSCLK or posedge RST) begin
        if(RST)begin
            Count[5:0] <= 6'h0;
        end
        else if(~Count_en)begin
            Count[5:0] <= 6'h0;
        end         
        else if(Count_en && count_up)begin
            Count[5:0] <= Count[5:0] + 1'b1;
        end     

    end
    
    //if Count[5:0] >= 32 
    assign Count_finish = (Count[5:0] == 32'd33) ? 1'b1 : 1'b0; 
  
  
    //MDIO_OUT shifter    
    reg [32:0] mdioData;

    always@(negedge SYSCLK) begin
        if (~Count_en) begin
            mdioData[32:0] <= {
                1'b1              ,// preamble
                2'b01             ,// start opcode
                2'b01             ,// write opcode
                5'h0              ,// PHY address
                5'd19             ,// register address
                2'b10             ,// turn-around
                16'b0011_1000_0001_1000  // control register
            };
        end 
        else if(count_up)begin
            mdioData[32:0] <= {mdioData[31:0], 1'b1};
        end
    end

    assign MDIO_LEDSet = mdioData[32];    
    assign LEDSet_en = Count_en; 
    
endmodule
