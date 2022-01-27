//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/25 10:48:36
// Design Name: 
// Module Name: ADC_INT
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
module ADC_INT(
    SYSCLK  ,
	ENABLE	,
    sRST    ,
	DATA_LENGTH,
	ADC_PDSTL,
    STRIP_POSITION  ,
	REG_INTERLOCK,
    WRITE_DATA  ,
    WRITE_ENABLE    ,
	THRESHOLD		,
	THRESHOLD_WIDTH,
    OFFSET          ,
    INT_TAG,
    INT_END  ,
    BEAM_POSITION   ,
	BEAM_WIDTH		,
    INT_INTERLOCK
);
    input 			SYSCLK;//SYSTEM CLOCK
	input			ENABLE;//Write Data CLOCK
	input	[287:0] WRITE_DATA;//ADC DATA
    input 			WRITE_ENABLE;//ADC DATA INABLE
	input 			sRST;//RESET
	
    input	[15:0] 	DATA_LENGTH;//DATA LENGTH(default 4000sample)
    input   [191:0]  ADC_PDSTL;
    input	[383:0] STRIP_POSITION;//SSEM strip position (16bit)
	input 	[1:0]	REG_INTERLOCK;//interlock control from UDP
	input	[15:0] 	THRESHOLD;//beam position threshold level
	input	[23:0]	THRESHOLD_WIDTH;//beam position threshold level
    input	[15:0]	OFFSET;//beam position offset
	
	output          INT_TAG;
    output 			INT_END;//end calculation
    output	[15:0] 	BEAM_POSITION;//result of beam position
	output	[23:0]	BEAM_WIDTH;
    output 			INT_INTERLOCK;//result of interlock
    
	wire intwe;
	reg int_start;
	reg ped;
	
	FD	RST_FD (.D(WRITE_ENABLE), .C(SYSCLK), .Q(intwe));
	
	always@(posedge SYSCLK)begin
        if(sRST)begin
          int_start <= 1'b1;
          ped       <= 1'b0;
        end else begin
          int_start <= WRITE_ENABLE&(~intwe);
          ped       <= int_start;
        end
    end
        
    reg   [12:0]    WD00;
    reg   [12:0]    WD01;
    reg   [12:0]    WD02;
    reg   [12:0]    WD03;
    reg   [12:0]    WD04;
    reg   [12:0]    WD05;
    reg   [12:0]    WD06;
    reg   [12:0]    WD07;
    reg   [12:0]    WD08;
    reg   [12:0]    WD09;
    reg   [12:0]    WD10;
    reg   [12:0]    WD11;
    reg   [12:0]    WD12;
    reg   [12:0]    WD13;
    reg   [12:0]    WD14;
    reg   [12:0]    WD15;
    reg   [12:0]    WD16;
    reg   [12:0]    WD17;
    reg   [12:0]    WD18;
    reg   [12:0]    WD19;
    reg   [12:0]    WD20;
    reg   [12:0]    WD21;
    reg   [12:0]    WD22;
    reg   [12:0]    WD23;
    
    reg   [12:0]    pedestal00;   
    reg   [12:0]    pedestal01;
    reg   [12:0]    pedestal02;
    reg   [12:0]    pedestal03;
    reg   [12:0]    pedestal04;
    reg   [12:0]    pedestal05;
    reg   [12:0]    pedestal06;
    reg   [12:0]    pedestal07;
    reg   [12:0]    pedestal08;
    reg   [12:0]    pedestal09;
    reg   [12:0]    pedestal10;
    reg   [12:0]    pedestal11;
    reg   [12:0]    pedestal12;
    reg   [12:0]    pedestal13;
    reg   [12:0]    pedestal14;
    reg   [12:0]    pedestal15;
    reg   [12:0]    pedestal16;
    reg   [12:0]    pedestal17;
    reg   [12:0]    pedestal18;
    reg   [12:0]    pedestal19;
    reg   [12:0]    pedestal20;
    reg   [12:0]    pedestal21;
    reg   [12:0]    pedestal22;
    reg   [12:0]    pedestal23;
 
    reg   [47:0]    qvalue00;
    reg   [47:0]    qvalue01;
    reg   [47:0]    qvalue02;
    reg   [47:0]    qvalue03;
    reg   [47:0]    qvalue04;
    reg   [47:0]    qvalue05;
    reg   [47:0]    qvalue06;
    reg   [47:0]    qvalue07;
    reg   [47:0]    qvalue08;
    reg   [47:0]    qvalue09;
    reg   [47:0]    qvalue10;
    reg   [47:0]    qvalue11;
    reg   [47:0]    qvalue12;
    reg   [47:0]    qvalue13;
    reg   [47:0]    qvalue14;
    reg   [47:0]    qvalue15;
    reg   [47:0]    qvalue16;
    reg   [47:0]    qvalue17;
    reg   [47:0]    qvalue18;
    reg   [47:0]    qvalue19;
    reg   [47:0]    qvalue20;
    reg   [47:0]    qvalue21;
    reg   [47:0]    qvalue22;
    reg   [47:0]    qvalue23;
 
    reg	  [16:0]    countcal;//count superintegral calculation per spill 
    reg    			sINT;//start of beam profile calculation
    reg				eCAL;//end of superintegral calculation per spill
    
    always@(posedge SYSCLK) begin
    
      if(int_start)begin
        WD00[12:0]   <=  13'd0;
        WD01[12:0]   <=  13'd0;
        WD02[12:0]   <=  13'd0;
        WD03[12:0]   <=  13'd0;
        WD04[12:0]   <=  13'd0;
        WD05[12:0]   <=  13'd0;
        WD06[12:0]   <=  13'd0;
        WD07[12:0]   <=  13'd0;
        WD08[12:0]   <=  13'd0;
        WD09[12:0]   <=  13'd0;
        WD10[12:0]   <=  13'd0;
        WD11[12:0]   <=  13'd0;
        WD12[12:0]   <=  13'd0;
        WD13[12:0]   <=  13'd0;
        WD14[12:0]   <=  13'd0;
        WD15[12:0]   <=  13'd0;
        WD16[12:0]   <=  13'd0;
        WD17[12:0]   <=  13'd0;
        WD18[12:0]   <=  13'd0;
        WD19[12:0]   <=  13'd0;
        WD20[12:0]   <=  13'd0;
        WD21[12:0]   <=  13'd0;
        WD22[12:0]   <=  13'd0;
        WD23[12:0]   <=  13'd0;
        
        pedestal00[12:0]  <=13'd0;
        pedestal01[12:0]  <=13'd0;
        pedestal02[12:0]  <=13'd0;
        pedestal03[12:0]  <=13'd0;
        pedestal04[12:0]  <=13'd0;
        pedestal05[12:0]  <=13'd0;
        pedestal06[12:0]  <=13'd0;
        pedestal07[12:0]  <=13'd0;
        pedestal08[12:0]  <=13'd0;
        pedestal09[12:0]  <=13'd0;
        pedestal10[12:0]  <=13'd0;
        pedestal11[12:0]  <=13'd0;
        pedestal12[12:0]  <=13'd0;
        pedestal13[12:0]  <=13'd0;
        pedestal14[12:0]  <=13'd0;
        pedestal15[12:0]  <=13'd0;
        pedestal16[12:0]  <=13'd0;
        pedestal17[12:0]  <=13'd0;
        pedestal18[12:0]  <=13'd0;
        pedestal19[12:0]  <=13'd0;
        pedestal20[12:0]  <=13'd0;
        pedestal21[12:0]  <=13'd0;
        pedestal22[12:0]  <=13'd0;
        pedestal23[12:0]  <=13'd0;

        qvalue00[47:0]   <= 48'd0;
        qvalue01[47:0]   <= 48'd0;
        qvalue02[47:0]   <= 48'd0;
        qvalue03[47:0]   <= 48'd0;
        qvalue04[47:0]   <= 48'd0;
        qvalue05[47:0]   <= 48'd0;
        qvalue06[47:0]   <= 48'd0;
        qvalue07[47:0]   <= 48'd0;
        qvalue08[47:0]   <= 48'd0;
        qvalue09[47:0]   <= 48'd0;
        qvalue10[47:0]   <= 48'd0;
        qvalue11[47:0]   <= 48'd0;
        qvalue12[47:0]   <= 48'd0;
        qvalue13[47:0]   <= 48'd0;
        qvalue14[47:0]   <= 48'd0;
        qvalue15[47:0]   <= 48'd0;
        qvalue16[47:0]   <= 48'd0;
        qvalue17[47:0]   <= 48'd0;
        qvalue18[47:0]   <= 48'd0;
        qvalue19[47:0]   <= 48'd0;
        qvalue20[47:0]   <= 48'd0;
        qvalue21[47:0]   <= 48'd0;
        qvalue22[47:0]   <= 48'd0;
        qvalue23[47:0]   <= 48'd0;
        
        countcal[16:0]   <= {DATA_LENGTH[15:0],1'b0};
        
        sINT <= 1'b0;
        eCAL <=	1'b1;
		
      end else  
      if(ped) begin
        pedestal00[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*1-1:8*0]};
        pedestal01[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*2-1:8*1]} ;
        pedestal02[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*3-1:8*2]} ;
        pedestal03[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*4-1:8*3]} ;
        pedestal04[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*5-1:8*4]} ;
        pedestal05[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*6-1:8*5]} ;
        pedestal06[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*7-1:8*6]} ;
        pedestal07[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*8-1:8*7]} ;
        pedestal08[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*9-1:8*8]} ;
        pedestal09[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*10-1:8*9]};
        pedestal10[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*11-1:8*10]};
        pedestal11[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*12-1:8*11]};
        pedestal12[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*13-1:8*12]};
        pedestal13[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*14-1:8*13]};
        pedestal14[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*15-1:8*14]};
        pedestal15[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*16-1:8*15]};
        pedestal16[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*17-1:8*16]};
        pedestal17[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*18-1:8*17]};
        pedestal18[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*19-1:8*18]};
        pedestal19[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*20-1:8*19]};
        pedestal20[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*21-1:8*20]};
        pedestal21[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*22-1:8*21]};
        pedestal22[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*23-1:8*22]};
        pedestal23[12:0]  <=13'd1900+{5'd0,ADC_PDSTL[8*24-1:8*23]};
      end else
	  if(intwe&eCAL)begin    
		countcal[16:0] <= countcal[16:0]-15'd1;
			
		WD00[12:0]     <=  {1'd0,WRITE_DATA[12*1-1:12*0]}   - pedestal00[12:0];
        WD01[12:0]   <=  {1'd0,WRITE_DATA[12*2-1:12*1]}   - pedestal01[12:0];
        WD02[12:0]   <=  {1'd0,WRITE_DATA[12*3-1:12*2]}   - pedestal02[12:0];
        WD03[12:0]   <=  {1'd0,WRITE_DATA[12*4-1:12*3]}   - pedestal03[12:0];
        WD04[12:0]   <=  {1'd0,WRITE_DATA[12*5-1:12*4]}   - pedestal04[12:0];
        WD05[12:0]   <=  {1'd0,WRITE_DATA[12*6-1:12*5]}   - pedestal05[12:0];
        WD06[12:0]   <=  {1'd0,WRITE_DATA[12*7-1:12*6]}   - pedestal06[12:0];
        WD07[12:0]   <=  {1'd0,WRITE_DATA[12*8-1:12*7]}   - pedestal07[12:0];
        WD08[12:0]   <=  {1'd0,WRITE_DATA[12*9-1:12*8]}   - pedestal08[12:0];
        WD09[12:0]   <=  {1'd0,WRITE_DATA[12*10-1:12*9]}  - pedestal09[12:0];               
        WD10[12:0]   <=  {1'd0,WRITE_DATA[12*11-1:12*10]} - pedestal10[12:0];
        WD11[12:0]   <=  {1'd0,WRITE_DATA[12*12-1:12*11]} - pedestal11[12:0];
        WD12[12:0]   <=  {1'd0,WRITE_DATA[12*13-1:12*12]} - pedestal12[12:0];
        WD13[12:0]   <=  {1'd0,WRITE_DATA[12*14-1:12*13]} - pedestal13[12:0];
        WD14[12:0]   <=  {1'd0,WRITE_DATA[12*15-1:12*14]} - pedestal14[12:0];
        WD15[12:0]   <=  {1'd0,WRITE_DATA[12*16-1:12*15]} - pedestal15[12:0];
        WD16[12:0]   <=  {1'd0,WRITE_DATA[12*17-1:12*16]} - pedestal16[12:0];
        WD17[12:0]   <=  {1'd0,WRITE_DATA[12*18-1:12*17]} - pedestal17[12:0];
        WD18[12:0]   <=  {1'd0,WRITE_DATA[12*19-1:12*18]} - pedestal18[12:0];
        WD19[12:0]   <=  {1'd0,WRITE_DATA[12*20-1:12*19]} - pedestal19[12:0];
        WD20[12:0]   <=  {1'd0,WRITE_DATA[12*21-1:12*20]} - pedestal20[12:0];
        WD21[12:0]   <=  {1'd0,WRITE_DATA[12*22-1:12*21]} - pedestal21[12:0];
        WD22[12:0]   <=  {1'd0,WRITE_DATA[12*23-1:12*22]} - pedestal22[12:0];
        WD23[12:0]   <=  {1'd0,WRITE_DATA[12*24-1:12*23]} - pedestal23[12:0];
                       
        qvalue00[47:0]   <=    qvalue00[47:0]+{ {36{WD00[12]}},WD00[11:0]};
        qvalue01[47:0]   <=    qvalue01[47:0]+{ {36{WD01[12]}},WD01[11:0]};
        qvalue02[47:0]   <=    qvalue02[47:0]+{ {36{WD02[12]}},WD02[11:0]};
        qvalue03[47:0]   <=    qvalue03[47:0]+{ {36{WD03[12]}},WD03[11:0]};
        qvalue04[47:0]   <=    qvalue04[47:0]+{ {36{WD04[12]}},WD04[11:0]};
        qvalue05[47:0]   <=    qvalue05[47:0]+{ {36{WD05[12]}},WD05[11:0]};
        qvalue06[47:0]   <=    qvalue06[47:0]+{ {36{WD06[12]}},WD06[11:0]};
        qvalue07[47:0]   <=    qvalue07[47:0]+{ {36{WD07[12]}},WD07[11:0]};
        qvalue08[47:0]   <=    qvalue08[47:0]+{ {36{WD08[12]}},WD08[11:0]};
        qvalue09[47:0]   <=    qvalue09[47:0]+{ {36{WD09[12]}},WD09[11:0]};
        qvalue10[47:0]   <=    qvalue10[47:0]+{ {36{WD10[12]}},WD10[11:0]};
        qvalue11[47:0]   <=    qvalue11[47:0]+{ {36{WD11[12]}},WD11[11:0]};
        qvalue12[47:0]   <=    qvalue12[47:0]+{ {36{WD12[12]}},WD12[11:0]};
        qvalue13[47:0]   <=    qvalue13[47:0]+{ {36{WD13[12]}},WD13[11:0]};
        qvalue14[47:0]   <=    qvalue14[47:0]+{ {36{WD14[12]}},WD14[11:0]};
        qvalue15[47:0]   <=    qvalue15[47:0]+{ {36{WD15[12]}},WD15[11:0]};
        qvalue16[47:0]   <=    qvalue16[47:0]+{ {36{WD16[12]}},WD16[11:0]};
        qvalue17[47:0]   <=    qvalue17[47:0]+{ {36{WD17[12]}},WD17[11:0]};
        qvalue18[47:0]   <=    qvalue18[47:0]+{ {36{WD18[12]}},WD18[11:0]};
        qvalue19[47:0]   <=    qvalue19[47:0]+{ {36{WD19[12]}},WD19[11:0]};
        qvalue20[47:0]   <=    qvalue20[47:0]+{ {36{WD20[12]}},WD20[11:0]};
        qvalue21[47:0]   <=    qvalue21[47:0]+{ {36{WD21[12]}},WD21[11:0]};
        qvalue22[47:0]   <=    qvalue22[47:0]+{ {36{WD22[12]}},WD22[11:0]};
        qvalue23[47:0]   <=    qvalue23[47:0]+{ {36{WD23[12]}},WD23[11:0]};
			
		if(countcal==16'd0)begin
		  sINT<=1'b1;
		  eCAL<=1'b0;
		end	
	  end	
	end
	
	reg 	[4:0]	countint;//count of beam profile calculation
    reg    [47:0]	intadc;//result of superintegral calculation per strip
    reg    [15:0]	spos;//strip position
    reg 			eINT;//end of beam profile calculation
	reg 			sSUM;//start of sum calculation
	reg 			sAVR;//start of average calculation
	reg		    	sRMS;//start of rms calculation
             
	always@(posedge SYSCLK) begin
			
		if(int_start)begin
		countint[4:0]<=5'd0;
		intadc[47:0]<=48'd0;
		spos[15:0]<=16'd0;
		eINT<=1'b1;
		sSUM<=1'b0;
		sAVR<=1'b0;
		sRMS<=1'b0;
		end else
		
		if(sINT&eINT)begin
		
		countint[4:0]<=countint[4:0]+5'd1;
		sSUM<=sINT;
		sAVR<=sSUM;
		sRMS<=sAVR;
		
		case(countint[4:0])
		
		5'd0:     intadc[47:0]<=( (qvalue00[47:0]>48'd1200&&(~qvalue00[47]))   ?  qvalue00[47:0]  : 48'd0);
		5'd1:     intadc[47:0]<=( (qvalue01[47:0]>48'd1200&&(~qvalue01[47]))   ?  qvalue01[47:0]  : 48'd0);
		5'd2:     intadc[47:0]<=( (qvalue02[47:0]>48'd1200&&(~qvalue02[47]))   ?  qvalue02[47:0]  : 48'd0);
		5'd3:     intadc[47:0]<=( (qvalue03[47:0]>48'd1200&&(~qvalue03[47]))   ?  qvalue03[47:0]  : 48'd0);
		5'd4:     intadc[47:0]<=( (qvalue04[47:0]>48'd1200&&(~qvalue04[47]))   ?  qvalue04[47:0]  : 48'd0);
		5'd5:     intadc[47:0]<=( (qvalue05[47:0]>48'd1200&&(~qvalue05[47]))   ?  qvalue05[47:0]  : 48'd0);
		5'd6:     intadc[47:0]<=( (qvalue06[47:0]>48'd1200&&(~qvalue06[47]))   ?  qvalue06[47:0]  : 48'd0);
		5'd7:     intadc[47:0]<=( (qvalue07[47:0]>48'd1200&&(~qvalue07[47]))   ?  qvalue07[47:0]  : 48'd0);
		5'd8:     intadc[47:0]<=( (qvalue08[47:0]>48'd1200&&(~qvalue08[47]))   ?  qvalue08[47:0]  : 48'd0);
		5'd9:     intadc[47:0]<=( (qvalue09[47:0]>48'd1200&&(~qvalue09[47]))   ?  qvalue09[47:0]  : 48'd0);
		5'd10:    intadc[47:0]<=( (qvalue10[47:0]>48'd1200&&(~qvalue10[47]))   ?  qvalue10[47:0]  : 48'd0);
		5'd11:    intadc[47:0]<=( (qvalue11[47:0]>48'd1200&&(~qvalue11[47]))   ?  qvalue11[47:0]  : 48'd0);
		5'd12:    intadc[47:0]<=( (qvalue12[47:0]>48'd1200&&(~qvalue12[47]))   ?  qvalue12[47:0]  : 48'd0);
		5'd13:    intadc[47:0]<=( (qvalue13[47:0]>48'd1200&&(~qvalue13[47]))   ?  qvalue13[47:0]  : 48'd0);
		5'd14:    intadc[47:0]<=( (qvalue14[47:0]>48'd1200&&(~qvalue14[47]))   ?  qvalue14[47:0]  : 48'd0);
		5'd15:    intadc[47:0]<=( (qvalue15[47:0]>48'd1200&&(~qvalue15[47]))   ?  qvalue15[47:0]  : 48'd0);
		5'd16:    intadc[47:0]<=( (qvalue16[47:0]>48'd1200&&(~qvalue16[47]))   ?  qvalue16[47:0]  : 48'd0);
		5'd17:    intadc[47:0]<=( (qvalue17[47:0]>48'd1200&&(~qvalue17[47]))   ?  qvalue17[47:0]  : 48'd0);
		5'd18:    intadc[47:0]<=( (qvalue18[47:0]>48'd1200&&(~qvalue18[47]))   ?  qvalue18[47:0]  : 48'd0);
		5'd19:    intadc[47:0]<=( (qvalue19[47:0]>48'd1200&&(~qvalue19[47]))   ?  qvalue19[47:0]  : 48'd0);
		5'd20:    intadc[47:0]<=( (qvalue20[47:0]>48'd1200&&(~qvalue20[47]))   ?  qvalue20[47:0]  : 48'd0);
		5'd21:    intadc[47:0]<=( (qvalue21[47:0]>48'd1200&&(~qvalue21[47]))   ?  qvalue21[47:0]  : 48'd0);
		5'd22:    intadc[47:0]<=( (qvalue22[47:0]>48'd1200&&(~qvalue22[47]))   ?  qvalue22[47:0]  : 48'd0);
		5'd23:    intadc[47:0]<=( (qvalue23[47:0]>48'd1200&&(~qvalue23[47]))   ?  qvalue23[47:0]  : 48'd0);
		default:intadc[47:0]<=48'd0;
		
		endcase
		
		case(countint[4:0])
		
		//2-2// strip position
		
		5'd0:     spos[15:0]<=STRIP_POSITION[16*1-1:16*0];
		5'd1:     spos[15:0]<=STRIP_POSITION[16*2-1:16*1];
		5'd2:     spos[15:0]<=STRIP_POSITION[16*3-1:16*2];
		5'd3:     spos[15:0]<=STRIP_POSITION[16*4-1:16*3];
		5'd4:     spos[15:0]<=STRIP_POSITION[16*5-1:16*4];
		5'd5:     spos[15:0]<=STRIP_POSITION[16*6-1:16*5];
		5'd6:     spos[15:0]<=STRIP_POSITION[16*7-1:16*6];
		5'd7:     spos[15:0]<=STRIP_POSITION[16*8-1:16*7];
		5'd8:     spos[15:0]<=STRIP_POSITION[16*9-1:16*8];
		5'd9:     spos[15:0]<=STRIP_POSITION[16*10-1:16*9];
		5'd10:    spos[15:0]<=STRIP_POSITION[16*11-1:16*10];
		5'd11:    spos[15:0]<=STRIP_POSITION[16*12-1:16*11];
		5'd12:    spos[15:0]<=STRIP_POSITION[16*13-1:16*12];
		5'd13:    spos[15:0]<=STRIP_POSITION[16*14-1:16*13];
		5'd14:    spos[15:0]<=STRIP_POSITION[16*15-1:16*14];
		5'd15:    spos[15:0]<=STRIP_POSITION[16*16-1:16*15];
		5'd16:    spos[15:0]<=STRIP_POSITION[16*17-1:16*16];
		5'd17:    spos[15:0]<=STRIP_POSITION[16*18-1:16*17];
		5'd18:    spos[15:0]<=STRIP_POSITION[16*19-1:16*18];
		5'd19:    spos[15:0]<=STRIP_POSITION[16*20-1:16*19];
		5'd20:    spos[15:0]<=STRIP_POSITION[16*21-1:16*20];
		5'd21:    spos[15:0]<=STRIP_POSITION[16*22-1:16*21];
		5'd22:    spos[15:0]<=STRIP_POSITION[16*23-1:16*22];
		5'd23:    spos[15:0]<=STRIP_POSITION[16*24-1:16*23];
		default:spos[15:0]<=16'd0;
		
		endcase
		
			if(countint[4:0]==5'd24)begin
			eINT<=1'd0;
			end
		end
	end
	
	reg		[63:0]	sum;//result of sum
	reg				eSUM;//end of sum calculation
	reg             beamintensity;
	reg				eAVR;//end of average calculation
	reg				eRMS;
	reg		[15:0]	spos2;
	
	always@(posedge SYSCLK)begin
	
		if(int_start)begin
		sum[63:0]<=64'd0;
		spos2[15:0]<=16'd0;
		eSUM<=1'b1;
		eAVR<=1'b1;
		eRMS<=1'b1;
		beamintensity<=1'b0;
		end else
		if(sSUM)begin
		  sum[63:0] <= sum[63:0]+{{16{intadc[47]}},intadc[47:0]};	
		  spos2     <= spos[15:0];	
			
		  eSUM<=eINT;
		  eAVR<=eSUM;
		  eRMS<=eAVR;
		end
		
		if(sSUM&&(~eSUM))begin
		  beamintensity<=((sum[63:0]>64'd10000)  ? 1'b1 :1'b0);
		end 
		
	end
	
	//Qstrip x Xstrip
  wire [63:0] spos_intadc;
	/*mult_gen_0 multiplier_0 (
    .CLK(SYSCLK),          // input wire CLK
    .A(spos[15:0]),        // input wire [15 : 0] A signed
    .B(intadc[47:0]),      // ibnput wire [47 : 0] B unsigned
    .CE(sSUM&eSUM),        // input wire CE
    .P(spos_intadc[63:0])  // output wire [63 : 0] P
  );*/
    
  reg [63:0] avr;  //result of average calculation
  always@(posedge SYSCLK ) begin
    
    if(int_start)begin
      avr[63:0] <= 64'd0;
    end else
    if(sAVR & eAVR)begin
      avr[63:0] <= avr[63:0] + spos_intadc[63:0];
    end
  end
    
	
	//Qstrip x Xstrip x Xstrip
	wire	[79:0]	spos_spos_intadc;
  /*mult_gen_1 multiplier_1 (
    .CLK(SYSCLK),               // input wire CLK
    .A(spos_intadc[63:0]),      // input wire [63 : 0] A
    .B(spos2[15:0]),            // input wire [15 : 0] B
    .CE(sAVR & eAVR),           // input wire CE
    .P(spos_spos_intadc[79:0])  // output wire [79 : 0] P
  );*/
	
	
	reg	[79:0]	rms;
	always@(posedge SYSCLK)begin
	
		if(int_start)begin
		  rms[79:0]<=80'd0;
		end else
		if(sRMS & eRMS)begin
		  rms[79:0]<=rms[79:0]+spos_spos_intadc[79:0];
		end 
	end
     
	  
  wire          sdiv;
  wire          eavr;
  wire          ediv;
  wire  [63:0]  bposq;
  wire  [63:0]  bposr;
         
  FD    RST_FD1 (.D(~eAVR), .C(SYSCLK), .Q(eavr));
         
  //Beam position X[mm] calculation
  assign  sdiv=(~eavr)&(~eAVR);
	/*divider avr_sum_divider (
    .aclk(SYSCLK),                                 // input wire aclk
    .s_axis_divisor_tvalid(sdiv),                  // input wire s_axis_divisor_tvalid
    .s_axis_divisor_tdata(sum[63:0]),              // input wire [47 : 0] s_axis_divisor_tdata
    .s_axis_dividend_tvalid(sdiv),                 // input wire s_axis_dividend_tvalid
    .s_axis_dividend_tdata(avr[63:0]),             // input wire [47 : 0] s_axis_dividend_tdata
    .m_axis_dout_tvalid(ediv),                     // output wire m_axis_dout_tvalid
    .m_axis_dout_tdata({bposq[63:0],bposr[63:0]})  // output wire [95 : 0] m_axis_dout_tdata
  );*/
   
  //X[mm] x X[mm]
  wire	[31:0] sqbpos;
  /*mult_gen_2 square_beam_position (
    .CLK(SYSCLK),     // input wire CLK
    .A(bposq[15:0]),  // input wire [15 : 0] A
    .B(bposq[15:0]),  // input wire [15 : 0] B
    .CE(ediv),        // input wire CE
    .P(sqbpos[31:0])  // output wire [31 : 0] P
  );*/
	
	wire          erms;
  wire          sdiv2;
  wire          ediv2;
  wire  [63:0]  bwidq;
  wire  [63:0]  bwidr;
         
  FD    RST_FD3 (.D(~eRMS), .C(SYSCLK), .Q(erms));
         
  assign  sdiv2=(~erms)&(~eRMS);
	
  //
	/*divider rms_sum_divider (
    .aclk(SYSCLK),                                // input wire aclk
    .s_axis_divisor_tvalid(sdiv2),                // input wire s_axis_divisor_tvalid
    .s_axis_divisor_tdata(sum[63:0]),             // input wire [63 : 0] s_axis_divisor_tdata
    .s_axis_dividend_tvalid(sdiv2),               // input wire s_axis_dividend_tvalid
    .s_axis_dividend_tdata(rms[63:0]),            // input wire [63 : 0] s_axis_dividend_tdata
    .m_axis_dout_tvalid(ediv2),                   // output wire m_axis_dout_tvalid
    .m_axis_dout_tdata({bwidq[63:0],bwidr[63:0]}) // output wire [127 : 0] m_axis_dout_tdata
  );*/
	
	wire	[47:0]	sqbwid;
	
	wire	[31:0]	bwid;
	wire			ebwid;

	assign sqbwid[47:0]=bwidq[47:0]-sqbpos[31:0];
	
	reg				ssqrt;
	
	reg		[47:0]	sqbwid1;
	
	always@(posedge SYSCLK)begin
	
		if(int_start)begin
			ssqrt<=1'b0;
			sqbwid1[47:0]<=48'd0;
		end
		
		if(sqbwid[47]==1'b0)begin
			sqbwid1[47:0]<=sqbwid[47:0];
			ssqrt<=ediv2;
		end else
		
		if(sqbwid[47]==1'b1)begin
			sqbwid1[47:0]<=48'd0-sqbwid[47:0];
			ssqrt<=ediv2;		
		end
	end
	
  //Taking square root
  /*cordic_0 square_root_rms (
    .aclk(SYSCLK),                           // input wire aclk
    .s_axis_cartesian_tvalid(ssqrt),         // input wire s_axis_cartesian_tvalid
    .s_axis_cartesian_tdata(sqbwid1[47:0]),  // input wire [47 : 0] s_axis_cartesian_tdata
    .m_axis_dout_tvalid(ebwid),              // output wire m_axis_dout_tvalid
    .m_axis_dout_tdata(bwid[31:0])           // output wire [31 : 0] m_axis_dout_tdata
  );*/

  reg			reginterlock;//cantrol interlock from UDP
  reg	[15:0]	BEAM_POSITION;//output of beam position
	reg	[23:0]	BEAM_WIDTH;
	reg	[15:0]	pthreshold;//beam position plus threshold level
	reg [15:0]	nthreshold;//beam position minus threshold level
	reg	[23:0]	wthreshold;
	reg	[15:0]	offset;//beam position offset  
	
	reg			thr;
	reg 		interlockstart;
	reg	[15:0]	nbdif;
	reg	[15:0]	pbdif;
	reg 		calinterlock;
	reg			widinterlock;
	reg			INT_INTERLOCK;//output of interlock
	reg			end_cal;
	
	always@(posedge SYSCLK) begin
		
		if(int_start)begin
			BEAM_POSITION[15:0]<=16'd0;
			BEAM_WIDTH[23:0]<=24'b0;
			INT_INTERLOCK<=1'b0;
			end_cal<=1'b0;
			pthreshold[15:0]<=THRESHOLD[15:0];
			nthreshold[15:0]<=16'd0;
			wthreshold[15:0]<=THRESHOLD_WIDTH[23:0];
			pbdif[15:0]<=16'd0;
			nbdif[15:0]<=16'd0;
			offset[15:0]<=OFFSET[15:0];
			reginterlock<=1'b0;
			calinterlock<=1'b0;
			widinterlock<=1'b0;
			interlockstart<=1'b0;
			thr<=1'b0;
		
		end else
		
		if(REG_INTERLOCK[1])begin
			BEAM_POSITION[15:0]<=16'd0;
			BEAM_WIDTH[23:0]<=24'b0;
			offset[15:0]<=OFFSET[15:0];
			pthreshold[15:0]<=THRESHOLD[15:0];
			nthreshold[15:0]<=16'd0;
			wthreshold[15:0]<=THRESHOLD_WIDTH[23:0];
			pbdif[15:0]<=16'd0;
			nbdif[15:0]<=16'd0;
			reginterlock<=1'b0;
            calinterlock<=1'b0;
            widinterlock<=1'b0;
            interlockstart<=1'b0;
            INT_INTERLOCK<=1'b0;
            thr<=1'b0;
		end
		
		if(ebwid)begin
			BEAM_POSITION[15:0]<=bposq[15:0]+offset[15:0];
			BEAM_WIDTH[23:0]<=bwid[23:0];
			end_cal<=1'b1;
			nthreshold[15:0]<=0-pthreshold[15:0];
			thr<=1'b1;
		end else

		if(thr)begin
			interlockstart<=1'b1;
			thr<=1'b0;
			pbdif[15:0]<=pthreshold[15:0]-BEAM_POSITION[15:0];
			nbdif[15:0]<=nthreshold[15:0]-BEAM_POSITION[15:0];
		end
		
        if(interlockstart&&beamintensity)begin
			calinterlock<=(pbdif[15]&nbdif[15])|(~pbdif[15]&~nbdif[15]);
			//widinterlock <= (BEAM_WIDTH[23:0]<THRESHOLD_WIDTH[23:0]?1'b0:1'b1);
			reginterlock<=REG_INTERLOCK[0];
			INT_INTERLOCK<=(calinterlock|reginterlock|INT_INTERLOCK);
		end else
		
		if(interlockstart&&(~beamintensity))begin
            BEAM_POSITION[15:0]<=8'd0;
            BEAM_WIDTH[23:0]<=24'd0;
            reginterlock<=REG_INTERLOCK[0];
            INT_INTERLOCK<=(reginterlock|INT_INTERLOCK);
        end
			  
    end
		
		wire      end_cal1;
		wire      INT_TAG;
		wire      INT_END;
		
		FD    RST_FD6 (.D(end_cal), .C(SYSCLK), .Q(end_cal1));
		
		assign INT_END=end_cal&(~end_cal1);  
		assign INT_TAG=end_cal;

endmodule