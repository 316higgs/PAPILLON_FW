-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Nov 22 23:52:50 2021
-- Host        : larwx01 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/kensh/Desktop/FPGA/PAPILLON/PAPILLON_v3s/PAPILLON_v3s.srcs/sources_1/ip/divider/divider_stub.vhdl
-- Design      : divider
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end divider;

architecture stub of divider is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_divisor_tvalid,s_axis_divisor_tdata[63:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[63:0],m_axis_dout_tvalid,m_axis_dout_tdata[127:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "div_gen_v5_1_16,Vivado 2019.2";
begin
end;