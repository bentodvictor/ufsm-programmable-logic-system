----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:23:53 09/25/2017 
-- Design Name: 
-- Module Name:    formigaLed - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity formigaLed is
    Port ( btn : in  STD_LOGIC;
           controle : inout  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  display : out  STD_LOGIC_VECTOR (6 downto 0)
			  );
end formigaLed;

architecture Behavioral of formigaLed is
	signal m,c,d,u : STD_LOGIC_VECTOR (6 downto 0);
	type estados is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11);
	signal state : estados;
	
begin
	
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
	variable cont : integer range 0 to 20_000_000; --2000ms -> 2s
	begin
		if rising_edge(clk) then
			if (cont < 20_000_000) then
				cont := cont + 1;
			else
				cont := 0;
			case state is
				when  s0 =>
					if btn = '1' then 
							state <= s1;
							m <= "1111111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111110";
							
					else
							state <= s1;
							m <= "1000110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110001";
					end if;
					
				when  s1 =>
					if btn = '1' then 
							state <= s2;
							m <= "1111111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111101";
							
					else
							state <= s2;
							m <= "1000110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110010";
					end if;
				
				when  s2 =>
					if btn = '1' then 
							state <= s3;
							m <= "1111111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111011";
							
					else
							state <= s3;
							m <= "1000110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110100";
					end if;
				
				when  s3 =>
					if btn = '1' then 
							state <= s4;
							m <= "1111111";
							c <= "1111111";
							d <= "1111111";
							u <= "1110111";
							
					else
							state <= s4;
							m <= "1000110";
							c <= "1110110";
							d <= "1110110";
							u <= "1111000";
					end if;
				when  s4 =>
					if btn = '1' then 
							state <= s5;
							m <= "1111111";
							c <= "1111111";
							d <= "1110111";
							u <= "1111111";
							
					else
							state <= s5;
							m <= "1000110";
							c <= "1110110";
							d <= "1111110";
							u <= "1110000";
					end if;
					when  s5 =>
					if btn = '1' then 
							state <= s6;
							m <= "1111111";
							c <= "1110111";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s6;
							m <= "1000110";
							c <= "1111110";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s6 =>
					if btn = '1' then 
							state <= s7;
							m <= "1110111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s7;
							m <= "1001110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s7 =>
					if btn = '1' then 
							state <= s8;
							m <= "1101111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s8;
							m <= "1010110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s8 =>
					if btn = '1' then 
							state <= s9;
							m <= "1011111";
							c <= "1111111";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s9;
							m <= "1100110";
							c <= "1110110";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s9 =>
					if btn = '1' then 
							state <= s10;
							m <= "1111110";
							c <= "1111111";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s10;
							m <= "1000111";
							c <= "1110110";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s10 =>
					if btn = '1' then 
							state <= s11;
							m <= "1111111";
							c <= "1111110";
							d <= "1111111";
							u <= "1111111";
							
					else
							state <= s11;
							m <= "1000110";
							c <= "1110111";
							d <= "1110110";
							u <= "1110000";
					end if;
					when  s11 =>
					if btn = '1' then 
							state <= s0;
							m <= "1111111";
							c <= "1111111";
							d <= "1111110";
							u <= "1111111";
							
					else
							state <= s0;
							m <= "1000110";
							c <= "1110110";
							d <= "1110111";
							u <= "1110000";
					end if;
				end case;
			end if;
			end if;
		end process;
end Behavioral;

