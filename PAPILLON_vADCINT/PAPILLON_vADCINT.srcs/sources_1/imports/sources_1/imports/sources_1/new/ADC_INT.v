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
  SYSCLK,
	ENABLE,
  sRST,
	DATA_LENGTH,
	ADC_PDSTL,
  STRIP_POSITION,
	REG_INTERLOCK,
  WRITE_DATA,
  WRITE_ENABLE,
	THRESHOLD,
	THRESHOLD_WIDTH,
  OFFSET,
  INT_TAG,
  INT_END,
  BEAM_POSITION,
	BEAM_WIDTH,
  INT_INTERLOCK
);
    input         SYSCLK;//SYSTEM CLOCK
	  input         ENABLE;//Write Data CLOCK
	  input [287:0] WRITE_DATA;//ADC DATA
    input         WRITE_ENABLE; //ADC DATA ENABLE (ON when data writing was started at ADC_SiTCP_RAW)
	  input         sRST;//RESET
    input	[15:0] 	DATA_LENGTH;//DATA LENGTH(<--REG_WINDOW, currently, 640 samples)
    input [191:0] ADC_PDSTL;
    input	[383:0] STRIP_POSITION;//SSEM strip position (16bit)
	  input [1:0]   REG_INTERLOCK;//interlock control from UDP
	  input [15:0]  THRESHOLD;//beam position threshold level
	  input [23:0]  THRESHOLD_WIDTH;//beam position threshold level
    input [15:0]  OFFSET;//beam position offset
	
	  output        INT_TAG;
    output        INT_END; //end calculation
    output [15:0] BEAM_POSITION;//result of beam position
	  output [23:0] BEAM_WIDTH;
    output        INT_INTERLOCK;//result of interlock


    wire intwe;
    reg  initADC_INT;  //Flag for initialization
    reg  FillPed;      //Flag for setting pedestal values

    FD RST_FD(.D(WRITE_ENABLE), .C(SYSCLK), .Q(intwe));

    //Start ADC_INT
    always@(posedge SYSCLK) begin

      //Flag initalization
      if (sRST) begin
        initADC_INT <= 1'b1;
        FillPed     <= 1'b0;
      end 
      else begin
        initADC_INT <= WRITE_ENABLE & (~intwe);
        FillPed     <= initADC_INT;  //ON falg after initialization
      end
    end


    //Writing data with respect to each channel(raw wave form)
    reg [12:0] WD00;
    reg [12:0] WD01;
    reg [12:0] WD02;
    reg [12:0] WD03;
    reg [12:0] WD04;
    reg [12:0] WD05;
    reg [12:0] WD06;
    reg [12:0] WD07;
    reg [12:0] WD08;
    reg [12:0] WD09;
    reg [12:0] WD10;
    reg [12:0] WD11;
    reg [12:0] WD12;
    reg [12:0] WD13;
    reg [12:0] WD14;
    reg [12:0] WD15;
    reg [12:0] WD16;
    reg [12:0] WD17;
    reg [12:0] WD18;
    reg [12:0] WD19;
    reg [12:0] WD20;
    reg [12:0] WD21;
    reg [12:0] WD22;
    reg [12:0] WD23;

    //Pedestal with respect to each channel
    reg [12:0] pedestal00;
    reg [12:0] pedestal01;
    reg [12:0] pedestal02;
    reg [12:0] pedestal03;
    reg [12:0] pedestal04;
    reg [12:0] pedestal05;
    reg [12:0] pedestal06;
    reg [12:0] pedestal07;
    reg [12:0] pedestal08;
    reg [12:0] pedestal09;
    reg [12:0] pedestal10;
    reg [12:0] pedestal11;
    reg [12:0] pedestal12;
    reg [12:0] pedestal13;
    reg [12:0] pedestal14;
    reg [12:0] pedestal15;
    reg [12:0] pedestal16;
    reg [12:0] pedestal17;
    reg [12:0] pedestal18;
    reg [12:0] pedestal19;
    reg [12:0] pedestal20;
    reg [12:0] pedestal21;
    reg [12:0] pedestal22;
    reg [12:0] pedestal23;

    //Accumulated signal quantity with respect tio each channel
    reg [47:0] sumQ00;
    reg [47:0] sumQ01;
    reg [47:0] sumQ02;
    reg [47:0] sumQ03;
    reg [47:0] sumQ04;
    reg [47:0] sumQ05;
    reg [47:0] sumQ06;
    reg [47:0] sumQ07;
    reg [47:0] sumQ08;
    reg [47:0] sumQ09;
    reg [47:0] sumQ10;
    reg [47:0] sumQ11;
    reg [47:0] sumQ12;
    reg [47:0] sumQ13;
    reg [47:0] sumQ14;
    reg [47:0] sumQ15;
    reg [47:0] sumQ16;
    reg [47:0] sumQ17;
    reg [47:0] sumQ18;
    reg [47:0] sumQ19;
    reg [47:0] sumQ20;
    reg [47:0] sumQ21;
    reg [47:0] sumQ22;
    reg [47:0] sumQ23;

    
    reg [16:0] CountCal;  //Counter of accumulated integration per spill
    reg IntQNow;          //Interval of accumulated integration per spill (1:calculating/0:finished)
    reg StartCal;         //Start of beam position and width calculation

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        WD00[12:0] <= 13'd0;
        WD01[12:0] <= 13'd0;
        WD02[12:0] <= 13'd0;
        WD03[12:0] <= 13'd0;
        WD04[12:0] <= 13'd0;
        WD05[12:0] <= 13'd0;
        WD06[12:0] <= 13'd0;
        WD07[12:0] <= 13'd0;
        WD08[12:0] <= 13'd0;
        WD09[12:0] <= 13'd0;
        WD10[12:0] <= 13'd0;
        WD11[12:0] <= 13'd0;
        WD12[12:0] <= 13'd0;
        WD13[12:0] <= 13'd0;
        WD14[12:0] <= 13'd0;
        WD15[12:0] <= 13'd0;
        WD16[12:0] <= 13'd0;
        WD17[12:0] <= 13'd0;
        WD18[12:0] <= 13'd0;
        WD19[12:0] <= 13'd0;
        WD20[12:0] <= 13'd0;
        WD21[12:0] <= 13'd0;
        WD22[12:0] <= 13'd0;
        WD23[12:0] <= 13'd0;

        pedestal00[12:0] <= 13'd0;
        pedestal01[12:0] <= 13'd0;
        pedestal02[12:0] <= 13'd0;
        pedestal03[12:0] <= 13'd0;
        pedestal04[12:0] <= 13'd0;
        pedestal05[12:0] <= 13'd0;
        pedestal06[12:0] <= 13'd0;
        pedestal07[12:0] <= 13'd0;
        pedestal08[12:0] <= 13'd0;
        pedestal09[12:0] <= 13'd0;
        pedestal10[12:0] <= 13'd0;
        pedestal11[12:0] <= 13'd0;
        pedestal12[12:0] <= 13'd0;
        pedestal13[12:0] <= 13'd0;
        pedestal14[12:0] <= 13'd0;
        pedestal15[12:0] <= 13'd0;
        pedestal16[12:0] <= 13'd0;
        pedestal17[12:0] <= 13'd0;
        pedestal18[12:0] <= 13'd0;
        pedestal19[12:0] <= 13'd0;
        pedestal20[12:0] <= 13'd0;
        pedestal21[12:0] <= 13'd0;
        pedestal22[12:0] <= 13'd0;
        pedestal23[12:0] <= 13'd0;

        sumQ00[47:0] <= 48'd0;
        sumQ01[47:0] <= 48'd0;
        sumQ02[47:0] <= 48'd0;
        sumQ03[47:0] <= 48'd0;
        sumQ04[47:0] <= 48'd0;
        sumQ05[47:0] <= 48'd0;
        sumQ06[47:0] <= 48'd0;
        sumQ07[47:0] <= 48'd0;
        sumQ08[47:0] <= 48'd0;
        sumQ09[47:0] <= 48'd0;
        sumQ10[47:0] <= 48'd0;
        sumQ11[47:0] <= 48'd0;
        sumQ12[47:0] <= 48'd0;
        sumQ13[47:0] <= 48'd0;
        sumQ14[47:0] <= 48'd0;
        sumQ15[47:0] <= 48'd0;
        sumQ16[47:0] <= 48'd0;
        sumQ17[47:0] <= 48'd0;
        sumQ18[47:0] <= 48'd0;
        sumQ19[47:0] <= 48'd0;
        sumQ20[47:0] <= 48'd0;
        sumQ21[47:0] <= 48'd0;
        sumQ22[47:0] <= 48'd0;
        sumQ23[47:0] <= 48'd0;

        //Set DATA_LENGTH*2 (take double to secure the sufficient time window of accumulated integration)
        CountCal[16:0] <= {DATA_LENGTH[15:0], 1'b0};

        IntQNow  <= 1'b1;  //ON flag for accumulated integration
        StartCal <= 1'b0;  //OFF flag until accumulated integration finish
      end 
      //Substitution of pedestal values
      else if (FillPed) begin 

        //Pedestal = 1900(default) + given values
        pedestal00[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*1-1 : 8*0]};  //extract [7:0]
        pedestal01[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*2-1 : 8*1]};  //extract [15:8] 
        pedestal02[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*3-1 : 8*2]};
        pedestal03[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*4-1 : 8*3]};
        pedestal04[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*5-1 : 8*4]};
        pedestal05[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*6-1 : 8*5]};
        pedestal06[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*7-1 : 8*6]};
        pedestal07[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*8-1 : 8*7]};
        pedestal08[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*9-1 : 8*8]};
        pedestal09[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*10-1 : 8*9]};
        pedestal10[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*11-1 : 8*10]};
        pedestal11[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*12-1 : 8*11]};
        pedestal12[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*13-1 : 8*12]};
        pedestal13[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*14-1 : 8*13]};
        pedestal14[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*15-1 : 8*14]};
        pedestal15[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*16-1 : 8*15]};
        pedestal16[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*17-1 : 8*16]};
        pedestal17[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*18-1 : 8*17]};
        pedestal18[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*19-1 : 8*18]};
        pedestal19[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*20-1 : 8*19]};
        pedestal20[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*21-1 : 8*20]};
        pedestal21[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*22-1 : 8*21]};
        pedestal22[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*23-1 : 8*22]};
        pedestal23[12:0] <= 13'd1900 + {5'd0, ADC_PDSTL[8*24-1 : 8*23]};
      end 
      //Get pedestal subtracted wave form and accumlate it
      //(One step of the accumulated integration)
      else if (intwe & IntQNow) begin

        //Count the step (Count down from DATA_LENGTH*2) 
        CountCal[16:0] <= CountCal[16:0] - 15'd1;

        //Substitute wave form which is subtracted the pedestal
        WD00[12:0] <= {1'd0, WRITE_DATA[12*1-1 : 12*0]   - pedestal00[12:0]};
        WD01[12:0] <= {1'd0, WRITE_DATA[12*2-1 : 12*1]   - pedestal01[12:0]};
        WD02[12:0] <= {1'd0, WRITE_DATA[12*3-1 : 12*2]   - pedestal02[12:0]};
        WD03[12:0] <= {1'd0, WRITE_DATA[12*4-1 : 12*3]   - pedestal03[12:0]};
        WD04[12:0] <= {1'd0, WRITE_DATA[12*5-1 : 12*4]   - pedestal04[12:0]};
        WD05[12:0] <= {1'd0, WRITE_DATA[12*6-1 : 12*5]   - pedestal05[12:0]};
        WD06[12:0] <= {1'd0, WRITE_DATA[12*7-1 : 12*6]   - pedestal06[12:0]};
        WD07[12:0] <= {1'd0, WRITE_DATA[12*8-1 : 12*7]   - pedestal07[12:0]};
        WD08[12:0] <= {1'd0, WRITE_DATA[12*9-1 : 12*8]   - pedestal08[12:0]};
        WD09[12:0] <= {1'd0, WRITE_DATA[12*10-1 : 12*9]  - pedestal09[12:0]};
        WD10[12:0] <= {1'd0, WRITE_DATA[12*11-1 : 12*10] - pedestal10[12:0]};
        WD11[12:0] <= {1'd0, WRITE_DATA[12*12-1 : 12*11] - pedestal11[12:0]};
        WD12[12:0] <= {1'd0, WRITE_DATA[12*13-1 : 12*12] - pedestal12[12:0]};
        WD13[12:0] <= {1'd0, WRITE_DATA[12*14-1 : 12*13] - pedestal13[12:0]};
        WD14[12:0] <= {1'd0, WRITE_DATA[12*15-1 : 12*14] - pedestal14[12:0]};
        WD15[12:0] <= {1'd0, WRITE_DATA[12*16-1 : 12*15] - pedestal15[12:0]};
        WD16[12:0] <= {1'd0, WRITE_DATA[12*17-1 : 12*16] - pedestal16[12:0]};
        WD17[12:0] <= {1'd0, WRITE_DATA[12*18-1 : 12*17] - pedestal17[12:0]};
        WD18[12:0] <= {1'd0, WRITE_DATA[12*19-1 : 12*18] - pedestal18[12:0]};
        WD19[12:0] <= {1'd0, WRITE_DATA[12*20-1 : 12*19] - pedestal19[12:0]};
        WD20[12:0] <= {1'd0, WRITE_DATA[12*21-1 : 12*20] - pedestal20[12:0]};
        WD21[12:0] <= {1'd0, WRITE_DATA[12*22-1 : 12*21] - pedestal21[12:0]};
        WD22[12:0] <= {1'd0, WRITE_DATA[12*23-1 : 12*22] - pedestal22[12:0]};
        WD23[12:0] <= {1'd0, WRITE_DATA[12*24-1 : 12*23] - pedestal23[12:0]};

        //Accumulate signal quantities
        //This sumQ = Previous sumQ + { 36bit 0s, 12bit wave form }
        sumQ00[47:0] <= sumQ00[47:0] + { {36{WD00[12]}}, WD00[11:0] };
        sumQ01[47:0] <= sumQ01[47:0] + { {36{WD01[12]}}, WD01[11:0] };
        sumQ02[47:0] <= sumQ02[47:0] + { {36{WD02[12]}}, WD02[11:0] };
        sumQ03[47:0] <= sumQ03[47:0] + { {36{WD03[12]}}, WD03[11:0] };
        sumQ04[47:0] <= sumQ04[47:0] + { {36{WD04[12]}}, WD04[11:0] };
        sumQ05[47:0] <= sumQ05[47:0] + { {36{WD05[12]}}, WD05[11:0] };
        sumQ06[47:0] <= sumQ06[47:0] + { {36{WD06[12]}}, WD06[11:0] };
        sumQ07[47:0] <= sumQ07[47:0] + { {36{WD07[12]}}, WD07[11:0] };
        sumQ08[47:0] <= sumQ08[47:0] + { {36{WD08[12]}}, WD08[11:0] };
        sumQ09[47:0] <= sumQ09[47:0] + { {36{WD09[12]}}, WD09[11:0] };
        sumQ10[47:0] <= sumQ10[47:0] + { {36{WD10[12]}}, WD10[11:0] };
        sumQ11[47:0] <= sumQ11[47:0] + { {36{WD11[12]}}, WD11[11:0] };
        sumQ12[47:0] <= sumQ12[47:0] + { {36{WD12[12]}}, WD12[11:0] };
        sumQ13[47:0] <= sumQ13[47:0] + { {36{WD13[12]}}, WD13[11:0] };
        sumQ14[47:0] <= sumQ14[47:0] + { {36{WD14[12]}}, WD14[11:0] };
        sumQ15[47:0] <= sumQ15[47:0] + { {36{WD15[12]}}, WD15[11:0] };
        sumQ16[47:0] <= sumQ16[47:0] + { {36{WD16[12]}}, WD16[11:0] };
        sumQ17[47:0] <= sumQ17[47:0] + { {36{WD17[12]}}, WD17[11:0] };
        sumQ18[47:0] <= sumQ18[47:0] + { {36{WD18[12]}}, WD18[11:0] };
        sumQ19[47:0] <= sumQ19[47:0] + { {36{WD19[12]}}, WD19[11:0] };
        sumQ20[47:0] <= sumQ20[47:0] + { {36{WD20[12]}}, WD20[11:0] };
        sumQ21[47:0] <= sumQ21[47:0] + { {36{WD21[12]}}, WD21[11:0] };
        sumQ22[47:0] <= sumQ22[47:0] + { {36{WD22[12]}}, WD22[11:0] };
        sumQ23[47:0] <= sumQ23[47:0] + { {36{WD23[12]}}, WD23[11:0] };

        //End of accumulated integration
        //If DATA_LENGTH is 640 samples, it corresponds to the integration on 8 us time windiow
        //(It is sufficient for covering a spill ~5 us)
        if (CountCal==16'd0) begin
          IntQNow  <= 1'b0;  //OFF flag for accumulation integration
          StartCal <= 1'b1;  //ON flag for the next calculation (position and width)
        end
      end
    end


    reg [4:0]  ChCounter;   //Channel counter
    reg [47:0] Qstrip;      //Accumulated signal quantities per strip channel
    reg [15:0] xstrip;      //strip position
    reg        QstripNow;          //Interval for setting Qstrip and xstrip (1:setting/0:finished)
    reg        StartSum;           //Flag for summation 
    reg        StartWeightSum;     //Flag for weighted summation
    reg        StartDelay;         //Flag for delayed signals(use in xstrip_x_xstrip_x_Qstrip)
    reg        StartSquareWeight;  //Flag for xstrip_x_xstrip_x_Qstrip
    reg        UseThisQstrip;

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        ChCounter[4:0]    <=  5'd0;
        //Qstrip[47:0]      <= 48'd0;
        //xstrip[15:0]      <= 16'd0;
        QstripNow         <=  1'b1;  //ON flag for setting Qstrip and xstrip
        StartSum          <=  1'b0;
        StartWeightSum    <=  1'b0;
        StartDelay        <=  1'b0;
        StartSquareWeight <=  1'b0;
      end
      //Setting Qstrip and xstrip (after accumulated integration)
      else if (StartCal & QstripNow) begin
        ChCounter[4:0]    <= ChCounter[4:0] + 5'd1;
        StartSum          <= StartCal;       //ON flag for taking summation
        StartWeightSum    <= StartSum;       //ON flag after summation
        StartDelay        <= StartWeightSum;
        StartSquareWeight <= StartDelay;     //ON flag after taking average

        //Get Qstrip from accumulated signal quantities
        //(Use only >1200 ones to avoid downshoot)
        /*case(ChCounter[4:0])
          5'd0:  Qstrip[47:0] <= ( (sumQ00[47:0]>48'd1200 && (~sumQ00[47])) ? sumQ00[47:0] : 48'd0 );  //ch.0
          5'd1:  Qstrip[47:0] <= ( (sumQ01[47:0]>48'd1200 && (~sumQ01[47])) ? sumQ01[47:0] : 48'd0 );  //ch.1
          5'd2:  Qstrip[47:0] <= ( (sumQ02[47:0]>48'd1200 && (~sumQ02[47])) ? sumQ02[47:0] : 48'd0 );  //ch.2
          5'd3:  Qstrip[47:0] <= ( (sumQ03[47:0]>48'd1200 && (~sumQ03[47])) ? sumQ03[47:0] : 48'd0 );  //ch.3
          5'd4:  Qstrip[47:0] <= ( (sumQ04[47:0]>48'd1200 && (~sumQ04[47])) ? sumQ04[47:0] : 48'd0 );  //ch.4
          5'd5:  Qstrip[47:0] <= ( (sumQ05[47:0]>48'd1200 && (~sumQ05[47])) ? sumQ05[47:0] : 48'd0 );  //ch.5
          5'd6:  Qstrip[47:0] <= ( (sumQ06[47:0]>48'd1200 && (~sumQ06[47])) ? sumQ06[47:0] : 48'd0 );  //ch.6
          5'd7:  Qstrip[47:0] <= ( (sumQ07[47:0]>48'd1200 && (~sumQ07[47])) ? sumQ07[47:0] : 48'd0 );  //ch.7
          5'd8:  Qstrip[47:0] <= ( (sumQ08[47:0]>48'd1200 && (~sumQ08[47])) ? sumQ08[47:0] : 48'd0 );  //ch.8
          5'd9:  Qstrip[47:0] <= ( (sumQ09[47:0]>48'd1200 && (~sumQ09[47])) ? sumQ09[47:0] : 48'd0 );  //ch.9
          5'd10: Qstrip[47:0] <= ( (sumQ10[47:0]>48'd1200 && (~sumQ10[47])) ? sumQ10[47:0] : 48'd0 );  //ch.10
          5'd11: Qstrip[47:0] <= ( (sumQ11[47:0]>48'd1200 && (~sumQ11[47])) ? sumQ11[47:0] : 48'd0 );  //ch.11
          5'd12: Qstrip[47:0] <= ( (sumQ12[47:0]>48'd1200 && (~sumQ12[47])) ? sumQ12[47:0] : 48'd0 );  //ch.12
          5'd13: Qstrip[47:0] <= ( (sumQ13[47:0]>48'd1200 && (~sumQ13[47])) ? sumQ13[47:0] : 48'd0 );  //ch.13
          5'd14: Qstrip[47:0] <= ( (sumQ14[47:0]>48'd1200 && (~sumQ14[47])) ? sumQ14[47:0] : 48'd0 );  //ch.14
          5'd15: Qstrip[47:0] <= ( (sumQ15[47:0]>48'd1200 && (~sumQ15[47])) ? sumQ15[47:0] : 48'd0 );  //ch.15
          5'd16: Qstrip[47:0] <= ( (sumQ16[47:0]>48'd1200 && (~sumQ16[47])) ? sumQ16[47:0] : 48'd0 );  //ch.16
          5'd17: Qstrip[47:0] <= ( (sumQ17[47:0]>48'd1200 && (~sumQ17[47])) ? sumQ17[47:0] : 48'd0 );  //ch.17
          5'd18: Qstrip[47:0] <= ( (sumQ18[47:0]>48'd1200 && (~sumQ18[47])) ? sumQ18[47:0] : 48'd0 );  //ch.18
          5'd19: Qstrip[47:0] <= ( (sumQ19[47:0]>48'd1200 && (~sumQ19[47])) ? sumQ19[47:0] : 48'd0 );  //ch.19
          5'd20: Qstrip[47:0] <= ( (sumQ20[47:0]>48'd1200 && (~sumQ20[47])) ? sumQ20[47:0] : 48'd0 );  //ch.20
          5'd21: Qstrip[47:0] <= ( (sumQ21[47:0]>48'd1200 && (~sumQ21[47])) ? sumQ21[47:0] : 48'd0 );  //ch.21
          5'd22: Qstrip[47:0] <= ( (sumQ22[47:0]>48'd1200 && (~sumQ22[47])) ? sumQ22[47:0] : 48'd0 );  //ch.22
          5'd23: Qstrip[47:0] <= ( (sumQ23[47:0]>48'd1200 && (~sumQ23[47])) ? sumQ23[47:0] : 48'd0 );  //ch.23
          default: Qstrip[47:0] <= 48'd0;
        endcase*/
        case(ChCounter[4:0])
          5'd0:  UseThisQstrip <= (sumQ00[47:0]>48'd1200 && (~sumQ00[47]));
          5'd1:  UseThisQstrip <= (sumQ01[47:0]>48'd1200 && (~sumQ01[47]));
          5'd2:  UseThisQstrip <= (sumQ02[47:0]>48'd1200 && (~sumQ02[47]));
          5'd3:  UseThisQstrip <= (sumQ03[47:0]>48'd1200 && (~sumQ03[47]));
          5'd4:  UseThisQstrip <= (sumQ04[47:0]>48'd1200 && (~sumQ04[47]));
          5'd5:  UseThisQstrip <= (sumQ05[47:0]>48'd1200 && (~sumQ05[47]));
          5'd6:  UseThisQstrip <= (sumQ06[47:0]>48'd1200 && (~sumQ06[47]));
          5'd7:  UseThisQstrip <= (sumQ07[47:0]>48'd1200 && (~sumQ07[47]));
          5'd8:  UseThisQstrip <= (sumQ08[47:0]>48'd1200 && (~sumQ08[47]));
          5'd9:  UseThisQstrip <= (sumQ09[47:0]>48'd1200 && (~sumQ09[47]));
          5'd10: UseThisQstrip <= (sumQ10[47:0]>48'd1200 && (~sumQ10[47]));
          5'd11: UseThisQstrip <= (sumQ11[47:0]>48'd1200 && (~sumQ11[47]));
          5'd12: UseThisQstrip <= (sumQ12[47:0]>48'd1200 && (~sumQ12[47]));
          5'd13: UseThisQstrip <= (sumQ13[47:0]>48'd1200 && (~sumQ13[47]));
          5'd14: UseThisQstrip <= (sumQ14[47:0]>48'd1200 && (~sumQ14[47]));
          5'd15: UseThisQstrip <= (sumQ15[47:0]>48'd1200 && (~sumQ15[47]));
          5'd16: UseThisQstrip <= (sumQ16[47:0]>48'd1200 && (~sumQ16[47]));
          5'd17: UseThisQstrip <= (sumQ17[47:0]>48'd1200 && (~sumQ17[47]));
          5'd18: UseThisQstrip <= (sumQ18[47:0]>48'd1200 && (~sumQ18[47]));
          5'd19: UseThisQstrip <= (sumQ19[47:0]>48'd1200 && (~sumQ19[47]));
          5'd20: UseThisQstrip <= (sumQ20[47:0]>48'd1200 && (~sumQ20[47]));
          5'd21: UseThisQstrip <= (sumQ21[47:0]>48'd1200 && (~sumQ21[47]));
          5'd22: UseThisQstrip <= (sumQ22[47:0]>48'd1200 && (~sumQ22[47]));
          5'd23: UseThisQstrip <= (sumQ23[47:0]>48'd1200 && (~sumQ23[47]));
        endcase

        //Set strip position
        /*case (ChCounter[4:0])
          5'd0:  xstrip[15:0] <= STRIP_POSITION[16*1-1 : 16*0];   //ch.0
          5'd1:  xstrip[15:0] <= STRIP_POSITION[16*2-1 : 16*1];   //ch.1
          5'd2:  xstrip[15:0] <= STRIP_POSITION[16*3-1 : 16*2];   //ch.2
          5'd3:  xstrip[15:0] <= STRIP_POSITION[16*4-1 : 16*3];   //ch.3
          5'd4:  xstrip[15:0] <= STRIP_POSITION[16*5-1 : 16*4];   //ch.4
          5'd5:  xstrip[15:0] <= STRIP_POSITION[16*6-1 : 16*5];   //ch.5
          5'd6:  xstrip[15:0] <= STRIP_POSITION[16*7-1 : 16*6];   //ch.6
          5'd7:  xstrip[15:0] <= STRIP_POSITION[16*8-1 : 16*7];   //ch.7
          5'd8:  xstrip[15:0] <= STRIP_POSITION[16*9-1 : 16*8];   //ch.8
          5'd9:  xstrip[15:0] <= STRIP_POSITION[16*10-1 : 16*9];  //ch.9
          5'd10: xstrip[15:0] <= STRIP_POSITION[16*11-1 : 16*10]; //ch.10
          5'd11: xstrip[15:0] <= STRIP_POSITION[16*12-1 : 16*11]; //ch.11
          5'd12: xstrip[15:0] <= STRIP_POSITION[16*13-1 : 16*12]; //ch.12
          5'd13: xstrip[15:0] <= STRIP_POSITION[16*14-1 : 16*13]; //ch.13
          5'd14: xstrip[15:0] <= STRIP_POSITION[16*15-1 : 16*14]; //ch.14
          5'd15: xstrip[15:0] <= STRIP_POSITION[16*16-1 : 16*15]; //ch.15
          5'd16: xstrip[15:0] <= STRIP_POSITION[16*17-1 : 16*16]; //ch.16
          5'd17: xstrip[15:0] <= STRIP_POSITION[16*18-1 : 16*17]; //ch.17
          5'd18: xstrip[15:0] <= STRIP_POSITION[16*19-1 : 16*18]; //ch.18
          5'd19: xstrip[15:0] <= STRIP_POSITION[16*20-1 : 16*19]; //ch.19
          5'd20: xstrip[15:0] <= STRIP_POSITION[16*21-1 : 16*10]; //ch.20
          5'd21: xstrip[15:0] <= STRIP_POSITION[16*22-1 : 16*11]; //ch.21
          5'd22: xstrip[15:0] <= STRIP_POSITION[16*23-1 : 16*12]; //ch.22
          5'd23: xstrip[15:0] <= STRIP_POSITION[16*24-1 : 16*13]; //ch.23
          default: xstrip[15:0] <= 16'd0;
        endcase*/

        if (ChCounter[4:0]==5'd24) begin
          QstripNow <= 1'b0;  //OFF flag for setting Qstrip and xstrip
        end
      end
    end

    always@(posedge SYSCLK) begin
      //Initialization
      if (initADC_INT) begin
        Qstrip[47:0]      <= 48'd0;
        xstrip[15:0]      <= 16'd0;
      end
      //Setting Qstrip and xstrip (after accumulated integration)
      else if (StartCal & QstripNow) begin

        if (UseThisQstrip) begin
          case (ChCounter[4:0])
            5'd0:  Qstrip[47:0] <= sumQ00[47:0];
            5'd1:  Qstrip[47:0] <= sumQ01[47:0];
            5'd2:  Qstrip[47:0] <= sumQ02[47:0];
            5'd3:  Qstrip[47:0] <= sumQ03[47:0];
            5'd4:  Qstrip[47:0] <= sumQ04[47:0];
            5'd5:  Qstrip[47:0] <= sumQ05[47:0];
            5'd6:  Qstrip[47:0] <= sumQ06[47:0];
            5'd7:  Qstrip[47:0] <= sumQ07[47:0];
            5'd8:  Qstrip[47:0] <= sumQ08[47:0];
            5'd9:  Qstrip[47:0] <= sumQ09[47:0];
            5'd10: Qstrip[47:0] <= sumQ10[47:0];
            5'd11: Qstrip[47:0] <= sumQ11[47:0];
            5'd12: Qstrip[47:0] <= sumQ12[47:0];
            5'd13: Qstrip[47:0] <= sumQ13[47:0];
            5'd14: Qstrip[47:0] <= sumQ14[47:0];
            5'd15: Qstrip[47:0] <= sumQ15[47:0];
            5'd16: Qstrip[47:0] <= sumQ16[47:0];
            5'd17: Qstrip[47:0] <= sumQ17[47:0];
            5'd18: Qstrip[47:0] <= sumQ18[47:0];
            5'd19: Qstrip[47:0] <= sumQ19[47:0];
            5'd20: Qstrip[47:0] <= sumQ20[47:0];
            5'd21: Qstrip[47:0] <= sumQ21[47:0];
            5'd22: Qstrip[47:0] <= sumQ22[47:0];
            5'd23: Qstrip[47:0] <= sumQ23[47:0];
          endcase
        end 
        else begin
          Qstrip[47:0] <= 48'd0;
        end


        //Set strip position
        case (ChCounter[4:0])
          5'd0:  xstrip[15:0] <= STRIP_POSITION[16*1-1 : 16*0];   //ch.0
          5'd1:  xstrip[15:0] <= STRIP_POSITION[16*2-1 : 16*1];   //ch.1
          5'd2:  xstrip[15:0] <= STRIP_POSITION[16*3-1 : 16*2];   //ch.2
          5'd3:  xstrip[15:0] <= STRIP_POSITION[16*4-1 : 16*3];   //ch.3
          5'd4:  xstrip[15:0] <= STRIP_POSITION[16*5-1 : 16*4];   //ch.4
          5'd5:  xstrip[15:0] <= STRIP_POSITION[16*6-1 : 16*5];   //ch.5
          5'd6:  xstrip[15:0] <= STRIP_POSITION[16*7-1 : 16*6];   //ch.6
          5'd7:  xstrip[15:0] <= STRIP_POSITION[16*8-1 : 16*7];   //ch.7
          5'd8:  xstrip[15:0] <= STRIP_POSITION[16*9-1 : 16*8];   //ch.8
          5'd9:  xstrip[15:0] <= STRIP_POSITION[16*10-1 : 16*9];  //ch.9
          5'd10: xstrip[15:0] <= STRIP_POSITION[16*11-1 : 16*10]; //ch.10
          5'd11: xstrip[15:0] <= STRIP_POSITION[16*12-1 : 16*11]; //ch.11
          5'd12: xstrip[15:0] <= STRIP_POSITION[16*13-1 : 16*12]; //ch.12
          5'd13: xstrip[15:0] <= STRIP_POSITION[16*14-1 : 16*13]; //ch.13
          5'd14: xstrip[15:0] <= STRIP_POSITION[16*15-1 : 16*14]; //ch.14
          5'd15: xstrip[15:0] <= STRIP_POSITION[16*16-1 : 16*15]; //ch.15
          5'd16: xstrip[15:0] <= STRIP_POSITION[16*17-1 : 16*16]; //ch.16
          5'd17: xstrip[15:0] <= STRIP_POSITION[16*18-1 : 16*17]; //ch.17
          5'd18: xstrip[15:0] <= STRIP_POSITION[16*19-1 : 16*18]; //ch.18
          5'd19: xstrip[15:0] <= STRIP_POSITION[16*20-1 : 16*19]; //ch.19
          5'd20: xstrip[15:0] <= STRIP_POSITION[16*21-1 : 16*10]; //ch.20
          5'd21: xstrip[15:0] <= STRIP_POSITION[16*22-1 : 16*11]; //ch.21
          5'd22: xstrip[15:0] <= STRIP_POSITION[16*23-1 : 16*12]; //ch.22
          5'd23: xstrip[15:0] <= STRIP_POSITION[16*24-1 : 16*13]; //ch.23
          default: xstrip[15:0] <= 16'd0;
        endcase
      end
    end


    //====== Sigma Qstrip ======
    reg [63:0] SumQstrip;  //Summed Qstrip
    reg SumStandby;        //Interval of summation (1:calculating / 0:finished)
    reg WeightSumStandby;  //Interval of weighted summation (1:calculating / 0:finished)
    reg DelayedStandby;
    reg SquareWeightStandby;
    reg beamintensity;
    reg [15:0] xstripcopy;

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        SumQstrip[63:0]     <= 64'd0;
        SumStandby          <=  1'b1;  //ON flag for taking summation
        WeightSumStandby    <=  1'b1;  //ON flag for taking weighted summation
        DelayedStandby      <=  1'b1;
        SquareWeightStandby <=  1'b1;  //ON flag for Sigma xstrip_x_xstrip_x_Qstrip

        beamintensity       <=  1'b0;
        xstripcopy[15:0]    <= 16'd0;  //Copied xstrip that synchronizes with Qstrip_x_xstrip
      end
      //Summation
      else if (StartSum) begin
        //Format: SumQstrip = Previous SumQstrip + { 16bit 0s, 48bit Qstrip}
        SumQstrip[63:0]  <= SumQstrip[63:0] + { {16{Qstrip[47]}}, Qstrip[47:0] };
        xstripcopy[15:0] <= xstrip[15:0];

        SumStandby          <= QstripNow;        //ON until end of Qstrip and xstrip setting (OFF after setting 24 channels)
        WeightSumStandby    <= SumStandby;       //OFF after SumNow OFF
        DelayedStandby      <= WeightSumStandby;
        SquareWeightStandby <= DelayedStandby;   //OFF after AvrNow OFF
      end

      if (StartSum) begin
        //Check SumQstrip > 10000 or not
        beamintensity <= ( (SumQstrip[63:0]>64'd10000) ? 1'b1 : 1'b0 );
      end
    end


    //====== xstrip*Qstrip ======
    wire [63:0] Qstrip_x_xstrip;

    //Format: A*B = P
    mult_gen_0 multiplier_0 (
      .CLK(SYSCLK),               //Clock (Calculate according to this timing)
      .A(xstrip[15:0]),           //A
      .B(Qstrip[47:0]),           //B
      .CE(SumStandby & StartSum), //Enable (Valid during the same interval as summation)
      .P(Qstrip_x_xstrip[63:0])   //result output
    );


    //====== Sigma xstrip*Qstrip ======
    reg [63:0] SumQstrip_x_xstrip; //Summed Qstrip_x_xstrip

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        SumQstrip_x_xstrip[63:0] <= 64'd0;
      end
      //x_strip_x_Qstrip
      else if (WeightSumStandby & StartWeightSum) begin
        SumQstrip_x_xstrip[63:0] <= SumQstrip_x_xstrip[63:0] + Qstrip_x_xstrip[63:0];
      end
    end


    //====== xstrip*xstrip*Qstrip ======
    wire [79:0] xstrip2_x_Qstrip;        //xstrip_x_xstrip_x_Qstrip for width calculation
    reg [63:0] Delayed_Qstrip_x_xstrip;
    reg [15:0] Delayed_xstrip;           //xstrip -> xstripcopy -> Delayed_xstrip

    //Use delayed signals for calculation
    //(IPs themselves should not be connected directly)
    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        Delayed_Qstrip_x_xstrip[63:0] <= 64'd0;
        Delayed_xstrip[15:0]          <= 16'd0;
      end
      //Delay
      else if (WeightSumStandby & StartWeightSum) begin
        Delayed_Qstrip_x_xstrip[63:0] <= Qstrip_x_xstrip[63:0];
        Delayed_xstrip[15:0]          <= xstripcopy[15:0];
      end
    end

    //Format: A*B = P
    mult_gen_1 multiplier_1 (
      .CLK(SYSCLK),                       //Clock (Calculate according to this timing)
      .A(Delayed_Qstrip_x_xstrip[63:0]),  //A
      .B(Delayed_xstrip[15:0]),           //B
      .CE(DelayedStandby & StartDelay),   //Enable (Valid during the same interval as weighted summation)
      .P(xstrip2_x_Qstrip[79:0])          //result output
    );


    //====== Sigma xstrip*xstrip*Qstrip ======
    reg [79:0] Sumxstrip2_x_Qstrip;

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        Sumxstrip2_x_Qstrip[79:0] <= 80'd0;
      end
      //xstrip_x_xstrip_x_Qstrip
      else if(SquareWeightStandby & StartSquareWeight) begin
        Sumxstrip2_x_Qstrip[79:0] <= Sumxstrip2_x_Qstrip[79:0] + xstrip2_x_Qstrip[79:0];
      end
    end


    //====== Beam Position X = (Sigma xstrip*Qstrip) / (Sigma Qstrip) ======
    wire StartDivider;
    wire eavr;
    wire EndDivider;
    wire [63:0] BeamPosQ;
    wire [63:0] BeamPosR;

    //Start divider after calculation of SumQstrip_x_xstrip
    //(Interval is specified by WeightSumStandby)
    FD RST_FD1 (.D(~WeightSumStandby), .C(SYSCLK), .Q(eavr));
    assign StartDivider = (~eavr) & (~WeightSumStandby);

    //Format: B/A = { BeamPosQ(Quotient), BeamPosR(Remainder) }
    divider CalBeamPosition (
      .aclk(SYSCLK),                                     //System clock
      .s_axis_divisor_tvalid(StartDivider),              //Start flag for denominator
      .s_axis_divisor_tdata(SumQstrip[63:0]),            //Denominator A
      .s_axis_dividend_tvalid(StartDivider),             //Start flag for numerator
      .s_axis_dividend_tdata(SumQstrip_x_xstrip[63:0]),  //Numerator B
      .m_axis_dout_tvalid(EndDivider),                   //End flag of calculation
      .m_axis_dout_tdata( { BeamPosQ[63:0], BeamPosR[63:0] } ) //result output
    );


    //====== Squared BeamPosition X*X ======
    reg DelayPosStandby;
    reg StartDelayPos;
    reg  [63:0] Delayed_BeamPos;
    wire [31:0] BeamPosSquare;

    //Delay flag design
    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        DelayPosStandby <= 1'b1;
        StartDelayPos   <= 1'b0;
      end
      //Delay flag
      else if (eavr & (~EndDivider)) begin
        StartDelayPos <= 1'b1;
      end
      //OFF DelayPosStandby
      else if (eavr & EndDivider) begin
        DelayPosStandby <= 1'b0;
      end
    end

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        Delayed_BeamPos[63:0] <= 64'd0;
      end
      //Delay BeamPosQ->DelayBeamPosQ
      else if (DelayPosStandby & DelayPosStandby) begin
        Delayed_BeamPos[63:0] <= BeamPosQ[63:0];
      end
    end

    //Format: A*B = P
    mult_gen_2 SquareBeamPosition (
      .CLK(SYSCLK),                         //Clock (Calculate according to this timing)
      .A(Delayed_BeamPos[15:0]),            //A
      .B(Delayed_BeamPos[15:0]),            //B
      .CE(DelayPosStandby & StartDelayPos), //Enable (Valid during the same interval as weighted summation)
      .P(BeamPosSquare[31:0])               //result output
    );


    //====== (Sigma xstrip*xstrip*Qstrip) / (Sigma Qstrip) ======
    wire        erms;
    wire        StartDivider2;
    wire        EndDivider2;
    wire [63:0] PartBeamWidQ;
    wire [63:0] PartBeamWidR;

    FD RST_FD3 (.D(~SquareWeightStandby), .C(SYSCLK), .Q(erms));
    assign StartDivider2 = (~erms) & (~SquareWeightStandby);

    //Format: B/A = { PartBeamWidQ(Quotient), PartBeamWidR(Remainder) }
    divider CalPartBeamWidth(
      .aclk(SYSCLK),                                      //System clock
      .s_axis_divisor_tvalid(StartDivider2),              //Start flag for denominator
      .s_axis_divisor_tdata(SumQstrip[63:0]),             //Denominator A
      .s_axis_dividend_tvalid(StartDivider2),             //Start flag for numerator
      .s_axis_dividend_tdata(Sumxstrip2_x_Qstrip[63:0]),  //Numerator B
      .m_axis_dout_tvalid(EndDivider2),                   //End flag of calculation
      .m_axis_dout_tdata( { PartBeamWidQ[63:0], PartBeamWidR[63:0] } ) //result output
    );


    //====== Squared Beam Width sigma*sigma ======
    wire [47:0] BeamWidSquare;
    assign BeamWidSquare[47:0] = PartBeamWidQ[47:0] - BeamPosSquare[31:0];

    reg StartSQRT;
    reg [47:0] UnsignedBeamWidSquare;

    always@(posedge SYSCLK) begin

      //Initialization
      if (initADC_INT) begin
        StartSQRT <= 1'b0;
        UnsignedBeamWidSquare[47:0] <= 48'd0;
      end

      //Unsigned squared beam width
      //If BeamWidSquare is positive...
      if (BeamWidSquare[47]==1'b0) begin
        UnsignedBeamWidSquare[47:0] <= BeamWidSquare[47:0];
        StartSQRT <= EndDivider2;  //ON after getting unsigned squared beam width
      end
      //If BeamWidSquare is negative...
      else if (BeamWidSquare[47]==1'b1) begin
        UnsignedBeamWidSquare[47:0] <= 48'd0 - BeamWidSquare[47:0];
        StartSQRT <= EndDivider2;  //ON after getting unsigned squared beam width
      end
    end


    //====== Beam Width sigma ======
    wire [31:0] BeamWid;
    wire EndSQRT;

    //Format: sqrt(A)
    cordic_0 CalBeamWidth(
      .aclk(SYSCLK),                                        //System clock
      .s_axis_cartesian_tvalid(StartSQRT),                  //Enable
      .s_axis_cartesian_tdata(UnsignedBeamWidSquare[47:0]), //Input A
      .m_axis_dout_tvalid(EndSQRT),                         //End flag
      .m_axis_dout_tdata(BeamWid[31:0])                     //result output
    );


    //====== Interlock ======
    reg [15:0] status_BeamPos;   //Finalized beam position result
    reg [15:0] status_BeamWid;   //Finalized beam width result
    reg        status_Interlock; //Finalized interlock status
    reg [15:0] Offset;           //Offset on beam position
    reg        EndCal;           //End flag of whole calculation
    reg [15:0] UpperThreshold;   //Threshold of beam position (upper limit)
    reg [15:0] LowerThreshold;   //Threshold of beam position (lower limit)
    reg [15:0] UpperDiffBeamPos; //Upper threshold - beam position result (>0 -> interlock ON)
    reg [15:0] LowerDiffBeamPos; //Lower threshold - beam position result (>0 -> interlock ON)
    reg        CompareNow;       //Get the difference between the result and the threshold
    reg        StartInterlock;   //Flag to start judgement of interlock
    reg        CalInterlock;     //Result of judgement of interlock
    reg        RegInterlock;

    always@(posedge SYSCLK) begin
      if (initADC_INT | REG_INTERLOCK[1]) begin
        status_BeamPos[15:0]   <= 16'd0;
        status_BeamWid[15:0]   <= 16'd0;
        status_Interlock       <=  1'b0;
        Offset[15:0]           <= OFFSET[15:0];
        EndCal                 <=  1'b0;
        UpperThreshold[15:0]   <= THRESHOLD[15:0];
        LowerThreshold[15:0]   <= 16'd0 - THRESHOLD[15:0];
        UpperDiffBeamPos[15:0] <= 16'd0;
        LowerDiffBeamPos[15:0] <= 16'd0;
        CompareNow             <=  1'b0;
        StartInterlock         <=  1'b0;  
        CalInterlock           <=  1'b0;  
        RegInterlock           <=  1'b0;
      end

      else if (EndSQRT & !CompareNow) begin

        //Record the calculated results
        status_BeamPos[15:0] <= BeamPosQ[15:0] + Offset[15:0];
        status_BeamWid[15:0] <= BeamWid[23:0];

        EndCal     <= 1'b1;
        CompareNow <= 1'b1;
      end
      else if (CompareNow) begin
        StartInterlock <= 1'b1;
        CompareNow     <= 1'b0;

        //The difference between the result and the threshold
        UpperDiffBeamPos[15:0] <= UpperThreshold[15:0] - status_BeamPos[15:0];
        LowerDiffBeamPos[15:0] <= LowerThreshold[15:0] - status_BeamPos[15:0];
      end

    //end


    //always@(posedge SYSCLK) begin
      //If SumQstrip > 10000, judge the interlock status with the calculated results
      if (StartInterlock && beamintensity) begin
        //Judge whether the interlock should be ON or not
        //If the result exceeds the upper limit(P > Pmax, P > Pmin), Pmax - P and Pmin - P should be negative.
        //If the result exceeds the lower limit(P < Pmax, P < Pmin), Pmax - P and Pmin - P should be positive.
        CalInterlock <= (~UpperDiffBeamPos[15] & ~LowerDiffBeamPos[15]) | (UpperDiffBeamPos[15] & LowerDiffBeamPos[15]);
        RegInterlock <= REG_INTERLOCK[0];

        //Determine the interlock status
        status_Interlock <= (CalInterlock | RegInterlock | status_Interlock);
      end
      //If SumQstrip < 10000, do not use the calculated results, 
      //and only refer the register interlock from UDP (force firing or not)
      else if (StartInterlock && (~beamintensity)) begin
        status_BeamPos[15:0] <= 16'd0;
        status_BeamWid[15:0] <= 16'd0;
        RegInterlock         <= REG_INTERLOCK[0];
        status_Interlock     <= (RegInterlock | status_Interlock);
      end

    end

    //Output the results; beam position, width, interlock status
    assign BEAM_POSITION[15:0] = status_BeamPos[15:0];
    assign BEAM_WIDTH[15:0]    = status_BeamWid[15:0];
    assign INT_INTERLOCK       = status_Interlock;
    

    //reg        EndCal;           //End flag of whole calculation
    /*always@(posedge SYSCLK) begin
      if (initADC_INT | REG_INTERLOCK[1]) begin
        EndCal  <=  1'b0;
        CompareNow             <=  1'b0;
      end
      //For test
      //else if ((~SquareWeightStandby) & EndDivider) begin
      //else if (~DelayPosStandby) begin
      //else if ((~DelayPosStandby) & EndDivider2) begin
      else if (EndSQRT) begin
        EndCal <= 1'b1;
      end
    end*/

    /*always@(posedge SYSCLK) begin
      if (EndSQRT & !CompareNow) begin
        CompareNow <= 1'b1;
        EndCal  <=  1'b0;
      end
    end*/


    //Close ADC_INT
    wire ec_sync;
    FD RST_FD6 (.D(EndCal), .C(SYSCLK), .Q(ec_sync));
    assign INT_END = EndCal & (~ec_sync);
    assign INT_TAG = ec_sync;

endmodule