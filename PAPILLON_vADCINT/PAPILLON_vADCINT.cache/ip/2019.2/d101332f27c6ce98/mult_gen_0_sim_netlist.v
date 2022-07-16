// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Jun 15 14:21:16 2022
// Host        : DESKTOP-NG52DIC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  (* C_LATENCY = "1" *) 
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
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "48" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
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
  (* C_LATENCY = "1" *) 
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
LgZA9rWATQQ/LH50JG4zaZz9amKPMdt8rVb+4QG3mFMo/LkahFC+ozuo6d+E8AnwUefvK1YoydJd
tIZncXF2RaW7J4VpryhQZivaMo0SuKMdrfHcZ8O3FaXh7vOwMtqE8lke1YVT484cDXNrwH8FzZ0V
jGXdptJ4tqhdIadOWOQ2lhcTD9Cgj3LwKTsecJZ7zTK508S/2XEUk7a334734uKDlkR8hL3B05PO
VNu7POiJgs/hzyiSJAE98tk7KTff3l0KD3NtSc5kzO+Z/DHgxEtpziz15v7zH3lAn6Ee+uNnPRhb
PwpinLF7o+XL0UNhNHA/c5UB8nh811nrdlXcDg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fJcGOty+dC2MwP1/hzs96NtWeo4OKUL4G6pvs2BIuk1Qz13JxUTz8KTaQzegcR6FSCLpvklqqmdm
s2FZsPNjBOEtv4D85h194HeM5CvKhfcx9SNun9h6+yoP8gLI9N9KfNjgupYB/AQyfuaBnWTH7BIv
N+9xgoWi6grwZEFrUJR8gGXcBeHucc6Bke30WMiUadouP33oC2vOhz49IEZmM1NO3Wvz+yVjwDEM
HGD/AZN7dtcYnoyflscGrmqYKrbymOsvZweaNUI0BMHpEDs9zbNjSxo2qvv8EY/5vrYTeBUCsjxL
9/xFyL5n3rkxEHV717Q+pASj++S3BQ1CAbHsEw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22208)
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
