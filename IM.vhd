library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;
use std.textio.all;
-----------------------------------------------------------------------------------------------------------------------


entity IM is
    Port ( reset : in  STD_LOGIC;
           direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaIM : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Behavioral of IM is

	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("text.data");

begin
	process(reset, direccion, instructions)
	begin
		if(reset = '1')then
			salidaIM <= (others=>'0');
		else
			salidaIM <= instructions(conv_integer(direccion(4 downto 0)));
		end if;
	end process;


end Behavioral;

