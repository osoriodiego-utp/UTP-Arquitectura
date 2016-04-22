library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;
-----------------------------------------------------------------------------------------------------------------------


entity RF is
    Port ( reset : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0); 
           rs1s : out  STD_LOGIC_VECTOR (31 downto 0);
           rs2s : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type RF_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registers : RF_type :=(others => x"00000000");

begin
	process(reset, rs1, rs2, rd, DWR)
	begin
		if(reset = '1')then
			rs1s <= (others=>'0');
			rs2s <= (others=>'0');
			registers <= (others => x"00000000");
		else
			rs1s <= registers(conv_integer(rs1));
			rs2s <= registers(conv_integer(rs2));
			if rd /= "000000" then
				registers(conv_integer(rd)) <= DWR;
			end if;
		end if;
	end process;
end Behavioral;

