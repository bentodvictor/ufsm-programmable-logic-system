--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: M.81d
--  \   \         Application: netgen
--  /   /         Filename: formigaLed_synthesis.vhd
-- /___/   /\     Timestamp: Tue Oct 24 12:23:50 2017
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm formigaLed -w -dir netgen/synthesis -ofmt vhdl -sim formigaLed.ngc formigaLed_synthesis.vhd 
-- Device	: xc6slx16-3-csg324
-- Input file	: formigaLed.ngc
-- Output file	: F:\vhdl\Aula11\minhoca\netgen\synthesis\formigaLed_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: formigaLed
-- Xilinx	: C:\Xilinx\12.4\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity formigaLed is
  port (
    btn : in STD_LOGIC := 'X'; 
    clk : in STD_LOGIC := 'X'; 
    controle : inout STD_LOGIC_VECTOR ( 3 downto 0 ); 
    display : out STD_LOGIC_VECTOR ( 6 downto 0 ) 
  );
end formigaLed;

architecture Structure of formigaLed is
  signal btn_IBUF_0 : STD_LOGIC; 
  signal clk_BUFGP_1 : STD_LOGIC; 
  signal state_FSM_FFd1_2 : STD_LOGIC; 
  signal state_FSM_FFd2_3 : STD_LOGIC; 
  signal state_FSM_FFd3_4 : STD_LOGIC; 
  signal state_FSM_FFd4_5 : STD_LOGIC; 
  signal display_6_52 : STD_LOGIC; 
  signal display_5_53 : STD_LOGIC; 
  signal display_4_54 : STD_LOGIC; 
  signal display_3_55 : STD_LOGIC; 
  signal display_2_56 : STD_LOGIC; 
  signal display_1_57 : STD_LOGIC; 
  signal display_0_58 : STD_LOGIC; 
  signal c_6_Q : STD_LOGIC; 
  signal c_3_Q : STD_LOGIC; 
  signal c_1_Q : STD_LOGIC; 
  signal c_0_Q : STD_LOGIC; 
  signal d_3_Q : STD_LOGIC; 
  signal d_1_Q : STD_LOGIC; 
  signal d_0_Q : STD_LOGIC; 
  signal u_6_Q : STD_LOGIC; 
  signal u_3_Q : STD_LOGIC; 
  signal u_2_Q : STD_LOGIC; 
  signal controle_3_76 : STD_LOGIC; 
  signal controle_2_77 : STD_LOGIC; 
  signal controle_1_78 : STD_LOGIC; 
  signal controle_0_79 : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_6_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_5_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_4_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_3_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_2_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_1_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_88_OUT_0_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_90_OUT_3_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_90_OUT_1_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_90_OUT_0_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_89_OUT_6_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_89_OUT_3_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_89_OUT_1_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_91_OUT_6_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_91_OUT_3_Q : STD_LOGIC; 
  signal state_3_X_3_o_wide_mux_91_OUT_2_Q : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_18_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_17_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_16_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_15_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_14_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_13_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_12_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_11_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_10_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_9_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_8_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_7_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_6_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_add_1_OUT_5_Q : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_1_o : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_6_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_5_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_4_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_3_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_2_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_1_Q : STD_LOGIC; 
  signal u_6_m_6_mux_10_OUT_0_Q : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_3_o : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_4_o : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_5_o : STD_LOGIC; 
  signal Q_n0160 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o_inv : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_1_o_inv : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal Result_4_1 : STD_LOGIC; 
  signal Result_5_1 : STD_LOGIC; 
  signal Result_6_1 : STD_LOGIC; 
  signal Result_7_1 : STD_LOGIC; 
  signal Result_8_1 : STD_LOGIC; 
  signal Result_9_1 : STD_LOGIC; 
  signal Result_10_1 : STD_LOGIC; 
  signal Result_11_1 : STD_LOGIC; 
  signal Result_12_1 : STD_LOGIC; 
  signal Result_13_1 : STD_LOGIC; 
  signal Result_14_1 : STD_LOGIC; 
  signal Result_15_1 : STD_LOGIC; 
  signal Result_16_1 : STD_LOGIC; 
  signal Result_17_1 : STD_LOGIC; 
  signal Result_18_1 : STD_LOGIC; 
  signal state_FSM_FFd4_In : STD_LOGIC; 
  signal state_FSM_FFd3_In : STD_LOGIC; 
  signal state_FSM_FFd2_In : STD_LOGIC; 
  signal state_FSM_FFd1_In : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_lut_0_Q : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_0_Q_178 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_Q_179 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_Q_180 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_Q_181 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_Q_182 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_Q_183 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_Q_184 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_Q_185 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_Q_186 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_Q_187 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_Q_188 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_Q_189 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_Q_190 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_Q_191 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_Q_192 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_Q_193 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_Q_194 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_Q_195 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_1_o1 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_1_o11_243 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_5_o2 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_5_o21_245 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_5_o22_246 : STD_LOGIC; 
  signal cont_mux_18_PWR_3_o_LessThan_5_o23_247 : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o3 : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o31_249 : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o32_250 : STD_LOGIC; 
  signal cont_26_GND_3_o_LessThan_18_o33_251 : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_3_o2 : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_3_o21_253 : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_4_o2 : STD_LOGIC; 
  signal cont_mux_18_GND_3_o_LessThan_4_o21_255 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_rt_269 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_rt_270 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_rt_271 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_rt_272 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_rt_273 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_rt_274 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_rt_275 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_rt_276 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_rt_277 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_rt_278 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_rt_279 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_rt_280 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_rt_281 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_rt_282 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_rt_283 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_rt_284 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_rt_285 : STD_LOGIC; 
  signal Mcount_cont_cy_1_rt_286 : STD_LOGIC; 
  signal Mcount_cont_cy_2_rt_287 : STD_LOGIC; 
  signal Mcount_cont_cy_3_rt_288 : STD_LOGIC; 
  signal Mcount_cont_cy_4_rt_289 : STD_LOGIC; 
  signal Mcount_cont_cy_5_rt_290 : STD_LOGIC; 
  signal Mcount_cont_cy_6_rt_291 : STD_LOGIC; 
  signal Mcount_cont_cy_7_rt_292 : STD_LOGIC; 
  signal Mcount_cont_cy_8_rt_293 : STD_LOGIC; 
  signal Mcount_cont_cy_9_rt_294 : STD_LOGIC; 
  signal Mcount_cont_cy_10_rt_295 : STD_LOGIC; 
  signal Mcount_cont_cy_11_rt_296 : STD_LOGIC; 
  signal Mcount_cont_cy_12_rt_297 : STD_LOGIC; 
  signal Mcount_cont_cy_13_rt_298 : STD_LOGIC; 
  signal Mcount_cont_cy_14_rt_299 : STD_LOGIC; 
  signal Mcount_cont_cy_15_rt_300 : STD_LOGIC; 
  signal Mcount_cont_cy_16_rt_301 : STD_LOGIC; 
  signal Mcount_cont_cy_17_rt_302 : STD_LOGIC; 
  signal Mcount_cont_cy_18_rt_303 : STD_LOGIC; 
  signal Mcount_cont_cy_19_rt_304 : STD_LOGIC; 
  signal Mcount_cont_cy_20_rt_305 : STD_LOGIC; 
  signal Mcount_cont_cy_21_rt_306 : STD_LOGIC; 
  signal Mcount_cont_cy_22_rt_307 : STD_LOGIC; 
  signal Mcount_cont_cy_23_rt_308 : STD_LOGIC; 
  signal Mcount_cont_cy_24_rt_309 : STD_LOGIC; 
  signal Mcount_cont_cy_25_rt_310 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_1_rt_311 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_2_rt_312 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_3_rt_313 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_4_rt_314 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_5_rt_315 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_6_rt_316 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_7_rt_317 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_8_rt_318 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_9_rt_319 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_10_rt_320 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_11_rt_321 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_12_rt_322 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_13_rt_323 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_14_rt_324 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_15_rt_325 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_16_rt_326 : STD_LOGIC; 
  signal Mcount_cont_mux_cy_17_rt_327 : STD_LOGIC; 
  signal Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_18_rt_328 : STD_LOGIC; 
  signal Mcount_cont_xor_26_rt_329 : STD_LOGIC; 
  signal Mcount_cont_mux_xor_18_rt_330 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N127 : STD_LOGIC; 
  signal N131 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N135 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal controle_2_rstpot_341 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N149 : STD_LOGIC; 
  signal controle_3_rstpot_344 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal cont_0_rstpot_347 : STD_LOGIC; 
  signal cont_1_rstpot_348 : STD_LOGIC; 
  signal cont_2_rstpot_349 : STD_LOGIC; 
  signal cont_3_rstpot_350 : STD_LOGIC; 
  signal cont_4_rstpot_351 : STD_LOGIC; 
  signal cont_5_rstpot_352 : STD_LOGIC; 
  signal cont_6_rstpot_353 : STD_LOGIC; 
  signal cont_7_rstpot_354 : STD_LOGIC; 
  signal cont_8_rstpot_355 : STD_LOGIC; 
  signal cont_9_rstpot_356 : STD_LOGIC; 
  signal cont_10_rstpot_357 : STD_LOGIC; 
  signal cont_11_rstpot_358 : STD_LOGIC; 
  signal cont_12_rstpot_359 : STD_LOGIC; 
  signal cont_13_rstpot_360 : STD_LOGIC; 
  signal cont_14_rstpot_361 : STD_LOGIC; 
  signal cont_15_rstpot_362 : STD_LOGIC; 
  signal cont_16_rstpot_363 : STD_LOGIC; 
  signal cont_17_rstpot_364 : STD_LOGIC; 
  signal cont_18_rstpot_365 : STD_LOGIC; 
  signal cont_19_rstpot_366 : STD_LOGIC; 
  signal cont_20_rstpot_367 : STD_LOGIC; 
  signal cont_21_rstpot_368 : STD_LOGIC; 
  signal cont_22_rstpot_369 : STD_LOGIC; 
  signal cont_23_rstpot_370 : STD_LOGIC; 
  signal cont_24_rstpot_371 : STD_LOGIC; 
  signal cont_25_rstpot_372 : STD_LOGIC; 
  signal cont_26_rstpot_373 : STD_LOGIC; 
  signal controle_0_rstpot_374 : STD_LOGIC; 
  signal cont : STD_LOGIC_VECTOR ( 26 downto 0 ); 
  signal cont_mux : STD_LOGIC_VECTOR ( 18 downto 0 ); 
  signal m : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal PWR_3_o_PWR_3_o_mux_6_OUT : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal Result : STD_LOGIC_VECTOR ( 26 downto 0 ); 
  signal Mcount_cont_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Mcount_cont_cy : STD_LOGIC_VECTOR ( 25 downto 0 ); 
  signal Mcount_cont_mux_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Mcount_cont_mux_cy : STD_LOGIC_VECTOR ( 17 downto 0 ); 
