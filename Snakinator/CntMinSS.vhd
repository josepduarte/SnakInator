library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CntMinSS is
	port(reset		: in  std_logic;  -- lost 
		  clk			: in  std_logic;	-- clk 1 Hz
		  count		: out std_logic_vector(15 downto 0));
end CntMinSS;

architecture Behavioral of CntMinSS is

	signal s_count : unsigned(15 downto 0);

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_count <= (others => '0');
				elsif (s_count(3 downto 0) = "1001") then
					s_count(3 downto 0) <= "0000";
					if (s_count(7 downto 4) = "0101") then
						s_count(7 downto 4) <= "0000";
						if (s_count(11 downto 8) = "1001") then
							s_count(11 downto 8) <= "0000";
							if (s_count(15 downto 12) = "1001") then
								s_count(15 downto 12) <= "0000";
							else
								s_count(15 downto 12) <= s_count(15 downto 12) + 1;
							end if;
						else
							s_count(11 downto 8) <= s_count(11 downto 8) + 1;
						end if;
					else
						s_count(7 downto 4) <= s_count(7 downto 4) + 1;
					end if;
				else
					s_count(3 downto 0) <= s_count(3 downto 0) + 1;
				end if;
		end if;
	end process;

	count <= std_logic_vector(s_count);
end Behavioral;
