----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:48:47 08/29/2017 
-- Design Name: 
-- Module Name:    somax - Behavioral 
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

entity somax is
    Port ( x , y: in  integer range 0 to 15;
           
           display : out  STD_LOGIC_VECTOR (6 downto 0);
           controle : out  STD_LOGIC_VECTOR (3 downto 0));
end somax;

architecture Behavioral of somax is
	
	component disp port (
				numero : in integer range 0 to 15;
				codificado : out std_logic_vector (6 downto 0));
	end component;
	signal soma : integer range 0 to 15;
begin

	controle <= "1110";
	soma <= x + y;
	
	u1 : disp port map (soma, display);
end Behavioral;

