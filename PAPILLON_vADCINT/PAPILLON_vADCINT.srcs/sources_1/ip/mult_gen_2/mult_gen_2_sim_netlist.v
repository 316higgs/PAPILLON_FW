// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Jun 16 12:39:31 2022
// Host        : DESKTOP-NG52DIC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/81802/Desktop/PAPILLON_FW/PAPILLON_vADCINT/PAPILLON_vADCINT.srcs/sources_1/ip/mult_gen_2/mult_gen_2_sim_netlist.v
// Design      : mult_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_2,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module mult_gen_2
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_2_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_2_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_2_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
HPMPLvpmoX7LOmPj78BMT9X1rCnPz6PdhVGZQ307N9haGfAdMGVirvGR3e0Glyn2ieoWqXA6qOQL
t0xn28+h0g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Nxv/BnutRgdmHnLyK7kvDGjm7WGfFKW2mxQ6xUKF14zS4ziz5pSV0ueW4VqAzUyEPsErIAEuyV6F
m5KCqRBB197Q2NbZa7O7tdAqboX6tPAJzbB6u4U/MmNS1AQcSgtfj5srMbdBzDa5pR4V3HrI0MRj
0xhV1BWf725FYPP4av0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F5KGJgEDQsX2btdjtRUlSmNtuyodIhGXEa3/AXv1Y7qgSO8gknBfiqj5HcIaVA9b4npQpDnNcmq+
1ONAqLeLhdOm9TES+GsTAkh/lClvl89bzfqgOV33iqwQHYIHwSsWMRXT9JSUx+YWu+g6xKpT1Ycn
8BCPsq4QUJIqL6W16fheEHB/lkMgnespIWEYJJG6R6zvv2zG8GiU6cG8zHrRjdvAj8kOkhmiMvSd
YjGXJSMfjw7ojCPSUF+nb6WWhUEmoMA/6lgSVaXRm00YHSZ09k7rKTJWSXFSpTmkL2WOsQhNS0ek
jdTK2KF5K6z2YOK4zkfHgZ+fB0KJyANaLLJH/Q==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lFuQXeJ0hi7qnIKAR+37XCSOwp8bGLukonngcICceOVpL87+rxvhP5TyNJ/zXpAWDF0BaRYlGr7d
isPiUStrvUthNyOqCr4vFZyhCdY8n+Mrv3OCvLoLQSarxVXbaKbXb0tPsXJCUdXTrCt9mr5x0Nda
6DAI8FBPlFMAiqnFXnYMwlUiSlkNWUpInuNw7+1eD8kUdckEUV1PDwZ0yjpFqMokMH9oJjN6z0Yy
65D8Tqo288ZMfZQuIimjski+X6EK157XbpyuoZIuYLJ7j6oaATdintgfZpgGzVvhCZtMbx6/SJtR
efW5vLBGiGs7rPBPE2T8fosHGOvmeC9QBSj8Ww==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q8VVvHzTNgU3tZr4+8ia7ylST+kbNPWskONHDOT1dTkB7cHZIAWyzXpQZPuEgk2wJq21PoqmVlG9
t08IYzkfC8vYQ2LRf2Co3SXc7p3gF2OFMC68J9Nf9D+/PXJCJy3QO4H8oO39l6bn8c56K2ARnK0R
mMIALbCWSBDGCWGQmXWZJ+xmDGs1KgTeiSW3bZRftWJ6K8l8BhMit8BLOY2Mi3jJ0WRhN8kKd6JT
D4NU1jTZT6jEtmI7Gnj/AXG6auTqDPHsVQzf+ZzBsLTfw83CFoO70xM997L5cZXlqz8fEDmxezkr
wWxPwJbJeVkRV3tUxlo2Bs2x1uVkXQeNVMI8jg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oUeTLA0HA2uKORUHo1HidNC3lw54gxwlLUkv28qRPv1pz7AEVUbIJ7wsyu2Scju+EkC2Ivi8HbBn
jxkeqRDTAwAbAqIKnY3AdyfojN9Hb8SMLcLnpWLLCpb6E0vwA09r7uqKRZ8wYAgT9CPFvzpQ3zKt
9DTLgQ3rZtFxx2nfCug=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Fayrlym1l14Y48yZ195XboT9ZQmp/mAzUyHby3Y9qJTzDF+m6mRQ/ZbebObo8bu4VAm45JeETPx1
YI4UZNOK4IqKv0BZsAlzUfAYAmqmkmIJYbn2gWUCwXyKX5AoA4ONnlxEHxzZhqtsmEXvxwTEs25/
R7iLzeoMfmwwNHgPNQkteiR4zDlB76CYmgu6EOSUX5Nnitq1oh7qRuU8WqWN7lLfgIC6T7qNHwGD
RPze2yiP06fSG45jPrOn2fvBX9SRbUXjNtiFgmqim4anwJU46v7y3ubit/I6giZhz5PJMZfkDaFX
ag+uCMq4Q8ZEolqMBmjUjat86BdVd4Nmr0yUaA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kIpxh3qIIkWUg8aLJSPKvKhKTPFH7T8fisti5RtNaftS7xh3KDsGLYnF1lYhH2RVXgzbdaVqvtED
5QJazVo6wUFI91xgFeOR5jX+Ny5UBUX2MngsK+UZyZg5+EdtSiDtiJNtQqgjq1Rn+XQCGF3xP80n
7YvuVMbgRHCAfWrWw7ZJ7Y3raRzeIkx+koPFio7XnC+QdRJ0ItO1YtQgF4Sg1Ihr5TH8/RrNn903
kPa+anH9spo3SFCf2Ts11UXAGLdIBmOLMtEAKjjCUbtmjGSeSc0gn2q2I+xRTFcegLevlr/iuLTw
3lFndBAoW40xOiCDjWZ6Rz7J+jZhsRl3D0Bhwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nCMOs5XTAkp1AUVuEwulgZshtxDK88CkHk6n6wmxrq6jE8P9+gndOu/Y8qWVqLSPA5uf19nHIr1p
AwFB4hcN+ndvIi25p/mTIlfT3hZTXaB/e6ifE25jdoSiSZ5A0JKbUBba90aC49dC9ibV34xvBt/H
21H4goNI7xXWFXKnbWKTeiTQFZqtMreowE75JFtJL2RFc3ruNBrV7QKB05NVqU8HeXGhOB2Alud5
pOK+IYkdrbAVSMFTwt44NuCBkdijVQcBzPSrPNY1/OG6gBy8APDX19oItI/oJgwry4aWGP1NtdiW
KR92zBZsrvxj7WKAxDqG831Vk119/jLxtf2lzQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Lvjrc2aPR0ldhHVszUS3lqkQZYsD9YbRWfR5zsY/+vHL+V7HeQgkIPyLL6ZmXX+3/BTDyfwo1cJs
yyE34ur3fBOQNCqL78n80CgKoS5kpCS1xlMe/twT4Hr4yR2lMbcfkUXqLKC6Hs8yJUXFG7fmZq8S
6Y4EGNdKEABLU+TkWEeER9bJtjSvhvx5eH7SbL2GYMTIJKjAL2EQ3FU30iqExcksDeE3iUm6udgu
tkgYQcVbJ3VHnORgfjAvwaKLgWCjnPSe2psQZA/bIMUFXwE5lYDRtaIFnsTakRbA5vWX0BWk9C/e
KqsjAw0Lfg/rvYtGjLrDs51NkZaz3Zuc7r1VIw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7296)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
