library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------------------------------------------------------------


entity SEU is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture Behavioral of SEU is
begin
	process(imm13)
		begin
			if imm13(12) = '0' then
				imm32 <= "0000000000000000000" & imm13;
			else
				imm32 <= "1111111111111111111" & imm13;
			end if;
	end process;
end Behavioral;

