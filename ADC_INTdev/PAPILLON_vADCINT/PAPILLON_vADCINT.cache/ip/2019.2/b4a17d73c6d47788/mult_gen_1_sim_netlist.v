// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Jun 15 15:01:32 2022
// Host        : DESKTOP-NG52DIC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_1_sim_netlist.v
// Design      : mult_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_1,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [63:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [79:0]P;

  wire [63:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [79:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "64" *) 
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
  (* C_OUT_HIGH = "79" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "64" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "79" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [63:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [79:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [63:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [79:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "64" *) 
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
  (* C_OUT_HIGH = "79" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
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
HUGt2/xuKQrph2/pDExq5bOqdaA16aeLaaYdx6epjsz4svXGPs3m7El0UhYkXq2kYzW+cVa5nOkL
nvechEqqsVuFnPlZ9zn/P2ZlIqCSwu3pV68jpgnfeNyQOk3+5Kb46n4UHzyOfEcASFNB+Iv6wtCi
bCLx6eCVHm5XQoqdUPBy72rO51cna1LkP4ABupxgJYmia5QLgRYp2dnPZSupCEvUR5bndehHrlMQ
MVJITljVWv6JybBJzXINZmdWdf3qSNIyjAag96JydeTMl9u9ZY/gw1QjSvA/ey7ztdpH/uNti7Jf
70VnBSiyAp2vCsbpaYno2BOUgRMnUtN98cW1sg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xo0ZUAWdVr1nmO0vxBr6ZIT3MPh2ezbwr7YhQE4vRSXwWeFU4PzJupRr+XzfTdKY3XC0Ls2ejdPj
/NSwKstkb6WZk5Xz9J70ICwjFBWoo1W7E1TPRREORkHn1ELaaEUp7BoQnsgZ/V8zOJpUGzhoS9Z+
oJ4Q4CUbOhTR9ARV+gJ2wABjKHs3tuV4JK8XgMd1ylD2/+ekRAt4O7r/6GEcLHkF/0dZz2S3Fs7P
CRSZakWKzCJ++iI6Jv1OU+DFZSYiyqBvNVItFrOm1gG0i8ggY+fk7F73WXjkso+4jTDsJm8wmQe8
oYOf60fm4K7QuHyDrrqlutz3ZnpxqcEQt0n6UA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30208)
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
