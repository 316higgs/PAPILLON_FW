// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Jun 16 19:09:59 2022
// Host        : DESKTOP-NG52DIC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/81802/Desktop/PAPILLON_FW/PAPILLON_vADCINT/PAPILLON_vADCINT.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [47:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [63:0]P;

  wire [15:0]A;
  wire [47:0]B;
  wire CE;
  wire CLK;
  wire [63:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "48" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "5" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_16 U0
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
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "48" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "5" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_16
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
  input [47:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [63:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [15:0]A;
  wire [47:0]B;
  wire CE;
  wire CLK;
  wire [63:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "48" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "5" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
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
kzzyY3iaO2lCoU986CN+RODJWAfmu0x4QV+h5eLEjOKkRYKSQe2QeZ4S/uK60ft9KJbNn5vdwQXw
9GkwElMP1wAKl45625S6FThAWfF4t8I94YTI4JIbxGka9Ll4GpWcY9JJiErJHxAyYabHcS2Pat0X
n6aC7Y9XTVlML5DqVK/8ntVqTcbx+2Oo9mxKwLUM8aljHiVhkIT1MKMTmLO7zaiV5tLaFsjUddkB
K3mBWNGWvA6YoI6f5nVmXbQSfDWWk+FshgbzaRbh/j7kUZ9tXVnBYC37Vi7+IhpAZGhmJprQlPbi
9de/R0Tk3jboTDC+8ek4IMdHu9XzRCOFwSI9UA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Tt14bj+Wxd00UQaHNO6XO8wWRkaJgrpX54B4d3SWyNQi2hFAggTSKKfYWTaXc8spOzsjuwX9sHsO
nDwSkuvWbTU9TLTct18MX2WdBFIOKK9HCB/X7uXmffmeKMhBS/q3321XruvLUfyw5e+TmxmkqZ+a
JS7CLyWBLYFwjkmckJ9R+8LOl6TX2Fx3pNbTOpTbn7aE+glna3656PzY1PspSpBBgn/ubrwdIqoK
1bG8EE8pMF/PtOMkoWU0cuXJI3VGTVPzjP4y9OqaY0RKnYLQq1hN4onN+OjvdaFXgsvhPFW9aV94
6vQVPUk1QjpD+SK6ZigSox8E+uu6FUMP7GSbCg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38096)
`pragma protect data_block
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
DT3NutzuCC9jIUjs0nQ6q4z7XlE=
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
