library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity segmentSaver_TestBench is
end segmentSaver_TestBench;

architecture Stimulus of segmentSaver_TestBench is
	
	signal	s_hexDraft	        : std_logic_vector(6 downto 0); 
	signal	s_hexPosition			  	: std_logic_vector(1 downto 0);
	signal	s_reset 				      	: std_logic; --lost			
	signal	s_begin_game				   : std_logic; -- faz com que quando se está em TInit e o jogo começar, tambem se crie um segmento
	signal	s_seg_eaten				    : std_logic; --tenho que inicializar este a '1' no posComparator
	signal	s_newHex					      : std_logic_vector(6 downto 0);
	signal	s_newHexPosition			: std_logic_vector(1 downto 0);

begin 

		uut : entity work.segment_Saver(Behav)
			port map(
				hexDraft		  	  => s_hexDraft,
				hexPosition 	  => s_hexPosition,
				reset		       	=> s_reset,
				begin_game	   	=> s_begin_game,
				seg_eaten     	=> s_seg_eaten,
				newHex		      	=> s_newHex,
				newHexPosition	=> s_newHexPosition
			);
		
			stim_proc	: process
			begin
				
				wait for 10 ns;
				
				s_hexDraft	 <= "0111111";
				s_hexPosition <= "01";
				s_reset 		 <= '0';
				s_begin_game   <= '0';
				s_seg_eaten    <= '0';
				
				wait for 20 ns;
				
				s_seg_eaten	<= '1';
				
				wait for 20 ns;
				
				s_reset <= '1';
				
				wait for 20 ns;
				
				s_hexDraft <= "1110111";
				s_hexPosition <= "11";
				
				wait for 20 ns;
				
				s_seg_eaten <= '0';
				
				s_begin_game <= '1';
				
				wait for 20 ns;
				
				s_reset <= '0';
				
				wait for 20 ns;
				
				s_hexDraft <= "1110110";
				s_hexPosition <= "10";
				
				wait for 100 ns;
		end process;
end Stimulus;