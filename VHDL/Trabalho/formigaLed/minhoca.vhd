library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity formigaLed is
    Port ( btn : in  STD_LOGIC;
           controle : inout  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
		   display : out  STD_LOGIC_VECTOR (6 downto 0)
			  );
end formigaLed;

architecture Behavioral of formigaLed is
	signal m,c,d,u : STD_LOGIC_VECTOR (6 downto 0);
	type estados is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13);
	signal state : estados;
	signal btn_limpo: std_logic;
	
	component debounce 
    
	Port ( clk : in  STD_LOGIC;
          botao : in  STD_LOGIC;
			 result : inout  STD_LOGIC );			  
	
	end component;
	
begin
	
	u1: debounce port map (clk, btn, btn_limpo);
	
	process(clk)
	
	variable cont_mux : integer range 0 to 400_000; --4ms
	begin
		if rising_edge(clk) then
			if(cont_mux < 400_000) then 
				cont_mux := cont_mux + 1;
				
				
				if cont_mux < 100_000 then 
					controle <= "0111";
					display <= m;
				elsif cont_mux < 200_000 then 
					controle <= "1011";
					display <= c;
				elsif cont_mux < 300_000 then 
					controle <= "1101";
					display <= d;
				else 
					controle <= "1110";
					display <= u;
				end if;
			else 
				cont_mux := 0;
			end if;
		end if;
	end process;
	
	process(clk)
	variable cont : integer range 0 to 21_428_571; 
	begin
		if rising_edge(clk) then
			if (cont < 21_428_571) then
				cont := cont + 1;
			else
				cont := 0;
			case state is
				when  s0 =>
					m <= "1111100";
					c <= "0111101";
					d <= "1111110";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s1;
					else
						state <= s13;
							
					end if;
					
				when  s1 =>
					m <= "1111101";
					c <= "0111101";
					d <= "1111100";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s2;	
					else
						state <= s0;
					end if;
				
				when  s2 =>
					m <= "1111111";
					c <= "0111101";
					d <= "1111100";
					u <= "0111111";
					if btn_limpo = '0' then 
						state <= s3;		
					else
						state <= s1;
					end if;
				
				when  s3 =>
					m <= "1111111";
					c <= "1111101";
					d <= "1111100";
					u <= "0111011";
					if btn_limpo = '0' then 
						state <= s4;		
					else
						state <= s2;
					end if;
					
				when  s4 =>
					m <= "1111111";
					c <= "1111111";
					d <= "1111100";
					u <= "0110011";
					btn_limpo = '0' then 
						state <= s5;		
					else
						state <= s3;
					end if;
					
				when  s5 =>
					m <= "1111111";
					c <= "1111111";
					d <= "1110101";
					u <= "0110011";
					if btn_limpo = '0' then 
						state <= s6;		
					else
						state <= s4;
					end if;
					
				when  s6 =>
					m <= "1111111";
					c <= "1110111";
					d <= "1110111";
					u <= "0110011";
					if btn_limpo = '0' then 
						state <= s7;		
					else
						state <= s5;
					end if;
					
				when  s7 =>
					m <= "1110111";
					c <= "1110111";
					d <= "1110111";
					u <= "1110011";
					if btn_limpo = '0' then 
						state <= s8;		
					else
						state <= s6;
					end if;
					
				when  s8 =>
					m <= "1100111";
					c <= "1110111";
					d <= "1110111";
					u <= "1110111";
					if btn_limpo = '0' then 
						state <= s9;		
					else
						state <= s7;
					end if;
					
				when  s9 =>
					m <= "1000111";
					c <= "1110111";
					d <= "1110111";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s10;		
					else
						state <= s8;
					end if;
					
				when  s10 =>
					m <= "1000110";
					c <= "1110111";
					d <= "1111111";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s11;		
					else
						state <= s9;
					end if;
					
				when  s11 =>
					m <= "1000100";
					c <= "1111111";
					d <= "1111111";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s12;		
					else
						state <= s10;
					end if;
					
				when  s12 =>
					m <= "1001100";
					c <= "0111111";
					d <= "1111111";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s13;		
					else
						state <= s11;
					end if;
					
				when  s13 =>
					m <= "1011100";
					c <= "0111101";
					d <= "1111111";
					u <= "1111111";
					if btn_limpo = '0' then 
						state <= s0;		
					else
						state <= s12;
					end if;
					
			end case;
			end if;
		end if;
	end process;
end Behavioral;

