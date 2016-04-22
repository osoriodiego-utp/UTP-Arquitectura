library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-----------------------------------------------------------------------------------------------------------------------


entity ALU is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (5 downto 0);
           --DWR : out  STD_LOGIC);
			  ALUr : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
	process(rs1, rs2, op)
		begin
			case op is
			
				when "000000" =>
					ALUr <= rs1 + rs2; -- ADD
					
				when "000001" =>
					ALUr <= rs1 - rs2; -- SUB
					
				when "000010" =>
					ALUr <= rs1 and rs2; -- AND
			
				when "000100" =>
					ALUr <= rs1 and (not rs2); -- ANDN
				
				when "000011" =>
					ALUr <= rs1 or rs2; -- OR
				
				when "000101" =>
					ALUr <= rs1 or (not rs2); -- ORN
					
				when "000110" =>
					ALUr <= rs1 xor rs2; -- XOR
					
				when "000111" => 
					ALUr <= rs1 xnor rs2; -- XORN
				
				when others => 
						null;
						
			end case;
			
end process;
end Behavioral;

