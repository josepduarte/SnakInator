library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity comparator is
	port(	beginGame				: in std_logic;  
			hexDraft, hexReal 	: in std_logic_vector(6 downto 0);
			hexPosition			  	: in std_logic_vector(1 downto 0);
			newHex				  	: out std_logic_vector(6 downto 0);
			newHexPosition			: out std_logic_vector(1 downto 0));
end comparator;

architecture Behav of comparator is
	signal s_hexPosition : std_logic_vector(1 downto 0);
begin 	
	comp : process(hexDraft, hexReal, hexPosition, s_hexPosition)
	begin
		if(beginGame = '1') then 
			if((hexDraft(0) = '0' and hexReal(0) = '0') or (hexDraft(1) = '0' and hexReal(1) = '0') or (hexDraft(2) = '0' and hexReal(2) = '0')
			or (hexDraft(3) = '0' and hexReal(3) = '0') or (hexDraft(4) = '0' and hexReal(4) = '0') or (hexDraft(5) = '0' and hexReal(5) = '0')
			or (hexDraft(6) = '0' and hexReal(6) = '0')) then
				if(hexPosition = "00") then
					s_hexPosition <= "10";
				elsif(hexPosition = "01") then
					s_hexPosition <= "11";
				elsif(hexPosition = "10") then
					s_hexPosition <= "00";
				else
					s_hexPosition <= "01";
				end if;
			else
				s_hexPosition <= hexPosition;
			end if;
		end if;
		newHexPosition <= s_hexPosition;
		newHex <= hexDraft;
	end process;
	
end Behav;
			
			