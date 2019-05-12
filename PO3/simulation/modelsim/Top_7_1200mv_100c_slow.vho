-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "05/11/2019 18:45:55"

-- 
-- Device: Altera EP4CE115F29I7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	uart_transmitter IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	transmit : IN std_logic;
	data : IN std_logic_vector(7 DOWNTO 0);
	serial_output_rx : BUFFER std_logic;
	busy : BUFFER std_logic
	);
END uart_transmitter;

-- Design Ports Information
-- serial_output_rx	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- busy	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- transmit	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF uart_transmitter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_transmit : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_serial_output_rx : std_logic;
SIGNAL ww_busy : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \serial_output_rx~output_o\ : std_logic;
SIGNAL \busy~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \transmit~input_o\ : std_logic;
SIGNAL \rxtimer|Equal0~0_combout\ : std_logic;
SIGNAL \rxtimer|Equal0~1_combout\ : std_logic;
SIGNAL \rxtimer|counter[0]~8_combout\ : std_logic;
SIGNAL \rxtimer|counter[0]~9_combout\ : std_logic;
SIGNAL \rxtimer|counter[0]~10_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \rxtimer|counter[1]~12_cout\ : std_logic;
SIGNAL \rxtimer|counter[1]~13_combout\ : std_logic;
SIGNAL \rxtimer|counter[1]~14\ : std_logic;
SIGNAL \rxtimer|counter[2]~15_combout\ : std_logic;
SIGNAL \rxtimer|counter[2]~16\ : std_logic;
SIGNAL \rxtimer|counter[3]~17_combout\ : std_logic;
SIGNAL \rxtimer|counter[3]~18\ : std_logic;
SIGNAL \rxtimer|counter[4]~19_combout\ : std_logic;
SIGNAL \rxtimer|counter[4]~20\ : std_logic;
SIGNAL \rxtimer|counter[5]~21_combout\ : std_logic;
SIGNAL \rxtimer|counter[5]~22\ : std_logic;
SIGNAL \rxtimer|counter[6]~23_combout\ : std_logic;
SIGNAL \rxtimer|counter[6]~24\ : std_logic;
SIGNAL \rxtimer|counter[7]~25_combout\ : std_logic;
SIGNAL \rxtimer|counter[7]~26\ : std_logic;
SIGNAL \rxtimer|counter[8]~27_combout\ : std_logic;
SIGNAL \rxtimer|next_bit~2_combout\ : std_logic;
SIGNAL \rxtimer|next_bit~3_combout\ : std_logic;
SIGNAL \rxtimer|next_bit~q\ : std_logic;
SIGNAL \txfsm|Selector31~0_combout\ : std_logic;
SIGNAL \txfsm|Selector31~1_combout\ : std_logic;
SIGNAL \txfsm|txstates[2]~1_combout\ : std_logic;
SIGNAL \txfsm|Equal0~0_combout\ : std_logic;
SIGNAL \rxbitcounter|counter[0]~4_combout\ : std_logic;
SIGNAL \rxbitcounter|counter[1]~0_combout\ : std_logic;
SIGNAL \rxbitcounter|counter[1]~2_combout\ : std_logic;
SIGNAL \rxbitcounter|counter[2]~3_combout\ : std_logic;
SIGNAL \rxbitcounter|counter[3]~1_combout\ : std_logic;
SIGNAL \rxbitcounter|Equal0~0_combout\ : std_logic;
SIGNAL \rxbitcounter|bit_counter~0_combout\ : std_logic;
SIGNAL \rxbitcounter|bit_counter~1_combout\ : std_logic;
SIGNAL \rxbitcounter|bit_counter~q\ : std_logic;
SIGNAL \txfsm|txstates[2]~2_combout\ : std_logic;
SIGNAL \txfsm|txstates[1]~0_combout\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \uartpiso|rgstr_r[0]~9_combout\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \uartparitygen|WideXor0~1_combout\ : std_logic;
SIGNAL \txfsm|Equal0~1_combout\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \uartparitygen|WideXor0~0_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~8_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~7_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~6_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~5_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~4_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~3_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~2_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~1_combout\ : std_logic;
SIGNAL \uartpiso|rgstr_r~0_combout\ : std_logic;
SIGNAL \txfsm|busy~0_combout\ : std_logic;
SIGNAL \rxtimer|counter\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \uartpiso|rgstr_r\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \txfsm|txstates\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \rxbitcounter|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \txfsm|ALT_INV_busy~0_combout\ : std_logic;
SIGNAL \uartpiso|ALT_INV_rgstr_r\ : std_logic_vector(9 DOWNTO 9);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_transmit <= transmit;
ww_data <= data;
serial_output_rx <= ww_serial_output_rx;
busy <= ww_busy;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\txfsm|ALT_INV_busy~0_combout\ <= NOT \txfsm|busy~0_combout\;
\uartpiso|ALT_INV_rgstr_r\(9) <= NOT \uartpiso|rgstr_r\(9);

