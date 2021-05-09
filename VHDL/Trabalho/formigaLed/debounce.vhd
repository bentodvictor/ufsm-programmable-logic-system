library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
generic (max : integer := 300_000_000); -- 3 milhões
    Port ( clk : in  STD_LOGIC;
           botao : in  STD_LOGIC;
			  result : inout  STD_LOGIC);
			  
end debounce;

architecture Behavioral of debounce is

signal cont : integer range 0 to max := 0;
signal botao_s : std_logic := '0'; 

begin
	process(clk)
	begin
		if (clk'event and clk='1')
				then	
				      botao_s <= botao ; -- salva o estado anterior do botao
				      if botao /= botao_s and cont = 0 -- alguem pressionou o botao
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

