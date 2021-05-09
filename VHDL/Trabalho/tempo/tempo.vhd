library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tempo is
    Port (	btn : in  STD_LOGIC_VECTOR (4 downto 0);
				controle : inout  STD_LOGIC_VECTOR (3 downto 0);
				clk 		: in  STD_LOGIC;
				display 	: out  STD_LOGIC_VECTOR (6 downto 0);
				led 		: inout STD_LOGIC
				);
end tempo;

architecture Behavioral of tempo is
	signal d, c, s1, s2 : integer range 0 to 9;
	signal btn_limpo : STD_LOGIC_VECTOR (4 downto 0);
	signal controlaDisp : integer range 0 to 9;
	
	component debounce
		Port ( 	clk : in  STD_LOGIC;
             	botao : in  STD_LOGIC;
             	result : inout  STD_LOGIC );
	end component;
	
	component debounce2
		Port ( 	clk : in  STD_LOGIC;
             	botao : in  STD_LOGIC;
             	result : inout  STD_LOGIC );
	end component;
	

begin
	u1: debounce port map (clk, btn(0), btn_limpo(0));
	u2: debounce port map (clk, btn(1), btn_limpo(1));
	u3: debounce2 port map (clk, btn(2), btn_limpo(2));
	u4: debounce port map (clk, btn(3), btn_limpo(3));
	u5: debounce port map (clk, btn(4), btn_limpo(4));
	
process(clk, btn_limpo(0), btn_limpo(1), btn_limpo(2), btn_limpo(3), btn_limpo(4))
	variable contc : integer range 0 to 1_000_000;
	variable conts : integer range 0 to 100_000_000;
	
	begin
	if rising_edge(clk) then
		if contc < 1_000_000 then 
				contc := contc + 1;	-- cont para os centésimos de segundo			
		else 
			contc := 0;
--------------------------   BOTÃO A, incrementa 3 segundos em 1 segundo   -------------------------
				if btn_limpo(0) = '1' then
				led <= '0';
					c <= c + 3;
					if c = 9 then
						c <= 0;
						d <= d + 1;
						if d = 9 then
							s1 <= s1 + 1;
							d <= 0;
								if s1 = 9 then
									s1 <= 0;
									s2 <= s2 + 1;
								end if;
						end if;
					end if;
				end if;
				if (s1 = 9 and s2 = 9 and d = 9 and c = 9) then	-- Quando display chega em 9999 ele mantém 9999
					s2 <= 9;
					s1 <= 9;
					d <= 9;
					c <= 9;
				end if;
--------------------------------   BOTÃO C, Decrementa até 0 e liga LED ----------------------------
				if btn_limpo(2) = '1' then
					if c > 0 then
						c <= c - 1;
					else
						if d > 0 then
							c <= 9;
							d <= d - 1;
						else
							if s1 > 0 then
								d <= 9;
								s1 <= s1 - 1;
							else
								if s2 > 0 then
									s1 <= 9;
									s2 <= s2 - 1;
								end if;
							end if;
						end if;
					end if;
						if (s1 = 0 and s2 = 0 and d = 0 and c = 0) then		-- Quando display chega em 0000 ele mantém 0000
							s2 <= 0;
							s1 <= 0;
							d <= 0;
							c <= 0;
							led <= '1'; 	-- Liga o LED
						else 
							led <= '0';
						end if;
				end if;					
		end if;
--------------------------------   BOTÃO E, Incrementa 1 unidade   ----------------------------------
-- bugado 1 segundo 	
	if conts < 100_000_000 then --tempo antigo 50_000_000
		conts := conts + 1;
	else
		conts := 0;
		if btn_limpo(4) = '1' then	
		led <= '0';
				if s1 < 9  then
					s1 <= s1 + 1;
				else
					s1 <= 0;
					s2 <= s2 + 1;
				end if;
				if s1 = 9 and s2 = 9 then
					s1<=9;
					s2<=9;
				end if;
		end if;	
	end if;
	
-----------------------------------   BOTÃO B, Zera tudo e apaga o LED   ---------------------------
		if btn_limpo(1) = '1' then
					s2 <= 0;
					s1 <= 0;
					d <= 0;
					c <= 0;
					led <= '0';
		end if;
---------------------------------   BOTÃO D, Decrementa 1 unidade   --------------------------------
	if conts < 100_000_000 then
		conts := conts + 1;
	else
		conts := 0;
		if btn_limpo(3) = '1' then	
		led <= '0';
				if s1 > 0 then
					s1 <= s1 - 1;
				else
					s1 <= 9;
					s2 <= s2 - 1;
				end if;
				if s1 = 0 and s2 = 0 then
					s1<=0;
					s2<=0;
				end if;
		end if;	
	end if;
	
	end if;
end process;
	
------------------------------ Process para acender os 4 displays ------------------------------	
process(clk)
	variable cont_mux : integer range 0 to 400_000; --4ms
	begin
		if rising_edge(clk) then
			if cont_mux < 400_000 then 
				cont_mux := cont_mux + 1;
				if cont_mux < 100_000 then 
					controle <= "0111";
					controlaDisp <= s2;
				elsif cont_mux < 200_000 then 
					controle <= "1011";
					controlaDisp <= s1;
				elsif cont_mux < 300_000 then 
					controle <= "1101";
					controlaDisp <= d;
				else 
					controle <= "1110";
					controlaDisp <= c;
				end if;
			else 
				cont_mux := 0;
			end if;
		end if;
	end process;
	
------------------------------ Process que cotrola o display ------------------------------	
process(controlaDisp)
	begin
			case controlaDisp is
				when 0 => display <=  "1000000";
				when 1 => display <=  "1111001"; 
				when 2 => display <=  "0100100"; 
				when 3 => display <=  "0110000"; 
				when 4 => display <=  "0011001"; 
				when 5 => display <=  "0010010";
				when 6 => display <=  "0000010";
				when 7 => display <=  "1111000";
				when 8 => display <=  "0000000";
				when others => display <=  "0010000";
			end case;
	end process;
end Behavioral;
