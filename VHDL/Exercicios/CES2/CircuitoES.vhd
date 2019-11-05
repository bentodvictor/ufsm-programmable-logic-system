----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:30 09/12/2017 
-- Design Name: 
-- Module Name:    CircuitoES - Behavioral 
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

entity CircuitoES is
    Port ( 
				
			  e1 : in  STD_LOGIC;
           e0 : in  STD_LOGIC;
           s1 : inout  STD_LOGIC;
           s0 : inout  STD_LOGIC;
			  c1: inout STD_LOGIC;
			  c0: inout STD_LOGIC
			  );
end CircuitoES;

architecture Behavioral of CircuitoES is

	
	
begin
	
	
	process
	
	begin
					
				if (c1 > c0) then
					s1 <= e1;
					s0 <= '0';
					
				elsif (c1 < c0) then
					s1 <= '0';
					s0 <= e0;
					
				else 
					s1 <= '0';
					s0 <= '0';
					
				end if;
			
			
		
	end process;
	
		
	


end Behavioral;

