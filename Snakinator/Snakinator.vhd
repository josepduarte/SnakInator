library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Snakinator is
	port(
		CLOCK_50 : in std_logic;
		SW 	: in std_logic_vector(3 downto 0);
		KEY	: in std_logic_vector(3 downto 0);
		HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 	: out std_logic_vector(6 downto 0));
end Snakinator;

architecture Shell of Snakinator is
begin
	system_core : entity work.snakeBrain(Strut)
		port map(	
			clk 	=> CLOCK_50,
			key3	=> KEY(3),
			key2	=> KEY(2),
			key1	=> KEY(1),
			key0 	=> KEY(0),
			sw3 	=> SW(3),
			sw2	=> SW(2),
			sw1	=> SW(1),
			sw0	=> SW(0),
			hex3 	=> HEX3,
			hex2	=> HEX2,
			hex1	=> HEX1,
			hex0 	=> HEX0,
			hex7	=> HEX7,
			hex6 	=> HEX6,
			hex5  => HEX5,
			hex4	=> HEX4
		);
end Shell;
