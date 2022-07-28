
module ADC_IF(
   // System
   clk,
  // clk2,
   clk_en,
   // From ADC Signal
   DCO_P,
   DCO_N,
   FCO_P,
   FCO_N,
   sADC_Data_P,
   sADC_Data_N,
   IO_RESET,
   // After Convert Output
   ADC_Data1,
   ADC_Data2,
   ADC_Data3,
   ADC_Data4,
   ADC_Data5,
   ADC_Data6,
   ADC_Data7,
   ADC_Data8,
   frame_ok,
   in_delay_reset,
   delay_tap_in1,
   delay_tap_in2,
   delay_tap_in3,
   delay_tap_in4,
   delay_tap_in5,
   delay_tap_in6,
   delay_tap_in7,
   delay_tap_in8,
   delay_tap_in_fco,
   adc_if_en,
   adc_if_reset
   //data_in_from_pins_delay
);

   // System
   input          clk     ;
   // input          clk2    ;
   input          clk_en  ;

   // From ADC
   input          DCO_P       ;
   input          DCO_N       ;
   input          FCO_P       ;
   input          FCO_N       ;
   input  [7:0]   sADC_Data_P ;
   input  [7:0]   sADC_Data_N ;
   input          IO_RESET    ;

   // After Convert Output
   output [11:0]  ADC_Data1 ;
   output [11:0]  ADC_Data2 ;
   output [11:0]  ADC_Data3 ;
   output [11:0]  ADC_Data4 ;
   output [11:0]  ADC_Data5 ;
   output [11:0]  ADC_Data6 ;
   output [11:0]  ADC_Data7 ;
   output [11:0]  ADC_Data8 ;

   output         frame_ok ;   
      
   input       in_delay_reset;
    
   input   [4:0]   delay_tap_in1; 
   input   [4:0]   delay_tap_in2; 
   input   [4:0]   delay_tap_in3; 
   input   [4:0]   delay_tap_in4; 
   input   [4:0]   delay_tap_in5; 
   input   [4:0]   delay_tap_in6; 
   input   [4:0]   delay_tap_in7; 
   input   [4:0]   delay_tap_in8; 
    
   input   [4:0]   delay_tap_in_fco;
    //output [8:0] data_in_from_pins_delay;

   input          adc_if_en; 
   input          adc_if_reset;

