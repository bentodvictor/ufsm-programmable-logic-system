----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:51 10/08/2013 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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

entity debounce is
generic (max : integer := 5000000); -- 1 milhão = 10ms em clock de 100Mhz
    Port ( clk : in  STD_LOGIC;
           botao : in  STD_LOGIC;
           result : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is

signal cont : integer range 0 to max := 0;
signal botao_ant : std_logic  := '0'; 

begin
	process(clk)
	begin
		if (clk'event and clk='1')
				then	
				      botao_ant <= botao ; -- salva o estado anterior do botao
				      if botao /= botao_ant and cont = 0 -- alguem pressionou o botao
							then result <= botao;
							     cont <= 1;
						end if;					 
                   if cont > 0 then
						         if cont < max then cont <= cont +1;
							                    else cont <= 0;
												     --result <= botao;
							 end if;
						end if;
		  
		end if;  -- clk'event
	end process;

end Behavioral;

