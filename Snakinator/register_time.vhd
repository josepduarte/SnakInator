library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity register_Time is
	port( 	
			lost																							: 		in std_logic;		
			hex0Time, hex1Time, hex2Time, hex3Time												: 		in std_logic_vector(6 downto 0);
			hex0RegisterTime, hex1RegisterTime, hex2RegisterTime,	hex3RegisterTime	:		out std_logic_vector(6 downto 0));
end register_Time;

architecture Behav of register_Time is
begin
	process(lost)
	begin
		if(rising_edge(lost)) then
			hex0RegisterTime 	<= hex0Time;
			hex1RegisterTime 	<= hex1Time;
			hex2RegisterTime 	<= hex2Time;
			hex3RegisterTime 	<= hex3Time;
		end if;
	end process;
end Behav;
	