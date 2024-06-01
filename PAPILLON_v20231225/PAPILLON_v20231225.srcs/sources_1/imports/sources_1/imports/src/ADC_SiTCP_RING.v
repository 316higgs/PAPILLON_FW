/*******************************************************************************
*                                                                              *
* System      : ADC SiTCP module                                               *
* Version     : v 0.0.0 2012/03/02                                             *
*                                                                              *
* Description : Delay Buffer                                                   *
*                                                                              *
* Designer    : Tomohisa Uchida                                                *
*                                                                              *
*                Copyright (c) 2012 Tomohisa Uchida                            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/
module ADC_SiTCP_RING(
// System
	SYSCLK				,	// in	: System clock
	sRST				,	// in	: System reset
// Parameters
	REG_DELAY			,	// in	: TRG delay [15:0]
// Enable
    ENABLE              ,
// ADC I/F
 //ADC_DATA				,	// in	: ADC data[191:0]
	ADC_DATA			,	// in	: ADC data[383:0]
// Trigger I/F	
	TRIGGER				,	// in	: Trigger
// Event buffer module I/F
	RAW_SOD				,	// out	: Start of data
	RAW_TRG_NUM			,	// out	: Trigger Number[31:0]
 //RAW_ADC					// out	: Delayed ADC data[191:0]
 	RAW_ADC					// out	: Delayed ADC data[383:0]
);



//-------- Input/Output -------------
	input				SYSCLK			;
	input				sRST			;

	input	[15:0]		REG_DELAY		;
	
	input               ENABLE          ;
    input   [12*24-1:0] ADC_DATA        ;//24ch
	input				TRIGGER   		;

	output				RAW_SOD			;
	output	[31:0]		RAW_TRG_NUM		;
	output	[12*24-1:0]	RAW_ADC			; //24ch

//------ output signals -----
	wire				RAW_SOD			;
	wire	[31:0]		RAW_TRG_NUM		;
	wire	[12*24-1:0]	RAW_ADC			;// 24ch
	
//------------------------------------------------------------------------------
//	Input registers
//------------------------------------------------------------------------------
	reg	[15:0] irDelay;
	always@ (posedge SYSCLK) begin
		irDelay[15:0] <= REG_DELAY[15:0];       //�p�����[�^�̑��
	end


    
//------------------------------------------------------------------------------
//	Pre-prosess
//------------------------------------------------------------------------------
    
   	reg	[1:0] irTrg	= 0;
    //reg [15:0] slrTrg;
 	reg	[7:0] slrTrg = 0;
	always@ (posedge SYSCLK) begin
	   if(sRST)begin
	       irTrg[1:0]  <= 2'd0;
	       slrTrg[7:0] <= 8'd0;
	   end else begin
	       if(ENABLE == 1)begin
		      irTrg[1:0]  <= {irTrg[0],TRIGGER};                 //TRIGGER��1clock������width���Ȃ�
		      slrTrg[7:0] <= {slrTrg[6:0],(irTrg[1:0]==2'b01)};  //TRIGGER�̃^�C�~���O��SOD�̃^�C�~���O�𒲐�(ADC_DATA��RAW_DATA��Delay���Ȃ��Ă���������邽��)
           end
       end
	end

//------------------------------------------------------------------------------
//	Delay buffer
//------------------------------------------------------------------------------
	reg	[12*24-1:0]	wd; //write data
	genvar p ; 
	generate
	 for (p=0;p<24;p=p+1) begin : WD_Gen 
		always@ (posedge SYSCLK) begin
		  if(ENABLE == 1)begin
			wd[12*p+11:12*p] <= ADC_DATA[12*p+11:12*p];
		  end
		end
	 end
	endgenerate

	reg	[11:0]	wa;
	always@ (posedge SYSCLK) begin
	   if(ENABLE == 1)begin
	       if(sRST)begin
			wa[11:0] <= 12'd0;
		   end else begin
			wa[11:0] <= wa[11:0] + 12'd1;
		   end
	   end
	end

	reg	 [11:0]	 ra;
    wire [287:0] rd;  //read data


    
    /////////24ch////////////////////////////////////////////////////
         generate
         genvar i;
           for (i=0; i<36; i=i+1)
             begin: mem_8_4K_generate
                 mem_8_4K ADC_MEM_0 (
                  .clka       (SYSCLK),    // input wire clka
                  .ena        (ENABLE),      // input wire ena
                  .wea        (1'b1),      // input wire [0 : 0] wea
                  .addra      (wa[11:0]),  // input wire [11 : 0] addra
                  .dina       (wd[8*(i+1)-1:8*i]),    // input wire [7 : 0] dina
                  .clkb       (SYSCLK),    // input wire clkb
                  .enb        (ENABLE),      // input wire enb
                  .addrb      (ra[11:0]),  // input wire [11 : 0] addrb  ??????-12'd1?????
                   .doutb      (rd[8*(i+1)-1:8*i])  // output wire [7 : 0] doutb
                  );
             end
          endgenerate
    
        always@ (posedge SYSCLK) begin
           if(ENABLE == 1)begin   // �R�����g�A�E�g����ƃr�b�g�΂�����
                   ra[11:0]    <= wa[11:0] - irDelay[11:0] ;
           end
        end

//------------------------------------------------------------------------------
//    Output
//------------------------------------------------------------------------------
        reg orSod = 1'd0;
        always@ (posedge SYSCLK) begin
            if(sRST)begin
                orSod <= 1'd0;
            end else begin
                if(ENABLE == 1)begin
                    orSod <= slrTrg[0];
                end
            end
        end

        reg [31:0] trgCntr = 0;
        always@ (posedge SYSCLK) begin
        if(sRST)begin
            trgCntr[31:0]    <= 32'd0;
            end else begin
				if(ENABLE == 1)begin
                    trgCntr[31:0]    <= (orSod ? trgCntr[31:0] + 32'd1 : trgCntr[31:0]);
                end
            end
        end
        
        assign RAW_SOD            = orSod;
        assign RAW_TRG_NUM[31:0]  = trgCntr[31:0];
        assign RAW_ADC[12*24-1:0] = rd[12*24-1:0];// 24ch
        
//------------------------------------------------------------------------------
    endmodule
