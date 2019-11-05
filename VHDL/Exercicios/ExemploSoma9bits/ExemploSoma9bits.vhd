----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:27 08/22/2017 
-- Design Name: 
-- Module Name:    ExemploSoma9bits - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ExemploSoma9bits is
    Port ( a,b : in  unsigned (3 downto 0);
           y : inout  unsigned (4 downto 0);
			  	
			  );
end ExemploSoma9bits;

architecture Behavioral of ExemploSoma9bits is

begin

	y <= ( '0' & a) + b;
	
	--with y select
	
	--				GFEDCBA
	--display <= "1000000" when "0000",
	--			  "0000110" when "0001",
	--			  "0100100" when "0010",
	--			  "0110000" when "0011",
	--			  "0011001" when "0100",
	--			  "0010010" when "0101",
	--			  "0000010" when "0110",
	--			  "1111000" when "0111",
	--			  "0000000" when "1000",
	--			  "0001000" when "1001",
	--			  "0111111" when others;

end Behavioral;

