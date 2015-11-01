library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity snakeBrain is 
	port(	
		clk 															: in std_logic;
		sw3, sw2, sw1, sw0										: in std_logic;
		key3,  key2, key1, key0 								: in std_logic;
		hex0, hex1, hex2, hex3, hex4, hex5, hex7, hex6	: out std_logic_vector(6 downto 0)
		
		--TESTES--
		--hex4,hex5,hex6, hex7 : out std_logic_vector(6 downto 0);
		--ledr : out std_logic_vector(3 downto 0)
	);
end snakeBrain;

architecture Strut of snakeBrain is 
	signal clk_1Hz, clk_8Hz, clk_4Hz, clk_2Hz			: std_logic;
	signal s_clk 													: std_logic;
	signal s_finalKey												: std_logic_vector(1 downto 0);
	signal s_lost 													: std_logic;
	signal s_beginGame											: std_logic;
	signal s_key3,s_key2, s_key1, s_key0					: std_logic;
	signal s_hex0, s_hex1, s_hex2, s_hex3					: std_logic_vector(6 downto 0);
	signal s_hexPosition											: std_logic_vector(1 downto 0);
	signal s_hexSeg												: std_logic_vector(6 downto 0);
	signal s_hexDraftFromComparator							: std_logic_vector(6 downto 0);
	signal s_hexDraftFromGenerate								: std_logic_vector(6 downto 0);
	signal s_hexDraftFromSegmentSaver						: std_logic_vector(6 downto 0);
	signal s_hexPositionFromComparator						: std_logic_vector(1 downto 0);
	signal s_hexPositionFromGenerate							: std_logic_vector(1 downto 0);
	signal s_hexPositionFromSegmentSaver					: std_logic_vector(1 downto 0);
	--signal s_realHexForComparator							: std_logic_vector(6 downto 0);
	signal s_segEaten												: std_logic;
	--signal s_signalReady										: std_logic;
	signal s_hexOutFirstMux										: std_logic_vector(6 downto 0);
	signal s_hexOutSecondMux									: std_logic_vector(6 downto 0);
	signal s_uneededCompare										: std_logic;
	signal s_compare												: std_logic;
	signal clk_10Hz												: std_logic;
	signal s_score													: std_logic_vector(7 downto 0);
	signal s_scoreFromBcd6, s_scoreFromBcd7				: std_logic_vector(6 downto 0);
	signal s_scoreFromRegister6, s_scoreFromRegister7	: std_logic_vector(6 downto 0);
	signal s_vectorTime											: std_logic_vector(15 downto 0);
	signal s_timeDisplay0										: std_logic_vector(6 downto 0);
	signal s_timeDisplay1										: std_logic_vector(6 downto 0);
	signal s_timeDisplay2										: std_logic_vector(6 downto 0);
	signal s_timeDisplay3										: std_logic_vector(6 downto 0);
	signal s_timeFromRegister0									: std_logic_vector(6 downto 0);
	signal s_timeFromRegister1									: std_logic_vector(6 downto 0);
	signal s_timeFromRegister2									: std_logic_vector(6 downto 0);
	signal s_timeFromRegister3									: std_logic_vector(6 downto 0);
	signal hex0FromShowResult									: std_logic_vector(6 downto 0);
	signal hex1FromShowResult									: std_logic_vector(6 downto 0);
	signal hex2FromShowResult									: std_logic_vector(6 downto 0);
	signal hex3FromShowResult									: std_logic_vector(6 downto 0);
	
	
