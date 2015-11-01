library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity showResult_TestBench is
end showResult_TestBench;

architecture Stimulus of showResult_TestBench is
	
	signal	s_clk_Blink											: std_logic;
	signal	s_positionSeg 										: std_logic_vector(1 downto 0);
	signal	s_inHexSeg											: std_logic_vector(6 downto 0);
	signal	s_inHex0, s_inHex1, s_inHex2, s_inHex3		: std_logic_vector(6 downto 0);
	signal	s_hex0, s_hex1, s_hex2, s_hex3				: std_logic_vector(6 downto 0);

begin 

		uut : entity work.showResult(Behav)
			port map(
				clk_Blink		=> s_clk_Blink,
				positionSeg 	=> s_positionSeg,
				inHexSeg			=> s_inHexSeg,
				inHex0			=> s_inHex0,
				inHex1			=> s_inHex1,
				inHex2			=> s_inHex2,
				inHex3			=> s_inHex3,
				hex0				=> s_hex0,
				hex1				=> s_hex1,
				hex2				=> s_hex2,
				hex3				=> s_hex3
			);
			
			clock_proc	:	process
			begin
				s_clk_Blink <= '0'; wait for 20 ns;
				s_clk_Blink <= '1'; wait for 20 ns;
			end process;
		
			stim_proc	: process
			begin
				
				s_positionSeg	<= "11";
				s_inHexSeg		<= "0111111";
				s_inHex0			<= "1111111";
				s_inHex1			<= "1111111";
				s_inHex2			<= "0011111";
				s_inHex3 		<= "1111111";  
				wait for 100 ns; --DEVERIA ESTAR O SEGMENTO NO DISPLAY3-SEG6 A PISCAR E A COBRA NO DISPLAY2-SEG56.
				
				s_positionSeg	<= "10";
				s_inHexSeg		<= "0111111";
				s_inHex0			<= "1111111";
				s_inHex1			<= "1111111";
				s_inHex2			<= "0011111";
				s_inHex3 		<= "1111111";  
				wait for 100 ns; --DEVERIA ESTAR A COBRA NO DISPLAY2-SEG56 (sem nada a piscar pois o seg esta sobreposto).
				
				s_positionSeg	<= "00";
				s_inHexSeg		<= "1110111";
				s_inHex0			<= "1111111";
				s_inHex1			<= "1111111";
				s_inHex2			<= "1111111";
				s_inHex3 		<= "1111100";  
				wait for 100 ns; --DEVERIA ESTAR O SEGMENTO NO DISPLAY0-SEG3 A PISCAR E A COBRA NO DISPLAY3-SEG12.
		  end process;
end Stimulus;