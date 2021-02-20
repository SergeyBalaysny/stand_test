
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity self_test_tb is
end entity self_test_tb;

architecture self_test_tb_behav of self_test_tb is
	
	SIGNAL s_CLK:	std_logic;
	SIGNAL s_BTN:	std_logic;
	SIGNAL s_LED:	std_logic_vector(6 downto 0);

	component self_test is
		port (	p_CLK:			in std_logic;
				p_FPGA_BTN_VLT:	in std_logic;
				p_FPGA_LED:		out std_logic_vector(6 downto 0)
			
		);
	end component self_test;

begin

st_module: self_test port map ( s_CLK, s_BTN, s_LED);

	process 
	begin
		s_CLK<='1';
		wait for 1 ns;
		s_CLK<='0';
		wait for 1 ns;
	end process;

	process
	begin
		s_BTN<='0';
		wait for 40 ns;
		s_BTN<='1';
		wait for 10 ns;
		s_BTN<='0';
		wait;
	end process;

	
end architecture self_test_tb_behav;