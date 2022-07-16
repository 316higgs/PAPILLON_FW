// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Jun 17 17:35:31 2022
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
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "3" *) (* C_MODEL_TYPE = "0" *) 
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
ouQdv1WB65Fml/JpNSCwBvUDpmZbJEFIdDFbGYNBgJXZNc72ouKgKLxEiJcWiqZ+yD2cvCwVNVvO
kiyNbp1Ks7MBnsz4C7/K5uC1vNs1Y4m7LZxardNfcT+GcaySvg8KC6rpNPLk6SdQdzUIwowR4ExZ
LT1Ait+7wvu1XmTqAYLxdnPelr8h/C1HWL36MYbk88BgNRLsTw6j7XTVEfrOZQxsydS+IekNTbln
5Uz0Isp2b6TZJzM3w7JDP8u9AoSwJ9Wbj4AygDDcwM66TSISk7oEZFroLhwCuyP83WGpbeBtyCpD
mKULJLX0+7agxIBOq7j+2vmOyVZwPbnanGMW7g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zzhHrh7eqWfO+cHxXjzO5jKXgah8tBZH8vtOlpo4QAAxbj8Ldn9QqX4IxlNxb8zGqm2m8oGNfFqa
pVShHsG5tWxpUZ8rGqlJc2APtaZIutCRPntMKTdRel3uFFHAksK/IV3DU2A2ebOIK/Edl+E9ER8Q
ugc45ZDT4MBEJvh4WwfIQuzsHlCM48h5cSYAIvjxW13Y/bGK7qs6aAK4ht4ZjOvqBuzwCmmgC/AD
gh2nYIW1s2c4R0gFvs/a59f4tBHZJ5yu7WEAa/hAoq2bQ/7hXWBlsvkS0rnNUxotDfVzFUQcRliZ
AIox2mTZJGS1jNXr4cYnXAsA+xaH/XmMqyeJVQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
k90kPZjcDnRZeeH6pfWWEBbr2mpMXrYHig==
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
