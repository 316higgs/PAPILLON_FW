// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Jun 17 17:35:32 2022
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
  (* C_LATENCY = "3" *) 
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
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
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
  (* C_LATENCY = "3" *) 
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
FqdlYLKTuY7SZREIuF80uHORn1r27ay9k2OCRkUTrtgqgfuLmBYg1PwEPtLjQdJgHIU166MRY22Y
wr+Oe6k/9IxkrOVnh0nNWMEFDZsrWfmtW2VRgxv8Mupdvr46fXkPwyKEeqF69CWiqpw38ycmJVLB
3serOy04iI/vk2dw44qd7AGa4NU6UA+kJfJkOTqTisMkakQCaTyfRN4xX3WXy5wv1xyO/29nSZyG
B/D86jNsEb+JE1YarlXMqSFyWjMgw/I3zu0utaNVmRHWWeCzufaWdGbVJao9rHzBeOEW4m67XOxP
yoIjOt2hLqh45200lRQnz1HsPUR+qbSP5+8OHA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CClE3Sv7DkVgIOwbx6NYnNCc7NLOjRw60v6JVeW/PH8jCkjpo6wegbLVBRt+1/VOpJxCFeQTkVH/
vcPI5pTcf8mtArIFlbkO01jeNjtk/xC3qOhPQehw8LuPavVoGc/oLidwn8Xb7MN15BvvL81mvP2A
K3gcq19Wa7NuErhRw/x7oyiZ1QWN+9Nxz1nnLk8Se0JA/pC/eQLWcXCEgGuX7hc6jwMQ2ccQePj+
T1KN3pZtThkWY17LMMJslxPfGB8yokFc0wS1SCICD8oExrWDe5wU5ODffNPCayngt61JeAr6wbzd
gmo8twPrgHPJib4t238wcdkF6ykmRPr8z3cHiw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7248)
`pragma protect data_block
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
4Y2whT1yGtns
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
