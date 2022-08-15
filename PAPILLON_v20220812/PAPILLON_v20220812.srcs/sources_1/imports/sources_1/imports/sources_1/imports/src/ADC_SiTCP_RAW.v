/*******************************************************************************
*                                                                              *
* System      : ADC SiTCP module                                               *
* Version     : v 0.0.0 2012/03/02                                             *
*                 0.0.1 2012/08/02 T.Uchida, fix a problem of multi-trigger    *
*                                                                              *
* Description : Top Module                                                     *
*                                                                              *
* Designer    : Tomohisa Uchida                                                *
*                                                                              *
*                Copyright (c) 2012 Tomohisa Uchida                            *
*                All rights reserved                                           *
*                                                                              *
*******************************************************************************/
module ADC_SiTCP_RAW(
// System
	SYSCLK				,	// in	: System clock
	sRST					,	// in	: System reset
	tag_mode,
//receive trigger tag
    RAW_TRG_TAG         ,   //in:trigger from GP-IO
    RAW_NUM_TAG         ,   //in:TAG number from GP-IO
// Parameters
	REG_HD_ID			,	// in	: Header ID[23:0]
	REG_WINDOW			,	// in	: Window size [15:0]
	REG_LEN             ,
	REG_MODE            ,   // in   : Mode [1:0]
	REG_ADC_PDSTL       ,
	REG_STRIP_POSITION  ,
	REG_THRESHOLD		,
	REG_THRESHOLD_WIDTH	,
	REG_OFFSET			,
	REG_INTERLOCK		,
	REG_TAG_COUNT		,
// Enable
    ENABLE              ,
// BUF_DELAY I/F
	RING_SOD			,	// in	: Start of data
	RING_TRG_NUM		,	// in	: Trigger Number[31:0]
 //RING_ADC				,	// in	:
	RING_ADC			,	// in	: Delayed ADC data[287:0]
// SiTCP I/F
	SiTCP_TX_AFULL		,	// in	: Almost full flag of a TCP Tx FIFO
	SiTCP_TX_WE			,	// out	: TCP Tx Data write enable
	SiTCP_TX_WD			,	// out	: TCP Tx Data[7:0]
	RAW_INTERLOCK
);

//-------- Input/Output -------------
	input			SYSCLK;
	input			sRST;
	input           tag_mode;
    
    input           RAW_TRG_TAG;
    input    [2:0]  RAW_NUM_TAG;

	input	[23:0]			REG_HD_ID;
	input	[15:0]			REG_WINDOW;
	input   [15:0]          REG_LEN;
	input	[1:0]			REG_MODE;
	input   [8*24-1:0]      REG_ADC_PDSTL;
	input   [16*24-1:0]		REG_STRIP_POSITION;
	input	[15:0]			REG_THRESHOLD;
	input	[23:0]			REG_THRESHOLD_WIDTH;
	input	[15:0]			REG_OFFSET;
	input	[1:0]			REG_INTERLOCK;
	input	[7:0]			REG_TAG_COUNT;
	
	input           		ENABLE;
	
	input					RING_SOD;
	input	[31:0]			RING_TRG_NUM;
    input   [12*24-1:0]    	RING_ADC;               // 24ch [287:0] RING_ADC
	input					SiTCP_TX_AFULL;

	output					SiTCP_TX_WE;
	output	[7:0]			SiTCP_TX_WD;
	output					RAW_INTERLOCK;

//------ output signals -----
	wire			SiTCP_TX_WE			;
	wire	[7:0]	SiTCP_TX_WD			;


