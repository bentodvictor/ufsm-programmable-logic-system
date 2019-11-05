----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:44:42 08/29/2017 
-- Design Name: 
-- Module Name:    disp - Behavioral 
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

entity disp is
    Port ( 	numero : in  integer range 0 to 15;
				codificado : out  STD_LOGIC_VECTOR (6 downto 0));
end disp;

architecture Behavioral of disp is

begin
	
	
	with numero select
		
		codificado <= 	"1000000" when 0,
							"1111001" when 1,
							"0100100" when 2,
							"0110000" when 3,
							"0011001" when 4,
							"0010010" when 5,
							"0000010" when 6,
							"1111000" when 7,
							"0000000" when 8,
							"0010000" when 9,
							"0001000" when 10,
							"0000011" when 11,
							"1000110" when 12,
							"0100001" when 13,
							"0000110" when 14,
							"0001110" when others;
							

end Behavioral;

