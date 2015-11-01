library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux4_1 is
	port(
		sel : in std_logic_vector(1 downto 0);
		hex3: in std_logic_vector(6 downto 0);
		hex2: in std_logic_vector(6 downto 0);
		hex1: in std_logic_vector(6 downto 0);
		hex0: in std_logic_vector(6 downto 0);
		hexOut : out std_logic_vector(6 downto 0);
		compare : out std_logic
	);
end Mux4_1;                  

architecture Behav of Mux4_1 is
begin

	process(sel, hex0, hex1, hex2, hex3)
	begin
		if(sel = "00") then 
			hexOut <= hex0;
		elsif(sel = "01") then 
			hexOut <= hex1;
		elsif(sel = "10") then 
			hexOut <= hex2;
		else 
			hexOut <= hex3;
		end if;
	end process;
end Behav;