//------------------------------------------------------------------------------
//	Input registers
//------------------------------------------------------------------------------
	reg     [15:0]		irWindow		;
	reg     [23:0]		irHdId			;
	reg     [15:0] 		irlen;
	reg     [16:0]		irLength		;
	reg     [1:0]  		irMode          ;
	reg     [8*24-1:0]  irADC_PDSTL     ;
	reg		[24*16-1:0] irStrip_position;
	reg		[15:0]		irThreshold;
	reg		[23:0]		irThreshold_width;
	reg		[15:0]		irOffset;
	reg		[1:0]		irinterlock;
	always@ (posedge SYSCLK) begin         //????��?��??��?��???��?��??��?��p????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��[????��?��??��?��???��?��??��?��^????��?��??��?��???��?��??��?��̑�????��?��??��?��???��?��??��?��
		irWindow[15:0]              <= REG_WINDOW[15:0];
		irlen[15:0]                 <= REG_LEN[15:0];
		irHdId[23:0]                <= REG_HD_ID[23:0];
		irLength[16:0]              <= {1'b0, irlen[15:0]} + 17'd1;
        irADC_PDSTL[8*24-1:0]       <= REG_ADC_PDSTL[8*24-1:0];
		irStrip_position[24*16-1:0] <= REG_STRIP_POSITION[24*16-1:0];
		irThreshold[15:0]           <= REG_THRESHOLD[15:0];
		irThreshold_width[23:0]     <= REG_THRESHOLD_WIDTH[23:0];
		irOffset[15:0]              <= REG_OFFSET[15:0];
		irinterlock[1:0]            <= REG_INTERLOCK[1:0];
		irMode[1:0]                 <= REG_MODE[1:0];
	end


    reg     [12*24-1:0] irAdcData;//24ch [287:0] irAdcData
	reg		[31:0]		irTrgCunt;
	reg		[3:0]		irSod;
	reg		[12:0]		wa;
	//reg rdBusy			;
	reg mBusy; //ON during buffer data writing to SiTCP transmission
	always@ (posedge SYSCLK) begin
	   if(sRST)begin
	       irTrgCunt[31:0] <= 32'd0;
	       irSod[3:0]      <= 4'd0;
	       wa[12:0]        <= 13'd0;
		end else begin
	       if(ENABLE == 1)begin
				irAdcData[12*24-1:0] <= RING_ADC[12*24-1:0]; // 24ch

				//if(RING_SOD & !rdBusy)begin
				if(RING_SOD & !mBusy)begin
	       		  irTrgCunt[31:0] <= RING_TRG_NUM[31:0];   //TRiGGERnumber????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��0????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��X????��?��??��?��???��?��??��?��^????��?��??��?��???��?��??��?��[????��?��??��?��???��?��??��?��g
				end
		    
		        irSod[3:0] <= {irSod[2:0],RING_SOD & !mBusy};

				if(RING_SOD & !mBusy)begin
	       		  wa[12:0]	<= 13'h1000;   //????��?��??��?��???��?��??��?��ŏ�????��?��??��?��???��?��??��?��bit????��?��??��?��???��?��??��?��𗧂�????��?��??��?��???��?��??��?��グ????��?��??��?��???��?��??��?��āA????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��̏�????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��ɂ͂�????��?��??��?��???��?��??��?��点????��?��??��?��???��?��??��?��????��?��??��?��???��?��??��?��
				end else begin
			      wa[12:0]	<= (wa[12] ? wa[12:0] + 13'd1 : 13'd0);
				end
			end
		end
	end

//------------------------------------------------------------------------------
//	Buffer
//------------------------------------------------------------------------------

    wire [12*24-1:0] wd;//24ch
	wire we;
    assign	wd[12*24-1:0]= irAdcData[12*24-1:0];  //24ch [287:0]
	assign	we= wa[12];
	
	reg  [17:0]      ra;
    wire [12*24-1:0] rd;  //24ch
    generate
    genvar i;
    for (i=0; i<36; i=i+1) begin: mem_generate
      mem_8_4K ADC_MEM_0 (
        .clka       (SYSCLK),    // input wire clka
        .ena        (ENABLE),      // input wire ena
        .wea        (we),      // input wire [0 : 0] wea
        .addra      (wa[11:0]),  // input wire [11 : 0] addra
        .dina       (wd[8*(i+1)-1:8*i]),    // input wire [7 : 0] dina
        .clkb       (SYSCLK),    // input wire clkb
        .enb        (1'b1),      // input wire enb
        .addrb      (ra[17:6]),  // input wire [11 : 0] addrb
        .doutb      (rd[8*(i+1)-1:8*i])  // output wire [7 : 0] doutb
      );
      end
    endgenerate

//------------------------------------------------------------------------------
//   beam position calculation and interlock
//------------------------------------------------------------------------------
     
    wire	[15:0]	BEAM_POSITION;
	wire	[23:0]	BEAM_WIDTH;
    wire			INT_INTERLOCK;
    wire            INT_TAG;
    wire 			INT_END;
    // Call ADC_INT
    ADC_INT     ADC_INT(
      .SYSCLK(SYSCLK),
	  .ENABLE(ENABLE),
      .sRST(sRST),
      .DATA_LENGTH(irWindow[15:0]),
      .ADC_PDSTL(irADC_PDSTL[8*24-1:0]),
      .STRIP_POSITION(irStrip_position[24*16-1:0]),
	  .REG_INTERLOCK(irinterlock[1:0]),
      .WRITE_DATA(wd[12*24-1:0]),
      .WRITE_ENABLE(we),
	  .THRESHOLD(irThreshold[15:0]),
	  .THRESHOLD_WIDTH(irThreshold_width[23:0]),
      .OFFSET(irOffset[15:0]),
              
      .INT_TAG(INT_TAG),
      .INT_END(INT_END),
      .BEAM_POSITION(BEAM_POSITION[15:0]),
	  .BEAM_WIDTH(BEAM_WIDTH[23:0]),
      .INT_INTERLOCK(INT_INTERLOCK)
    );
	assign RAW_INTERLOCK=INT_INTERLOCK;
    /*ADC_INT     ADC_INT(
      .SYSCLK(SYSCLK),
	  .ENABLE(ENABLE),
      .sRST(sRST),
      .DATA_LENGTH(irWindow[15:0]),
      .ADC_PDSTL(irADC_PDSTL[8*24-1:0]),
      .STRIP_POSITION(irStrip_position[24*16-1:0]),
	  .REG_INTERLOCK(irinterlock[1:0]),
      .WRITE_DATA(wd[12*24-1:0]),
      .WRITE_ENABLE(we),
	  .THRESHOLD(irThreshold[15:0]),
	  .THRESHOLD_WIDTH(irThreshold_width[23:0]),
      .OFFSET(irOffset[15:0]),
              
      .INT_TAG(INT_TAG),
      .INT_END(INT_END),
      .BEAM_POSITION(16'd100),
	  .BEAM_WIDTH(24'd100),
      .INT_INTERLOCK(INT_INTERLOCK)
    );  
	*/
	
	//=================================
	//demo (w/o beam position calculator)
	/*reg fin_beamcal;
	always@ (posedge SYSCLK) begin
	  if (wa[12:0]==13'h1284) begin  //should be determined by REG_WINDOW
	    fin_beamcal <= 1'b1;
	  end
	  else begin
	    fin_beamcal <= 1'b0;
	  end
	end
	assign INT_END = fin_beamcal;
	
	reg once;
	always@ (posedge SYSCLK) begin
	  if (sRST) begin
	    once <= 1'b0;
	  end
	
      if (fin_beamcal) begin
        if (~once) begin
          once <= 1'b1;
        end
      end
      else if (~fin_beamcal & once) begin
        once <= 1'b1;
      end else if (~fin_beamcal & ~once) begin
        once <= 1'b0;
      end
    end
    assign INT_TAG = once;*/
    //=================================


//------------------------------------------------------------------------------
//   read start
//------------------------------------------------------------------------------
 reg [1:0] srTagIn;
 reg       intTagIn;
 reg [7:0] tag_count;
 reg       sTAG;
 reg       eTAG;
 always@(posedge SYSCLK)begin
     
     if(sRST)begin
         srTagIn[1:0]    <=    {2{RAW_TRG_TAG}};
         intTagIn        <=    1'b0;
         sTAG            <=    1'b0;
         eTAG            <=    1'b0;
         tag_count[7:0]  <=    REG_TAG_COUNT[7:0];
     end 
     
	 if(~INT_TAG)begin
         srTagIn[1:0]    <=  {2{RAW_TRG_TAG}};
         intTagIn        <=  1'b0;
         sTAG            <=  1'b0;
         eTAG            <=  1'b0;
         tag_count[7:0]  <=  REG_TAG_COUNT[7:0];
     end 
	 
	 //intTagIn switch on
     if ( INT_TAG ) begin
        srTagIn[1:0]    <=  {srTagIn[0], RAW_TRG_TAG};
        intTagIn        <=  (srTagIn[1:0]==2'b10);     //If srTagIn is 3=0b10, switch to HIGH
        sTAG            <=  1'b0;
        eTAG            <=  1'b0;
        tag_count[7:0]  <=  REG_TAG_COUNT[7:0];
     end 
     
	 //sTAG swicth on
     if ( intTagIn ) begin
        sTAG            <=  1'b1;
     end
     
	 //eTAG switch on
     if ( sTAG ) begin
        sTAG            <=  sTAG;                     //keep this value
        tag_count[7:0]  <=  tag_count[7:0] - 8'd1;    //count down tag_count
        eTAG            <=  (tag_count[7:0]==8'd1);   //If tag_count down to 1, switch to HIGH
     end
     
	 //
     if ( eTAG ) begin
        tag_count[7:0]  <=    REG_TAG_COUNT[7:0];
        sTAG            <=    1'b0;
        eTAG            <=    1'b0;
     end
 end

 wire tag_start;
 FD RST_FD6 (.D(eTAG), .C(SYSCLK), .Q(tag_start));
 
 wire   READ_START;
 assign READ_START = ( tag_mode ? tag_start : INT_END);
	
	
//------------------------------------------------------------------------------
//   write data to SiTCP
//------------------------------------------------------------------------------
	reg				rdBusy		;
	reg				hdSend		;
	reg		[22:0]	len	        ;
	reg		[5:0]	ha			;
	wire	[21:0]  lenwindow  	;
	reg		[5:0]   countadd    ;
	reg		[11:0]  countmem   	;
	reg    			readstart	;
	reg		[15:0]  BeamPosition;
	reg		[23:0]	BeamWidth	;
	
	assign lenwindow[21:0] ={1'b0, ({1'b0,irLength[16:0]} + {irLength[16:0],1'b0}), 3'b0} - 1;
	
	always@ (posedge SYSCLK) begin
		if ( sRST ) begin
			mBusy              <= 1'd0;
			rdBusy             <= 1'd0;
			hdSend             <= 1'd0;
			readstart          <= 1'b0;
			BeamPosition[15:0] <= 16'd0;
			BeamWidth[23:0]    <= 24'b0;
		end else begin
			//rdBusy	<= ~len[22] & (irSod[3] | rdBusy);
			//hdSend	<= ~ha[4]   & (irSod[3] | hdSend);
			readstart          <=   READ_START;
			BeamPosition[15:0] <=   BEAM_POSITION[15:0];
			BeamWidth[23:0]    <=   BEAM_WIDTH[23:0];
			/*readstart          = READ_START;
			BeamPosition[15:0] = BEAM_POSITION[15:0];
			BeamWidth[23:0]	   = BEAM_WIDTH[23:0];*/
			//should be non-brocking substitution (otherwise, read part will not start...)
			mBusy	<=	~len[22] & (irSod[3] | mBusy);
			rdBusy	<=	~len[22] & (readstart | rdBusy);
			hdSend	<=	~ha[5]   & (readstart | hdSend);
		end
	end

	reg				rdEnb		;
	reg				hdEnb		;

	always@ (posedge SYSCLK) begin
		if(sRST)begin
			rdEnb	<= 1'd0;
			hdEnb	<= 1'd0;
		end else begin
			rdEnb	<= ~len[22] & rdBusy & ~hdSend & ~SiTCP_TX_AFULL;
			hdEnb	<= ~ha[5]   & rdBusy &  hdSend & ~SiTCP_TX_AFULL;
		end

		if( !rdBusy )begin
			ha[5:0]		   <= 6'd31;
			ra[17:0]	   <= 18'd0;
			countmem[11:0] <= 12'd0;
			countadd[5:0]  <= 6'd0;
			len[22:0]	   <= {1'b0, ~lenwindow[21:0]};
		end else begin
		
		if( hdEnb )begin
		
			if(ha==6'd4)begin
				ha[5:0]	<= 6'd63;
			end else begin
				ha[5:0]	<= ha[5:0] - 6'd1;
			end
			
		end
			
		if( rdEnb )begin
            if(countadd==6'd47)begin
                countadd <= 0;
                countmem <= countmem +12'd1;
                ra <= {countmem[11:0],countadd[5:0]};
            end else begin
                countadd <= countadd+6'd1;
                countmem <= countmem;
                ra <= {countmem[11:0],countadd[5:0]};
            end   
				len[22:0]	<= len[22:0] + 23'd1;
			end
		end

	end


	reg				hdVal	;
	reg		[4:0]	rdHa	;
	reg		[5:0]	rdRa	;
	reg		[1:0]	rdVal	;
    reg		[4:0]	dlyRdHa	;
    reg            	dlyHdVal;
    reg     [5:0]   dlyRdRa ;
    reg             dlyRdVal;
	//reg             dlydlyRdVal;

    //Original rdVal timing
	always@ (posedge SYSCLK) begin
		rdHa[4:0]	<=  ha[4:0];
		hdVal		<= ~ha[5] & hdEnb;
        rdRa[5:0]   <=  ra[5:0];
		rdVal[1:0]	<= {rdVal[0],~len[22] & rdEnb};
	end

	//original dlyRdRa timing
	always@ (posedge SYSCLK) begin
		dlyRdHa[4:0]	<= rdHa[4:0];
		dlyHdVal		<= hdVal;
		dlyRdRa[5:0]    <= rdRa[5:0];
		dlyRdVal		<= rdVal[1];
	end


    //============   Modification   ===============

    //Modified? rdVal timing
	/*always@ (posedge SYSCLK) begin
		rdHa[4:0]	<=  ha[4:0];
		hdVal		<= ~ha[5] & hdEnb;
		rdVal[1:0]	<= {rdVal[0], ~len[22] & rdEnb};

		//if (rdVal[1]) begin
			//rdRa[5:0] <= ra[5:0];
		//end else begin
			//rdRa[5:0] <= 6'd0;
		//end
	end

	always@ (posedge SYSCLK) begin
		rdRa[5:0] <= ra[5:0];
	end

	always@ (posedge SYSCLK) begin
		dlyRdVal <= rdVal[1];

		//if (dlyRdVal) begin
			//rdRa[5:0] <= ra[5:0];
		//end else begin
			//rdRa[5:0] <= 6'd0;
		//end

		if (dlyRdVal) begin
			//dlyRdRa[5:0] <= ra[5:0] - 6'd1;
			dlyRdRa[5:0] <= rdRa[5:0];
		end else begin
			dlyRdRa[5:0] <= 6'd0;
		end
		//dlyRdRa[5:0] <= rdRa[5:0];
	end

    //Modified? dlyRdRa timing
	always@ (posedge SYSCLK) begin
		dlyRdHa[4:0] <= rdHa[4:0];
		dlyHdVal     <= hdVal;
	end*/

	//================================================


	reg		[7:0]	rdHdData	;
	reg				rdHdVal	;
	reg		[7:0]	rdAdcData;
	reg				rdAdcVal	;

	wire	[21:0] length;
	assign	length[21:0] = {2'b0, irLength[16:0], 3'b0} + {1'b0, irLength[16:0], 4'b0};


	always@ (posedge SYSCLK) begin
		case(dlyRdHa[4:0])
			5'd31:	rdHdData[7:0]	<= 8'hFF;					// Unused
			5'd30:	rdHdData[7:0]	<= 8'hFF;					// Unused
			5'd29:	rdHdData[7:0]	<= 8'h55;					// Unused
			5'd28:	rdHdData[7:0]	<= 8'h55;					// Unused               32bit unused
			5'd27:	rdHdData[7:0]	<= irMode[0];				// Mode                 8bit Mode
			5'd26:	rdHdData[7:0]	<= irHdId[23:16];   		// HeaderID             
			5'd25:	rdHdData[7:0]	<= irHdId[15: 8];   		// HeaderID
			5'd24:	rdHdData[7:0]	<= irHdId[ 7: 0];   		// HeaderID             24bit HeaderID
			5'd23:	rdHdData[7:0]	<= 8'd0;					// Length               
			5'd22:	rdHdData[7:0]	<= {2'd0,length[21:16]};    // Length               
			5'd21:	rdHdData[7:0]	<= length[15: 8];           // Length
			5'd20:	rdHdData[7:0]	<= length[ 7: 0];           // Length               32bit Length
			5'd19:	rdHdData[7:0]	<= 8'h00;
			5'd18:	rdHdData[7:0]	<= 8'h00;
			5'd17:	rdHdData[7:0]	<= 8'h00;
			5'd16:	rdHdData[7:0]	<= {5'b0,RAW_NUM_TAG[2:0]}; //event tag
			//5'd16:	rdHdData[7:0]	<= irTrgCunt[ 7: 0];     //trigger count from LEMO			
			5'd15:	rdHdData[7:0]	<= 8'd0;					//beam position[31:24]
			5'd14:	rdHdData[7:0]	<= 8'd0;					//beam position[23:16]
			5'd13:	rdHdData[7:0]	<= BeamPosition[15: 8];
			5'd12:	rdHdData[7:0]	<= BeamPosition[7: 0];
			5'd11:	rdHdData[7:0]	<= 8'd0;					//beam width[31:24]
			5'd10:	rdHdData[7:0]	<= BeamWidth[23:16];		//beam width[23:16]
			5'd9:	rdHdData[7:0]	<= BeamWidth[15:8];			//beam width[15:8]
			5'd8:	rdHdData[7:0]	<= BeamWidth[7:0];			//beam width[7:0]
			5'd7:	rdHdData[7:0]	<= 8'd0;					//interlock[31:24]
			5'd6:	rdHdData[7:0]	<= 8'd0;					//interlock[23:16]
			5'd5:	rdHdData[7:0]	<= 8'd0;					//interlock[15:8]
			5'd4:	rdHdData[7:0]	<= {7'b0,INT_INTERLOCK};	//interlock[7:0]
			default:rdHdData[7:0]	<= 8'b0;
		endcase
		rdHdVal		<= dlyHdVal;

		case(dlyRdRa[5:0])   // [6:0]  for timing?
		//case(rdRa[5:0])   // [6:0]
	       	6'd0: rdAdcData[7:0]	<= {4'd0,rd[12*0+11:12*0+8]};
            6'd1: rdAdcData[7:0]    <= rd[12*0+7:12*0];
            6'd2: rdAdcData[7:0]    <= {4'd0,rd[12*1+11:12*1+8]};
            6'd3: rdAdcData[7:0]    <= rd[12*1+7:12*1];
            6'd4: rdAdcData[7:0]    <= {4'd0,rd[12*2+11:12*2+8]};
            6'd5: rdAdcData[7:0]    <= rd[12*2+7:12*2];
            6'd6: rdAdcData[7:0]    <= {4'd0,rd[12*3+11:12*3+8]};
            6'd7: rdAdcData[7:0]    <= rd[12*3+7:12*3];
            6'd8: rdAdcData[7:0]    <= {4'd0,rd[12*4+11:12*4+8]};
            6'd9: rdAdcData[7:0]    <= rd[12*4+7:12*4];
            6'd10:rdAdcData[7:0]    <= {4'd0,rd[12*5+11:12*5+8]};
            6'd11:rdAdcData[7:0]    <= rd[12*5+7:12*5];
            6'd12:rdAdcData[7:0]    <= {4'd0,rd[12*6+11:12*6+8]};
            6'd13:rdAdcData[7:0]    <= rd[12*6+7:12*6];
            6'd14:rdAdcData[7:0]    <= {4'd0,rd[12*7+11:12*7+8]};
            6'd15:rdAdcData[7:0]    <= rd[12*7+7:12*7];
            6'd16:rdAdcData[7:0]    <= {4'd0,rd[12*8+11:12*8+8]};
            6'd17:rdAdcData[7:0]    <= rd[12*8+7:12*8];
            6'd18:rdAdcData[7:0]    <= {4'd0,rd[12*9+11:12*9+8]};
            6'd19:rdAdcData[7:0]    <= rd[12*9+7:12*9];
            6'd20:rdAdcData[7:0]    <= {4'd0,rd[12*10+11:12*10+8]};
            6'd21:rdAdcData[7:0]    <= rd[12*10+7:12*10];
            6'd22:rdAdcData[7:0]    <= {4'd0,rd[12*11+11:12*11+8]};
            6'd23:rdAdcData[7:0]    <= rd[12*11+7:12*11];
            6'd24:rdAdcData[7:0]    <= {4'd0,rd[12*12+11:12*12+8]};
            6'd25:rdAdcData[7:0]    <= rd[12*12+7:12*12];
            6'd26:rdAdcData[7:0]    <= {4'd0,rd[12*13+11:12*13+8]};
            6'd27:rdAdcData[7:0]    <= rd[12*13+7:12*13];
            6'd28:rdAdcData[7:0]    <= {4'd0,rd[12*14+11:12*14+8]};
            6'd29:rdAdcData[7:0]    <= rd[12*14+7:12*14];
            6'd30:rdAdcData[7:0]    <= {4'd0,rd[12*15+11:12*15+8]};
            6'd31:rdAdcData[7:0]    <= rd[12*15+7:12*15];
            6'd32:rdAdcData[7:0]    <= {4'd0,rd[12*16+11:12*16+8]};
            6'd33:rdAdcData[7:0]    <= rd[12*16+7:12*16];
            6'd34:rdAdcData[7:0]    <= {4'd0,rd[12*17+11:12*17+8]};
            6'd35:rdAdcData[7:0]    <= rd[12*17+7:12*17];
            6'd36:rdAdcData[7:0]    <= {4'd0,rd[12*18+11:12*18+8]};
            6'd37:rdAdcData[7:0]    <= rd[12*18+7:12*18];
            6'd38:rdAdcData[7:0]    <= {4'd0,rd[12*19+11:12*19+8]};
            6'd39:rdAdcData[7:0]    <= rd[12*19+7:12*19];
            6'd40:rdAdcData[7:0]    <= {4'd0,rd[12*20+11:12*20+8]};
            6'd41:rdAdcData[7:0]    <= rd[12*20+7:12*20];
            6'd42:rdAdcData[7:0]    <= {4'd0,rd[12*21+11:12*21+8]};
            6'd43:rdAdcData[7:0]    <= rd[12*21+7:12*21];
            6'd44:rdAdcData[7:0]    <= {4'd0,rd[12*22+11:12*22+8]};
            6'd45:rdAdcData[7:0]    <= rd[12*22+7:12*22];
            6'd46:rdAdcData[7:0]    <= {4'd0,rd[12*23+11:12*23+8]};
            6'd47:rdAdcData[7:0]    <= rd[12*23+7:12*23];
            default:rdAdcData[7:0] 	<= 7'd0;
        endcase
		rdAdcVal <= dlyRdVal; // for timing ?
		//rdAdcVal <= rdVal[1];

	end

	reg orSitcpWe;
	reg [7:0] orSitcpWd;
	always@ (posedge SYSCLK) begin
		if(sRST)begin
			orSitcpWe	   <= 1'b0;
			orSitcpWd[7:0] <= 8'd0;
		end else begin
			orSitcpWe		<= rdHdVal | rdAdcVal;
			orSitcpWd[7:0]	<= (rdHdVal ? rdHdData[7:0] : 8'd0) | (rdAdcVal ? rdAdcData[7:0] : 8'd0);
		end
	end

	assign	SiTCP_TX_WE		 = orSitcpWe;
	assign	SiTCP_TX_WD[7:0] = orSitcpWd[7:0];

//------------------------------------------------------------------------------
endmodule