begin
	hex4	 <= "1111001";
	hex5 	 <= "0010010";
	s_key3 <= not key3;
	s_key2 <= not key2;
	s_key1 <= not key1;
	s_key0 <= not key0;
	s_beginGame <= s_key3 or s_key2 or s_key1 or s_key0; 

	clkDivider_1Hz : entity work.ClkDividerN(Behavioral) -- 1 seg
		generic map(divFactor => 50000000) 
		port map(reset			 => '0',
					clkIn			 => clk,
					clkOut		 => clk_1Hz);
	
	clkDivider_2Hz : entity work.ClkDividerN(Behavioral) -- 0,5 seg
		generic map(divFactor => 25000000) 
		port map(reset			 => '0',
					clkIn			 => clk,
					clkOut		 => clk_2Hz);
		clkDivider_4Hz : entity work.ClkDividerN(Behavioral) -- 0.25 sec
		generic map(divFactor => 12500000) 
		port map(reset			 => '0',
					clkIn			 => clk,
					clkOut		 => clk_4Hz);
	
	clkDivider_8Hz : entity work.ClkDividerN(Behavioral) -- 0,125 sec
		generic map(divFactor => 6250000) 
		port map(reset			 => '0',
					clkIn			 => clk,
					clkOut		 => clk_8Hz);
					
	clkDivider_10Hz : entity work.ClkDividerN(Behavioral) -- 0,1 seg
		generic map(divFactor => 5000000) 
		port map(reset			 => '0',
					clkIn			 => clk,
					clkOut		 => clk_10Hz);
					
	snakeMovement: entity work.snakeMovement(Behavioral)
		port map(	clk			=> s_clk,
						final_key	=> s_finalKey,
						begin_game 	=> s_beginGame,
						hex0 			=>	s_hex0,
						hex1			=> s_hex1,
						hex2			=> s_hex2,
						hex3 			=> s_hex3,
						lost 			=> s_lost,
						needCompare => s_compare
			);
		
	defineKey : entity work.defineKey(Behav)
		port map(	
				key3			=>	s_key3,
				key2 			=>	s_key2,
				key1			=>	s_key1,
				key0			=>	s_key0,
				final_key 	=> s_finalKey);
								
	defineDifficult : entity work.defineDifficult(Behav)
		port map(	
				sw3			=> sw3,
				sw2			=> sw2,
				sw1			=> sw1,
				sw0			=> sw0,
				clk3			=> clk_8Hz,
				clk2			=> clk_4Hz,
				clk1			=> clk_2Hz,
				clk0			=> clk_1Hz,
				clkOut		=> s_clk);
						
	showResult : entity work.showResult(Behav)
		port map(
			clk_Blink	=> clk_10Hz,
			positionSeg => s_hexPositionFromSegmentSaver,
			inHexSeg		=> s_hexDraftFromSegmentSaver,
			inHex0 		=> s_hex0,
			inHex1		=> s_hex1,
			inHex2 		=> s_hex2,
			inHex3		=>	s_hex3,
			hex0 			=>	hex0FromShowResult,
			hex1			=> hex1FromShowResult,
			hex2			=> hex2FromShowResult,
			hex3 			=> hex3FromShowResult
		);
	generateRandom : entity work.generateRandom(Behavioral)
		port map(
			clk50MHz 	=> clk,
			hexDraft		=> s_hexDraftFromGenerate,
			hexPosition	=> s_hexPositionFromGenerate
		);
	
	comparator 		: entity work.comparator(Behav)
		port map(
		--	notClock50Mhz	=> clk_1Hz,
			beginGame		=> s_beginGame, --????
			hexDraft			=> s_hexDraftFromGenerate,
			hexReal 			=> s_hexOutFirstMux,
			hexPosition		=> s_hexPositionFromGenerate,	
			newHex			=> s_hexDraftFromComparator,
			newHexPosition	=> s_hexPositionFromComparator
		);
		
	segment_saver	: entity work.segment_Saver(Behav)
		port map(
			--clk50MHz 		=> clk,
			hexDraft			=> s_hexDraftFromComparator, 
			hexPosition		=> s_hexPositionFromComparator,
			reset 			=> s_lost,					
			seg_eaten		=> s_segEaten, --
			begin_game		=> s_beginGame,
			--signal_Ready 	=> s_signalReady,
			newHex			=> s_hexDraftFromSegmentSaver,
			newHexPosition => s_hexPositionFromSegmentSaver
		);
		
	mux4_1First			: entity work.Mux4_1(Behav)
		port map(
			sel => s_hexPositionFromgenerate, 
			hex3	=> s_hex3,
			hex2 	=> s_hex2,
			hex1  => s_hex1,			
			hex0  => s_hex0,
			hexOut => s_hexOutFirstMux
		);
	
	mux4_1Second			: entity work.Mux4_1(Behav)
		port map(
			sel => s_hexPositionFromSegmentSaver, 
			hex3	=> s_hex3,
			hex2 	=> s_hex2,
			hex1  => s_hex1,
			hex0  => s_hex0,
			hexOut => s_hexOutSecondMux
		);
		
	posComparator	: entity work.posComparator(Behav)
		port map(
			hexDraft	=> s_hexDraftFromSegmentSaver,
			hexReal 	=> s_hexOutSecondMux,
			compare	=>	s_compare, 
			seg_eaten => s_segEaten
		);
		
	score 		: entity work.score(Behav)
		port map(
			seg_eaten => s_segEaten,
			lost 	 	 => s_lost,
			score		 => s_score
		);
		
	displayScore_d7 : entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_score(7 downto 4),
		   decOut_n	=> s_scoreFromBcd7
		);
		
	displayScore_d6 : entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_score(3 downto 0),
		   decOut_n	=> s_scoreFromBcd6
		);
		
	registe_score : entity work.register_Score(Behav)
		port map(
			lost						=> s_lost,
			hex6Score				=> s_scoreFromBcd6,
			hex7Score				=> s_scoreFromBcd7,
			hex6RegisterScore		=> s_scoreFromRegister6,
			hex7RegisterScore		=> s_scoreFromRegister7
		);
		
	cntMinSS 	: entity work.cntMinSS(Behavioral)
		port map(
			reset		=> s_lost,
			clk		=> clk_1Hz,
			count		=> s_vectorTime
		);
		
	minDisplay3	: entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_vectorTime(15 downto 12),
		   decOut_n	=> s_timeDisplay3
		);
		
	minDisplay2	: entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_vectorTime(11 downto 8),
		   decOut_n	=> s_timeDisplay2
		);
	
	minDisplay1	: entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_vectorTime(7 downto 4),
		   decOut_n	=> s_timeDisplay1
		);
		
	minDisplay0	: entity work.Bin7SegDecoder(Behavioral)
		port map(
			binInput	=> s_vectorTime(3 downto 0),
		   decOut_n	=> s_timeDisplay0
		);
		
	register_time : entity work.register_time(Behav)
		port map(
			lost					=> s_lost,
			hex0Time				=> s_timeDisplay0,
			hex1Time				=> s_timeDisplay1,
			hex2Time				=> s_timeDisplay2,
			hex3Time				=> s_timeDisplay3,							
			hex0RegisterTime	=> s_timeFromRegister0,
			hex1RegisterTime	=> s_timeFromRegister1,
			hex2RegisterTime	=> s_timeFromRegister2,
			hex3RegisterTime	=> s_timeFromRegister3
		);
		
	mux2_1HEX	: entity	work.Mux2_1HEX(behav)
		port map(
			sel 			=> 	s_lost,																							
			hex0notLost	=> 	hex0FromShowResult,
			hex1notLost =>		hex1FromShowResult,
			hex2notLost	=>		hex2FromShowResult,
			hex3notLost =>		hex3FromShowResult,
			hex6notLost	=>		s_scoreFromBcd6,
			hex7notLost =>		s_scoreFromBcd7,
			hex0Lost		=>		s_timeFromRegister0,
			hex1Lost		=>		s_timeFromRegister1,
			hex2Lost		=>		s_timeFromRegister2,
			hex3Lost		=>		s_timeFromRegister3,
			hex6Lost		=>		s_scoreFromRegister6,
			hex7Lost 	=>		s_scoreFromRegister7,				
			hex0			=>    hex0,
			hex1			=>    hex1,
			hex2			=>		hex2,
			hex3			=> 	hex3,
			hex6			=> 	hex6,
			hex7			=> 	hex7
		);
	
	
		
end Strut;
	
	
					
	