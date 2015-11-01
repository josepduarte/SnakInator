-- Recebe sinal do comparador sempre que o pedido de comparação a novo comparador retorna igualdade

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity segment_Saver is
	port(	hexDraft					: in std_logic_vector(6 downto 0); 
			hexPosition			  	: in std_logic_vector(1 downto 0);
			reset 					: in std_logic; 			
			begin_game				: in std_logic; 
			seg_eaten				: in std_logic; 
			newHex					: out std_logic_vector(6 downto 0);
			newHexPosition			: out std_logic_vector(1 downto 0)
			);
end segment_Saver;

architecture Behav of segment_Saver is
begin
	process(reset, begin_game, hexDraft, hexPosition, seg_eaten) 
	begin
			if((reset ='1') and (begin_game = '1')) then 
				newHex <= hexDraft;
				newHexPosition <= hexPosition;
			elsif(reset = '1') then
				newHex <= "1111111"; 
				newHexPosition <= "00";
			elsif(seg_eaten = '1') then
				newHex <= hexDraft;
				newHexPosition <= hexPosition;
			end if;
	end process;
end Behav;