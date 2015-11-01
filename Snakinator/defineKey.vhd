library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity defineKey is
	port(
				key3,  key2, key1, key0 	: in std_logic;
				final_key						: out std_logic_vector(1 downto 0));
end defineKey;

architecture Behav of defineKey is
begin
	process(key3, key2, key1, key0)
	begin
		if(key3 = '1') then
			final_key <= "10"; -- esquerda
		elsif(key2 = '1') then
			final_key <= "00"; -- cima
		elsif(key1 = '1') then
			final_key <= "01"; -- baixo
		elsif(key0 = '1') then
			final_key <= "11"; -- direita
		end if;
	end process;
end Behav;