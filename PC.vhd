library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------------------


entity PC is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           entradaPC : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaPC : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin
process (clk,reset,entradaPC)
	begin
		if (rising_edge(clk))then
			if (reset='1') then
				salidaPC <= (others=> '0'); --x"00000000";
			else
				salidaPC <= entradaPC;
			end if;
		end if;
end process;

end Behavioral;

