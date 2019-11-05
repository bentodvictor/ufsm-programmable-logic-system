----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:00 08/29/2017 
-- Design Name: 
-- Module Name:    DisplayComArquivo - Behavioral 
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

entity DisplayComArquivo is
    Port ( numero : in  integer range 0 to 15;
           controle : out  STD_LOGIC_VECTOR (3 downto 0);
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end DisplayComArquivo;

architecture Behavioral of DisplayComArquivo is

component disp 
   
	Port ( 	numero : in  integer range 0 to 15;
				codificado : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

begin
	
	controle <= "1110";
	u1 : disp port map (numero, display);

end Behavioral;

