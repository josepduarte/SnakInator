library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity score is 
	port(
			seg_eaten : in std_logic;
			lost 	 	 : in std_logic;
			score		 : out std_logic_vector(7 downto 0)
			);
end score;

architecture Behav of Score is
	signal s_count : unsigned(7 downto 0) := "00000000";
begin
	process(seg_eaten, lost)
		begin
		if(lost = '1') then
			s_count <= (others => '0');
		elsif (rising_edge(seg_eaten)) then
			if (s_count(3 downto 0) = "1001") then
				s_count(3 downto 0) <= "0000";
				if (s_count(7 downto 4) = "1001") then
					s_count(7 downto 4) <= "0000";
				else
					s_count(7 downto 4) <= s_count(7 downto 4) + 1;
				end if;
			else
				s_count(3 downto 0) <= s_count(3 downto 0) + 1;
			end if;
		end if;
	end process;

	score <= std_logic_vector(s_count);
end Behav;