----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:29 08/31/2017 
-- Design Name: 
-- Module Name:    displayAB - Behavioral 
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

-- Implemente em uma placa nexys um circuito que leia 2 entradas A e B,
-- e mostre no display0 a variável B por 1 segundo e depois mostre no display1
-- a variável A por 1 s, conforme figura abaixo. 

entity displayAB is
    Port ( a : in  integer range 0 to 15;
           b : in  integer range 0 to 15;
			  clk : in STD_LOGIC;
           display : out  STD_LOGIC_VECTOR (6 downto 0);
           controle : inout  STD_LOGIC_VECTOR (3 downto 0);
			  but : inout STD_LOGIC_VECTOR  (2 downto 0);
			  valor : inout integer range 0 to 15;
			  temp : inout integer range 0 to 30
			  ); 
			  
end displayAB;

architecture Behavioral of displayAB is
	
	signal cont_rapido :  integer range 0 to 100000000;
	
	
	
	component disp port (
				numero : in integer range 0 to 15;
				codificado : out std_logic_vector (6 downto 0));
	end component;
	
	
begin

	
	
	temp <= a + b when but (0) = '1' else
			  a - b when but (1) = '1' else
			  (a + b)/2 when but (2) = '1' else
			  0;
			  
	
	
	process (clk)
	begin
	
		if (clk = '1') and (clk'event) then
		
			if cont_rapido < 5000000 then
				cont_rapido <= cont_rapido + 1;
				
				
			else 
				cont_rapido <= 0;	
					if	(controle = "1110") then
							valor <= temp /10;		-- na questão de resto e divisão, aqui valor <= (b/10) ao inves de a;
							controle <= "1101";
					else 
							valor <= temp mod 10;		-- na questão de resto e divisão, aqui valor <= (b mod 10) ao inves de b;
							controle <= "1110";
					end if;
			
			end if;
		end if;
		
	end process;
					
	
		u1 : disp port map (valor, display);

end Behavioral;

