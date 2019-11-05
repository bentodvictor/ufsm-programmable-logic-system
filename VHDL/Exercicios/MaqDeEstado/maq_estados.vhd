----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:40:31 09/19/2017 
-- Design Name: 
-- Module Name:    maq_estados - Behavioral 
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


entity maq_estados is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0);
			  controle: inout  STD_LOGIC_VECTOR (3 downto 0)
			  );
end maq_estados;

architecture Behavioral of maq_estados is
	type estados is (s0,s1,s2,s3,s4,s5);
	signal state : estados;
begin
	
	controle <= "1110";
	
	process(clk)
		variable cont : integer range 0 to 9_000_000;
	begin
		if rising_edge(clk) then
			if cont < 9_000_000
			then cont := cont + 1;
			else cont := 0;
			
				case state is
				when  s0 =>
					if btn = '1' then 
						state <= s1; 
					else
						state <= s5; 
					end if;
				when  s1 =>
					if btn = '1' then 
						state <= s2;
					else
						state <= s0;
					end if;
				when  s2 =>
					if btn = '1' then 
						state <= s3;
					else
						state <= s1;
					end if;
				when  s3 =>
					if btn = '1' then 
						state <= s4;
					else
						state <= s2;
					end if;
				when  s4 =>
					if btn = '1' then 
						state <= s5;
					else
						state <= s3;
					end if;
				when  others =>
					if btn = '1' then 
						state <= s0;
					else
						state <= s4;
					end if;
				end case;
			end if;
		end if;
		end process;
		
		with state select 
			display <= 	"1111110" when s0,
							"1111101" when s1,
							"1111011" when s2,
							"1110111" when s3,
							"1101111" when s4,
							"1011111" when others;
end Behavioral;

