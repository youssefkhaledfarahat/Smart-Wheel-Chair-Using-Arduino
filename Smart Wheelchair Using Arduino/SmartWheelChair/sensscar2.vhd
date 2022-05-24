LIBRARY ieee;
USE ieee.std_logic_1164.all ;

ENTITY sensscar2 IS
Port(sensorleft, sensorright, switch, Hsensor:in std_logic;
signal goR, stopR, goL, stopL, Lout, buzz:out std_logic);
end sensscar2;
Architecture behav of sensscar2 is

Begin 
sensors :process (sensorleft, sensorright)
begin
if(switch = '1') then
	if(sensorleft = '0' and sensorright = '1') then
			goR <= '0';
			stopR <= '0';
			goL <='1';
			stopL<='0';
			buzz <='0';
		elsif (sensorright = '0' and sensorleft = '1') then 
			goR <= '1';
			stopR <= '0';
			goL<='0';
			stopL<= '0';
			buzz<= '0';
		elsif ((sensorright = '0') and (sensorleft='0')) then
			goR <= '0';
			stopR <= '0';
			goL<='0';
			stopL<='0';
			buzz<='1';
		elsif(((sensorright = '1') and (sensorleft='1'))) then
			goR <= '1';
			stopR <= '0';
			goL<='1';
			stopL <='0';
			buzz <='0';
			end if;

	elsif(switch = '0') then
	goR <= '0';
	stopR <= '0';
	goL <= '0';
	stopL <= '0';
	buzz <='0';
	end if;

end process sensors;


motion :process(Hsensor)
Begin
if((Hsensor = '1') and (switch = '1')) then
Lout <= '1';
else
Lout <= '0';
end if ;
end process motion;
end behav;
