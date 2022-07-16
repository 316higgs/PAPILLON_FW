// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Jun 16 12:39:31 2022
// Host        : DESKTOP-NG52DIC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_2_sim_netlist.v
// Design      : mult_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_2,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
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
Xmmi03TBjr9lxUNQpVRQMgv0CDjeXJEWBBBYLElFY4k2yvSb7Y7GkP/tmaZwhndNRTqg+p6NKZa1
iiOLZsWru+1RSb37CId3Pbpuue1ou1GHO6fk0Obd3dHWzR+FlPWwR1BfjJFVteHYEjug+1gSoaVu
qEv2fn1BzsxTlS7lWZaf/sgq/ldJn3YE8nWMnjovsxWcz6oAx0pB8r0jhFg0aZoTZ6wG0AsAE570
jnOz5Vwb3xtnSJ5b7Ai2t4iVbLQPHEuusrx9vtZaV9xzS3GEX88QhC9eKSgf615/hPkRM/Rdl0FY
JSQ8VnwM2v/qOrQZ8cJ3FXL2JtQ+F7uYhtY/Ag==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
N02B0HgnMfjck577RekZDwTMPrFMMIRm99tGCOeYj4v1okNO9/2qKp6dIGuiG7fqfHnalNHzVFM0
sxGWuj+jcs9Fx5uHCw9kDiLf6KN9x/YJbXvgPP8a/NoFQulV3l8mYDNVvCQzKd4xidRZpc9Tth6c
0wJOUNhIiyaiPsqUv3a2Ymntq7PmeJQWQc9OOWNcOnPvZLZtNq5R09EMdAZpC6RMVXb94p7DnLDH
q3wNwfXFRai246VdC2EgEWd/QnBDXHFdp9Kg1G3Meemnc/Vj/ZOO86xlNUD7mrq1AZIchp5v2CdH
BDDuC5TfZA99C2rzOWipucLzzwHa02PoVT3Qlg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7312)
`pragma protect data_block
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
prMfoVj6Ro7CiMuHbjm0og==
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
