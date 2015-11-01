library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparator_TestBench is
end comparator_TestBench;

architecture Stimulus of comparator_TestBench is
	
	-- signal 	s_notClock50Mhz			: std_logic;
	signal	s_hexDraft, s_hexReal 	: std_logic_vector(6 downto 0);
	signal 	s_hexPosition			  	: std_logic_vector(1 downto 0);
	signal	s_newHex				  	: std_logic_vector(6 downto 0);
	signal 	s_newHexPosition			: std_logic_vector(1 downto 0);

begin 

		uut : entity work.comparator(Behav)
			port map(
--				notClock50Mhz 	=> s_notClock50Mhz,
				hexDraft			=> s_hexDraft,
				hexReal			=>	s_hexReal,
				hexPosition 	=> s_hexPosition,
				newHex			=> s_newHex,
				newHexPosition	=> s_newHexPosition
			);
			
--		clock_proc	:	process
--			begin
--				s_notClock50Mhz <= '1'; wait for 20 ns;
--				s_notClock50Mhz <= '0'; wait for 20 ns;
--			end process;
			
				stim_proc	: process
				begin
					
					wait for 10 ns;
					s_hexDraft	 <= "0111111";
					s_hexReal 	 <= "0011111";
					s_hexPosition <= "01";
					
					wait for 40 ns;
					
					s_hexDraft		<= "0111111";
					s_hexReal		<= "0111111";
					s_hexPosition	<= "10";
					
					wait for 40 ns;
					
					s_hexDraft		<= "0111111";
					s_hexReal		<= "1111001";
					s_hexPosition	<= "11";
					
					wait for 100 ns;
		end process;
end Stimulus;