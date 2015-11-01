library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity posComparator_TestBench is
end posComparator_TestBench;

architecture Stimulus of posComparator_TestBench is
	
			signal s_hexDraft, s_hexReal 	: std_logic_vector(6 downto 0);
			signal s_compare					: std_logic; 
			signal s_segEaten				: std_logic;

begin 

		uut : entity work.posComparator(Behav)
			port map(
				hexDraft			=> s_hexDraft,
				hexReal			=>	s_hexReal,
				compare 			=> s_compare,
				seg_eaten 		=> s_segEaten
			);
		
			stim_proc	: process
			begin
			
				s_compare <= '0';
				wait for 10 ns;
				
				s_hexDraft	 <= "0111111";
				s_hexReal 	 <= "0011111";
				wait for 20 ns;
				
				s_compare <= '1';
				wait for 20 ns;
				
				s_hexDraft		<= "0111111";
				s_hexReal		<= "0111111";
				wait for 20 ns;
				
				s_compare <= '0';
				wait for 20 ns;
				
				s_compare <= '1';
				wait for 20 ns;
				
				s_hexDraft		<= "0111111";
				s_hexReal		<= "1111001";
				wait for 20 ns;
				
				s_compare <= '0';
				wait for 20 ns;
				
				s_compare <= '1';
				wait for 100 ns;
			
		end process;
end Stimulus;