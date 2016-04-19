library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           s : out  STD_LOGIC_VECTOR (31 downto 0));
end sumador;

architecture Behavioral of sumador is

begin

process(a, b)
begin
	s <= a + b;
end process;

end Behavioral;

# procesador-monociclo
