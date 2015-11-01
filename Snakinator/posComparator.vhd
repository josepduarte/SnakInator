library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity posComparator is
	port(	hexDraft, hexReal 	: in std_logic_vector(6 downto 0);
			compare					: in std_logic; --definir no snakemovement que quando há alteração de estado fazer nova comparação
			seg_eaten				: out std_logic);
end posComparator;

architecture Behav of posComparator is
	signal s_segEaten : std_logic;
begin
	process(compare, hexDraft, hexReal) 
	begin
		if(compare = '1') then --será que assim o compare está sempre a '1'??
			if(((hexDraft(0) or hexReal(0)) = '0') or ((hexDraft(1) or hexReal(1)) = '0') or ((hexDraft(2) or hexReal(2)) = '0')
			or ((hexDraft(3) or hexReal(3)) = '0') or ((hexDraft(4) or hexReal(4)) = '0') or ((hexDraft(5) or hexReal(5)) = '0')
			or ((hexDraft(6) or hexReal(6)) = '0')) then
				s_segEaten <= '1';	-- será que segEaten permanece demasiado tempo aceso?
			else	
				s_segEaten <= '0';
			end if;
		end if;
	end process;
	
		seg_eaten <= s_segEaten;
			
end Behav;