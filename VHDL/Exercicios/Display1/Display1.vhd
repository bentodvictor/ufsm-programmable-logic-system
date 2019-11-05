----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:40:52 08/24/2017 
-- Design Name: 
-- Module Name:    Display1 - Behavioral 
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

entity Display1 is
    Port ( cont : inout  integer range 0 to 7;
           clk : in  STD_LOGIC;
			  display : out bit_vector (6 downto 0);
			  controle : out bit_vector (3 downto 0));
			  
end Display1;

architecture Behavioral of Display1 is

	signal cont_rapido : integer range 0 to 50000000;
	signal clock_lento : std_logic;

begin
-- quero pegar a borda, então uso o process
	with cont select
		display <= 	"1000000" when 0,
						"1111001" when 1,
						"0100100" when 2,
						"0110000" when 3,
						"0011001" when 4,
						"0010010" when 5,
						"0000010" when 6,
						"0111111" when others;
		--controle <= "1110";
	with cont select
		controle <= 	"1110" when 0,
						"1101" when 1,
						"1011" when 2,
						"0111" when 3,
						"1110" when 4,
						"1101" when 5,
						"1011" when 6,
						"0111" when 7;
						
						
	process (clk)
	begin
	
		if (clk = '1') and (clk'event) then
		
			if cont_rapido < 50000000 then
				cont_rapido <= cont_rapido + 1;
				
				
			else 
			cont_rapido <= 0;			
				if cont < 7 then 
					cont <= cont + 1;
					
				else cont <= 0;
				end if;
			
			end if;
		end if;
		
	end process;
	
	
end Behavioral;