begin
  XST_VCC : VCC
    port map (
      P => c_0_Q
    );
  XST_GND : GND
    port map (
      G => N1
    );
  m_0 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_0_Q,
      Q => m(0)
    );
  m_1 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_1_Q,
      Q => m(1)
    );
  m_2 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_2_Q,
      Q => m(2)
    );
  m_3 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_3_Q,
      Q => m(3)
    );
  m_4 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_4_Q,
      Q => m(4)
    );
  m_5 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_5_Q,
      Q => m(5)
    );
  m_6 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_88_OUT_6_Q,
      Q => m(6)
    );
  controle_1 : FDSE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => PWR_3_o_PWR_3_o_mux_6_OUT(1),
      S => Q_n0160,
      Q => controle_1_78
    );
  c_1 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_89_OUT_1_Q,
      Q => c_1_Q
    );
  c_3 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_89_OUT_3_Q,
      Q => c_3_Q
    );
  c_6 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_89_OUT_6_Q,
      Q => c_6_Q
    );
  d_0 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_90_OUT_0_Q,
      Q => d_0_Q
    );
  d_1 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_90_OUT_1_Q,
      Q => d_1_Q
    );
  d_3 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_90_OUT_3_Q,
      Q => d_3_Q
    );
  u_2 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_91_OUT_2_Q,
      Q => u_2_Q
    );
  u_3 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_91_OUT_3_Q,
      Q => u_3_Q
    );
  u_6 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_26_GND_3_o_LessThan_18_o_inv,
      D => state_3_X_3_o_wide_mux_91_OUT_6_Q,
      Q => u_6_Q
    );
  display_0 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_0_Q,
      Q => display_0_58
    );
  display_1 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_1_Q,
      Q => display_1_57
    );
  display_2 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_2_Q,
      Q => display_2_56
    );
  display_3 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_3_Q,
      Q => display_3_55
    );
  display_4 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_4_Q,
      Q => display_4_54
    );
  display_5 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_5_Q,
      Q => display_5_53
    );
  display_6 : FDE
    port map (
      C => clk_BUFGP_1,
      CE => cont_mux_18_PWR_3_o_LessThan_1_o,
      D => u_6_m_6_mux_10_OUT_6_Q,
      Q => display_6_52
    );
  state_FSM_FFd4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => state_FSM_FFd4_In,
      Q => state_FSM_FFd4_5
    );
  state_FSM_FFd3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => state_FSM_FFd3_In,
      Q => state_FSM_FFd3_4
    );
  state_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => state_FSM_FFd2_In,
      Q => state_FSM_FFd2_3
    );
  state_FSM_FFd1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => state_FSM_FFd1_In,
      Q => state_FSM_FFd1_2
    );
  cont_mux_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_0_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(0)
    );
  cont_mux_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_1_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(1)
    );
  cont_mux_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_2_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(2)
    );
  cont_mux_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_3_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(3)
    );
  cont_mux_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_4_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(4)
    );
  cont_mux_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_5_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(5)
    );
  cont_mux_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_6_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(6)
    );
  cont_mux_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_7_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(7)
    );
  cont_mux_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_8_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(8)
    );
  cont_mux_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_9_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(9)
    );
  cont_mux_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_10_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(10)
    );
  cont_mux_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_11_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(11)
    );
  cont_mux_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_12_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(12)
    );
  cont_mux_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_13_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(13)
    );
  cont_mux_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_14_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(14)
    );
  cont_mux_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_15_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(15)
    );
  cont_mux_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_16_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(16)
    );
  cont_mux_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_17_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(17)
    );
  cont_mux_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => Result_18_1,
      R => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      Q => cont_mux(18)
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => c_0_Q,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_lut_0_Q,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_0_Q_178
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_0_Q_178,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_rt_269,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_Q_179
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_Q_179,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_rt_270,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_Q_180
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_Q_180,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_rt_271,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_Q_181
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_Q_181,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_rt_272,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_Q_182
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_Q_182,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_rt_273,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_Q_183
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_5_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_Q_182,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_rt_273,
      O => cont_mux_18_GND_3_o_add_1_OUT_5_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_Q_183,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_rt_274,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_Q_184
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_6_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_Q_183,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_rt_274,
      O => cont_mux_18_GND_3_o_add_1_OUT_6_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_Q_184,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_rt_275,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_Q_185
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_7_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_Q_184,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_rt_275,
      O => cont_mux_18_GND_3_o_add_1_OUT_7_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_Q_185,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_rt_276,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_Q_186
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_8_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_Q_185,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_rt_276,
      O => cont_mux_18_GND_3_o_add_1_OUT_8_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_Q_186,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_rt_277,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_Q_187
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_9_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_Q_186,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_rt_277,
      O => cont_mux_18_GND_3_o_add_1_OUT_9_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_Q_187,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_rt_278,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_Q_188
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_10_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_Q_187,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_rt_278,
      O => cont_mux_18_GND_3_o_add_1_OUT_10_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_Q_188,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_rt_279,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_Q_189
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_11_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_Q_188,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_rt_279,
      O => cont_mux_18_GND_3_o_add_1_OUT_11_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_Q_189,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_rt_280,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_Q_190
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_12_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_Q_189,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_rt_280,
      O => cont_mux_18_GND_3_o_add_1_OUT_12_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_Q_190,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_rt_281,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_Q_191
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_13_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_Q_190,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_rt_281,
      O => cont_mux_18_GND_3_o_add_1_OUT_13_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_Q_191,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_rt_282,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_Q_192
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_14_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_Q_191,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_rt_282,
      O => cont_mux_18_GND_3_o_add_1_OUT_14_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_Q_192,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_rt_283,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_Q_193
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_15_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_Q_192,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_rt_283,
      O => cont_mux_18_GND_3_o_add_1_OUT_15_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_Q_193,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_rt_284,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_Q_194
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_16_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_Q_193,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_rt_284,
      O => cont_mux_18_GND_3_o_add_1_OUT_16_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_Q : MUXCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_Q_194,
      DI => N1,
      S => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_rt_285,
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_Q_195
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_17_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_Q_194,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_rt_285,
      O => cont_mux_18_GND_3_o_add_1_OUT_17_Q
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_18_Q : XORCY
    port map (
      CI => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_Q_195,
      LI => Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_18_rt_328,
      O => cont_mux_18_GND_3_o_add_1_OUT_18_Q
    );
  Mcount_cont_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => c_0_Q,
      S => Mcount_cont_lut(0),
      O => Mcount_cont_cy(0)
    );
  Mcount_cont_xor_0_Q : XORCY
    port map (
      CI => N1,
      LI => Mcount_cont_lut(0),
      O => Result(0)
    );
  Mcount_cont_cy_1_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(0),
      DI => N1,
      S => Mcount_cont_cy_1_rt_286,
      O => Mcount_cont_cy(1)
    );
  Mcount_cont_xor_1_Q : XORCY
    port map (
      CI => Mcount_cont_cy(0),
      LI => Mcount_cont_cy_1_rt_286,
      O => Result(1)
    );
  Mcount_cont_cy_2_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(1),
      DI => N1,
      S => Mcount_cont_cy_2_rt_287,
      O => Mcount_cont_cy(2)
    );
  Mcount_cont_xor_2_Q : XORCY
    port map (
      CI => Mcount_cont_cy(1),
      LI => Mcount_cont_cy_2_rt_287,
      O => Result(2)
    );
  Mcount_cont_cy_3_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(2),
      DI => N1,
      S => Mcount_cont_cy_3_rt_288,
      O => Mcount_cont_cy(3)
    );
  Mcount_cont_xor_3_Q : XORCY
    port map (
      CI => Mcount_cont_cy(2),
      LI => Mcount_cont_cy_3_rt_288,
      O => Result(3)
    );
  Mcount_cont_cy_4_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(3),
      DI => N1,
      S => Mcount_cont_cy_4_rt_289,
      O => Mcount_cont_cy(4)
    );
  Mcount_cont_xor_4_Q : XORCY
    port map (
      CI => Mcount_cont_cy(3),
      LI => Mcount_cont_cy_4_rt_289,
      O => Result(4)
    );
  Mcount_cont_cy_5_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(4),
      DI => N1,
      S => Mcount_cont_cy_5_rt_290,
      O => Mcount_cont_cy(5)
    );
  Mcount_cont_xor_5_Q : XORCY
    port map (
      CI => Mcount_cont_cy(4),
      LI => Mcount_cont_cy_5_rt_290,
      O => Result(5)
    );
  Mcount_cont_cy_6_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(5),
      DI => N1,
      S => Mcount_cont_cy_6_rt_291,
      O => Mcount_cont_cy(6)
    );
  Mcount_cont_xor_6_Q : XORCY
    port map (
      CI => Mcount_cont_cy(5),
      LI => Mcount_cont_cy_6_rt_291,
      O => Result(6)
    );
  Mcount_cont_cy_7_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(6),
      DI => N1,
      S => Mcount_cont_cy_7_rt_292,
      O => Mcount_cont_cy(7)
    );
  Mcount_cont_xor_7_Q : XORCY
    port map (
      CI => Mcount_cont_cy(6),
      LI => Mcount_cont_cy_7_rt_292,
      O => Result(7)
    );
  Mcount_cont_cy_8_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(7),
      DI => N1,
      S => Mcount_cont_cy_8_rt_293,
      O => Mcount_cont_cy(8)
    );
  Mcount_cont_xor_8_Q : XORCY
    port map (
      CI => Mcount_cont_cy(7),
      LI => Mcount_cont_cy_8_rt_293,
      O => Result(8)
    );
  Mcount_cont_cy_9_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(8),
      DI => N1,
      S => Mcount_cont_cy_9_rt_294,
      O => Mcount_cont_cy(9)
    );
  Mcount_cont_xor_9_Q : XORCY
    port map (
      CI => Mcount_cont_cy(8),
      LI => Mcount_cont_cy_9_rt_294,
      O => Result(9)
    );
  Mcount_cont_cy_10_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(9),
      DI => N1,
      S => Mcount_cont_cy_10_rt_295,
      O => Mcount_cont_cy(10)
    );
  Mcount_cont_xor_10_Q : XORCY
    port map (
      CI => Mcount_cont_cy(9),
      LI => Mcount_cont_cy_10_rt_295,
      O => Result(10)
    );
  Mcount_cont_cy_11_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(10),
      DI => N1,
      S => Mcount_cont_cy_11_rt_296,
      O => Mcount_cont_cy(11)
    );
  Mcount_cont_xor_11_Q : XORCY
    port map (
      CI => Mcount_cont_cy(10),
      LI => Mcount_cont_cy_11_rt_296,
      O => Result(11)
    );
  Mcount_cont_cy_12_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(11),
      DI => N1,
      S => Mcount_cont_cy_12_rt_297,
      O => Mcount_cont_cy(12)
    );
  Mcount_cont_xor_12_Q : XORCY
    port map (
      CI => Mcount_cont_cy(11),
      LI => Mcount_cont_cy_12_rt_297,
      O => Result(12)
    );
  Mcount_cont_cy_13_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(12),
      DI => N1,
      S => Mcount_cont_cy_13_rt_298,
      O => Mcount_cont_cy(13)
    );
  Mcount_cont_xor_13_Q : XORCY
    port map (
      CI => Mcount_cont_cy(12),
      LI => Mcount_cont_cy_13_rt_298,
      O => Result(13)
    );
  Mcount_cont_cy_14_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(13),
      DI => N1,
      S => Mcount_cont_cy_14_rt_299,
      O => Mcount_cont_cy(14)
    );
  Mcount_cont_xor_14_Q : XORCY
    port map (
      CI => Mcount_cont_cy(13),
      LI => Mcount_cont_cy_14_rt_299,
      O => Result(14)
    );
  Mcount_cont_cy_15_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(14),
      DI => N1,
      S => Mcount_cont_cy_15_rt_300,
      O => Mcount_cont_cy(15)
    );
  Mcount_cont_xor_15_Q : XORCY
    port map (
      CI => Mcount_cont_cy(14),
      LI => Mcount_cont_cy_15_rt_300,
      O => Result(15)
    );
  Mcount_cont_cy_16_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(15),
      DI => N1,
      S => Mcount_cont_cy_16_rt_301,
      O => Mcount_cont_cy(16)
    );
  Mcount_cont_xor_16_Q : XORCY
    port map (
      CI => Mcount_cont_cy(15),
      LI => Mcount_cont_cy_16_rt_301,
      O => Result(16)
    );
  Mcount_cont_cy_17_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(16),
      DI => N1,
      S => Mcount_cont_cy_17_rt_302,
      O => Mcount_cont_cy(17)
    );
  Mcount_cont_xor_17_Q : XORCY
    port map (
      CI => Mcount_cont_cy(16),
      LI => Mcount_cont_cy_17_rt_302,
      O => Result(17)
    );
  Mcount_cont_cy_18_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(17),
      DI => N1,
      S => Mcount_cont_cy_18_rt_303,
      O => Mcount_cont_cy(18)
    );
  Mcount_cont_xor_18_Q : XORCY
    port map (
      CI => Mcount_cont_cy(17),
      LI => Mcount_cont_cy_18_rt_303,
      O => Result(18)
    );
  Mcount_cont_cy_19_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(18),
      DI => N1,
      S => Mcount_cont_cy_19_rt_304,
      O => Mcount_cont_cy(19)
    );
  Mcount_cont_xor_19_Q : XORCY
    port map (
      CI => Mcount_cont_cy(18),
      LI => Mcount_cont_cy_19_rt_304,
      O => Result(19)
    );
  Mcount_cont_cy_20_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(19),
      DI => N1,
      S => Mcount_cont_cy_20_rt_305,
      O => Mcount_cont_cy(20)
    );
  Mcount_cont_xor_20_Q : XORCY
    port map (
      CI => Mcount_cont_cy(19),
      LI => Mcount_cont_cy_20_rt_305,
      O => Result(20)
    );
  Mcount_cont_cy_21_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(20),
      DI => N1,
      S => Mcount_cont_cy_21_rt_306,
      O => Mcount_cont_cy(21)
    );
  Mcount_cont_xor_21_Q : XORCY
    port map (
      CI => Mcount_cont_cy(20),
      LI => Mcount_cont_cy_21_rt_306,
      O => Result(21)
    );
  Mcount_cont_cy_22_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(21),
      DI => N1,
      S => Mcount_cont_cy_22_rt_307,
      O => Mcount_cont_cy(22)
    );
  Mcount_cont_xor_22_Q : XORCY
    port map (
      CI => Mcount_cont_cy(21),
      LI => Mcount_cont_cy_22_rt_307,
      O => Result(22)
    );
  Mcount_cont_cy_23_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(22),
      DI => N1,
      S => Mcount_cont_cy_23_rt_308,
      O => Mcount_cont_cy(23)
    );
  Mcount_cont_xor_23_Q : XORCY
    port map (
      CI => Mcount_cont_cy(22),
      LI => Mcount_cont_cy_23_rt_308,
      O => Result(23)
    );
  Mcount_cont_cy_24_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(23),
      DI => N1,
      S => Mcount_cont_cy_24_rt_309,
      O => Mcount_cont_cy(24)
    );
  Mcount_cont_xor_24_Q : XORCY
    port map (
      CI => Mcount_cont_cy(23),
      LI => Mcount_cont_cy_24_rt_309,
      O => Result(24)
    );
  Mcount_cont_cy_25_Q : MUXCY
    port map (
      CI => Mcount_cont_cy(24),
      DI => N1,
      S => Mcount_cont_cy_25_rt_310,
      O => Mcount_cont_cy(25)
    );
  Mcount_cont_xor_25_Q : XORCY
    port map (
      CI => Mcount_cont_cy(24),
      LI => Mcount_cont_cy_25_rt_310,
      O => Result(25)
    );
  Mcount_cont_xor_26_Q : XORCY
    port map (
      CI => Mcount_cont_cy(25),
      LI => Mcount_cont_xor_26_rt_329,
      O => Result(26)
    );
  Mcount_cont_mux_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => c_0_Q,
      S => Mcount_cont_mux_lut(0),
      O => Mcount_cont_mux_cy(0)
    );
  Mcount_cont_mux_xor_0_Q : XORCY
    port map (
      CI => N1,
      LI => Mcount_cont_mux_lut(0),
      O => Result_0_1
    );
  Mcount_cont_mux_cy_1_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(0),
      DI => N1,
      S => Mcount_cont_mux_cy_1_rt_311,
      O => Mcount_cont_mux_cy(1)
    );
  Mcount_cont_mux_xor_1_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(0),
      LI => Mcount_cont_mux_cy_1_rt_311,
      O => Result_1_1
    );
  Mcount_cont_mux_cy_2_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(1),
      DI => N1,
      S => Mcount_cont_mux_cy_2_rt_312,
      O => Mcount_cont_mux_cy(2)
    );
  Mcount_cont_mux_xor_2_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(1),
      LI => Mcount_cont_mux_cy_2_rt_312,
      O => Result_2_1
    );
  Mcount_cont_mux_cy_3_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(2),
      DI => N1,
      S => Mcount_cont_mux_cy_3_rt_313,
      O => Mcount_cont_mux_cy(3)
    );
  Mcount_cont_mux_xor_3_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(2),
      LI => Mcount_cont_mux_cy_3_rt_313,
      O => Result_3_1
    );
  Mcount_cont_mux_cy_4_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(3),
      DI => N1,
      S => Mcount_cont_mux_cy_4_rt_314,
      O => Mcount_cont_mux_cy(4)
    );
  Mcount_cont_mux_xor_4_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(3),
      LI => Mcount_cont_mux_cy_4_rt_314,
      O => Result_4_1
    );
  Mcount_cont_mux_cy_5_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(4),
      DI => N1,
      S => Mcount_cont_mux_cy_5_rt_315,
      O => Mcount_cont_mux_cy(5)
    );
  Mcount_cont_mux_xor_5_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(4),
      LI => Mcount_cont_mux_cy_5_rt_315,
      O => Result_5_1
    );
  Mcount_cont_mux_cy_6_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(5),
      DI => N1,
      S => Mcount_cont_mux_cy_6_rt_316,
      O => Mcount_cont_mux_cy(6)
    );
  Mcount_cont_mux_xor_6_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(5),
      LI => Mcount_cont_mux_cy_6_rt_316,
      O => Result_6_1
    );
  Mcount_cont_mux_cy_7_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(6),
      DI => N1,
      S => Mcount_cont_mux_cy_7_rt_317,
      O => Mcount_cont_mux_cy(7)
    );
  Mcount_cont_mux_xor_7_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(6),
      LI => Mcount_cont_mux_cy_7_rt_317,
      O => Result_7_1
    );
  Mcount_cont_mux_cy_8_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(7),
      DI => N1,
      S => Mcount_cont_mux_cy_8_rt_318,
      O => Mcount_cont_mux_cy(8)
    );
  Mcount_cont_mux_xor_8_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(7),
      LI => Mcount_cont_mux_cy_8_rt_318,
      O => Result_8_1
    );
  Mcount_cont_mux_cy_9_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(8),
      DI => N1,
      S => Mcount_cont_mux_cy_9_rt_319,
      O => Mcount_cont_mux_cy(9)
    );
  Mcount_cont_mux_xor_9_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(8),
      LI => Mcount_cont_mux_cy_9_rt_319,
      O => Result_9_1
    );
  Mcount_cont_mux_cy_10_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(9),
      DI => N1,
      S => Mcount_cont_mux_cy_10_rt_320,
      O => Mcount_cont_mux_cy(10)
    );
  Mcount_cont_mux_xor_10_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(9),
      LI => Mcount_cont_mux_cy_10_rt_320,
      O => Result_10_1
    );
  Mcount_cont_mux_cy_11_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(10),
      DI => N1,
      S => Mcount_cont_mux_cy_11_rt_321,
      O => Mcount_cont_mux_cy(11)
    );
  Mcount_cont_mux_xor_11_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(10),
      LI => Mcount_cont_mux_cy_11_rt_321,
      O => Result_11_1
    );
  Mcount_cont_mux_cy_12_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(11),
      DI => N1,
      S => Mcount_cont_mux_cy_12_rt_322,
      O => Mcount_cont_mux_cy(12)
    );
  Mcount_cont_mux_xor_12_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(11),
      LI => Mcount_cont_mux_cy_12_rt_322,
      O => Result_12_1
    );
  Mcount_cont_mux_cy_13_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(12),
      DI => N1,
      S => Mcount_cont_mux_cy_13_rt_323,
      O => Mcount_cont_mux_cy(13)
    );
  Mcount_cont_mux_xor_13_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(12),
      LI => Mcount_cont_mux_cy_13_rt_323,
      O => Result_13_1
    );
  Mcount_cont_mux_cy_14_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(13),
      DI => N1,
      S => Mcount_cont_mux_cy_14_rt_324,
      O => Mcount_cont_mux_cy(14)
    );
  Mcount_cont_mux_xor_14_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(13),
      LI => Mcount_cont_mux_cy_14_rt_324,
      O => Result_14_1
    );
  Mcount_cont_mux_cy_15_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(14),
      DI => N1,
      S => Mcount_cont_mux_cy_15_rt_325,
      O => Mcount_cont_mux_cy(15)
    );
  Mcount_cont_mux_xor_15_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(14),
      LI => Mcount_cont_mux_cy_15_rt_325,
      O => Result_15_1
    );
  Mcount_cont_mux_cy_16_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(15),
      DI => N1,
      S => Mcount_cont_mux_cy_16_rt_326,
      O => Mcount_cont_mux_cy(16)
    );
  Mcount_cont_mux_xor_16_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(15),
      LI => Mcount_cont_mux_cy_16_rt_326,
      O => Result_16_1
    );
  Mcount_cont_mux_cy_17_Q : MUXCY
    port map (
      CI => Mcount_cont_mux_cy(16),
      DI => N1,
      S => Mcount_cont_mux_cy_17_rt_327,
      O => Mcount_cont_mux_cy(17)
    );
  Mcount_cont_mux_xor_17_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(16),
      LI => Mcount_cont_mux_cy_17_rt_327,
      O => Result_17_1
    );
  Mcount_cont_mux_xor_18_Q : XORCY
    port map (
      CI => Mcount_cont_mux_cy(17),
      LI => Mcount_cont_mux_xor_18_rt_330,
      O => Result_18_1
    );
  state_FSM_FFd4_In1 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => state_FSM_FFd4_5,
      I1 => cont_26_GND_3_o_LessThan_18_o,
      O => state_FSM_FFd4_In
    );
  m_6_PWR_3_o_mux_20_OUT_6_1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => m(6),
      I1 => btn_IBUF_0,
      O => state_3_X_3_o_wide_mux_88_OUT_6_Q
    );
  m_6_PWR_3_o_mux_20_OUT_2_1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => m(2),
      I1 => btn_IBUF_0,
      O => state_3_X_3_o_wide_mux_88_OUT_2_Q
    );
  Mmux_u_6_m_6_mux_10_OUT61 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => m(5),
      I1 => cont_mux_18_GND_3_o_LessThan_3_o,
      O => u_6_m_6_mux_10_OUT_5_Q
    );
  Mmux_u_6_m_6_mux_10_OUT51 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => m(4),
      I1 => cont_mux_18_GND_3_o_LessThan_3_o,
      O => u_6_m_6_mux_10_OUT_4_Q
    );
  Mmux_state_3_X_3_o_wide_mux_90_OUT101 : LUT6
    generic map(
      INIT => X"EEFBEFFB44514551"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd3_4,
      I3 => state_FSM_FFd2_3,
      I4 => state_FSM_FFd4_5,
      I5 => d_3_Q,
      O => state_3_X_3_o_wide_mux_90_OUT_3_Q
    );
  Mmux_u_6_m_6_mux_10_OUT71 : LUT6
    generic map(
      INIT => X"AAAACCFFAAAACCF0"
    )
    port map (
      I0 => m(6),
      I1 => c_6_Q,
      I2 => u_6_Q,
      I3 => cont_mux_18_GND_3_o_LessThan_4_o,
      I4 => cont_mux_18_GND_3_o_LessThan_3_o,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o,
      O => u_6_m_6_mux_10_OUT_6_Q
    );
  Mmux_u_6_m_6_mux_10_OUT21 : LUT6
    generic map(
      INIT => X"AAAACCF0AAAACCFF"
    )
    port map (
      I0 => m(1),
      I1 => c_1_Q,
      I2 => d_1_Q,
      I3 => cont_mux_18_GND_3_o_LessThan_4_o,
      I4 => cont_mux_18_GND_3_o_LessThan_3_o,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o,
      O => u_6_m_6_mux_10_OUT_1_Q
    );
  Mmux_state_3_X_3_o_wide_mux_89_OUT101 : LUT6
    generic map(
      INIT => X"EFFBEBFB45514151"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd4_5,
      I5 => c_3_Q,
      O => state_3_X_3_o_wide_mux_89_OUT_3_Q
    );
  state_FSM_FFd3_In1 : LUT6
    generic map(
      INIT => X"CCCCCCCC8999CCCC"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd3_4,
      I2 => state_FSM_FFd1_2,
      I3 => state_FSM_FFd2_3,
      I4 => state_FSM_FFd4_5,
      I5 => cont_26_GND_3_o_LessThan_18_o,
      O => state_FSM_FFd3_In
    );
  Mmux_state_3_X_3_o_wide_mux_91_OUT101 : LUT6
    generic map(
      INIT => X"EEEEFFFB44445551"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd4_5,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd2_3,
      I5 => u_3_Q,
      O => state_3_X_3_o_wide_mux_91_OUT_3_Q
    );
  state_FSM_FFd2_In1 : LUT6
    generic map(
      INIT => X"F0F0F0F0C696D2D2"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd3_4,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd1_2,
      I4 => state_FSM_FFd4_5,
      I5 => cont_26_GND_3_o_LessThan_18_o,
      O => state_FSM_FFd2_In
    );
  state_FSM_FFd1_In1 : LUT6
    generic map(
      INIT => X"FF00FF00456A552A"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd3_4,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd1_2,
      I4 => state_FSM_FFd4_5,
      I5 => cont_26_GND_3_o_LessThan_18_o,
      O => state_FSM_FFd1_In
    );
  Mmux_state_3_X_3_o_wide_mux_89_OUT131 : LUT6
    generic map(
      INIT => X"BFBEBEBE15141414"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd2_3,
      I2 => state_FSM_FFd1_2,
      I3 => state_FSM_FFd4_5,
      I4 => state_FSM_FFd3_4,
      I5 => c_6_Q,
      O => state_3_X_3_o_wide_mux_89_OUT_6_Q
    );
  Mmux_state_3_X_3_o_wide_mux_89_OUT81 : LUT5
    generic map(
      INIT => X"BFEE1544"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd4_5,
      I3 => state_FSM_FFd2_3,
      I4 => c_1_Q,
      O => state_3_X_3_o_wide_mux_89_OUT_1_Q
    );
  Mmux_state_3_X_3_o_wide_mux_90_OUT81 : LUT6
    generic map(
      INIT => X"FEEEFEEF54445445"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd3_4,
      I3 => state_FSM_FFd2_3,
      I4 => state_FSM_FFd4_5,
      I5 => d_1_Q,
      O => state_3_X_3_o_wide_mux_90_OUT_1_Q
    );
  Mmux_state_3_X_3_o_wide_mux_90_OUT71 : LUT6
    generic map(
      INIT => X"FFFFEEEA55554440"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd2_3,
      I2 => state_FSM_FFd4_5,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd1_2,
      I5 => d_0_Q,
      O => state_3_X_3_o_wide_mux_90_OUT_0_Q
    );
  Mmux_state_3_X_3_o_wide_mux_91_OUT91 : LUT6
    generic map(
      INIT => X"FFFFABBB55550111"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd2_3,
      I2 => state_FSM_FFd4_5,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd1_2,
      I5 => u_2_Q,
      O => state_3_X_3_o_wide_mux_91_OUT_2_Q
    );
  Mmux_state_3_X_3_o_wide_mux_91_OUT131 : LUT6
    generic map(
      INIT => X"FEEFEEEF54454445"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd3_4,
      I3 => state_FSM_FFd2_3,
      I4 => state_FSM_FFd4_5,
      I5 => u_6_Q,
      O => state_3_X_3_o_wide_mux_91_OUT_6_Q
    );
  cont_mux_18_PWR_3_o_LessThan_1_o11 : LUT6
    generic map(
      INIT => X"1115FFFFFFFFFFFF"
    )
    port map (
      I0 => cont_mux(10),
      I1 => cont_mux(9),
      I2 => cont_mux(7),
      I3 => cont_mux(8),
      I4 => cont_mux(12),
      I5 => cont_mux(11),
      O => cont_mux_18_PWR_3_o_LessThan_1_o1
    );
  cont_mux_18_PWR_3_o_LessThan_1_o12 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => cont_mux(15),
      I1 => cont_mux(16),
      I2 => cont_mux(14),
      I3 => cont_mux(13),
      O => cont_mux_18_PWR_3_o_LessThan_1_o11_243
    );
  cont_mux_18_PWR_3_o_LessThan_1_o13 : LUT4
    generic map(
      INIT => X"D5FF"
    )
    port map (
      I0 => cont_mux(17),
      I1 => cont_mux_18_PWR_3_o_LessThan_1_o11_243,
      I2 => cont_mux_18_PWR_3_o_LessThan_1_o1,
      I3 => cont_mux(18),
      O => cont_mux_18_PWR_3_o_LessThan_1_o
    );
  cont_mux_18_PWR_3_o_LessThan_5_o21 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      O => cont_mux_18_PWR_3_o_LessThan_5_o2
    );
  cont_mux_18_PWR_3_o_LessThan_5_o22 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_14_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_13_Q,
      O => cont_mux_18_PWR_3_o_LessThan_5_o21_245
    );
  cont_mux_18_PWR_3_o_LessThan_5_o23 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_5_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_6_Q,
      O => cont_mux_18_PWR_3_o_LessThan_5_o22_246
    );
  cont_mux_18_PWR_3_o_LessThan_5_o24 : LUT6
    generic map(
      INIT => X"1111111101111111"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_10_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_11_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_9_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_7_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_8_Q,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o22_246,
      O => cont_mux_18_PWR_3_o_LessThan_5_o23_247
    );
  cont_mux_18_PWR_3_o_LessThan_5_o25 : LUT6
    generic map(
      INIT => X"FF3F0F0F7F3F0F0F"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I3 => cont_mux_18_PWR_3_o_LessThan_5_o21_245,
      I4 => cont_mux_18_PWR_3_o_LessThan_5_o2,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o23_247,
      O => cont_mux_18_PWR_3_o_LessThan_5_o
    );
  cont_26_GND_3_o_LessThan_18_o31 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => cont(18),
      I1 => cont(19),
      I2 => cont(17),
      O => cont_26_GND_3_o_LessThan_18_o3
    );
  cont_26_GND_3_o_LessThan_18_o32 : LUT6
    generic map(
      INIT => X"15151555FFFFFFFF"
    )
    port map (
      I0 => cont(12),
      I1 => cont(10),
      I2 => cont(11),
      I3 => cont(9),
      I4 => cont(8),
      I5 => cont(13),
      O => cont_26_GND_3_o_LessThan_18_o31_249
    );
  cont_26_GND_3_o_LessThan_18_o33 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cont(14),
      I1 => cont(15),
      O => cont_26_GND_3_o_LessThan_18_o32_250
    );
  cont_26_GND_3_o_LessThan_18_o34 : LUT6
    generic map(
      INIT => X"FF7F77777F7F7777"
    )
    port map (
      I0 => cont(21),
      I1 => cont(20),
      I2 => cont(16),
      I3 => cont_26_GND_3_o_LessThan_18_o32_250,
      I4 => cont_26_GND_3_o_LessThan_18_o3,
      I5 => cont_26_GND_3_o_LessThan_18_o31_249,
      O => cont_26_GND_3_o_LessThan_18_o33_251
    );
  cont_26_GND_3_o_LessThan_18_o35 : LUT6
    generic map(
      INIT => X"0000001F0000000F"
    )
    port map (
      I0 => cont(22),
      I1 => cont(23),
      I2 => cont(24),
      I3 => cont(26),
      I4 => cont(25),
      I5 => cont_26_GND_3_o_LessThan_18_o33_251,
      O => cont_26_GND_3_o_LessThan_18_o
    );
  cont_mux_18_GND_3_o_LessThan_3_o21 : LUT6
    generic map(
      INIT => X"001FFFFFFFFFFFFF"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_5_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_6_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_7_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_8_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_9_Q,
      I5 => cont_mux_18_GND_3_o_add_1_OUT_10_Q,
      O => cont_mux_18_GND_3_o_LessThan_3_o2
    );
  cont_mux_18_GND_3_o_LessThan_3_o22 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_11_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_13_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_14_Q,
      O => cont_mux_18_GND_3_o_LessThan_3_o21_253
    );
  cont_mux_18_GND_3_o_LessThan_3_o23 : LUT6
    generic map(
      INIT => X"0033001300130013"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I4 => cont_mux_18_GND_3_o_LessThan_3_o2,
      I5 => cont_mux_18_GND_3_o_LessThan_3_o21_253,
      O => cont_mux_18_GND_3_o_LessThan_3_o
    );
  cont_mux_18_GND_3_o_LessThan_4_o21 : LUT6
    generic map(
      INIT => X"001FFFFFFFFFFFFF"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_6_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_7_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_8_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_9_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_10_Q,
      I5 => cont_mux_18_GND_3_o_add_1_OUT_11_Q,
      O => cont_mux_18_GND_3_o_LessThan_4_o2
    );
  cont_mux_18_GND_3_o_LessThan_4_o22 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_13_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_14_Q,
      O => cont_mux_18_GND_3_o_LessThan_4_o21_255
    );
  cont_mux_18_GND_3_o_LessThan_4_o23 : LUT6
    generic map(
      INIT => X"1333033303330333"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I4 => cont_mux_18_GND_3_o_LessThan_4_o2,
      I5 => cont_mux_18_GND_3_o_LessThan_4_o21_255,
      O => cont_mux_18_GND_3_o_LessThan_4_o
    );
  btn_IBUF : IBUF
    port map (
      I => btn,
      O => btn_IBUF_0
    );
  controle_3_OBUF : OBUF
    port map (
      I => controle_3_76,
      O => controle(3)
    );
  controle_2_OBUF : OBUF
    port map (
      I => controle_2_77,
      O => controle(2)
    );
  controle_1_OBUF : OBUF
    port map (
      I => controle_1_78,
      O => controle(1)
    );
  controle_0_OBUF : OBUF
    port map (
      I => controle_0_79,
      O => controle(0)
    );
  display_6_OBUF : OBUF
    port map (
      I => display_6_52,
      O => display(6)
    );
  display_5_OBUF : OBUF
    port map (
      I => display_5_53,
      O => display(5)
    );
  display_4_OBUF : OBUF
    port map (
      I => display_4_54,
      O => display(4)
    );
  display_3_OBUF : OBUF
    port map (
      I => display_3_55,
      O => display(3)
    );
  display_2_OBUF : OBUF
    port map (
      I => display_2_56,
      O => display(2)
    );
  display_1_OBUF : OBUF
    port map (
      I => display_1_57,
      O => display(1)
    );
  display_0_OBUF : OBUF
    port map (
      I => display_0_58,
      O => display(0)
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(1),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_1_rt_269
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(2),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_2_rt_270
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(3),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_3_rt_271
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(4),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_4_rt_272
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(5),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_5_rt_273
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(6),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_6_rt_274
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(7),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_7_rt_275
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(8),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_8_rt_276
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(9),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_9_rt_277
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(10),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_10_rt_278
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(11),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_11_rt_279
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(12),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_12_rt_280
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(13),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_13_rt_281
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(14),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_14_rt_282
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(15),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_15_rt_283
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(16),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_16_rt_284
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(17),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_cy_17_rt_285
    );
  Mcount_cont_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(1),
      O => Mcount_cont_cy_1_rt_286
    );
  Mcount_cont_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(2),
      O => Mcount_cont_cy_2_rt_287
    );
  Mcount_cont_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(3),
      O => Mcount_cont_cy_3_rt_288
    );
  Mcount_cont_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(4),
      O => Mcount_cont_cy_4_rt_289
    );
  Mcount_cont_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(5),
      O => Mcount_cont_cy_5_rt_290
    );
  Mcount_cont_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(6),
      O => Mcount_cont_cy_6_rt_291
    );
  Mcount_cont_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(7),
      O => Mcount_cont_cy_7_rt_292
    );
  Mcount_cont_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(8),
      O => Mcount_cont_cy_8_rt_293
    );
  Mcount_cont_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(9),
      O => Mcount_cont_cy_9_rt_294
    );
  Mcount_cont_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(10),
      O => Mcount_cont_cy_10_rt_295
    );
  Mcount_cont_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(11),
      O => Mcount_cont_cy_11_rt_296
    );
  Mcount_cont_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(12),
      O => Mcount_cont_cy_12_rt_297
    );
  Mcount_cont_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(13),
      O => Mcount_cont_cy_13_rt_298
    );
  Mcount_cont_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(14),
      O => Mcount_cont_cy_14_rt_299
    );
  Mcount_cont_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(15),
      O => Mcount_cont_cy_15_rt_300
    );
  Mcount_cont_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(16),
      O => Mcount_cont_cy_16_rt_301
    );
  Mcount_cont_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(17),
      O => Mcount_cont_cy_17_rt_302
    );
  Mcount_cont_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(18),
      O => Mcount_cont_cy_18_rt_303
    );
  Mcount_cont_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(19),
      O => Mcount_cont_cy_19_rt_304
    );
  Mcount_cont_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(20),
      O => Mcount_cont_cy_20_rt_305
    );
  Mcount_cont_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(21),
      O => Mcount_cont_cy_21_rt_306
    );
  Mcount_cont_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(22),
      O => Mcount_cont_cy_22_rt_307
    );
  Mcount_cont_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(23),
      O => Mcount_cont_cy_23_rt_308
    );
  Mcount_cont_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(24),
      O => Mcount_cont_cy_24_rt_309
    );
  Mcount_cont_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(25),
      O => Mcount_cont_cy_25_rt_310
    );
  Mcount_cont_mux_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(1),
      O => Mcount_cont_mux_cy_1_rt_311
    );
  Mcount_cont_mux_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(2),
      O => Mcount_cont_mux_cy_2_rt_312
    );
  Mcount_cont_mux_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(3),
      O => Mcount_cont_mux_cy_3_rt_313
    );
  Mcount_cont_mux_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(4),
      O => Mcount_cont_mux_cy_4_rt_314
    );
  Mcount_cont_mux_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(5),
      O => Mcount_cont_mux_cy_5_rt_315
    );
  Mcount_cont_mux_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(6),
      O => Mcount_cont_mux_cy_6_rt_316
    );
  Mcount_cont_mux_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(7),
      O => Mcount_cont_mux_cy_7_rt_317
    );
  Mcount_cont_mux_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(8),
      O => Mcount_cont_mux_cy_8_rt_318
    );
  Mcount_cont_mux_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(9),
      O => Mcount_cont_mux_cy_9_rt_319
    );
  Mcount_cont_mux_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(10),
      O => Mcount_cont_mux_cy_10_rt_320
    );
  Mcount_cont_mux_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(11),
      O => Mcount_cont_mux_cy_11_rt_321
    );
  Mcount_cont_mux_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(12),
      O => Mcount_cont_mux_cy_12_rt_322
    );
  Mcount_cont_mux_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(13),
      O => Mcount_cont_mux_cy_13_rt_323
    );
  Mcount_cont_mux_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(14),
      O => Mcount_cont_mux_cy_14_rt_324
    );
  Mcount_cont_mux_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(15),
      O => Mcount_cont_mux_cy_15_rt_325
    );
  Mcount_cont_mux_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(16),
      O => Mcount_cont_mux_cy_16_rt_326
    );
  Mcount_cont_mux_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(17),
      O => Mcount_cont_mux_cy_17_rt_327
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(18),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_xor_18_rt_328
    );
  Mcount_cont_xor_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont(26),
      O => Mcount_cont_xor_26_rt_329
    );
  Mcount_cont_mux_xor_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cont_mux(18),
      O => Mcount_cont_mux_xor_18_rt_330
    );
  Mmux_u_6_m_6_mux_10_OUT42 : LUT5
    generic map(
      INIT => X"BB88B8B8"
    )
    port map (
      I0 => m(3),
      I1 => cont_mux_18_GND_3_o_LessThan_3_o,
      I2 => N126,
      I3 => N127,
      I4 => cont_mux_18_PWR_3_o_LessThan_5_o,
      O => u_6_m_6_mux_10_OUT_3_Q
    );
  cont_mux_18_GND_3_o_LessThan_4_o23_SW0 : LUT4
    generic map(
      INIT => X"ACCC"
    )
    port map (
      I0 => u_3_Q,
      I1 => c_3_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      O => N131
    );
  cont_mux_18_GND_3_o_LessThan_4_o23_SW1 : LUT5
    generic map(
      INIT => X"ACCCCCCC"
    )
    port map (
      I0 => u_3_Q,
      I1 => c_3_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      O => N132
    );
  Mmux_u_6_m_6_mux_10_OUT41_SW0 : LUT6
    generic map(
      INIT => X"BBBBB8888BBB8888"
    )
    port map (
      I0 => u_3_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_LessThan_4_o2,
      I3 => cont_mux_18_GND_3_o_LessThan_4_o21_255,
      I4 => N131,
      I5 => N132,
      O => N126
    );
  cont_mux_18_GND_3_o_LessThan_4_o23_SW2 : LUT4
    generic map(
      INIT => X"ACCC"
    )
    port map (
      I0 => d_3_Q,
      I1 => c_3_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      O => N134
    );
  cont_mux_18_GND_3_o_LessThan_4_o23_SW3 : LUT5
    generic map(
      INIT => X"ACCCCCCC"
    )
    port map (
      I0 => d_3_Q,
      I1 => c_3_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      O => N135
    );
  Mmux_u_6_m_6_mux_10_OUT41_SW1 : LUT6
    generic map(
      INIT => X"BBBBB8888BBB8888"
    )
    port map (
      I0 => d_3_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_LessThan_4_o2,
      I3 => cont_mux_18_GND_3_o_LessThan_4_o21_255,
      I4 => N134,
      I5 => N135,
      O => N127
    );
  Mmux_u_6_m_6_mux_10_OUT31_SW0 : LUT6
    generic map(
      INIT => X"FFAAFFEAFFEAFFEA"
    )
    port map (
      I0 => m(2),
      I1 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I4 => cont_mux_18_GND_3_o_LessThan_3_o2,
      I5 => cont_mux_18_GND_3_o_LessThan_3_o21_253,
      O => N141
    );
  Mmux_u_6_m_6_mux_10_OUT31 : LUT5
    generic map(
      INIT => X"F7D5A280"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I1 => cont_mux_18_PWR_3_o_LessThan_5_o23_247,
      I2 => N143,
      I3 => N142,
      I4 => N141,
      O => u_6_m_6_mux_10_OUT_2_Q
    );
  cont_mux_18_GND_3_o_LessThan_3_o23_SW0 : LUT6
    generic map(
      INIT => X"FFFF088808880888"
    )
    port map (
      I0 => cont_mux(18),
      I1 => cont_mux(17),
      I2 => cont_mux_18_PWR_3_o_LessThan_1_o11_243,
      I3 => cont_mux_18_PWR_3_o_LessThan_1_o1,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I5 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      O => N145
    );
  cont_mux_18_GND_3_o_LessThan_3_o23_SW1 : LUT4
    generic map(
      INIT => X"0888"
    )
    port map (
      I0 => cont_mux(17),
      I1 => cont_mux(18),
      I2 => cont_mux_18_PWR_3_o_LessThan_1_o11_243,
      I3 => cont_mux_18_PWR_3_o_LessThan_1_o1,
      O => cont_mux_18_PWR_3_o_LessThan_1_o_inv
    );
  Q_n01601 : LUT6
    generic map(
      INIT => X"0010000001111111"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I2 => cont_mux_18_GND_3_o_LessThan_3_o2,
      I3 => cont_mux_18_PWR_3_o_LessThan_1_o_inv,
      I4 => cont_mux_18_GND_3_o_LessThan_3_o21_253,
      I5 => N145,
      O => Q_n0160
    );
  controle_2 : FD
    port map (
      C => clk_BUFGP_1,
      D => controle_2_rstpot_341,
      Q => controle_2_77
    );
  cont_mux_18_PWR_3_o_LessThan_5_o25_SW0 : LUT6
    generic map(
      INIT => X"EAAAFAAAFFAAFFAA"
    )
    port map (
      I0 => d_0_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I4 => cont_mux_18_PWR_3_o_LessThan_5_o21_245,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o2,
      O => N148
    );
  Mmux_u_6_m_6_mux_10_OUT11 : LUT6
    generic map(
      INIT => X"AAAAAAAAFFFFF3C0"
    )
    port map (
      I0 => m(0),
      I1 => cont_mux_18_PWR_3_o_LessThan_5_o23_247,
      I2 => N149,
      I3 => N148,
      I4 => cont_mux_18_GND_3_o_LessThan_4_o,
      I5 => cont_mux_18_GND_3_o_LessThan_3_o,
      O => u_6_m_6_mux_10_OUT_0_Q
    );
  Mmux_u_6_m_6_mux_10_OUT31_SW1 : LUT6
    generic map(
      INIT => X"AAAAAABFAAAAAAAF"
    )
    port map (
      I0 => u_2_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o21_245,
      O => N142
    );
  controle_3 : FD
    port map (
      C => clk_BUFGP_1,
      D => controle_3_rstpot_344,
      Q => controle_3_76
    );
  controle_2_rstpot : LUT4
    generic map(
      INIT => X"FF2E"
    )
    port map (
      I0 => controle_2_77,
      I1 => cont_mux_18_PWR_3_o_LessThan_1_o,
      I2 => cont_mux_18_GND_3_o_LessThan_4_o,
      I3 => Q_n0160,
      O => controle_2_rstpot_341
    );
  cont_mux_18_PWR_3_o_LessThan_5_o25_SW1 : LUT6
    generic map(
      INIT => X"FAFAFAAAFAFAFAEA"
    )
    port map (
      I0 => d_0_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I5 => cont_mux_18_PWR_3_o_LessThan_5_o21_245,
      O => N149
    );
  controle_3_rstpot : LUT6
    generic map(
      INIT => X"00000000FFBFBFBF"
    )
    port map (
      I0 => controle_3_76,
      I1 => cont_mux(18),
      I2 => cont_mux(17),
      I3 => cont_mux_18_PWR_3_o_LessThan_1_o11_243,
      I4 => cont_mux_18_PWR_3_o_LessThan_1_o1,
      I5 => Q_n0160,
      O => controle_3_rstpot_344
    );
  Mmux_PWR_3_o_PWR_3_o_mux_6_OUT21_SW3 : LUT6
    generic map(
      INIT => X"DFFBCFFBCFFBCFFB"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I4 => cont_mux_18_GND_3_o_LessThan_4_o2,
      I5 => cont_mux_18_GND_3_o_LessThan_4_o21_255,
      O => N151
    );
  Mmux_PWR_3_o_PWR_3_o_mux_6_OUT21_SW4 : LUT6
    generic map(
      INIT => X"DFF3CFF3CFF3CFF3"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_18_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      I4 => cont_mux_18_GND_3_o_LessThan_4_o2,
      I5 => cont_mux_18_GND_3_o_LessThan_4_o21_255,
      O => N152
    );
  cont_26_GND_3_o_LessThan_18_o_inv1 : LUT6
    generic map(
      INIT => X"FFFEEEEEFFFFEEEE"
    )
    port map (
      I0 => cont(26),
      I1 => cont(25),
      I2 => cont(22),
      I3 => cont(23),
      I4 => cont(24),
      I5 => cont_26_GND_3_o_LessThan_18_o33_251,
      O => cont_26_GND_3_o_LessThan_18_o_inv
    );
  Mmux_u_6_m_6_mux_10_OUT31_SW2 : LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAABFF"
    )
    port map (
      I0 => u_2_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_13_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_14_Q,
      I3 => cont_mux_18_GND_3_o_add_1_OUT_15_Q,
      I4 => cont_mux_18_GND_3_o_add_1_OUT_16_Q,
      I5 => cont_mux_18_GND_3_o_add_1_OUT_17_Q,
      O => N143
    );
  Mmux_PWR_3_o_PWR_3_o_mux_6_OUT21 : LUT6
    generic map(
      INIT => X"FFFFFAFE05010000"
    )
    port map (
      I0 => cont_mux_18_GND_3_o_add_1_OUT_13_Q,
      I1 => cont_mux_18_GND_3_o_add_1_OUT_12_Q,
      I2 => cont_mux_18_GND_3_o_add_1_OUT_14_Q,
      I3 => cont_mux_18_PWR_3_o_LessThan_5_o23_247,
      I4 => N152,
      I5 => N151,
      O => PWR_3_o_PWR_3_o_mux_6_OUT(1)
    );
  state_3_411 : LUT5
    generic map(
      INIT => X"FBBB5111"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd4_5,
      I4 => m(4),
      O => state_3_X_3_o_wide_mux_88_OUT_4_Q
    );
  state_3_7 : LUT6
    generic map(
      INIT => X"BBBFBBBE11151114"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd4_5,
      I5 => m(0),
      O => state_3_X_3_o_wide_mux_88_OUT_0_Q
    );
  state_3_11 : LUT6
    generic map(
      INIT => X"AFBFBEBE05151414"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd2_3,
      I2 => state_FSM_FFd1_2,
      I3 => state_FSM_FFd4_5,
      I4 => state_FSM_FFd3_4,
      I5 => m(1),
      O => state_3_X_3_o_wide_mux_88_OUT_1_Q
    );
  state_3_311 : LUT6
    generic map(
      INIT => X"EBEFEFEF41454545"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd2_3,
      I2 => state_FSM_FFd1_2,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd4_5,
      I5 => m(3),
      O => state_3_X_3_o_wide_mux_88_OUT_3_Q
    );
  state_3_511 : LUT6
    generic map(
      INIT => X"BBBBBBBF11111115"
    )
    port map (
      I0 => btn_IBUF_0,
      I1 => state_FSM_FFd1_2,
      I2 => state_FSM_FFd2_3,
      I3 => state_FSM_FFd3_4,
      I4 => state_FSM_FFd4_5,
      I5 => m(5),
      O => state_3_X_3_o_wide_mux_88_OUT_5_Q
    );
  cont_0_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(0),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_0_rstpot_347
    );
  cont_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_0_rstpot_347,
      Q => cont(0)
    );
  cont_1_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(1),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_1_rstpot_348
    );
  cont_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_1_rstpot_348,
      Q => cont(1)
    );
  cont_2_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(2),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_2_rstpot_349
    );
  cont_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_2_rstpot_349,
      Q => cont(2)
    );
  cont_3_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(3),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_3_rstpot_350
    );
  cont_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_3_rstpot_350,
      Q => cont(3)
    );
  cont_4_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(4),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_4_rstpot_351
    );
  cont_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_4_rstpot_351,
      Q => cont(4)
    );
  cont_5_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(5),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_5_rstpot_352
    );
  cont_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_5_rstpot_352,
      Q => cont(5)
    );
  cont_6_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(6),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_6_rstpot_353
    );
  cont_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_6_rstpot_353,
      Q => cont(6)
    );
  cont_7_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(7),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_7_rstpot_354
    );
  cont_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_7_rstpot_354,
      Q => cont(7)
    );
  cont_8_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(8),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_8_rstpot_355
    );
  cont_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_8_rstpot_355,
      Q => cont(8)
    );
  cont_9_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(9),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_9_rstpot_356
    );
  cont_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_9_rstpot_356,
      Q => cont(9)
    );
  cont_10_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(10),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_10_rstpot_357
    );
  cont_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_10_rstpot_357,
      Q => cont(10)
    );
  cont_11_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(11),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_11_rstpot_358
    );
  cont_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_11_rstpot_358,
      Q => cont(11)
    );
  cont_12_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(12),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_12_rstpot_359
    );
  cont_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_12_rstpot_359,
      Q => cont(12)
    );
  cont_13_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(13),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_13_rstpot_360
    );
  cont_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_13_rstpot_360,
      Q => cont(13)
    );
  cont_14_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(14),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_14_rstpot_361
    );
  cont_14 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_14_rstpot_361,
      Q => cont(14)
    );
  cont_15_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(15),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_15_rstpot_362
    );
  cont_15 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_15_rstpot_362,
      Q => cont(15)
    );
  cont_16_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(16),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_16_rstpot_363
    );
  cont_16 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_16_rstpot_363,
      Q => cont(16)
    );
  cont_17_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(17),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_17_rstpot_364
    );
  cont_17 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_17_rstpot_364,
      Q => cont(17)
    );
  cont_18_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(18),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_18_rstpot_365
    );
  cont_18 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_18_rstpot_365,
      Q => cont(18)
    );
  cont_19_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(19),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_19_rstpot_366
    );
  cont_19 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_19_rstpot_366,
      Q => cont(19)
    );
  cont_20_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(20),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_20_rstpot_367
    );
  cont_20 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_20_rstpot_367,
      Q => cont(20)
    );
  cont_21_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(21),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_21_rstpot_368
    );
  cont_21 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_21_rstpot_368,
      Q => cont(21)
    );
  cont_22_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(22),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_22_rstpot_369
    );
  cont_22 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_22_rstpot_369,
      Q => cont(22)
    );
  cont_23_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(23),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_23_rstpot_370
    );
  cont_23 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_23_rstpot_370,
      Q => cont(23)
    );
  cont_24_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(24),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_24_rstpot_371
    );
  cont_24 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_24_rstpot_371,
      Q => cont(24)
    );
  cont_25_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(25),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_25_rstpot_372
    );
  cont_25 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_25_rstpot_372,
      Q => cont(25)
    );
  cont_26_rstpot : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => Result(26),
      I1 => cont_26_GND_3_o_LessThan_18_o_inv,
      O => cont_26_rstpot_373
    );
  cont_26 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      D => cont_26_rstpot_373,
      Q => cont(26)
    );
  controle_0_rstpot : LUT4
    generic map(
      INIT => X"FEF4"
    )
    port map (
      I0 => cont_mux_18_PWR_3_o_LessThan_1_o,
      I1 => controle_0_79,
      I2 => Q_n0160,
      I3 => cont_mux_18_PWR_3_o_LessThan_5_o,
      O => controle_0_rstpot_374
    );
  controle_0 : FD
    port map (
      C => clk_BUFGP_1,
      D => controle_0_rstpot_374,
      Q => controle_0_79
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_1
    );
  Madd_cont_mux_18_GND_3_o_add_1_OUT_lut_0_INV_0 : INV
    port map (
      I => cont_mux(0),
      O => Madd_cont_mux_18_GND_3_o_add_1_OUT_lut_0_Q
    );
  Mcount_cont_lut_0_INV_0 : INV
    port map (
      I => cont(0),
      O => Mcount_cont_lut(0)
    );
  Mcount_cont_mux_lut_0_INV_0 : INV
    port map (
      I => cont_mux(0),
      O => Mcount_cont_mux_lut(0)
    );

end Structure;

