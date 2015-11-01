library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity generateRandom is
	port(	clk50MHz 	: in std_logic;
			hexDraft		: out std_logic_vector(6 downto 0);
			hexPosition : out std_logic_vector(1 downto 0)
	);
end generateRandom;

architecture Behavioral of generateRandom is
	signal s_counterDraft : unsigned(2 downto 0)	:= "000"; 
	signal s_counterPosition : unsigned(1 downto 0):= "00"; 
begin
	counter : process(clk50MHz) 
	begin
		if(rising_edge(clk50MHz)) then
			if(s_counterDraft = "110") then
				s_counterDraft <= "000";
			else
				s_counterDraft <= s_counterDraft + 1;
			end if;
			s_counterPosition <= s_counterPosition + 1;
		end if;
	end process;
		
	hexPosition <= std_logic_vector(s_counterPosition);
	
	defineDisplay : process(s_counterDraft)
	begin
		if(s_counterDraft = "000") then
			hexDraft <= "0111111";
		elsif(s_counterDraft = "001") then
			hexDraft <= "1011111";
		elsif(s_counterDraft = "010") then
			hexDraft <= "1101111";
		elsif(s_counterDraft = "011") then
			hexDraft <= "1110111";
		elsif(s_counterDraft = "100") then
			hexDraft <= "1111011";
		elsif(s_counterDraft = "101") then
			hexDraft <= "1111101";
		elsif(s_counterDraft = "110") then
			hexDraft <= "1111110";
		else
			hexDraft <= "1110111"; 
		end if;
	end process;
end Behavioral;