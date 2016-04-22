library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------------------------------------------------------------


entity adder is
    Port ( entradaADDER : in  STD_LOGIC_VECTOR (32 downto 0);
           salidaADDER : out  STD_LOGIC_VECTOR (32 downto 0));
end adder;

architecture Behavioral of adder is
begin
	salidaADDER <= entradaADDER + '1';

end Behavioral;

