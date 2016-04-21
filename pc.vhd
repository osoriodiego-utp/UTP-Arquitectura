library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity npc is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (31 downto 0);
           s : out  STD_LOGIC_VECTOR (31 downto 0));
end npc;

architecture Behavioral of npc is

begin

process (clk)
begin
   if clk'event and clk='1' then  
      if reset='1' then   
         s <= x"00000000";
      else
         s <= d;
      end if;
   end if;

end process;
 



end Behavioral;