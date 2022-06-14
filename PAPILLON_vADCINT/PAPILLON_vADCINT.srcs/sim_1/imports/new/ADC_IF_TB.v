`timescale 1ns / 1ps

module ADC_IF_TB;

    //reg       CLK40M;
    reg       CLK160M;
    reg       clk_en;
    reg       ADC_DCO_P;
    reg       ADC_DCO_N;
    reg       ADC_FCO_P;
    reg       ADC_FCO_N;
    wire [7:0] ADC_Data_P;
    wire [7:0] ADC_Data_N;
    wire       in_delay_reset;
    wire [4:0] delay_tap_in_1;
    wire [4:0] delay_tap_in_2;
    wire [4:0] delay_tap_in_3;
    wire [4:0] delay_tap_in_4;
    wire [4:0] delay_tap_in_5;
    wire [4:0] delay_tap_in_6;
    wire [4:0] delay_tap_in_7;
    wire [4:0] delay_tap_in_8;
    wire [4:0] delay_tap_in_fco;
    wire [12*8-1:0] adcData;
    
    reg       IO_RESET;   

    ADC_IF uut(
          // System
          //.clk          (CLK40M),
          //.clk2         (CLK160M),
          .clk          (CLK160M),
          .clk_en       (clk_en),
          // From ADC Signal
          .DCO_P        (ADC_DCO_P      ),        //inversion for circuit design
          .DCO_N        (ADC_DCO_N      ),        //inversion for circuit design
          .FCO_P        (ADC_FCO_P      ),        //inversion for circuit design
          .FCO_N        (ADC_FCO_N      ),        //inversion for circuit design
          .sADC_Data_P  (ADC_Data_P[7:0]),        //inversion for circuit design
          .sADC_Data_N  (ADC_Data_N[7:0]),        //inversion for circuit design
          .IO_RESET     (IO_RESET          ),      
          // After Convert Output
          .ADC_Data1    (adcData[12*1-1:12*0]  ),
          .ADC_Data2    (adcData[12*2-1:12*1]  ),
          .ADC_Data3    (adcData[12*3-1:12*2]  ),
          .ADC_Data4    (adcData[12*4-1:12*3]  ),
          .ADC_Data5    (adcData[12*5-1:12*4]  ),
          .ADC_Data6    (adcData[12*6-1:12*5]  ),
          .ADC_Data7    (adcData[12*7-1:12*6]  ),
          .ADC_Data8    (adcData[12*8-1:12*7]  ),
          .frame_ok     (),
          .in_delay_reset   (in_delay_reset),   
          .delay_tap_in1 (delay_tap_in_1[4:0]),
          .delay_tap_in2 (delay_tap_in_2[4:0]),
          .delay_tap_in3 (delay_tap_in_3[4:0]),
          .delay_tap_in4 (delay_tap_in_4[4:0]),
          .delay_tap_in5 (delay_tap_in_5[4:0]),
          .delay_tap_in6 (delay_tap_in_6[4:0]),
          .delay_tap_in7 (delay_tap_in_7[4:0]),
          .delay_tap_in8 (delay_tap_in_8[4:0]),
          .delay_tap_in_fco (delay_tap_in_fco[4:0])
       );

    parameter BITSLIP_MOD = 8;

//set clock
    parameter STEP_DCO = 4;
    always begin
        ADC_DCO_P = 0;
        ADC_DCO_N = 1;
        #(STEP_DCO/2);
        ADC_DCO_P = 1;
        ADC_DCO_N = 0;
        #(STEP_DCO/2);
    end
    
    parameter STEP_FCO = STEP_DCO * 6;
    initial begin
        ADC_FCO_P = 0;
        ADC_FCO_N = 1;
        #(1 + 4 * BITSLIP_MOD);
        forever begin
            ADC_FCO_P = 1;
            ADC_FCO_N = 0;
            #(STEP_FCO/2);
            ADC_FCO_P = 0;
            ADC_FCO_N = 1;
            #(STEP_FCO/2);              
        end
    end
    
//    parameter STEP_CLK = STEP_FCO / 2;
//    initial begin
//        #(139);
//        forever begin
//            #(STEP_CLK/2) CLK40M = 0;
//            #(STEP_CLK/2) CLK40M = 1;
//        end
//    end 

     parameter STEP_CLK2 = STEP_FCO / 8;
    initial begin
        #(139);
        forever begin
            #(STEP_CLK2/2) CLK160M = 0;
            #(STEP_CLK2/2) CLK160M = 1;
        end
    end     
    
   wire [11:0] ADC_Data_sim[7:0];
   assign ADC_Data_sim[0][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[1][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[2][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[3][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[4][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[5][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[6][11:0] = 12'b100000_000000;
   assign ADC_Data_sim[7][11:0] = 12'b100000_000000;
    
    reg [3:0] ADC_Data_num;
    integer i;
    initial begin
        #(1 + 4 * BITSLIP_MOD);
        forever begin
            ADC_Data_num[3:0] <= 4'd11;
            for(i = 0; i < 12; i = i + 1)begin
                #(STEP_DCO/2);
                ADC_Data_num[3:0] <= ADC_Data_num[3:0] - 1'b1;
            end
        end
    end
    assign ADC_Data_P[0] = ADC_Data_sim[0][ADC_Data_num[3:0]];
    assign ADC_Data_P[1] = ~ADC_Data_sim[1][ADC_Data_num[3:0]];
    assign ADC_Data_P[2] = ADC_Data_sim[2][ADC_Data_num[3:0]];
    assign ADC_Data_P[3] = ~ADC_Data_sim[3][ADC_Data_num[3:0]];
    assign ADC_Data_P[4] = ADC_Data_sim[4][ADC_Data_num[3:0]];
    assign ADC_Data_P[5] = ADC_Data_sim[5][ADC_Data_num[3:0]];
    assign ADC_Data_P[6] = ADC_Data_sim[6][ADC_Data_num[3:0]];
    assign ADC_Data_P[7] = ADC_Data_sim[7][ADC_Data_num[3:0]];
    assign ADC_Data_N[0] = ~ADC_Data_sim[0][ADC_Data_num[3:0]];
    assign ADC_Data_N[1] = ADC_Data_sim[1][ADC_Data_num[3:0]];
    assign ADC_Data_N[2] = ~ADC_Data_sim[2][ADC_Data_num[3:0]];
    assign ADC_Data_N[3] = ADC_Data_sim[3][ADC_Data_num[3:0]];
    assign ADC_Data_N[4] = ~ADC_Data_sim[4][ADC_Data_num[3:0]];
    assign ADC_Data_N[5] = ~ADC_Data_sim[5][ADC_Data_num[3:0]];
    assign ADC_Data_N[6] = ~ADC_Data_sim[6][ADC_Data_num[3:0]];
    assign ADC_Data_N[7] = ~ADC_Data_sim[7][ADC_Data_num[3:0]];    

//other
    initial begin
        #(139);
        IO_RESET = 1;
        #(STEP_CLK2 * 10);
        IO_RESET = 0;
        
    end
    
    
    assign in_delay_reset=1'b0;    
    assign delay_tap_in_1[4:0]=5'd0;
    assign delay_tap_in_2[4:0]=5'd0;
    assign delay_tap_in_3[4:0]=5'd0;
    assign delay_tap_in_4[4:0]=5'd0;
    assign delay_tap_in_5[4:0]=5'd0;
    assign delay_tap_in_6[4:0]=5'd0;
    assign delay_tap_in_7[4:0]=5'd0;
    assign delay_tap_in_8[4:0]=5'd0;      
    assign delay_tap_in_fco[4:0]=5'd0;  
    
    always@(posedge CLK160M) begin
     if (IO_RESET) begin
        clk_en <= 1'b0 ;
     end else begin
        clk_en <= ~clk_en ;
     end
  end      

endmodule