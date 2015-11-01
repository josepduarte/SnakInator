library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SnakeMovement is
	port(	
			clk 							: in std_logic;
			final_key 					: in std_logic_vector(1 downto 0);
			begin_game 					: in std_logic;
			hex0, hex1, hex2, hex3	: out std_logic_vector(6 downto 0);
			lost 		  					: out std_logic;
			needCompare					: out std_logic);			
end SnakeMovement;

architecture Behavioral of SnakeMovement is
	type TState is (TInit, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23, S24,
								  S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, S41, S42, S43, S44, S45, S46, S47, S48,
								  S49, S50, S51, S52, S53, S54, S55, S56, S57, S58, S59, S60, S61, S62, S63, S64, S65, S66, S67, S68, S69, S70, S71, S72,
								  S73, S74, S75, S76, S77, S78, S79, S80, S81, S82, S83, S84, S85, S86, S87, S88, S89, S90, S91, S92, S93, S94, S95, S96,
								  S97, S98, S99, S100, S101, S102, S103, S104, S105, S106, S107, S108, S109, S110, S111, S112, S113, S114, S115, S116, 
								  S117, S118, S119, S120, S121, S122);
	signal s_currentState, s_nextState : Tstate := TInit;
	signal s_stateChanged : std_logic;
begin 
	sync_proc : process(clk)
	begin 
		if(rising_edge(clk)) then
			if(s_currentState /= s_nextState) then
				s_stateChanged <= '1';
			else	
				s_stateChanged <= '0';
			end if;
			s_currentState <= s_nextState;
		end if;
	
	end process;
	needCompare <= s_stateChanged;
	
	
	comb_proc : process(s_currentState, final_key, begin_game)
	begin
		case (s_currentState) is
			when TInit =>
				hex0 <= "1111111";
				hex1 <= "1111111"; 
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '1';
				if(begin_game = '1') then
					s_nextState <= S109;
				else
					s_nextState <= TInit;
				end if;
				
			when S1 =>
				hex0 <= "0111101";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S3;
					else
						s_nextState <= TInit;
					end if;
			
			when S2=>
				hex0 <= "0011111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";  
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S1;
					elsif(final_key = "01") then
						s_nextState <= S6;
					else
						s_nextState <= TInit;
					end if;
			
			when S3=>
				hex0 <= "1111100";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S4;
					else
						s_nextState <= S92;
					end if;
			
			when S4=>
				hex0 <= "1011110";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S86;
					elsif(final_key = "11") then
						s_nextState <= S2;
					else
						s_nextState <= S19;
					end if;
				
			when S5=>
				hex0 <= "0101111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S88;
					elsif(final_key = "11") then
						s_nextState <= S7;
					else
						s_nextState <= TInit;
					end if;
				
			when S6=>
				hex0 <= "0111011";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S12;
					elsif(final_key = "01") then
						s_nextState <= S5;
					else
						s_nextState <= S93;
					end if;
				
			when S7=>
				hex0 <= "1100111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S8;
					else
						s_nextState <= TInit;
					end if;
				
			when S8=>
				hex0 <= "1110011";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S6;
					elsif(final_key = "11") then
						s_nextState <= TInit;
					else
						s_nextState <= S10;
					end if;
				
			when S9=>
				hex0 <= "1001111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S90;
					elsif(final_key = "11") then
						s_nextState <= S14;
					else
						s_nextState <= TInit;
					end if;
				
			when S10=>
				hex0 <= "1111001";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S3;
					else
						s_nextState <= TInit;
					end if;
				
			when S11=>
				hex0 <= "0111101";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S12;
					elsif(final_key = "01") then
						s_nextState <= S5;
					else
						s_nextState <= S93;
					end if;
				
			when S12=>
				hex0 <= "0011111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S90;
					elsif(final_key = "11") then
						s_nextState <= S14;
					else
						s_nextState <= TInit;
					end if;
				
			when S13=>
				hex0 <= "1111100";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S11;
					elsif(final_key = "11") then
						s_nextState <= TInit;
					else
						s_nextState <= S20;
					end if;
				
			when S14=>
				hex0 <= "1011110";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S13;
					else
						s_nextState <= TInit;
					end if;
				
			when S15=>
				hex0 <= "0101111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S1;
					elsif(final_key = "01") then
						s_nextState <= S16;
					else
						s_nextState <= TInit;
					end if;
				
			when S16 =>
				hex0 <= "0111011";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S18;
					else
						s_nextState <= TInit;
					end if;
				
			when S17=>
				hex0 <= "1100111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S87;
					elsif(final_key = "11") then
						s_nextState <= S15;
					else
						s_nextState <= S9;
					end if;
				
			when S18 =>
				hex0 <= "1110011";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S17;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S94;
					end if;
				
			when S19=>
				hex0 <= "1001111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S88;
					elsif(final_key = "11") then
						s_nextState <= S7;
					else
						s_nextState <= TInit;
					end if;
				
			when S20=>
				hex0 <= "1111001";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S18;
					else
						s_nextState <= TInit;
					end if;
					
			when S21=>
				hex0 <= "1111111";
				hex1 <= "0111101";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S23;
					elsif(final_key = "11") then
						s_nextState <= S91;
					else
						s_nextState <= TInit;
					end if;
						
			when S22=>
				hex0 <= "1111111";
				hex1 <= "0011111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S21;
					elsif(final_key = "01") then
						s_nextState <= S36;
					else
						s_nextState <= S82;
					end if;
				
			when S23=>
				hex0 <= "1111111";
				hex1 <= "1111100";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S24;
					else
						s_nextState <= S106;
					end if;
				
			when S24=>
				hex0 <= "1111111";
				hex1 <= "1011110";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S100;
					elsif(final_key = "11") then
						s_nextState <= S22;
					else
						s_nextState <= S39;
					end if;
				
			when S25=> 
				hex0 <= "1111111";
				hex1 <= "0101111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S102;
					elsif(final_key = "11") then
						s_nextState <= S27;
					else
						s_nextState <= TInit;
					end if;
				
			when S26 =>
				hex0 <= "1111111";
				hex1 <= "0111011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S32;
					elsif(final_key = "01") then
						s_nextState <= S25;
					else
						s_nextState <= S107;
					end if;
				
			when S27=>
				hex0 <= "1111111";
				hex1 <= "1100111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S28;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S83;
					end if;
				
			when S28 =>
				hex0 <= "1111111";
				hex1 <= "1110011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S26;
					elsif(final_key = "11") then
						s_nextState <= S98;
					else
						s_nextState <= S30;
					end if;
				
			when S29=>
				hex0 <= "1111111";
				hex1 <= "1001111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S104;
					elsif(final_key = "11") then
						s_nextState <= S34;
					else
						s_nextState <= TInit;
					end if;
				
			when S30=>
				hex0 <= "1111111";
				hex1 <= "1111001";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S23;
					elsif(final_key = "11") then
						s_nextState <= S91;
					else
						s_nextState <= TInit;
					end if;
					
			when S31=>
				hex0 <= "1111111";
				hex1 <= "0111101";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S32;
					elsif(final_key = "01") then
						s_nextState <= S25;
					else
						s_nextState <= S107;
					end if;
				
			when S32=> 
				hex0 <= "1111111";
				hex1 <= "0011111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S104;
					elsif(final_key = "11") then
						s_nextState <= S34;
					else
						s_nextState <= TInit;
					end if;
				
			when S33=> 
				hex0 <= "1111111";
				hex1 <= "1111100";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S31;
					elsif(final_key = "11") then
						s_nextState <= S85;
					else
						s_nextState <= S40;
					end if;
				
			when S34=>
				hex0 <= "1111111";
				hex1 <= "1011110";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S33;
					else
						s_nextState <= S81;
					end if;
				
			when S35=>
				hex0 <= "1111111";
				hex1 <= "0101111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S21;
					elsif(final_key = "01") then
						s_nextState <= S36;
					else
						s_nextState <= S82;
					end if;
				
			when S36 =>
				hex0 <= "1111111";
				hex1 <= "0111011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S38;
					elsif(final_key = "11") then
						s_nextState <= S89;
					else
						s_nextState <= TInit;
					end if;
				
			when S37=>
				hex0 <= "1111111";
				hex1 <= "1100111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S101;
					elsif(final_key = "11") then
						s_nextState <= S35;
					else
						s_nextState <= S29;
					end if;
				
			when S38 =>
				hex0 <= "1111111";
				hex1 <= "1110011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S37;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S108;
					end if;
				
			when S39=>
				hex0 <= "1111111";
				hex1 <= "1001111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S102;
					elsif(final_key = "11") then
						s_nextState <= S27;
					else
						s_nextState <= TInit;
					end if;
				
			when S40=>
				hex0 <= "1111111";
				hex1 <= "1111001";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S38;
					elsif(final_key = "11") then
						s_nextState <= S89;
					else
						s_nextState <= TInit;
					end if;
					
			when S41=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111101";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S43;
					elsif(final_key = "11") then
						s_nextState <= S105;
					else
						s_nextState <= TInit;
					end if;
						
			when S42=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0011111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S41;
					elsif(final_key = "01") then
						s_nextState <= S56;
					else
						s_nextState <= S96;
					end if;
				
			when S43=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111100";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S44;
					else
						s_nextState <= S120;
					end if;
				
			when S44=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1011110";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S114;
					elsif(final_key = "11") then
						s_nextState <= S42;
					else
						s_nextState <= S59;
					end if;
				
			when S45=> 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0101111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S116;
					elsif(final_key = "11") then
						s_nextState <= S47;
					else
						s_nextState <= TInit;
					end if;
				
			when S46 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S52;
					elsif(final_key = "01") then
						s_nextState <= S45;
					else
						s_nextState <= S121;
					end if;
				
			when S47=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1100111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S48;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S97;
					end if;
				
			when S48 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S56;
					elsif(final_key = "11") then
						s_nextState <= S98;
					else
						s_nextState <= S50;
					end if;
				
			when S49=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1001111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S118;
					elsif(final_key = "11") then
						s_nextState <= S54;
					else
						s_nextState <= TInit;
					end if;
				
			when S50=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111001";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S43;
					elsif(final_key = "11") then
						s_nextState <= S105;
					else
						s_nextState <= TInit;
					end if;
						
			when S51=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111101";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S52;
					elsif(final_key = "01") then
						s_nextState <= S45;
					else
						s_nextState <= S121;
					end if;
				
			when S52=> 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0011111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S118;
					elsif(final_key = "11") then
						s_nextState <= S54;
					else
						s_nextState <= TInit;
					end if;
				
			when S53=> 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111100";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S51;
					elsif(final_key = "11") then
						s_nextState <= S99;
					else
						s_nextState <= S60;
					end if;
				
			when S54=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1011110";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S53;
					else
						s_nextState <= S95;
					end if;
				
			when S55=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0101111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S41;
					elsif(final_key = "01") then
						s_nextState <= S56;
					else
						s_nextState <= S96;
					end if;
				
			when S56 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S58;
					elsif(final_key = "11") then
						s_nextState <= S103;
					else
						s_nextState <= TInit;
					end if;
				
			when S57=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1100111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S115;
					elsif(final_key = "11") then
						s_nextState <= S55;
					else
						s_nextState <= S49;
					end if;
				
			when S58 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S57;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S122;
					end if;
				
			when S59=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1001111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S116;
					elsif(final_key = "11") then
						s_nextState <= S47;
					else
						s_nextState <= TInit;
					end if;
				
			when S60=>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111001";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S58;
					elsif(final_key = "11") then
						s_nextState <= S103;
					else
						s_nextState <= TInit;
					end if;
					
			when S61 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0111101";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S63;
					elsif(final_key = "11") then
						s_nextState <= S119;
					else
						s_nextState <= TInit;
					end if;

			when S62 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0011111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S61;
					elsif(final_key = "01") then
						s_nextState <= S76;
					else
						s_nextState <= S110;
					end if;
				
			when S63 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111100";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S64;
					else
						s_nextState <= TInit;
					end if;
				
			when S64 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1011110";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= TInit;
					elsif(final_key = "11") then
						s_nextState <= S62;
					else
						s_nextState <= S79;
					end if;
				
			when S65 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0101111";
				lost <= '0';
					if(final_key = "11") then
						s_nextState <= S67;
					else
						s_nextState <= TInit;
					end if;
				
			when S66 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0111011";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S72;
					elsif(final_key = "01") then
						s_nextState <= S65;
					else
						s_nextState <= TInit;
					end if;
				
			when S67 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1100111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S68;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S111;
					end if;
				
			when S68 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1110011";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S66;
					elsif(final_key = "11") then
						s_nextState <= S112;
					else
						s_nextState <= S70;
					end if;
				
			when S69 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1001111";
				lost <= '0';
					if(final_key = "11") then
						s_nextState <= S74;
					else
						s_nextState <= TInit;
					end if;
				
			when S70 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111001";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S63;
					elsif(final_key = "11") then
						s_nextState <= S119;
					else
						s_nextState <= TInit;
					end if;
				
			when S71 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0111101";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S72;
					elsif(final_key = "01") then
						s_nextState <= S65;
					else
						s_nextState <= TInit;
					end if;

			when S72 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0011111";
				lost <= '0';
					if(final_key = "11") then
						s_nextState <= S74;
					else
						s_nextState <= TInit;
					end if;
				
			when S73 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111100";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S71;
					elsif(final_key = "11") then
						s_nextState <= S113;
					else
						s_nextState <= S80;
					end if;
				
			when S74 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1011110";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S73;
					else
						s_nextState <= S109;
					end if;
				
			when S75 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0101111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S61;
					elsif(final_key = "01") then
						s_nextState <= S76;
					else
						s_nextState <= S110;
					end if;
				
			when S76 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "0111011";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S78;
					elsif(final_key = "11") then
						s_nextState <= S117;
					else
						s_nextState <= TInit;
					end if;
				
			when S77 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1100111";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= TInit;
					elsif(final_key = "11") then
						s_nextState <= S75;
					else
						s_nextState <= S79;
					end if;
				
			when S78 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1110011";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S77;
					else
						s_nextState <= TInit;
					end if;
				
			when S79 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1001111";
				lost <= '0';
					if(final_key = "11") then
						s_nextState <= S74;
					else
						s_nextState <= TInit;
					end if;
				
			when S80 =>
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111111";
				hex3 <= "1111001";
				lost <= '0';
					if(final_key = "10") then
						s_nextState <= S78;
					elsif(final_key = "11") then
						s_nextState <= S117;
					else
						s_nextState <= TInit;
					end if;
				
			when S81 => 
				hex0 <= "1111110";
				hex1 <= "1111110";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S13;
					else
						s_nextState <= TInit;
					end if;
				
			when S82 =>
				hex0 <= "0111111";
				hex1 <= "0111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S1;
					elsif(final_key = "01") then
						s_nextState <= S16;
					else
						s_nextState <= TInit;
					end if;
				
			when S83 =>
				hex0 <= "1110111";
				hex1 <= "1110111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S8;
					else
						s_nextState <= TInit;
					end if;
			
			when S84 =>
				hex0 <= "0111111";
				hex1 <= "1111011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S1;
					elsif(final_key = "01") then
						s_nextState <= S16;
					else
						s_nextState <= TInit;
					end if;
				
			when S85 =>
				hex0 <= "0111111";
				hex1 <= "1111101";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S1;
					elsif(final_key = "01") then
						s_nextState <= S16;
					else
						s_nextState <= TInit;
					end if;
				
			when S86 =>
				hex0 <= "1011111";
				hex1 <= "0111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S32;
					elsif(final_key = "01") then
						s_nextState <= S25;
					else
						s_nextState <= S107;
					end if;
				
			when S87 =>
				hex0 <= "1101111";
				hex1 <= "0111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S32;
					elsif(final_key = "01") then
						s_nextState <= S25;
					else
						s_nextState <= S107;
					end if;
				
		when S88 =>
				hex0 <= "1101111";
				hex1 <= "1110111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S37;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S108;
					end if;
				
			when S89 =>
				hex0 <= "1110111";
				hex1 <= "1111011";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S8;
					else
						s_nextState <= TInit;
					end if;
				
			when S90 =>
				hex0 <= "1011111";
				hex1 <= "1111110";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S24;
					else
						s_nextState <= S106;
					end if;

			when S91 =>
				hex0 <= "1111110";
				hex1 <= "1111101";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S13;
					else
						s_nextState <= TInit;
					end if;
				
			when S92 =>
				hex0 <= "1111110";
				hex1 <= "1111110";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S24;
					else
						s_nextState <= S106;
					end if;
				
			when S93 =>
				hex0 <= "0111111";
				hex1 <= "0111111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S32;
					elsif(final_key = "01") then
						s_nextState <= S25;
					else
						s_nextState <= S107;
					end if;
				
			when S94 =>
				hex0 <= "1110111";
				hex1 <= "1110111";
				hex2 <= "1111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S37;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S108;
					end if;
								
			when S95 => --
				hex0 <= "1111111";
				hex1 <= "1111110";
				hex2 <= "1111110";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S33;
					else
						s_nextState <= S81;
					end if;
							
			when S96 => --
				hex0 <= "1111111";
				hex1 <= "0111111";
				hex2 <= "0111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S21;
					elsif(final_key = "01") then
						s_nextState <= S36;
					else
						s_nextState <= S82;
					end if;
								
			when S97 => 
				hex0 <= "1111111";
				hex1 <= "1110111";
				hex2 <= "1110111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S28;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S83;
					end if;
							
			when S98 => 
				hex0 <= "1111111";
				hex1 <= "0111111";
				hex2 <= "1111011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S21;
					elsif(final_key = "01") then
						s_nextState <= S36;
					else
						s_nextState <= S82;
					end if;
				
			when S99 =>
				hex0 <= "1111111";
				hex1 <= "0111111";
				hex2 <= "1111101";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S21;
					elsif(final_key = "01") then
						s_nextState <= S36;
					else
						s_nextState <= S82;
					end if;
				
			when S100 =>
				hex0 <= "1111111";
				hex1 <= "1011111";
				hex2 <= "0111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S52;
					elsif(final_key = "01") then
						s_nextState <= S45;
					else
						s_nextState <= S121;
					end if;
				
			when S101 => 
				hex0 <= "1111111";
				hex1 <= "1101111";
				hex2 <= "0111111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S52;
					elsif(final_key = "01") then
						s_nextState <= S45;
					else
						s_nextState <= S121;
					end if;
				
				when S102 =>
				hex0 <= "1111111";
				hex1 <= "1101111";
				hex2 <= "1110111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S57;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S122;
					end if;
				
			when S103 => --
				hex0 <= "1111111";
				hex1 <= "1110111";
				hex2 <= "1111011";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S28;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S83;
					end if;
				
			when S104 => 
				hex0 <= "1111111";
				hex1 <= "1011111";
				hex2 <= "1111110";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S44;
					else
						s_nextState <= S120;
					end if;
				
			when S105 =>
				hex0 <= "1111111";
				hex1 <= "1111110";
				hex2 <= "1111101";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S33;
					else
						s_nextState <= S81;
					end if;
				
			when S106 =>
				hex0 <= "1111111";
				hex1 <= "1111110";
				hex2 <= "1111110";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S44;
					else
						s_nextState <= S120;
					end if;
				
			when S107 =>
					hex0 <= "1111111";
					hex1 <= "0111111";
					hex2 <= "0111111";
					hex3 <= "1111111";
						if(final_key = "00") then
							s_nextState <= S52;
						elsif(final_key = "01") then
							s_nextState <= S45;
						else
							s_nextState <= S121;
						end if;
				
			when S108 =>
				hex0 <= "1111111";
				hex1 <= "1110111";
				hex2 <= "1110111";
				hex3 <= "1111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S57;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S122;
					end if;
				
			when S109 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111110";
				hex3 <= "1111110";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					elsif(final_key = "01") then
						s_nextState <= S53;
					
					else
						s_nextState <= S95;
					end if;
				
			when S110 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111111";
				hex3 <= "0111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S41;
					elsif(final_key = "01") then
						s_nextState <= S56;
					else
						s_nextState <= S96;
					end if;
				
			when S111 => ----------------------------------------------- lost 1   -------------------------------------------
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110111";
				hex3 <= "1110111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S48;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					lost <= '1';
					elsif(final_key = "10") then
						s_nextState <= S97;
					lost <= '1';
					elsif(final_key = "11") then
						s_nextState <= S97;
					lost <= '1';
					else
						s_nextState <= S97;
					lost <= '1';
					end if;
			
			when S112 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111111";
				hex3 <= "1111011";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S41;
					elsif(final_key = "01") then
						s_nextState <= S56;
					else
						s_nextState <= S96;
					end if;
				
			when S113 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111111";
				hex3 <= "1111101";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S41;
					elsif(final_key = "01") then
						s_nextState <= S56;
					else
						s_nextState <= S96;
					end if;
				
			when S114 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110111";
				hex3 <= "1110111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S62;
					elsif(final_key = "01") then
						s_nextState <= S75;
					else
						s_nextState <= TInit;
					end if;
				
			when S115 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1101111";
				hex3 <= "0111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S72;
					elsif(final_key = "01") then
						s_nextState <= S65;
					else
						s_nextState <= TInit;
					end if;
				
			when S116 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1101111";
				hex3 <= "1110111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S77;
					else
						s_nextState <= TInit;
					end if;
				
			when S117 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110111";
				hex3 <= "1111011";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S48;
					elsif(final_key = "01") then
						s_nextState <= TInit;
					else
						s_nextState <= S111;
					end if;
				
			when S118 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1011111";
				hex3 <= "1111110";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S64;
					else
						s_nextState <= TInit;
					end if;
				
			when S119 => ----------------------------------------------- lost 1   -------------------------------------------
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111110";
				hex3 <= "1111101";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= TInit;
					lost <= '1'; 
					elsif(final_key = "01") then
						s_nextState <= S53;
					else
						s_nextState <= S95;
					end if;
				
			when S120 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1111110";
				hex3 <= "1111110";
				lost <= '0';
					if(final_key = "01") then
						s_nextState <= S64;
					else 
						s_nextState <= TInit;
					end if;
				
			when S121 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "0111111";
				hex3 <= "0111111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S72;
					elsif(final_key = "01") then
						s_nextState <= S65;
					else
						s_nextState <= TInit;
					end if;
				
			when S122 => 
				hex0 <= "1111111";
				hex1 <= "1111111";
				hex2 <= "1110111";
				hex3 <= "1110111";
				lost <= '0';
					if(final_key = "00") then
						s_nextState <= S77;
					else
						s_nextState <= Tinit;
					end if;
				
				
		end case;
	end process;
end Behavioral;