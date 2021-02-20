library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stand_test_tb is
end entity stand_test_tb;

architecture stand_test_tb_behav of stand_test_tb is
	SIGNAL s_CLK:		std_logic;
	SIGNAL s_IMP_LAS:	std_logic:='1';
	SIGNAL s_IMP_GEN:	std_logic:='0';
	SIGNAL s_OUT_IMP:	std_logic_vector(63 downto 0);


	SIGNAL s_BTN_FREQ_OK:	std_logic:='0';
	SIGNAL s_BTN_FREQ_FAIL: std_logic:='0';




	component stand_test is
	port (		p_CLK:				in std_logic;
				p_IN_IMP_LAS:		in std_logic;								-- вход \ сигнал запуска лазера
				p_IN_IMP_GEN:		in std_logic;								-- вход \ сигнал запуска генератора
				p_OUT_IMP:			out std_logic_vector(63 downto 0);			-- выход \ имитация выхродного импульса блока по одному из каналов
				p_BTN_FREQ_CNTR_OK:	in std_logic;								-- вход \ кнопка запуск проверки детектора импульсов стенда
				p_BTN_FREQ_CNTR_FAIL:	in std_logic							-- вход \ кнопка запуска проверки детектора импульсов стенда (имитация отказов работы блока работы)

				);
	end component;

begin

	module_stand_test: stand_test port map (s_CLK,
											s_IMP_LAS,
											s_IMP_GEN,
											s_OUT_IMP,					
											s_BTN_FREQ_OK,
											s_BTN_FREQ_FAIL
											);

	
	process 
	begin
		s_CLK <= '1';
		wait for 1 ns;
		s_CLK <= '0';
		wait for 1 ns;
	end process;

	process 
	begin
		s_BTN_FREQ_OK <= '0';
		s_BTN_FREQ_FAIL <= '0';
		wait for 10 ns;
		s_BTN_FREQ_OK <= '0';
		s_BTN_FREQ_FAIL <= '1';
		wait for 5 ns;
		s_BTN_FREQ_OK <= '0';
		s_BTN_FREQ_FAIL <= '0';
		wait for 20 ns;
		wait;
	end process;

	process
	begin
		s_IMP_GEN <= '0';
		s_IMP_LAS <= '1';
		wait for 30 ns;
		s_IMP_GEN <= '1';
		wait for 5 ns;
		s_IMP_GEN <= '0';
		wait for 10 ns;
		s_IMP_LAS <= '0';
		wait for 5 ns;
		s_IMP_LAS <= '1';
		wait for 100 ns;
	end process;
	
end architecture stand_test_tb_behav;
