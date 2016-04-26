library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------------------------------------------------------------

entity MUX is
    Port ( i : in  STD_LOGIC;
			  rs2s : in  STD_LOGIC_VECTOR (31 downto 0);
			  imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture Behavioral of MUX is
begin
	process(i, rs2s, imm32)
		begin
			if (i = '1') then
				salidaMUX <= imm32;
				else
				salidaMUX <= rs2s;
			end if;
end process;
end Behavioral;


