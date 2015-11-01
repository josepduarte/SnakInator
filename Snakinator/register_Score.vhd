library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity register_Score is
	port( 	
			lost											: 		in std_logic;		
			hex6Score, hex7Score						: 		in std_logic_vector(6 downto 0);
			hex6RegisterScore, hex7RegisterScore:		out std_logic_vector(6 downto 0));
end register_Score;

architecture Behav of register_Score is
begin
	process(lost)
	begin
		if(rising_edge(lost)) then
			hex6RegisterScore 	<= hex6Score;
			hex7RegisterScore		<= hex7Score;
		end if;
	end process;
end Behav;
	
	