-- Location: IOOBUF_X13_Y73_N23
\serial_output_rx~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uartpiso|ALT_INV_rgstr_r\(9),
	devoe => ww_devoe,
	o => \serial_output_rx~output_o\);

-- Location: IOOBUF_X115_Y15_N2
\busy~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \txfsm|ALT_INV_busy~0_combout\,
	devoe => ww_devoe,
	o => \busy~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y40_N8
\transmit~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_transmit,
	o => \transmit~input_o\);

-- Location: LCCOMB_X112_Y15_N28
\rxtimer|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|Equal0~0_combout\ = (!\rxtimer|counter\(3) & (!\rxtimer|counter\(2) & (\rxtimer|counter\(0) & !\rxtimer|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(3),
	datab => \rxtimer|counter\(2),
	datac => \rxtimer|counter\(0),
	datad => \rxtimer|counter\(1),
	combout => \rxtimer|Equal0~0_combout\);

-- Location: LCCOMB_X112_Y15_N22
\rxtimer|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|Equal0~1_combout\ = (\rxtimer|counter\(4) & (!\rxtimer|counter\(6) & (\rxtimer|counter\(5) & \rxtimer|counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(4),
	datab => \rxtimer|counter\(6),
	datac => \rxtimer|counter\(5),
	datad => \rxtimer|counter\(7),
	combout => \rxtimer|Equal0~1_combout\);

-- Location: LCCOMB_X112_Y15_N24
\rxtimer|counter[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[0]~8_combout\ = (!\txfsm|txstates\(0) & (\txfsm|txstates\(2) $ (\txfsm|txstates\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datac => \txfsm|txstates\(1),
	datad => \txfsm|txstates\(0),
	combout => \rxtimer|counter[0]~8_combout\);

-- Location: LCCOMB_X112_Y15_N2
\rxtimer|counter[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[0]~9_combout\ = (\rxtimer|counter[0]~8_combout\ & (((!\rxtimer|Equal0~1_combout\) # (!\rxtimer|Equal0~0_combout\)) # (!\rxtimer|counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(8),
	datab => \rxtimer|Equal0~0_combout\,
	datac => \rxtimer|Equal0~1_combout\,
	datad => \rxtimer|counter[0]~8_combout\,
	combout => \rxtimer|counter[0]~9_combout\);

-- Location: LCCOMB_X112_Y15_N30
\rxtimer|counter[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[0]~10_combout\ = \rxtimer|counter\(0) $ (\rxtimer|counter[0]~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rxtimer|counter\(0),
	datad => \rxtimer|counter[0]~9_combout\,
	combout => \rxtimer|counter[0]~10_combout\);

-- Location: IOIBUF_X115_Y53_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X112_Y15_N31
\rxtimer|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[0]~10_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(0));

-- Location: LCCOMB_X112_Y15_N4
\rxtimer|counter[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[1]~12_cout\ = CARRY(\rxtimer|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(0),
	datad => VCC,
	cout => \rxtimer|counter[1]~12_cout\);

-- Location: LCCOMB_X112_Y15_N6
\rxtimer|counter[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[1]~13_combout\ = (\rxtimer|counter\(1) & (\rxtimer|counter[1]~12_cout\ & VCC)) # (!\rxtimer|counter\(1) & (!\rxtimer|counter[1]~12_cout\))
-- \rxtimer|counter[1]~14\ = CARRY((!\rxtimer|counter\(1) & !\rxtimer|counter[1]~12_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(1),
	datad => VCC,
	cin => \rxtimer|counter[1]~12_cout\,
	combout => \rxtimer|counter[1]~13_combout\,
	cout => \rxtimer|counter[1]~14\);

-- Location: FF_X112_Y15_N7
\rxtimer|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[1]~13_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(1));

-- Location: LCCOMB_X112_Y15_N8
\rxtimer|counter[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[2]~15_combout\ = (\rxtimer|counter\(2) & ((GND) # (!\rxtimer|counter[1]~14\))) # (!\rxtimer|counter\(2) & (\rxtimer|counter[1]~14\ $ (GND)))
-- \rxtimer|counter[2]~16\ = CARRY((\rxtimer|counter\(2)) # (!\rxtimer|counter[1]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rxtimer|counter\(2),
	datad => VCC,
	cin => \rxtimer|counter[1]~14\,
	combout => \rxtimer|counter[2]~15_combout\,
	cout => \rxtimer|counter[2]~16\);

-- Location: FF_X112_Y15_N9
\rxtimer|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[2]~15_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(2));

-- Location: LCCOMB_X112_Y15_N10
\rxtimer|counter[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[3]~17_combout\ = (\rxtimer|counter\(3) & (\rxtimer|counter[2]~16\ & VCC)) # (!\rxtimer|counter\(3) & (!\rxtimer|counter[2]~16\))
-- \rxtimer|counter[3]~18\ = CARRY((!\rxtimer|counter\(3) & !\rxtimer|counter[2]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(3),
	datad => VCC,
	cin => \rxtimer|counter[2]~16\,
	combout => \rxtimer|counter[3]~17_combout\,
	cout => \rxtimer|counter[3]~18\);

-- Location: FF_X112_Y15_N11
\rxtimer|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[3]~17_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(3));

-- Location: LCCOMB_X112_Y15_N12
\rxtimer|counter[4]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[4]~19_combout\ = (\rxtimer|counter\(4) & ((GND) # (!\rxtimer|counter[3]~18\))) # (!\rxtimer|counter\(4) & (\rxtimer|counter[3]~18\ $ (GND)))
-- \rxtimer|counter[4]~20\ = CARRY((\rxtimer|counter\(4)) # (!\rxtimer|counter[3]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|counter\(4),
	datad => VCC,
	cin => \rxtimer|counter[3]~18\,
	combout => \rxtimer|counter[4]~19_combout\,
	cout => \rxtimer|counter[4]~20\);

-- Location: FF_X112_Y15_N13
\rxtimer|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[4]~19_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(4));

-- Location: LCCOMB_X112_Y15_N14
\rxtimer|counter[5]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[5]~21_combout\ = (\rxtimer|counter\(5) & (\rxtimer|counter[4]~20\ & VCC)) # (!\rxtimer|counter\(5) & (!\rxtimer|counter[4]~20\))
-- \rxtimer|counter[5]~22\ = CARRY((!\rxtimer|counter\(5) & !\rxtimer|counter[4]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rxtimer|counter\(5),
	datad => VCC,
	cin => \rxtimer|counter[4]~20\,
	combout => \rxtimer|counter[5]~21_combout\,
	cout => \rxtimer|counter[5]~22\);

-- Location: FF_X112_Y15_N15
\rxtimer|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[5]~21_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(5));

-- Location: LCCOMB_X112_Y15_N16
\rxtimer|counter[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[6]~23_combout\ = (\rxtimer|counter\(6) & ((GND) # (!\rxtimer|counter[5]~22\))) # (!\rxtimer|counter\(6) & (\rxtimer|counter[5]~22\ $ (GND)))
-- \rxtimer|counter[6]~24\ = CARRY((\rxtimer|counter\(6)) # (!\rxtimer|counter[5]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rxtimer|counter\(6),
	datad => VCC,
	cin => \rxtimer|counter[5]~22\,
	combout => \rxtimer|counter[6]~23_combout\,
	cout => \rxtimer|counter[6]~24\);

-- Location: FF_X112_Y15_N17
\rxtimer|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[6]~23_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(6));

-- Location: LCCOMB_X112_Y15_N18
\rxtimer|counter[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[7]~25_combout\ = (\rxtimer|counter\(7) & (\rxtimer|counter[6]~24\ & VCC)) # (!\rxtimer|counter\(7) & (!\rxtimer|counter[6]~24\))
-- \rxtimer|counter[7]~26\ = CARRY((!\rxtimer|counter\(7) & !\rxtimer|counter[6]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rxtimer|counter\(7),
	datad => VCC,
	cin => \rxtimer|counter[6]~24\,
	combout => \rxtimer|counter[7]~25_combout\,
	cout => \rxtimer|counter[7]~26\);

-- Location: FF_X112_Y15_N19
\rxtimer|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[7]~25_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(7));

-- Location: LCCOMB_X112_Y15_N20
\rxtimer|counter[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|counter[8]~27_combout\ = \rxtimer|counter[7]~26\ $ (\rxtimer|counter\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \rxtimer|counter\(8),
	cin => \rxtimer|counter[7]~26\,
	combout => \rxtimer|counter[8]~27_combout\);

-- Location: FF_X112_Y15_N21
\rxtimer|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|counter[8]~27_combout\,
	clrn => \reset~input_o\,
	ena => \rxtimer|counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|counter\(8));

-- Location: LCCOMB_X112_Y15_N0
\rxtimer|next_bit~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|next_bit~2_combout\ = (\rxtimer|next_bit~q\) # ((\rxtimer|counter\(8) & (\rxtimer|Equal0~1_combout\ & \rxtimer|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxtimer|next_bit~q\,
	datab => \rxtimer|counter\(8),
	datac => \rxtimer|Equal0~1_combout\,
	datad => \rxtimer|Equal0~0_combout\,
	combout => \rxtimer|next_bit~2_combout\);

-- Location: LCCOMB_X112_Y15_N26
\rxtimer|next_bit~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxtimer|next_bit~3_combout\ = (!\txfsm|txstates\(0) & (\rxtimer|next_bit~2_combout\ & (\txfsm|txstates\(2) $ (\txfsm|txstates\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datab => \txfsm|txstates\(0),
	datac => \txfsm|txstates\(1),
	datad => \rxtimer|next_bit~2_combout\,
	combout => \rxtimer|next_bit~3_combout\);

-- Location: FF_X112_Y15_N27
\rxtimer|next_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxtimer|next_bit~3_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxtimer|next_bit~q\);

-- Location: LCCOMB_X113_Y15_N18
\txfsm|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|Selector31~0_combout\ = (\txfsm|txstates\(1) & ((\rxtimer|next_bit~q\))) # (!\txfsm|txstates\(1) & (\transmit~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmit~input_o\,
	datac => \rxtimer|next_bit~q\,
	datad => \txfsm|txstates\(1),
	combout => \txfsm|Selector31~0_combout\);

-- Location: LCCOMB_X113_Y15_N24
\txfsm|Selector31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|Selector31~1_combout\ = (!\txfsm|txstates\(2) & (!\txfsm|txstates\(0) & \txfsm|Selector31~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datac => \txfsm|txstates\(0),
	datad => \txfsm|Selector31~0_combout\,
	combout => \txfsm|Selector31~1_combout\);

-- Location: FF_X113_Y15_N25
\txfsm|txstates[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \txfsm|Selector31~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \txfsm|txstates\(0));

-- Location: LCCOMB_X113_Y15_N12
\txfsm|txstates[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|txstates[2]~1_combout\ = (\txfsm|txstates\(2) & (!\txfsm|txstates\(0) & (\transmit~input_o\ & !\txfsm|txstates\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datab => \txfsm|txstates\(0),
	datac => \transmit~input_o\,
	datad => \txfsm|txstates\(1),
	combout => \txfsm|txstates[2]~1_combout\);

-- Location: LCCOMB_X113_Y15_N16
\txfsm|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|Equal0~0_combout\ = (\txfsm|txstates\(0) & !\txfsm|txstates\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \txfsm|txstates\(0),
	datad => \txfsm|txstates\(2),
	combout => \txfsm|Equal0~0_combout\);

-- Location: LCCOMB_X113_Y15_N28
\rxbitcounter|counter[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|counter[0]~4_combout\ = \rxbitcounter|counter\(0) $ (((!\rxbitcounter|Equal0~0_combout\ & (\txfsm|txstates\(1) & \txfsm|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxbitcounter|Equal0~0_combout\,
	datab => \txfsm|txstates\(1),
	datac => \rxbitcounter|counter\(0),
	datad => \txfsm|Equal0~0_combout\,
	combout => \rxbitcounter|counter[0]~4_combout\);

-- Location: FF_X113_Y15_N29
\rxbitcounter|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxbitcounter|counter[0]~4_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxbitcounter|counter\(0));

-- Location: LCCOMB_X113_Y15_N2
\rxbitcounter|counter[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|counter[1]~0_combout\ = (\rxbitcounter|counter\(0) & (\txfsm|txstates\(1) & (!\rxbitcounter|Equal0~0_combout\ & \txfsm|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxbitcounter|counter\(0),
	datab => \txfsm|txstates\(1),
	datac => \rxbitcounter|Equal0~0_combout\,
	datad => \txfsm|Equal0~0_combout\,
	combout => \rxbitcounter|counter[1]~0_combout\);

-- Location: LCCOMB_X113_Y15_N20
\rxbitcounter|counter[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|counter[1]~2_combout\ = \rxbitcounter|counter\(1) $ (\rxbitcounter|counter[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rxbitcounter|counter\(1),
	datad => \rxbitcounter|counter[1]~0_combout\,
	combout => \rxbitcounter|counter[1]~2_combout\);

-- Location: FF_X113_Y15_N21
\rxbitcounter|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxbitcounter|counter[1]~2_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxbitcounter|counter\(1));

-- Location: LCCOMB_X113_Y15_N10
\rxbitcounter|counter[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|counter[2]~3_combout\ = \rxbitcounter|counter\(2) $ (((\rxbitcounter|counter\(1) & \rxbitcounter|counter[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rxbitcounter|counter\(1),
	datac => \rxbitcounter|counter\(2),
	datad => \rxbitcounter|counter[1]~0_combout\,
	combout => \rxbitcounter|counter[2]~3_combout\);

-- Location: FF_X113_Y15_N11
\rxbitcounter|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxbitcounter|counter[2]~3_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxbitcounter|counter\(2));

-- Location: LCCOMB_X113_Y15_N26
\rxbitcounter|counter[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|counter[3]~1_combout\ = \rxbitcounter|counter\(3) $ (((\rxbitcounter|counter\(2) & (\rxbitcounter|counter\(1) & \rxbitcounter|counter[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxbitcounter|counter\(2),
	datab => \rxbitcounter|counter\(1),
	datac => \rxbitcounter|counter\(3),
	datad => \rxbitcounter|counter[1]~0_combout\,
	combout => \rxbitcounter|counter[3]~1_combout\);

-- Location: FF_X113_Y15_N27
\rxbitcounter|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxbitcounter|counter[3]~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxbitcounter|counter\(3));

-- Location: LCCOMB_X113_Y15_N22
\rxbitcounter|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|Equal0~0_combout\ = (!\rxbitcounter|counter\(2) & (!\rxbitcounter|counter\(0) & (\rxbitcounter|counter\(3) & \rxbitcounter|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rxbitcounter|counter\(2),
	datab => \rxbitcounter|counter\(0),
	datac => \rxbitcounter|counter\(3),
	datad => \rxbitcounter|counter\(1),
	combout => \rxbitcounter|Equal0~0_combout\);

-- Location: LCCOMB_X113_Y15_N0
\rxbitcounter|bit_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|bit_counter~0_combout\ = (\rxbitcounter|bit_counter~q\ & ((\txfsm|txstates\(2) & (!\txfsm|txstates\(0) & !\txfsm|txstates\(1))) # (!\txfsm|txstates\(2) & (\txfsm|txstates\(0) & \txfsm|txstates\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datab => \txfsm|txstates\(0),
	datac => \rxbitcounter|bit_counter~q\,
	datad => \txfsm|txstates\(1),
	combout => \rxbitcounter|bit_counter~0_combout\);

-- Location: LCCOMB_X113_Y15_N4
\rxbitcounter|bit_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rxbitcounter|bit_counter~1_combout\ = (\rxbitcounter|Equal0~0_combout\) # (\rxbitcounter|bit_counter~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rxbitcounter|Equal0~0_combout\,
	datad => \rxbitcounter|bit_counter~0_combout\,
	combout => \rxbitcounter|bit_counter~1_combout\);

-- Location: FF_X113_Y15_N5
\rxbitcounter|bit_counter\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rxbitcounter|bit_counter~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rxbitcounter|bit_counter~q\);

-- Location: LCCOMB_X113_Y15_N6
\txfsm|txstates[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|txstates[2]~2_combout\ = (\txfsm|txstates[2]~1_combout\) # ((\txfsm|txstates\(1) & (\rxbitcounter|bit_counter~q\ & \txfsm|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates[2]~1_combout\,
	datab => \txfsm|txstates\(1),
	datac => \rxbitcounter|bit_counter~q\,
	datad => \txfsm|Equal0~0_combout\,
	combout => \txfsm|txstates[2]~2_combout\);

-- Location: FF_X113_Y15_N7
\txfsm|txstates[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \txfsm|txstates[2]~2_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \txfsm|txstates\(2));

-- Location: LCCOMB_X113_Y15_N30
\txfsm|txstates[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|txstates[1]~0_combout\ = (!\txfsm|txstates\(2) & ((\txfsm|txstates\(0) & ((!\txfsm|txstates\(1)) # (!\rxbitcounter|bit_counter~q\))) # (!\txfsm|txstates\(0) & ((\txfsm|txstates\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datab => \txfsm|txstates\(0),
	datac => \rxbitcounter|bit_counter~q\,
	datad => \txfsm|txstates\(1),
	combout => \txfsm|txstates[1]~0_combout\);

-- Location: FF_X112_Y15_N25
\txfsm|txstates[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \txfsm|txstates[1]~0_combout\,
	clrn => \reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \txfsm|txstates\(1));

-- Location: IOIBUF_X1_Y0_N22
\data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(7),
	o => \data[7]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(6),
	o => \data[6]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(5),
	o => \data[5]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: LCCOMB_X114_Y15_N30
\uartpiso|rgstr_r[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r[0]~9_combout\ = (\txfsm|Equal0~0_combout\ & (\txfsm|txstates\(1) & ((\uartpiso|rgstr_r\(9))))) # (!\txfsm|Equal0~0_combout\ & (((\uartpiso|rgstr_r\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|Equal0~0_combout\,
	datab => \txfsm|txstates\(1),
	datac => \uartpiso|rgstr_r\(0),
	datad => \uartpiso|rgstr_r\(9),
	combout => \uartpiso|rgstr_r[0]~9_combout\);

-- Location: FF_X114_Y15_N31
\uartpiso|rgstr_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r[0]~9_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(0));

-- Location: IOIBUF_X115_Y18_N8
\data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(4),
	o => \data[4]~input_o\);

-- Location: LCCOMB_X114_Y15_N8
\uartparitygen|WideXor0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartparitygen|WideXor0~1_combout\ = \data[6]~input_o\ $ (\data[5]~input_o\ $ (\data[7]~input_o\ $ (\data[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data[6]~input_o\,
	datab => \data[5]~input_o\,
	datac => \data[7]~input_o\,
	datad => \data[4]~input_o\,
	combout => \uartparitygen|WideXor0~1_combout\);

-- Location: LCCOMB_X113_Y15_N14
\txfsm|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|Equal0~1_combout\ = (!\txfsm|txstates\(2) & (\txfsm|txstates\(0) & !\txfsm|txstates\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(2),
	datab => \txfsm|txstates\(0),
	datad => \txfsm|txstates\(1),
	combout => \txfsm|Equal0~1_combout\);

-- Location: IOIBUF_X115_Y15_N8
\data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: LCCOMB_X114_Y15_N26
\uartparitygen|WideXor0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartparitygen|WideXor0~0_combout\ = \data[2]~input_o\ $ (\data[1]~input_o\ $ (\data[3]~input_o\ $ (\data[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data[2]~input_o\,
	datab => \data[1]~input_o\,
	datac => \data[3]~input_o\,
	datad => \data[0]~input_o\,
	combout => \uartparitygen|WideXor0~0_combout\);

-- Location: LCCOMB_X113_Y15_N8
\uartpiso|rgstr_r~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~8_combout\ = (\txfsm|Equal0~1_combout\ & ((\uartparitygen|WideXor0~1_combout\ $ (\uartparitygen|WideXor0~0_combout\)))) # (!\txfsm|Equal0~1_combout\ & (\uartpiso|rgstr_r\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uartpiso|rgstr_r\(0),
	datab => \uartparitygen|WideXor0~1_combout\,
	datac => \txfsm|Equal0~1_combout\,
	datad => \uartparitygen|WideXor0~0_combout\,
	combout => \uartpiso|rgstr_r~8_combout\);

-- Location: FF_X113_Y15_N9
\uartpiso|rgstr_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~8_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(1));

-- Location: LCCOMB_X114_Y15_N12
\uartpiso|rgstr_r~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~7_combout\ = (\txfsm|txstates\(1) & (((\uartpiso|rgstr_r\(1))))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & (!\data[0]~input_o\)) # (!\txfsm|Equal0~0_combout\ & ((\uartpiso|rgstr_r\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(1),
	datab => \data[0]~input_o\,
	datac => \txfsm|Equal0~0_combout\,
	datad => \uartpiso|rgstr_r\(1),
	combout => \uartpiso|rgstr_r~7_combout\);

-- Location: FF_X114_Y15_N13
\uartpiso|rgstr_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~7_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(2));

-- Location: LCCOMB_X114_Y15_N10
\uartpiso|rgstr_r~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~6_combout\ = (\txfsm|Equal0~0_combout\ & ((\txfsm|txstates\(1) & (\uartpiso|rgstr_r\(2))) # (!\txfsm|txstates\(1) & ((!\data[1]~input_o\))))) # (!\txfsm|Equal0~0_combout\ & (\uartpiso|rgstr_r\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uartpiso|rgstr_r\(2),
	datab => \data[1]~input_o\,
	datac => \txfsm|Equal0~0_combout\,
	datad => \txfsm|txstates\(1),
	combout => \uartpiso|rgstr_r~6_combout\);

-- Location: FF_X114_Y15_N11
\uartpiso|rgstr_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~6_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(3));

-- Location: LCCOMB_X114_Y15_N20
\uartpiso|rgstr_r~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~5_combout\ = (\txfsm|txstates\(1) & (\uartpiso|rgstr_r\(3))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & ((!\data[2]~input_o\))) # (!\txfsm|Equal0~0_combout\ & (\uartpiso|rgstr_r\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uartpiso|rgstr_r\(3),
	datab => \txfsm|txstates\(1),
	datac => \txfsm|Equal0~0_combout\,
	datad => \data[2]~input_o\,
	combout => \uartpiso|rgstr_r~5_combout\);

-- Location: FF_X114_Y15_N21
\uartpiso|rgstr_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~5_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(4));

-- Location: LCCOMB_X114_Y15_N22
\uartpiso|rgstr_r~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~4_combout\ = (\txfsm|txstates\(1) & (((\uartpiso|rgstr_r\(4))))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & (!\data[3]~input_o\)) # (!\txfsm|Equal0~0_combout\ & ((\uartpiso|rgstr_r\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(1),
	datab => \data[3]~input_o\,
	datac => \txfsm|Equal0~0_combout\,
	datad => \uartpiso|rgstr_r\(4),
	combout => \uartpiso|rgstr_r~4_combout\);

-- Location: FF_X114_Y15_N23
\uartpiso|rgstr_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~4_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(5));

-- Location: LCCOMB_X114_Y15_N16
\uartpiso|rgstr_r~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~3_combout\ = (\txfsm|txstates\(1) & (\uartpiso|rgstr_r\(5))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & ((!\data[4]~input_o\))) # (!\txfsm|Equal0~0_combout\ & (\uartpiso|rgstr_r\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uartpiso|rgstr_r\(5),
	datab => \txfsm|txstates\(1),
	datac => \txfsm|Equal0~0_combout\,
	datad => \data[4]~input_o\,
	combout => \uartpiso|rgstr_r~3_combout\);

-- Location: FF_X114_Y15_N17
\uartpiso|rgstr_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~3_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(6));

-- Location: LCCOMB_X114_Y15_N18
\uartpiso|rgstr_r~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~2_combout\ = (\txfsm|txstates\(1) & (((\uartpiso|rgstr_r\(6))))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & (!\data[5]~input_o\)) # (!\txfsm|Equal0~0_combout\ & ((\uartpiso|rgstr_r\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(1),
	datab => \data[5]~input_o\,
	datac => \txfsm|Equal0~0_combout\,
	datad => \uartpiso|rgstr_r\(6),
	combout => \uartpiso|rgstr_r~2_combout\);

-- Location: FF_X114_Y15_N19
\uartpiso|rgstr_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~2_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(7));

-- Location: LCCOMB_X114_Y15_N24
\uartpiso|rgstr_r~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~1_combout\ = (\txfsm|Equal0~0_combout\ & ((\txfsm|txstates\(1) & ((\uartpiso|rgstr_r\(7)))) # (!\txfsm|txstates\(1) & (!\data[6]~input_o\)))) # (!\txfsm|Equal0~0_combout\ & (((\uartpiso|rgstr_r\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data[6]~input_o\,
	datab => \uartpiso|rgstr_r\(7),
	datac => \txfsm|Equal0~0_combout\,
	datad => \txfsm|txstates\(1),
	combout => \uartpiso|rgstr_r~1_combout\);

-- Location: FF_X114_Y15_N25
\uartpiso|rgstr_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~1_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(8));

-- Location: LCCOMB_X114_Y15_N28
\uartpiso|rgstr_r~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uartpiso|rgstr_r~0_combout\ = (\txfsm|txstates\(1) & (((\uartpiso|rgstr_r\(8))))) # (!\txfsm|txstates\(1) & ((\txfsm|Equal0~0_combout\ & (!\data[7]~input_o\)) # (!\txfsm|Equal0~0_combout\ & ((\uartpiso|rgstr_r\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(1),
	datab => \data[7]~input_o\,
	datac => \txfsm|Equal0~0_combout\,
	datad => \uartpiso|rgstr_r\(8),
	combout => \uartpiso|rgstr_r~0_combout\);

-- Location: FF_X114_Y15_N29
\uartpiso|rgstr_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uartpiso|rgstr_r~0_combout\,
	clrn => \reset~input_o\,
	ena => \txfsm|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uartpiso|rgstr_r\(9));

-- Location: LCCOMB_X114_Y15_N2
\txfsm|busy~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \txfsm|busy~0_combout\ = (!\txfsm|txstates\(1) & !\txfsm|txstates\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \txfsm|txstates\(1),
	datad => \txfsm|txstates\(0),
	combout => \txfsm|busy~0_combout\);

ww_serial_output_rx <= \serial_output_rx~output_o\;

ww_busy <= \busy~output_o\;
END structure;


