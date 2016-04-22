library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------


entity NPC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           entradaNPC : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaNPC : out  STD_LOGIC_VECTOR (31 downto 0));
end NPC;

architecture Behavioral of NPC is

begin
process (clk,reset,entradaNPC)
	begin
		if (rising_edge(clk))then
			if (reset='1') then
				salidaNPC <= (others=> '0'); --x"00000000";
			else
				salidaNPC <= entradaNPC;
			end if;
		end if;
end process;

end Behavioral;