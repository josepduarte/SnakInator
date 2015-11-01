library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity defineDifficult is
	port(
		
		sw3, sw2, sw1, sw0		: in std_logic;
		clk3, clk2, clk1, clk0	: in std_logic;
		clkOut 						: out std_logic
		
	);
end defineDifficult;

architecture Behav of defineDifficult is
begin
	process(sw3,sw2,sw1,sw0,clk3,clk2,clk1,clk0)
	begin
		if(sw3 = '1') then
			clkOut <= clk3;
		elsif(sw2 = '1') then
			clkOut <= clk2;
		elsif(sw0 = '1') then	
			clkOut <= clk0;
		else	
			clkOut <= clk1;
		end if;
	end process;
end Behav;