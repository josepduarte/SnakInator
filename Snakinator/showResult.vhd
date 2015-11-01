library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity showResult is
	port(
		clk_Blink								: in std_logic;
		positionSeg 							: in std_logic_vector(1 downto 0);
		inHexSeg									: in std_logic_vector(6 downto 0);
		inHex0, inHex1, inHex2, inHex3	: in std_logic_vector(6 downto 0);
		hex0, hex1, hex2, hex3 				: out std_logic_vector(6 downto 0));
end showResult;

architecture Behav of showResult is
	signal s_seg : std_logic_vector(27 downto 0);
begin
	process(positionSeg, clk_Blink, inHex0, inHex1, inHex2, inHex3, inHexSeg)
	begin
		if(positionSeg = "00") then -- display 0
			s_seg(0) <= (not clk_Blink or inHexSeg(0)) and inHex0(0);
			s_seg(1) <= (not clk_Blink or inHexSeg(1)) and inHex0(1);
			s_seg(2) <= (not clk_Blink or inHexSeg(2)) and inHex0(2);
			s_seg(3) <= (not clk_Blink or inHexSeg(3)) and inHex0(3);
			s_seg(4) <= (not clk_Blink or inHexSeg(4)) and inHex0(4);
			s_seg(5) <= (not clk_Blink or inHexSeg(5)) and inHex0(5);
			s_seg(6) <= (not clk_Blink or inHexSeg(6)) and inHex0(6);
			
			s_seg(7) <= inHex1(0);
			s_seg(8) <= inHex1(1);
			s_seg(9) <= inHex1(2);
			s_seg(10) <= inHex1(3);
			s_seg(11) <= inHex1(4);
			s_seg(12) <= inHex1(5);
			s_seg(13) <= inHex1(6);
			
			s_seg(14) <= inHex2(0);
			s_seg(15) <= inHex2(1);
			s_seg(16) <= inHex2(2);
			s_seg(17) <= inHex2(3);
			s_seg(18) <= inHex2(4);
			s_seg(19) <= inHex2(5);
			s_seg(20) <= inHex2(6);
			
			s_seg(21) <= inHex3(0);
			s_seg(22) <= inHex3(1);
			s_seg(23) <= inHex3(2);
			s_seg(24) <= inHex3(3);
			s_seg(25) <= inHex3(4);
			s_seg(26) <= inHex3(5);
			s_seg(27) <= inHex3(6);
			
			
		elsif(positionSeg = "01") then  --display1
			
			s_seg(0) <= inHex0(0);
			s_seg(1) <= inHex0(1);
			s_seg(2) <= inHex0(2);
			s_seg(3) <= inHex0(3);
			s_seg(4) <= inHex0(4);
			s_seg(5) <= inHex0(5);
			s_seg(6) <= inHex0(6);
			
			s_seg(7) <= (not clk_Blink or inHexSeg(0)) and inHex1(0);
			s_seg(8) <= (not clk_Blink or inHexSeg(1)) and inHex1(1);
			s_seg(9) <= (not clk_Blink or inHexSeg(2)) and inHex1(2);
			s_seg(10) <= (not clk_Blink or inHexSeg(3)) and inHex1(3);
			s_seg(11) <= (not clk_Blink or inHexSeg(4)) and inHex1(4);
			s_seg(12) <= (not clk_Blink or inHexSeg(5)) and inHex1(5);
			s_seg(13) <= (not clk_Blink or inHexSeg(6)) and inHex1(6);
			
			s_seg(14) <= inHex2(0);
			s_seg(15) <= inHex2(1);
			s_seg(16) <= inHex2(2);
			s_seg(17) <= inHex2(3);
			s_seg(18) <= inHex2(4);
			s_seg(19) <= inHex2(5);
			s_seg(20) <= inHex2(6);
			
			s_seg(21) <= inHex3(0);
			s_seg(22) <= inHex3(1);
			s_seg(23) <= inHex3(2);
			s_seg(24) <= inHex3(3);
			s_seg(25) <= inHex3(4);
			s_seg(26) <= inHex3(5);
			s_seg(27) <= inHex3(6);
		
		elsif(positionSeg = "10") then -- display 2
			
			s_seg(0) <= inHex0(0);
			s_seg(1) <= inHex0(1);
			s_seg(2) <= inHex0(2);
			s_seg(3) <= inHex0(3);
			s_seg(4) <= inHex0(4);
			s_seg(5) <= inHex0(5);
			s_seg(6) <= inHex0(6);
			
			s_seg(7) <= inHex1(0);
			s_seg(8) <= inHex1(1);
			s_seg(9) <= inHex1(2);
			s_seg(10) <= inHex1(3);
			s_seg(11) <= inHex1(4);
			s_seg(12) <= inHex1(5);
			s_seg(13) <= inHex1(6);
			
			s_seg(14) <= (not clk_Blink or inHexSeg(0)) and inHex2(0);
			s_seg(15) <= (not clk_Blink or inHexSeg(1)) and inHex2(1);
			s_seg(16) <= (not clk_Blink or inHexSeg(2)) and inHex2(2);
			s_seg(17) <= (not clk_Blink or inHexSeg(3)) and inHex2(3);
			s_seg(18) <= (not clk_Blink or inHexSeg(4)) and inHex2(4);
			s_seg(19) <= (not clk_Blink or inHexSeg(5)) and inHex2(5);
			s_seg(20) <= (not clk_Blink or inHexSeg(6)) and inHex2(6);
			
			s_seg(21) <= inHex3(0);
			s_seg(22) <= inHex3(1);
			s_seg(23) <= inHex3(2);
			s_seg(24) <= inHex3(3);
			s_seg(25) <= inHex3(4); 
			s_seg(26) <= inHex3(5);
			s_seg(27) <= inHex3(6);
			
		else 
		
			s_seg(0) <= inHex0(0);
			s_seg(1) <= inHex0(1);
			s_seg(2) <= inHex0(2);
			s_seg(3) <= inHex0(3);
			s_seg(4) <= inHex0(4);
			s_seg(5) <= inHex0(5);
			s_seg(6) <= inHex0(6);
			
			s_seg(7) <= inHex1(0);
			s_seg(8) <= inHex1(1);
			s_seg(9) <= inHex1(2);
			s_seg(10) <= inHex1(3);
			s_seg(11) <= inHex1(4);
			s_seg(12) <= inHex1(5);
			s_seg(13) <= inHex1(6);
			
			s_seg(14) <= inHex2(0);
			s_seg(15) <= inHex2(1);
			s_seg(16) <= inHex2(2);
			s_seg(17) <= inHex2(3);
			s_seg(18) <= inHex2(4);
			s_seg(19) <= inHex2(5);
			s_seg(20) <= inHex2(6);
			
			s_seg(21) <= (not clk_Blink or inHexSeg(0)) and inHex3(0);
			s_seg(22) <= (not clk_Blink or inHexSeg(1)) and inHex3(1);
			s_seg(23) <= (not clk_Blink or inHexSeg(2)) and inHex3(2);
			s_seg(24) <= (not clk_Blink or inHexSeg(3)) and inHex3(3);
			s_seg(25) <= (not clk_Blink or inHexSeg(4)) and inHex3(4);
			s_seg(26) <= (not clk_Blink or inHexSeg(5)) and inHex3(5);
			s_seg(27) <= (not clk_Blink or inHexSeg(6)) and inHex3(6);
		
		end if;
	end process;
	hex3 <= s_seg(27 downto 21);
	hex2 <= s_seg(20 downto 14);
	hex1 <= s_seg(13 downto 7);
	hex0 <= s_seg(6 downto 0);
		
end Behav;