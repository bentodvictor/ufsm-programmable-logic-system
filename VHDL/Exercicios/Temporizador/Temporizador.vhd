----------------------------------------------------------------------------------
-- Company: UFSM
-- Engineer: Keli and Giuliano
-- 
-- Create Date:    09:57:50 09/26/2017 
-- Design Name: 
-- Module Name:    Temporizador - Behavioral 
-- Project Name: 
-- Target Devices: Temporizador com uso de botões
 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Temporizador is
    Port ( 
				clk : in  STD_LOGIC;
  				controle : inout STD_LOGIC_VECTOR (3 downto 0)
			  );
end Temporizador;

architecture Behavioral of Temporizador is

component disp port (
				
				display : out std_logic_vector (6 downto 0));
end component;
signal num : in integer range 0 to 9;
begin

	process(clk)
		variable cont_c, cont_d, cont_s0, cont_s1 : integer range 0 to 1_000_000; -- 10ms
		variable cont_mux : integer range 0 to 400_000; --4ms
		begin 
		--	controle <= "1110";
			if cont_c < 1_000_000 then 
					
					cont_c := cont_c + 1;	-- cont para os centésimos de segundo
			else 
					cont_c := 0;
		--			controle <= "1100"; 
					cont_d := cont_d + 1; -- cont para os décimos de segundo
					
					if cont_d > 900_000 then 
			--			controle <= "1000";
						cont_d := 0;
						cont_s0 := cont_s0 + 1;	-- cont para o primerio display de segundos
						
								if cont_s0 > 900_000 then
			--						controle <= "0000";
									cont_s0 := 0;
									cont_s1 := cont_s1 + 1;	-- cont para o segundo display de segundos
								end if;
					end if;
			end if;
		
			if(cont_mux < 400_000) then 
				cont_mux := cont_mux + 1;
				
				if cont_mux < 100_000 then 
					controle <= "1110";
					num <= cont_c;
				elsif cont_mux < 200_000 then 
					controle <= "1101";
					num <= cont_d;
				elsif cont_mux < 300_000 then 
					controle <= "1011";
					num <= cont_s0;
				else 
					controle <= "0111";
					num <= cont_s1;
				end if;
			else 
				cont_mux := 0;
			end if;
		
	end process;
			
				-- port map do num para ajustar as saidas para o display
				u1 : disp port map (num, display);
end Behavioral;