/////////////

   reg            BITSLIP           ;
   reg    [1:0]   DIV_RST           ;
   reg    [1:0]   en_rst;
   wire           CLK_DIV_OUT       ;
   wire   [53:0]  DATA_IN_TO_DEVICE ;

  /// is this correct ? CLK_DIV_OUT is an output from SIF_IF2_TEST
   always@(posedge CLK_DIV_OUT) begin
      DIV_RST[0] <= adc_if_reset   ;
      DIV_RST[1] <= DIV_RST[0] ;
      en_rst[0]  <= adc_if_en   ;
      en_rst[1]  <= en_rst[0] ;     
   end


    reg in_delay_reset_old;

    always@(posedge clk)begin
        in_delay_reset_old <= in_delay_reset;
    end
    
    
    wire in_delay_reset_ON;
    assign in_delay_reset_ON = (in_delay_reset & ~in_delay_reset_old) ? 1'b1 : 1'b0;
    
    reg [1:0] in_delay_reset_ON_old;
    always@(posedge clk)begin
        in_delay_reset_ON_old[0] <= in_delay_reset_ON;
        in_delay_reset_ON_old[1] <= in_delay_reset_ON_old[0];
    end    

    wire in_delay_reset_ON2;
    assign in_delay_reset_ON2 = in_delay_reset_ON | in_delay_reset_ON_old[0] | in_delay_reset_ON_old[1];


    wire [44:0] delay_tap_in_2;
    assign delay_tap_in_2[44:0] = {delay_tap_in1[4:0], 
                                    delay_tap_in2[4:0], 
                                    delay_tap_in3[4:0],
                                    delay_tap_in4[4:0],
                                    delay_tap_in5[4:0],
                                    delay_tap_in6[4:0],
                                    delay_tap_in7[4:0],
                                    delay_tap_in8[4:0],
                                    delay_tap_in_fco[4:0]};
                                    
    wire [44:0]  delay_tap_out;         
    //
    wire ref_clock;
    assign ref_clock = 1'b0;                         

    SIF_IF2_TEST 
      adc(
     .data_in_from_pins_p ({sADC_Data_P[7:0],FCO_P}),     // input [8:0] data_in_from_pins_p
     .data_in_from_pins_n ({sADC_Data_N[7:0],FCO_N}),     // input [8:0] data_in_from_pins_n
     .data_in_to_device   (DATA_IN_TO_DEVICE),     // output [53:0] data_in_to_device
     .in_delay_reset      (in_delay_reset_ON2),     // input in_delay_reset                    
     .in_delay_data_ce    (9'h0),     // input [8  :0] in_delay_data_ce      
     .in_delay_data_inc   (9'h0),     // input [8  :0] in_delay_data_inc     
     .in_delay_tap_in(delay_tap_in_2[44:0]),     // input [224:0] in_delay_tap_in          
     .in_delay_tap_out(delay_tap_out[44:0]),     // output [224:0] in_delay_tap_out  
   
     .delay_locked(delay_locked), // output delay_locked                      
     .ref_clock(ref_clock), // input ref_clock                         
     .bitslip   ({BITSLIP, BITSLIP, BITSLIP, BITSLIP, BITSLIP, BITSLIP, BITSLIP, BITSLIP, BITSLIP}), // input bitslip                           
     .clk_in_p  (DCO_P),  // input clk_in_p                          
     .clk_in_n  (DCO_N),  // input clk_in_n
     .clock_enable (en_rst[1]), // input clock_enable
     .clk_div_out (CLK_DIV_OUT),       // output clk_div_out                       
     .clk_reset  (1'b0),              // input clk_reset
     .io_reset (DIV_RST[1])         // input io_reset
  ); 

   wire   [5:0]   Para_FCO_Data  ;
   wire   [5:0]   Para_ADC_Data1 ;
   wire   [5:0]   Para_ADC_Data2 ;
   wire   [5:0]   Para_ADC_Data3 ;
   wire   [5:0]   Para_ADC_Data4 ;
   wire   [5:0]   Para_ADC_Data5 ;
   wire   [5:0]   Para_ADC_Data6 ;
   wire   [5:0]   Para_ADC_Data7 ;
   wire   [5:0]   Para_ADC_Data8 ;

   assign Para_FCO_Data[5:0]  = { DATA_IN_TO_DEVICE[0],DATA_IN_TO_DEVICE[9], DATA_IN_TO_DEVICE[18],DATA_IN_TO_DEVICE[27],DATA_IN_TO_DEVICE[36],DATA_IN_TO_DEVICE[45] } ;
   assign Para_ADC_Data1[5:0] = { DATA_IN_TO_DEVICE[1],DATA_IN_TO_DEVICE[10],DATA_IN_TO_DEVICE[19],DATA_IN_TO_DEVICE[28],DATA_IN_TO_DEVICE[37],DATA_IN_TO_DEVICE[46] } ;
   assign Para_ADC_Data2[5:0] = { DATA_IN_TO_DEVICE[2],DATA_IN_TO_DEVICE[11],DATA_IN_TO_DEVICE[20],DATA_IN_TO_DEVICE[29],DATA_IN_TO_DEVICE[38],DATA_IN_TO_DEVICE[47] } ;
   assign Para_ADC_Data3[5:0] = { DATA_IN_TO_DEVICE[3],DATA_IN_TO_DEVICE[12],DATA_IN_TO_DEVICE[21],DATA_IN_TO_DEVICE[30],DATA_IN_TO_DEVICE[39],DATA_IN_TO_DEVICE[48] } ;
   assign Para_ADC_Data4[5:0] = { DATA_IN_TO_DEVICE[4],DATA_IN_TO_DEVICE[13],DATA_IN_TO_DEVICE[22],DATA_IN_TO_DEVICE[31],DATA_IN_TO_DEVICE[40],DATA_IN_TO_DEVICE[49] } ;
   assign Para_ADC_Data5[5:0] = { DATA_IN_TO_DEVICE[5],DATA_IN_TO_DEVICE[14],DATA_IN_TO_DEVICE[23],DATA_IN_TO_DEVICE[32],DATA_IN_TO_DEVICE[41],DATA_IN_TO_DEVICE[50] } ;
   assign Para_ADC_Data6[5:0] = { DATA_IN_TO_DEVICE[6],DATA_IN_TO_DEVICE[15],DATA_IN_TO_DEVICE[24],DATA_IN_TO_DEVICE[33],DATA_IN_TO_DEVICE[42],DATA_IN_TO_DEVICE[51] } ;
   assign Para_ADC_Data7[5:0] = { DATA_IN_TO_DEVICE[7],DATA_IN_TO_DEVICE[16],DATA_IN_TO_DEVICE[25],DATA_IN_TO_DEVICE[34],DATA_IN_TO_DEVICE[43],DATA_IN_TO_DEVICE[52] } ;
   assign Para_ADC_Data8[5:0] = { DATA_IN_TO_DEVICE[8],DATA_IN_TO_DEVICE[17],DATA_IN_TO_DEVICE[26],DATA_IN_TO_DEVICE[35],DATA_IN_TO_DEVICE[44],DATA_IN_TO_DEVICE[53] } ;

   reg    [11:0]  FCO_Data  ;
   reg    [11:0]  reg_ADC_Data1 ;
   reg    [11:0]  reg_ADC_Data2 ;
   reg    [11:0]  reg_ADC_Data3 ;
   reg    [11:0]  reg_ADC_Data4 ;
   reg    [11:0]  reg_ADC_Data5 ;
   reg    [11:0]  reg_ADC_Data6 ;
   reg    [11:0]  reg_ADC_Data7 ;
   reg    [11:0]  reg_ADC_Data8 ;

   always@(posedge CLK_DIV_OUT) begin
      if (DIV_RST[1]) begin
         FCO_Data[11:0]      <= 12'd0 ;
         reg_ADC_Data1[11:0] <= 12'd0 ;
         reg_ADC_Data2[11:0] <= 12'd0 ;
         reg_ADC_Data3[11:0] <= 12'd0 ;
         reg_ADC_Data4[11:0] <= 12'd0 ;
         reg_ADC_Data5[11:0] <= 12'd0 ;
         reg_ADC_Data6[11:0] <= 12'd0 ;
         reg_ADC_Data7[11:0] <= 12'd0 ;
         reg_ADC_Data8[11:0] <= 12'd0 ;
      end else begin
         FCO_Data[11:0]      <= {FCO_Data[5:0], Para_FCO_Data[5:0]}  ;
         reg_ADC_Data1[11:0] <= {reg_ADC_Data1[5:0],Para_ADC_Data1[5:0]} ;
         reg_ADC_Data2[11:0] <= {reg_ADC_Data2[5:0],Para_ADC_Data2[5:0]} ;
         reg_ADC_Data3[11:0] <= {reg_ADC_Data3[5:0],Para_ADC_Data3[5:0]} ;
         reg_ADC_Data4[11:0] <= {reg_ADC_Data4[5:0],Para_ADC_Data4[5:0]} ;
         reg_ADC_Data5[11:0] <= {reg_ADC_Data5[5:0],Para_ADC_Data5[5:0]} ;
         reg_ADC_Data6[11:0] <= {reg_ADC_Data6[5:0],Para_ADC_Data6[5:0]} ;
         reg_ADC_Data7[11:0] <= {reg_ADC_Data7[5:0],Para_ADC_Data7[5:0]} ;
         reg_ADC_Data8[11:0] <= {reg_ADC_Data8[5:0],Para_ADC_Data8[5:0]} ;
      end
   end

   reg            reg_Data_en ;

   always@(posedge CLK_DIV_OUT) begin
      if (FCO_Data[11:0]==12'b000000_111111) begin
         reg_Data_en <= 1'b1 ;
      end else begin
         reg_Data_en <= 1'b0 ;
      end
   end

   reg    [1:0]   counter ;

   always@(posedge CLK_DIV_OUT) begin
      if (DIV_RST[1]) begin
         counter[1:0] <= 2'b00 ;
      end else begin
         counter[1:0] <= counter[1:0] + 2'b01 ;
      end
   end

   wire           Allone  ;
   wire           Allzero ;

   assign Allone  = (Para_FCO_Data[5:0]==6'b111111) ;
   assign Allzero = (Para_FCO_Data[5:0]==6'b000000) ;

   always@(posedge CLK_DIV_OUT) begin
      if (counter[1:0]==2'b11) begin
         if (Allzero | Allone) begin
            BITSLIP <= 1'b0 ;
         end else begin
            BITSLIP <= 1'b1 ;
         end
      end else begin
         BITSLIP <= 1'b0 ;
      end
   end

   reg            BITSLIP_finished ;

   always@(posedge CLK_DIV_OUT) begin
      if (DIV_RST[1]) begin
         BITSLIP_finished <= 1'b0 ;
      end else begin
         if (Allzero | Allone) begin
            BITSLIP_finished <= 1'b1 ;
         end else begin
            BITSLIP_finished <= 1'b0 ;
         end
      end
   end

   reg            frame_ok ;

   always@(posedge CLK_DIV_OUT) begin
      if (BITSLIP_finished) begin
         frame_ok <= 1'b1 ;
      end else begin
         frame_ok <= 1'b0 ;
      end
   end

   wire   [95:0]  eras_data_in  ;
   wire   [95:0]  eras_data_out ;

   wire   [11:0]  reg2_ADC_Data1 ;
   wire   [11:0]  reg2_ADC_Data2 ;
   wire   [11:0]  reg2_ADC_Data3 ;
   wire   [11:0]  reg2_ADC_Data4 ;
   wire   [11:0]  reg2_ADC_Data5 ;
   wire   [11:0]  reg2_ADC_Data6 ;
   wire   [11:0]  reg2_ADC_Data7 ;
   wire   [11:0]  reg2_ADC_Data8 ;

   reg    [2:0]   shift_empty     ;
   reg            eras_fifo_reset ;
   reg            eras_wr_en      ;

   assign eras_data_in[95:0] = {reg_ADC_Data1[11:0],reg_ADC_Data2[11:0],reg_ADC_Data3[11:0],reg_ADC_Data4[11:0],reg_ADC_Data5[11:0],reg_ADC_Data6[11:0],reg_ADC_Data7[11:0],reg_ADC_Data8[11:0]};

   assign {reg2_ADC_Data1[11:0],reg2_ADC_Data2[11:0],reg2_ADC_Data3[11:0],reg2_ADC_Data4[11:0],reg2_ADC_Data5[11:0],reg2_ADC_Data6[11:0],reg2_ADC_Data7[11:0],reg2_ADC_Data8[11:0]} = eras_data_out[95:0] ;

   
   fifo_generator_1 eras_fifo (
     .rst(eras_fifo_reset),        // input wire rst
     .wr_clk(CLK_DIV_OUT),  // input wire wr_clk
     .rd_clk(clk),  // input wire rd_clk
     .din(eras_data_in[95:0]),        // input wire [95 : 0] din
     .wr_en((eras_wr_en&reg_Data_en)),    // input wire wr_en
     .rd_en((shift_empty[2]&clk_en)),    // input wire rd_en
     .dout(eras_data_out[95:0]),      // output wire [95 : 0] dout
     .full(),      // output wire full
     .empty(eras_fifo_empty)    // output wire empty
   );
   always@(posedge CLK_DIV_OUT) begin
      eras_fifo_reset <= (~frame_ok)        ;
      eras_wr_en      <= (~eras_fifo_reset) ;     
   end

   always@(posedge clk) begin
      shift_empty[2:0] <= {shift_empty[1:0],(~eras_fifo_empty)} ;
   end

/*
   reg    [11:0]  ADC_Data1 ;
   reg    [11:0]  ADC_Data2 ;
   reg    [11:0]  ADC_Data3 ;
   reg    [11:0]  ADC_Data4 ;
   reg    [11:0]  ADC_Data5 ;
   reg    [11:0]  ADC_Data6 ;
   reg    [11:0]  ADC_Data7 ;
   reg    [11:0]  ADC_Data8 ;

   always@(posedge clk) begin
      ADC_Data1[11:0] <= reg2_ADC_Data1[11:0] ;
      ADC_Data2[11:0] <= reg2_ADC_Data2[11:0] ;
      ADC_Data3[11:0] <= reg2_ADC_Data3[11:0] ;
      ADC_Data4[11:0] <= reg2_ADC_Data4[11:0] ;
      ADC_Data5[11:0] <= reg2_ADC_Data5[11:0] ;
      ADC_Data6[11:0] <= reg2_ADC_Data6[11:0] ;
      ADC_Data7[11:0] <= reg2_ADC_Data7[11:0] ;
      ADC_Data8[11:0] <= reg2_ADC_Data8[11:0] ;
   end
   */
   reg    [11:0]  tmp_ADC_Data1 ;
   reg    [11:0]  tmp_ADC_Data2 ;
   reg    [11:0]  tmp_ADC_Data3 ;
   reg    [11:0]  tmp_ADC_Data4 ;
   reg    [11:0]  tmp_ADC_Data5 ;
   reg    [11:0]  tmp_ADC_Data6 ;
   reg    [11:0]  tmp_ADC_Data7 ;
   reg    [11:0]  tmp_ADC_Data8 ;

   always@(posedge clk) begin
      tmp_ADC_Data1[11:0] <= reg2_ADC_Data1[11:0] ;
      tmp_ADC_Data2[11:0] <= reg2_ADC_Data2[11:0] ;
      tmp_ADC_Data3[11:0] <= reg2_ADC_Data3[11:0] ;
      tmp_ADC_Data4[11:0] <= reg2_ADC_Data4[11:0] ;
      tmp_ADC_Data5[11:0] <= reg2_ADC_Data5[11:0] ;
      tmp_ADC_Data6[11:0] <= reg2_ADC_Data6[11:0] ;
      tmp_ADC_Data7[11:0] <= reg2_ADC_Data7[11:0] ;
      tmp_ADC_Data8[11:0] <= reg2_ADC_Data8[11:0] ;
   end
   
   assign ADC_Data1[11:0] = tmp_ADC_Data1[11:0]; 
   assign ADC_Data2[11:0] = tmp_ADC_Data2[11:0]; 
   assign ADC_Data3[11:0] = tmp_ADC_Data3[11:0]; 
   assign ADC_Data4[11:0] = tmp_ADC_Data4[11:0]; 
   assign ADC_Data5[11:0] = tmp_ADC_Data5[11:0]; 
   assign ADC_Data6[11:0] = tmp_ADC_Data6[11:0]; 
   assign ADC_Data7[11:0] = tmp_ADC_Data7[11:0]; 
   assign ADC_Data8[11:0] = tmp_ADC_Data8[11:0]; 
   
        
endmodule
