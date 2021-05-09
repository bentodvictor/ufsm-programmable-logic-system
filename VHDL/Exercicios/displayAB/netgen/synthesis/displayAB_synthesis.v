////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: displayAB_synthesis.v
// /___/   /\     Timestamp: Tue Sep 05 10:12:52 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim displayAB.ngc displayAB_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: displayAB.ngc
// Output file	: C:\Users\Keli Tauana\Documents\SLP\Exercicio1_lista1\netgen\synthesis\displayAB_synthesis.v
// # of Modules	: 1
// Design Name	: displayAB
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module displayAB (
  clk, a, b, but, display, controle, valor, temp
);
  input clk;
  input [3 : 0] a;
  input [3 : 0] b;
  inout [2 : 0] but;
  output [6 : 0] display;
  inout [3 : 0] controle;
  inout [3 : 0] valor;
  inout [4 : 0] temp;
  wire a_3_IBUF_0;
  wire a_2_IBUF_1;
  wire a_1_IBUF_2;
  wire a_0_IBUF_3;
  wire b_3_IBUF_4;
  wire b_2_IBUF_5;
  wire b_1_IBUF_6;
  wire b_0_IBUF_7;
  wire but_2_IBUF_8;
  wire but_1_IBUF_9;
  wire but_0_IBUF_10;
  wire clk_BUFGP_11;
  wire valor_3_36;
  wire valor_2_37;
  wire valor_1_38;
  wire valor_0_39;
  wire controle_0_40;
  wire \n0044[4:0]<1> ;
  wire temp_4_OBUF_42;
  wire temp_3_OBUF_43;
  wire temp_2_OBUF_44;
  wire temp_1_OBUF_45;
  wire temp_0_OBUF_46;
  wire display_6_OBUF_47;
  wire display_5_OBUF_48;
  wire display_4_OBUF_49;
  wire display_3_OBUF_50;
  wire display_2_OBUF_51;
  wire display_1_OBUF_52;
  wire display_0_OBUF_53;
  wire \temp[4]_temp[4]_mux_11_OUT<3> ;
  wire \temp[4]_temp[4]_mux_11_OUT<2> ;
  wire \temp[4]_temp[4]_mux_11_OUT<1> ;
  wire \temp[4]_temp[4]_mux_11_OUT<0> ;
  wire \Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[0] ;
  wire \Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[2] ;
  wire \Madd_n0044[4:0]_cy<0> ;
  wire \Madd_n0044[4:0]_lut<2> ;
  wire \Madd_n0044[4:0]_cy<2> ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi_88 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<0>_89 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<0>_90 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi1_91 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<1>_92 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<1>_93 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi2_94 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<2>_95 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<2>_96 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi3 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<3> ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<3>_99 ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ;
  wire \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ;
  wire Mmux_n002211;
  wire \controle<0>_inv ;
  wire Mmux_n00224;
  wire N18;
  wire Mmux_n00223;
  wire Mmux_n002231_130;
  wire \Mcount_cont_rapido_cy<1>_rt_163 ;
  wire \Mcount_cont_rapido_cy<2>_rt_164 ;
  wire \Mcount_cont_rapido_cy<3>_rt_165 ;
  wire \Mcount_cont_rapido_cy<4>_rt_166 ;
  wire \Mcount_cont_rapido_cy<5>_rt_167 ;
  wire \Mcount_cont_rapido_cy<6>_rt_168 ;
  wire \Mcount_cont_rapido_cy<7>_rt_169 ;
  wire \Mcount_cont_rapido_cy<8>_rt_170 ;
  wire \Mcount_cont_rapido_cy<9>_rt_171 ;
  wire \Mcount_cont_rapido_cy<10>_rt_172 ;
  wire \Mcount_cont_rapido_cy<11>_rt_173 ;
  wire \Mcount_cont_rapido_cy<12>_rt_174 ;
  wire \Mcount_cont_rapido_cy<13>_rt_175 ;
  wire \Mcount_cont_rapido_cy<14>_rt_176 ;
  wire \Mcount_cont_rapido_cy<15>_rt_177 ;
  wire \Mcount_cont_rapido_cy<16>_rt_178 ;
  wire \Mcount_cont_rapido_cy<17>_rt_179 ;
  wire \Mcount_cont_rapido_cy<18>_rt_180 ;
  wire \Mcount_cont_rapido_cy<19>_rt_181 ;
  wire \Mcount_cont_rapido_cy<20>_rt_182 ;
  wire \Mcount_cont_rapido_cy<21>_rt_183 ;
  wire \Mcount_cont_rapido_xor<22>_rt_184 ;
  wire controle_0_rstpot_185;
  wire cont_rapido_0_rstpot_186;
  wire cont_rapido_1_rstpot_187;
  wire cont_rapido_2_rstpot_188;
  wire cont_rapido_3_rstpot_189;
  wire cont_rapido_4_rstpot_190;
  wire cont_rapido_5_rstpot_191;
  wire cont_rapido_6_rstpot_192;
  wire cont_rapido_7_rstpot_193;
  wire cont_rapido_8_rstpot_194;
  wire cont_rapido_9_rstpot_195;
  wire cont_rapido_10_rstpot_196;
  wire cont_rapido_11_rstpot_197;
  wire cont_rapido_12_rstpot_198;
  wire cont_rapido_13_rstpot_199;
  wire cont_rapido_14_rstpot_200;
  wire cont_rapido_15_rstpot_201;
  wire cont_rapido_16_rstpot_202;
  wire cont_rapido_17_rstpot_203;
  wire cont_rapido_18_rstpot_204;
  wire cont_rapido_19_rstpot_205;
  wire cont_rapido_20_rstpot_206;
  wire cont_rapido_21_rstpot_207;
  wire cont_rapido_22_rstpot_208;
  wire [23 : 0] cont_rapido;
  wire [22 : 0] Result;
  wire [2 : 1] Msub_GND_3_o_GND_3_o_sub_3_OUT_lut;
  wire [0 : 0] Mcount_cont_rapido_lut;
  wire [21 : 0] Mcount_cont_rapido_cy;
  VCC   XST_VCC (
    .P(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> )
  );
  GND   XST_GND (
    .G(cont_rapido[23])
  );
  FDE   valor_0 (
    .C(clk_BUFGP_11),
    .CE(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .D(\temp[4]_temp[4]_mux_11_OUT<0> ),
    .Q(valor_0_39)
  );
  FDE   valor_1 (
    .C(clk_BUFGP_11),
    .CE(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .D(\temp[4]_temp[4]_mux_11_OUT<1> ),
    .Q(valor_1_38)
  );
  FDE   valor_2 (
    .C(clk_BUFGP_11),
    .CE(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .D(\temp[4]_temp[4]_mux_11_OUT<2> ),
    .Q(valor_2_37)
  );
  FDE   valor_3 (
    .C(clk_BUFGP_11),
    .CE(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .D(\temp[4]_temp[4]_mux_11_OUT<3> ),
    .Q(valor_3_36)
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi  (
    .I0(cont_rapido[9]),
    .I1(cont_rapido[8]),
    .I2(cont_rapido[7]),
    .I3(cont_rapido[10]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi_88 )
  );
  LUT5 #(
    .INIT ( 32'h00004000 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<0>  (
    .I0(cont_rapido[7]),
    .I1(cont_rapido[6]),
    .I2(cont_rapido[8]),
    .I3(cont_rapido[9]),
    .I4(cont_rapido[10]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<0>_89 )
  );
  MUXCY   \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<0>  (
    .CI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ),
    .DI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi_88 ),
    .S(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<0>_89 ),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<0>_90 )
  );
  LUT4 #(
    .INIT ( 16'hFFA8 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi1  (
    .I0(cont_rapido[14]),
    .I1(cont_rapido[13]),
    .I2(cont_rapido[12]),
    .I3(cont_rapido[15]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi1_91 )
  );
  LUT5 #(
    .INIT ( 32'h00000400 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<1>  (
    .I0(cont_rapido[12]),
    .I1(cont_rapido[11]),
    .I2(cont_rapido[13]),
    .I3(cont_rapido[14]),
    .I4(cont_rapido[15]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<1>_92 )
  );
  MUXCY   \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<1>  (
    .CI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<0>_90 ),
    .DI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi1_91 ),
    .S(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<1>_92 ),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<1>_93 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF8880 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi2  (
    .I0(cont_rapido[19]),
    .I1(cont_rapido[18]),
    .I2(cont_rapido[17]),
    .I3(cont_rapido[16]),
    .I4(cont_rapido[20]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi2_94 )
  );
  LUT5 #(
    .INIT ( 32'h00000400 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<2>  (
    .I0(cont_rapido[16]),
    .I1(cont_rapido[18]),
    .I2(cont_rapido[17]),
    .I3(cont_rapido[19]),
    .I4(cont_rapido[20]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<2>_95 )
  );
  MUXCY   \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<2>  (
    .CI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<1>_93 ),
    .DI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi2_94 ),
    .S(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<2>_95 ),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<2>_96 )
  );
  MUXCY   \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<3>  (
    .CI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<2>_96 ),
    .DI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi3 ),
    .S(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<3> ),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<3>_99 )
  );
  MUXCY   \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>  (
    .CI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<3>_99 ),
    .DI(cont_rapido[23]),
    .S(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 )
  );
  MUXCY   \Mcount_cont_rapido_cy<0>  (
    .CI(cont_rapido[23]),
    .DI(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ),
    .S(Mcount_cont_rapido_lut[0]),
    .O(Mcount_cont_rapido_cy[0])
  );
  XORCY   \Mcount_cont_rapido_xor<0>  (
    .CI(cont_rapido[23]),
    .LI(Mcount_cont_rapido_lut[0]),
    .O(Result[0])
  );
  MUXCY   \Mcount_cont_rapido_cy<1>  (
    .CI(Mcount_cont_rapido_cy[0]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<1>_rt_163 ),
    .O(Mcount_cont_rapido_cy[1])
  );
  XORCY   \Mcount_cont_rapido_xor<1>  (
    .CI(Mcount_cont_rapido_cy[0]),
    .LI(\Mcount_cont_rapido_cy<1>_rt_163 ),
    .O(Result[1])
  );
  MUXCY   \Mcount_cont_rapido_cy<2>  (
    .CI(Mcount_cont_rapido_cy[1]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<2>_rt_164 ),
    .O(Mcount_cont_rapido_cy[2])
  );
  XORCY   \Mcount_cont_rapido_xor<2>  (
    .CI(Mcount_cont_rapido_cy[1]),
    .LI(\Mcount_cont_rapido_cy<2>_rt_164 ),
    .O(Result[2])
  );
  MUXCY   \Mcount_cont_rapido_cy<3>  (
    .CI(Mcount_cont_rapido_cy[2]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<3>_rt_165 ),
    .O(Mcount_cont_rapido_cy[3])
  );
  XORCY   \Mcount_cont_rapido_xor<3>  (
    .CI(Mcount_cont_rapido_cy[2]),
    .LI(\Mcount_cont_rapido_cy<3>_rt_165 ),
    .O(Result[3])
  );
  MUXCY   \Mcount_cont_rapido_cy<4>  (
    .CI(Mcount_cont_rapido_cy[3]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<4>_rt_166 ),
    .O(Mcount_cont_rapido_cy[4])
  );
  XORCY   \Mcount_cont_rapido_xor<4>  (
    .CI(Mcount_cont_rapido_cy[3]),
    .LI(\Mcount_cont_rapido_cy<4>_rt_166 ),
    .O(Result[4])
  );
  MUXCY   \Mcount_cont_rapido_cy<5>  (
    .CI(Mcount_cont_rapido_cy[4]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<5>_rt_167 ),
    .O(Mcount_cont_rapido_cy[5])
  );
  XORCY   \Mcount_cont_rapido_xor<5>  (
    .CI(Mcount_cont_rapido_cy[4]),
    .LI(\Mcount_cont_rapido_cy<5>_rt_167 ),
    .O(Result[5])
  );
  MUXCY   \Mcount_cont_rapido_cy<6>  (
    .CI(Mcount_cont_rapido_cy[5]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<6>_rt_168 ),
    .O(Mcount_cont_rapido_cy[6])
  );
  XORCY   \Mcount_cont_rapido_xor<6>  (
    .CI(Mcount_cont_rapido_cy[5]),
    .LI(\Mcount_cont_rapido_cy<6>_rt_168 ),
    .O(Result[6])
  );
  MUXCY   \Mcount_cont_rapido_cy<7>  (
    .CI(Mcount_cont_rapido_cy[6]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<7>_rt_169 ),
    .O(Mcount_cont_rapido_cy[7])
  );
  XORCY   \Mcount_cont_rapido_xor<7>  (
    .CI(Mcount_cont_rapido_cy[6]),
    .LI(\Mcount_cont_rapido_cy<7>_rt_169 ),
    .O(Result[7])
  );
  MUXCY   \Mcount_cont_rapido_cy<8>  (
    .CI(Mcount_cont_rapido_cy[7]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<8>_rt_170 ),
    .O(Mcount_cont_rapido_cy[8])
  );
  XORCY   \Mcount_cont_rapido_xor<8>  (
    .CI(Mcount_cont_rapido_cy[7]),
    .LI(\Mcount_cont_rapido_cy<8>_rt_170 ),
    .O(Result[8])
  );
  MUXCY   \Mcount_cont_rapido_cy<9>  (
    .CI(Mcount_cont_rapido_cy[8]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<9>_rt_171 ),
    .O(Mcount_cont_rapido_cy[9])
  );
  XORCY   \Mcount_cont_rapido_xor<9>  (
    .CI(Mcount_cont_rapido_cy[8]),
    .LI(\Mcount_cont_rapido_cy<9>_rt_171 ),
    .O(Result[9])
  );
  MUXCY   \Mcount_cont_rapido_cy<10>  (
    .CI(Mcount_cont_rapido_cy[9]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<10>_rt_172 ),
    .O(Mcount_cont_rapido_cy[10])
  );
  XORCY   \Mcount_cont_rapido_xor<10>  (
    .CI(Mcount_cont_rapido_cy[9]),
    .LI(\Mcount_cont_rapido_cy<10>_rt_172 ),
    .O(Result[10])
  );
  MUXCY   \Mcount_cont_rapido_cy<11>  (
    .CI(Mcount_cont_rapido_cy[10]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<11>_rt_173 ),
    .O(Mcount_cont_rapido_cy[11])
  );
  XORCY   \Mcount_cont_rapido_xor<11>  (
    .CI(Mcount_cont_rapido_cy[10]),
    .LI(\Mcount_cont_rapido_cy<11>_rt_173 ),
    .O(Result[11])
  );
  MUXCY   \Mcount_cont_rapido_cy<12>  (
    .CI(Mcount_cont_rapido_cy[11]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<12>_rt_174 ),
    .O(Mcount_cont_rapido_cy[12])
  );
  XORCY   \Mcount_cont_rapido_xor<12>  (
    .CI(Mcount_cont_rapido_cy[11]),
    .LI(\Mcount_cont_rapido_cy<12>_rt_174 ),
    .O(Result[12])
  );
  MUXCY   \Mcount_cont_rapido_cy<13>  (
    .CI(Mcount_cont_rapido_cy[12]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<13>_rt_175 ),
    .O(Mcount_cont_rapido_cy[13])
  );
  XORCY   \Mcount_cont_rapido_xor<13>  (
    .CI(Mcount_cont_rapido_cy[12]),
    .LI(\Mcount_cont_rapido_cy<13>_rt_175 ),
    .O(Result[13])
  );
  MUXCY   \Mcount_cont_rapido_cy<14>  (
    .CI(Mcount_cont_rapido_cy[13]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<14>_rt_176 ),
    .O(Mcount_cont_rapido_cy[14])
  );
  XORCY   \Mcount_cont_rapido_xor<14>  (
    .CI(Mcount_cont_rapido_cy[13]),
    .LI(\Mcount_cont_rapido_cy<14>_rt_176 ),
    .O(Result[14])
  );
  MUXCY   \Mcount_cont_rapido_cy<15>  (
    .CI(Mcount_cont_rapido_cy[14]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<15>_rt_177 ),
    .O(Mcount_cont_rapido_cy[15])
  );
  XORCY   \Mcount_cont_rapido_xor<15>  (
    .CI(Mcount_cont_rapido_cy[14]),
    .LI(\Mcount_cont_rapido_cy<15>_rt_177 ),
    .O(Result[15])
  );
  MUXCY   \Mcount_cont_rapido_cy<16>  (
    .CI(Mcount_cont_rapido_cy[15]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<16>_rt_178 ),
    .O(Mcount_cont_rapido_cy[16])
  );
  XORCY   \Mcount_cont_rapido_xor<16>  (
    .CI(Mcount_cont_rapido_cy[15]),
    .LI(\Mcount_cont_rapido_cy<16>_rt_178 ),
    .O(Result[16])
  );
  MUXCY   \Mcount_cont_rapido_cy<17>  (
    .CI(Mcount_cont_rapido_cy[16]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<17>_rt_179 ),
    .O(Mcount_cont_rapido_cy[17])
  );
  XORCY   \Mcount_cont_rapido_xor<17>  (
    .CI(Mcount_cont_rapido_cy[16]),
    .LI(\Mcount_cont_rapido_cy<17>_rt_179 ),
    .O(Result[17])
  );
  MUXCY   \Mcount_cont_rapido_cy<18>  (
    .CI(Mcount_cont_rapido_cy[17]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<18>_rt_180 ),
    .O(Mcount_cont_rapido_cy[18])
  );
  XORCY   \Mcount_cont_rapido_xor<18>  (
    .CI(Mcount_cont_rapido_cy[17]),
    .LI(\Mcount_cont_rapido_cy<18>_rt_180 ),
    .O(Result[18])
  );
  MUXCY   \Mcount_cont_rapido_cy<19>  (
    .CI(Mcount_cont_rapido_cy[18]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<19>_rt_181 ),
    .O(Mcount_cont_rapido_cy[19])
  );
  XORCY   \Mcount_cont_rapido_xor<19>  (
    .CI(Mcount_cont_rapido_cy[18]),
    .LI(\Mcount_cont_rapido_cy<19>_rt_181 ),
    .O(Result[19])
  );
  MUXCY   \Mcount_cont_rapido_cy<20>  (
    .CI(Mcount_cont_rapido_cy[19]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<20>_rt_182 ),
    .O(Mcount_cont_rapido_cy[20])
  );
  XORCY   \Mcount_cont_rapido_xor<20>  (
    .CI(Mcount_cont_rapido_cy[19]),
    .LI(\Mcount_cont_rapido_cy<20>_rt_182 ),
    .O(Result[20])
  );
  MUXCY   \Mcount_cont_rapido_cy<21>  (
    .CI(Mcount_cont_rapido_cy[20]),
    .DI(cont_rapido[23]),
    .S(\Mcount_cont_rapido_cy<21>_rt_183 ),
    .O(Mcount_cont_rapido_cy[21])
  );
  XORCY   \Mcount_cont_rapido_xor<21>  (
    .CI(Mcount_cont_rapido_cy[20]),
    .LI(\Mcount_cont_rapido_cy<21>_rt_183 ),
    .O(Result[21])
  );
  XORCY   \Mcount_cont_rapido_xor<22>  (
    .CI(Mcount_cont_rapido_cy[21]),
    .LI(\Mcount_cont_rapido_xor<22>_rt_184 ),
    .O(Result[22])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_3_o_GND_3_o_sub_3_OUT_lut<1>1  (
    .I0(a_1_IBUF_2),
    .I1(b_1_IBUF_6),
    .O(Msub_GND_3_o_GND_3_o_sub_3_OUT_lut[1])
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Msub_GND_3_o_GND_3_o_sub_3_OUT_lut<2>1  (
    .I0(a_2_IBUF_1),
    .I1(b_2_IBUF_5),
    .O(Msub_GND_3_o_GND_3_o_sub_3_OUT_lut[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Madd_n0044[4:0]_lut<2>1  (
    .I0(a_2_IBUF_1),
    .I1(b_2_IBUF_5),
    .O(\Madd_n0044[4:0]_lut<2> )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \Msub_GND_3_o_GND_3_o_sub_3_OUT_cy<0>11  (
    .I0(b_0_IBUF_7),
    .I1(a_0_IBUF_3),
    .O(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[0] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Madd_n0044[4:0]_cy<0>11  (
    .I0(a_0_IBUF_3),
    .I1(b_0_IBUF_7),
    .O(\Madd_n0044[4:0]_cy<0> )
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  Mmux_n0022111 (
    .I0(but_1_IBUF_9),
    .I1(but_0_IBUF_10),
    .I2(but_2_IBUF_8),
    .O(Mmux_n002211)
  );
  LUT4 #(
    .INIT ( 16'hE228 ))
  \u1/Mram_codificado111  (
    .I0(valor_2_37),
    .I1(valor_0_39),
    .I2(valor_1_38),
    .I3(valor_3_36),
    .O(display_1_OBUF_52)
  );
  LUT4 #(
    .INIT ( 16'h0941 ))
  \u1/Mram_codificado61  (
    .I0(valor_1_38),
    .I1(valor_2_37),
    .I2(valor_3_36),
    .I3(valor_0_39),
    .O(display_6_OBUF_47)
  );
  LUT4 #(
    .INIT ( 16'h02BA ))
  \u1/Mram_codificado41  (
    .I0(valor_0_39),
    .I1(valor_1_38),
    .I2(valor_2_37),
    .I3(valor_3_36),
    .O(display_4_OBUF_49)
  );
  LUT4 #(
    .INIT ( 16'h2812 ))
  \u1/Mram_codificado11  (
    .I0(valor_0_39),
    .I1(valor_1_38),
    .I2(valor_2_37),
    .I3(valor_3_36),
    .O(display_0_OBUF_53)
  );
  LUT4 #(
    .INIT ( 16'h9086 ))
  \u1/Mram_codificado31  (
    .I0(valor_0_39),
    .I1(valor_2_37),
    .I2(valor_1_38),
    .I3(valor_3_36),
    .O(display_3_OBUF_50)
  );
  LUT4 #(
    .INIT ( 16'h6054 ))
  \u1/Mram_codificado51  (
    .I0(valor_3_36),
    .I1(valor_1_38),
    .I2(valor_0_39),
    .I3(valor_2_37),
    .O(display_5_OBUF_48)
  );
  LUT4 #(
    .INIT ( 16'hD004 ))
  \u1/Mram_codificado21  (
    .I0(valor_0_39),
    .I1(valor_1_38),
    .I2(valor_2_37),
    .I3(valor_3_36),
    .O(display_2_OBUF_51)
  );
  LUT6 #(
    .INIT ( 64'hAEEA0440FFFFFFFF ))
  Mmux_n00222 (
    .I0(but_0_IBUF_10),
    .I1(but_1_IBUF_9),
    .I2(Msub_GND_3_o_GND_3_o_sub_3_OUT_lut[1]),
    .I3(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[0] ),
    .I4(\n0044[4:0]<1> ),
    .I5(N18),
    .O(temp_1_OBUF_45)
  );
  LUT6 #(
    .INIT ( 64'h0202022020022020 ))
  Mmux_n002232 (
    .I0(but_1_IBUF_9),
    .I1(but_0_IBUF_10),
    .I2(Msub_GND_3_o_GND_3_o_sub_3_OUT_lut[2]),
    .I3(Msub_GND_3_o_GND_3_o_sub_3_OUT_lut[1]),
    .I4(a_1_IBUF_2),
    .I5(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[0] ),
    .O(Mmux_n002231_130)
  );
  IBUF   a_3_IBUF (
    .I(a[3]),
    .O(a_3_IBUF_0)
  );
  IBUF   a_2_IBUF (
    .I(a[2]),
    .O(a_2_IBUF_1)
  );
  IBUF   a_1_IBUF (
    .I(a[1]),
    .O(a_1_IBUF_2)
  );
  IBUF   a_0_IBUF (
    .I(a[0]),
    .O(a_0_IBUF_3)
  );
  IBUF   b_3_IBUF (
    .I(b[3]),
    .O(b_3_IBUF_4)
  );
  IBUF   b_2_IBUF (
    .I(b[2]),
    .O(b_2_IBUF_5)
  );
  IBUF   b_1_IBUF (
    .I(b[1]),
    .O(b_1_IBUF_6)
  );
  IBUF   b_0_IBUF (
    .I(b[0]),
    .O(b_0_IBUF_7)
  );
  IBUF   but_2_IBUF (
    .I(but[2]),
    .O(but_2_IBUF_8)
  );
  IBUF   but_1_IBUF (
    .I(but[1]),
    .O(but_1_IBUF_9)
  );
  IBUF   but_0_IBUF (
    .I(but[0]),
    .O(but_0_IBUF_10)
  );
  OBUF   controle_3_OBUF (
    .I(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ),
    .O(controle[3])
  );
  OBUF   controle_2_OBUF (
    .I(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<4> ),
    .O(controle[2])
  );
  OBUF   controle_1_OBUF (
    .I(\controle<0>_inv ),
    .O(controle[1])
  );
  OBUF   controle_0_OBUF (
    .I(controle_0_40),
    .O(controle[0])
  );
  OBUF   valor_3_OBUF (
    .I(valor_3_36),
    .O(valor[3])
  );
  OBUF   valor_2_OBUF (
    .I(valor_2_37),
    .O(valor[2])
  );
  OBUF   valor_1_OBUF (
    .I(valor_1_38),
    .O(valor[1])
  );
  OBUF   valor_0_OBUF (
    .I(valor_0_39),
    .O(valor[0])
  );
  OBUF   temp_4_OBUF (
    .I(temp_4_OBUF_42),
    .O(temp[4])
  );
  OBUF   temp_3_OBUF (
    .I(temp_3_OBUF_43),
    .O(temp[3])
  );
  OBUF   temp_2_OBUF (
    .I(temp_2_OBUF_44),
    .O(temp[2])
  );
  OBUF   temp_1_OBUF (
    .I(temp_1_OBUF_45),
    .O(temp[1])
  );
  OBUF   temp_0_OBUF (
    .I(temp_0_OBUF_46),
    .O(temp[0])
  );
  OBUF   display_6_OBUF (
    .I(display_6_OBUF_47),
    .O(display[6])
  );
  OBUF   display_5_OBUF (
    .I(display_5_OBUF_48),
    .O(display[5])
  );
  OBUF   display_4_OBUF (
    .I(display_4_OBUF_49),
    .O(display[4])
  );
  OBUF   display_3_OBUF (
    .I(display_3_OBUF_50),
    .O(display[3])
  );
  OBUF   display_2_OBUF (
    .I(display_2_OBUF_51),
    .O(display[2])
  );
  OBUF   display_1_OBUF (
    .I(display_1_OBUF_52),
    .O(display[1])
  );
  OBUF   display_0_OBUF (
    .I(display_0_OBUF_53),
    .O(display[0])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi31  (
    .I0(cont_rapido[22]),
    .I1(cont_rapido[21]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lutdi3 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<3>1  (
    .I0(cont_rapido[21]),
    .I1(cont_rapido[22]),
    .O(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_lut<3> )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<1>_rt  (
    .I0(cont_rapido[1]),
    .O(\Mcount_cont_rapido_cy<1>_rt_163 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<2>_rt  (
    .I0(cont_rapido[2]),
    .O(\Mcount_cont_rapido_cy<2>_rt_164 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<3>_rt  (
    .I0(cont_rapido[3]),
    .O(\Mcount_cont_rapido_cy<3>_rt_165 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<4>_rt  (
    .I0(cont_rapido[4]),
    .O(\Mcount_cont_rapido_cy<4>_rt_166 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<5>_rt  (
    .I0(cont_rapido[5]),
    .O(\Mcount_cont_rapido_cy<5>_rt_167 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<6>_rt  (
    .I0(cont_rapido[6]),
    .O(\Mcount_cont_rapido_cy<6>_rt_168 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<7>_rt  (
    .I0(cont_rapido[7]),
    .O(\Mcount_cont_rapido_cy<7>_rt_169 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<8>_rt  (
    .I0(cont_rapido[8]),
    .O(\Mcount_cont_rapido_cy<8>_rt_170 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<9>_rt  (
    .I0(cont_rapido[9]),
    .O(\Mcount_cont_rapido_cy<9>_rt_171 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<10>_rt  (
    .I0(cont_rapido[10]),
    .O(\Mcount_cont_rapido_cy<10>_rt_172 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<11>_rt  (
    .I0(cont_rapido[11]),
    .O(\Mcount_cont_rapido_cy<11>_rt_173 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<12>_rt  (
    .I0(cont_rapido[12]),
    .O(\Mcount_cont_rapido_cy<12>_rt_174 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<13>_rt  (
    .I0(cont_rapido[13]),
    .O(\Mcount_cont_rapido_cy<13>_rt_175 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<14>_rt  (
    .I0(cont_rapido[14]),
    .O(\Mcount_cont_rapido_cy<14>_rt_176 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<15>_rt  (
    .I0(cont_rapido[15]),
    .O(\Mcount_cont_rapido_cy<15>_rt_177 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<16>_rt  (
    .I0(cont_rapido[16]),
    .O(\Mcount_cont_rapido_cy<16>_rt_178 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<17>_rt  (
    .I0(cont_rapido[17]),
    .O(\Mcount_cont_rapido_cy<17>_rt_179 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<18>_rt  (
    .I0(cont_rapido[18]),
    .O(\Mcount_cont_rapido_cy<18>_rt_180 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<19>_rt  (
    .I0(cont_rapido[19]),
    .O(\Mcount_cont_rapido_cy<19>_rt_181 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<20>_rt  (
    .I0(cont_rapido[20]),
    .O(\Mcount_cont_rapido_cy<20>_rt_182 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_cy<21>_rt  (
    .I0(cont_rapido[21]),
    .O(\Mcount_cont_rapido_cy<21>_rt_183 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_cont_rapido_xor<22>_rt  (
    .I0(cont_rapido[22]),
    .O(\Mcount_cont_rapido_xor<22>_rt_184 )
  );
  FD   controle_0 (
    .C(clk_BUFGP_11),
    .D(controle_0_rstpot_185),
    .Q(controle_0_40)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  controle_0_rstpot (
    .I0(controle_0_40),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(controle_0_rstpot_185)
  );
  LUT6 #(
    .INIT ( 64'hEBABEEEA41014440 ))
  \Mmux_temp[4]_temp[4]_mux_11_OUT1  (
    .I0(controle_0_40),
    .I1(temp_3_OBUF_43),
    .I2(temp_2_OBUF_44),
    .I3(temp_1_OBUF_45),
    .I4(temp_4_OBUF_42),
    .I5(temp_0_OBUF_46),
    .O(\temp[4]_temp[4]_mux_11_OUT<0> )
  );
  LUT5 #(
    .INIT ( 32'h20080020 ))
  \Mmux_temp[4]_temp[4]_mux_11_OUT41  (
    .I0(controle_0_40),
    .I1(temp_1_OBUF_45),
    .I2(temp_3_OBUF_43),
    .I3(temp_2_OBUF_44),
    .I4(temp_4_OBUF_42),
    .O(\temp[4]_temp[4]_mux_11_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'h2EA46228 ))
  \Mmux_temp[4]_temp[4]_mux_11_OUT21  (
    .I0(temp_4_OBUF_42),
    .I1(controle_0_40),
    .I2(temp_3_OBUF_43),
    .I3(temp_2_OBUF_44),
    .I4(temp_1_OBUF_45),
    .O(\temp[4]_temp[4]_mux_11_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'h28082028 ))
  \Mmux_temp[4]_temp[4]_mux_11_OUT31  (
    .I0(controle_0_40),
    .I1(temp_2_OBUF_44),
    .I2(temp_4_OBUF_42),
    .I3(temp_3_OBUF_43),
    .I4(temp_1_OBUF_45),
    .O(\temp[4]_temp[4]_mux_11_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'h3C7D3C283C283C28 ))
  Mmux_n002212 (
    .I0(but_0_IBUF_10),
    .I1(a_0_IBUF_3),
    .I2(b_0_IBUF_7),
    .I3(but_1_IBUF_9),
    .I4(\n0044[4:0]<1> ),
    .I5(but_2_IBUF_8),
    .O(temp_0_OBUF_46)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEE88228 ))
  Mmux_n002242 (
    .I0(but_0_IBUF_10),
    .I1(\Madd_n0044[4:0]_cy<2> ),
    .I2(a_3_IBUF_0),
    .I3(b_3_IBUF_4),
    .I4(Mmux_n002211),
    .I5(Mmux_n00224),
    .O(temp_3_OBUF_43)
  );
  LUT5 #(
    .INIT ( 32'h02202002 ))
  Mmux_n002241 (
    .I0(but_1_IBUF_9),
    .I1(but_0_IBUF_10),
    .I2(a_3_IBUF_0),
    .I3(b_3_IBUF_4),
    .I4(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[2] ),
    .O(Mmux_n00224)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF8228 ))
  Mmux_n002233 (
    .I0(Mmux_n002211),
    .I1(\Madd_n0044[4:0]_cy<2> ),
    .I2(a_3_IBUF_0),
    .I3(b_3_IBUF_4),
    .I4(Mmux_n002231_130),
    .I5(Mmux_n00223),
    .O(temp_2_OBUF_44)
  );
  LUT6 #(
    .INIT ( 64'hAEEEA0A4A4E40004 ))
  Mmux_n00225 (
    .I0(but_0_IBUF_10),
    .I1(but_1_IBUF_9),
    .I2(a_3_IBUF_0),
    .I3(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[2] ),
    .I4(b_3_IBUF_4),
    .I5(\Madd_n0044[4:0]_cy<2> ),
    .O(temp_4_OBUF_42)
  );
  LUT6 #(
    .INIT ( 64'hFDD5D5D5577F7F7F ))
  Mmux_n00222_SW0 (
    .I0(Mmux_n002211),
    .I1(a_1_IBUF_2),
    .I2(b_1_IBUF_6),
    .I3(a_0_IBUF_3),
    .I4(b_0_IBUF_7),
    .I5(\Madd_n0044[4:0]_lut<2> ),
    .O(N18)
  );
  LUT6 #(
    .INIT ( 64'h8282822882282828 ))
  Mmux_n002231 (
    .I0(but_0_IBUF_10),
    .I1(a_2_IBUF_1),
    .I2(b_2_IBUF_5),
    .I3(a_1_IBUF_2),
    .I4(b_1_IBUF_6),
    .I5(\Madd_n0044[4:0]_cy<0> ),
    .O(Mmux_n00223)
  );
  LUT4 #(
    .INIT ( 16'h9666 ))
  \Madd_n0044[4:0]_xor<1>11  (
    .I0(a_1_IBUF_2),
    .I1(b_1_IBUF_6),
    .I2(a_0_IBUF_3),
    .I3(b_0_IBUF_7),
    .O(\n0044[4:0]<1> )
  );
  LUT6 #(
    .INIT ( 64'hEEE8E888E888E888 ))
  \Madd_n0044[4:0]_cy<2>11  (
    .I0(a_2_IBUF_1),
    .I1(b_2_IBUF_5),
    .I2(a_1_IBUF_2),
    .I3(b_1_IBUF_6),
    .I4(a_0_IBUF_3),
    .I5(b_0_IBUF_7),
    .O(\Madd_n0044[4:0]_cy<2> )
  );
  LUT6 #(
    .INIT ( 64'hB2BBB2BB22B2B2BB ))
  \Msub_GND_3_o_GND_3_o_sub_3_OUT_cy<2>11  (
    .I0(a_2_IBUF_1),
    .I1(b_2_IBUF_5),
    .I2(a_1_IBUF_2),
    .I3(b_1_IBUF_6),
    .I4(b_0_IBUF_7),
    .I5(a_0_IBUF_3),
    .O(\Msub_GND_3_o_GND_3_o_sub_3_OUT_cy[2] )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_0_rstpot (
    .I0(Result[0]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_0_rstpot_186)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_0 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_0_rstpot_186),
    .Q(cont_rapido[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_1_rstpot (
    .I0(Result[1]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_1_rstpot_187)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_1 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_1_rstpot_187),
    .Q(cont_rapido[1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_2_rstpot (
    .I0(Result[2]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_2_rstpot_188)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_2 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_2_rstpot_188),
    .Q(cont_rapido[2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_3_rstpot (
    .I0(Result[3]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_3_rstpot_189)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_3 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_3_rstpot_189),
    .Q(cont_rapido[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_4_rstpot (
    .I0(Result[4]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_4_rstpot_190)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_4 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_4_rstpot_190),
    .Q(cont_rapido[4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_5_rstpot (
    .I0(Result[5]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_5_rstpot_191)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_5 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_5_rstpot_191),
    .Q(cont_rapido[5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_6_rstpot (
    .I0(Result[6]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_6_rstpot_192)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_6 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_6_rstpot_192),
    .Q(cont_rapido[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_7_rstpot (
    .I0(Result[7]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_7_rstpot_193)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_7 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_7_rstpot_193),
    .Q(cont_rapido[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_8_rstpot (
    .I0(Result[8]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_8_rstpot_194)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_8 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_8_rstpot_194),
    .Q(cont_rapido[8])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_9_rstpot (
    .I0(Result[9]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_9_rstpot_195)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_9 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_9_rstpot_195),
    .Q(cont_rapido[9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_10_rstpot (
    .I0(Result[10]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_10_rstpot_196)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_10 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_10_rstpot_196),
    .Q(cont_rapido[10])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_11_rstpot (
    .I0(Result[11]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_11_rstpot_197)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_11 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_11_rstpot_197),
    .Q(cont_rapido[11])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_12_rstpot (
    .I0(Result[12]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_12_rstpot_198)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_12 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_12_rstpot_198),
    .Q(cont_rapido[12])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_13_rstpot (
    .I0(Result[13]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_13_rstpot_199)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_13 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_13_rstpot_199),
    .Q(cont_rapido[13])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_14_rstpot (
    .I0(Result[14]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_14_rstpot_200)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_14 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_14_rstpot_200),
    .Q(cont_rapido[14])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_15_rstpot (
    .I0(Result[15]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_15_rstpot_201)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_15 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_15_rstpot_201),
    .Q(cont_rapido[15])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_16_rstpot (
    .I0(Result[16]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_16_rstpot_202)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_16 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_16_rstpot_202),
    .Q(cont_rapido[16])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_17_rstpot (
    .I0(Result[17]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_17_rstpot_203)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_17 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_17_rstpot_203),
    .Q(cont_rapido[17])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_18_rstpot (
    .I0(Result[18]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_18_rstpot_204)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_18 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_18_rstpot_204),
    .Q(cont_rapido[18])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_19_rstpot (
    .I0(Result[19]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_19_rstpot_205)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_19 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_19_rstpot_205),
    .Q(cont_rapido[19])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_20_rstpot (
    .I0(Result[20]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_20_rstpot_206)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_20 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_20_rstpot_206),
    .Q(cont_rapido[20])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_21_rstpot (
    .I0(Result[21]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_21_rstpot_207)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_21 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_21_rstpot_207),
    .Q(cont_rapido[21])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  cont_rapido_22_rstpot (
    .I0(Result[22]),
    .I1(\Mcompar_cont_rapido[26]_GND_3_o_LessThan_7_o_cy<4>_101 ),
    .O(cont_rapido_22_rstpot_208)
  );
  FD #(
    .INIT ( 1'b0 ))
  cont_rapido_22 (
    .C(clk_BUFGP_11),
    .D(cont_rapido_22_rstpot_208),
    .Q(cont_rapido[22])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_11)
  );
  INV   \Mcount_cont_rapido_lut<0>_INV_0  (
    .I(cont_rapido[0]),
    .O(Mcount_cont_rapido_lut[0])
  );
  INV   \controle<0>_inv1_INV_0  (
    .I(controle_0_40),
    .O(\controle<0>_inv )
  );
endmodule


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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

