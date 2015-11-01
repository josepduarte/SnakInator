library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux2_1HEX is 
	port(
		sel 																									: in std_logic; -- lost
		hex0notLost, hex1notLost, hex2notLost, hex3notLost, hex6notLost, hex7notLost  : in std_logic_vector(6 downto 0);
		hex0Lost, hex1Lost, hex2Lost, hex3Lost, hex6Lost, hex7Lost 							: in std_logic_vector(6 downto 0);
		hex0, hex1, hex2, hex3, hex6, hex7 															: out std_logic_vector(6 downto 0)
		);
end mux2_1HEX;
		
architecture behav of mux2_1HEX is 
	signal s_hex0notLost, s_hex1notLost, s_hex2notLost, s_hex3notLost, s_hex6notLost, s_hex7notLost : std_logic_vector(6 downto 0);
	signal s_hex0Lost, s_hex1Lost, s_hex2Lost, s_hex3Lost, s_hex6Lost, s_hex7Lost : std_logic_vector(6 downto 0);
begin
	s_hex0notLost <= hex0notLost;
	s_hex1notLost <= hex1notLost;
	s_hex2notLost <= hex2notLost;
	s_hex3notLost <= hex3notLost;
	s_hex6notLost <= hex6notLost;
	s_hex7notLost <= hex7notLost;
	
	s_hex0Lost 	  <= hex0Lost;
	s_hex1Lost 	  <= hex1Lost;
	s_hex2Lost 	  <= hex2Lost;
	s_hex3Lost 	  <= hex3Lost;
	s_hex6Lost 	  <= hex6Lost;
	s_hex7Lost 	  <= hex7Lost;
	
	process(sel, s_hex0notLost, s_hex1notLost, s_hex2notLost, s_hex3notLost, s_hex6notLost, s_hex7notLost,
				s_hex0Lost, s_hex1Lost, s_hex2Lost, s_hex3Lost, s_hex6Lost, s_hex7Lost)
	begin
		if(sel = '1') then
			hex0 <= s_hex0Lost;
			hex1 <= s_hex1Lost;
			hex2 <= s_hex2Lost;
			hex3 <= s_hex3Lost;
			hex6 <= s_hex6Lost;
			hex7 <= s_hex7Lost;
		else
			hex0 <= s_hex0notLost;
			hex1 <= s_hex1notLost;
			hex2 <= s_hex2notLost;
			hex3 <= s_hex3notLost;
			hex6 <= s_hex6notLost;
			hex7 <= s_hex7notLost;
		end if;
	end process;
end behav;
			
	
	