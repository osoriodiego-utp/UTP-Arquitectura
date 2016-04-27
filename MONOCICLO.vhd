
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MONOCICLO is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end MONOCICLO;

architecture Behavioral of MONOCICLO is

COMPONENT adder
	PORT(  entradaADDER : in  STD_LOGIC_VECTOR (31 downto 0);
			 entrada2ADDER : in  STD_LOGIC_VECTOR (31 downto 0);
          salidaADDER : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	

COMPONENT NPC
	PORT(  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           entradaNPC : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaNPC : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
COMPONENT PC
	PORT ( clk : in  STD_LOGIC;
			 reset : in  STD_LOGIC;
			 entradaPC : in  STD_LOGIC_VECTOR (31 downto 0);
			 salidaPC : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
	
COMPONENT IM
	PORT(  reset : in  STD_LOGIC;
           direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           salidaIM : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
	
COMPONENT UC
	PORT(  op : in  STD_LOGIC_VECTOR (1 downto 0);
          op3 : in  STD_LOGIC_VECTOR (5 downto 0);
          ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
	END COMPONENT;

	
COMPONENT RF
	PORT(  reset : in  STD_LOGIC;
          rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
          rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
          rd : in  STD_LOGIC_VECTOR (4 downto 0);
          DWR : in  STD_LOGIC_VECTOR (31 downto 0); 
          srs1 : out  STD_LOGIC_VECTOR (31 downto 0);
          srs2 : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
	
COMPONENT SEU
	PORT ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
          imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
	
COMPONENT MUX
	PORT ( i : in  STD_LOGIC;
			 rs2s : in  STD_LOGIC_VECTOR (31 downto 0);
			 imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
          salidaMUX : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;

COMPONENT ALU
	PORT ( rs1 : in  STD_LOGIC_VECTOR (31 downto 0);
          rs2 : in  STD_LOGIC_VECTOR (31 downto 0);
          op : in  STD_LOGIC_VECTOR (5 downto 0);
			 ALUr : out  STD_LOGIC_VECTOR (31 downto 0)); --DWR
	END COMPONENT;

	
	
signal sADDER: std_logic_vector(31 downto 0); 
signal sNPC: std_logic_vector(31 downto 0); --NPC address
signal sPC: std_logic_vector(31 downto 0); -- PC address
signal sIM: std_logic_vector(31 downto 0);
signal sUC: std_logic_vector(5 downto 0);
signal crs1: std_logic_vector(31 downto 0);
signal crs2: std_logic_vector(31 downto 0);
signal sSEU: std_logic_vector(31 downto 0);
signal sMUX: std_logic_vector(31 downto 0);
signal sALU: std_logic_vector(31 downto 0); -- DWR

begin

Inst_adder: adder PORT MAP(
		entradaADDER => "00000000000000000000000000000001",
		entrada2ADDER => sNPC,
		salidaADDER => sADDER );

Inst_NPC: NPC PORT MAP(
		clk => clk,
		reset => reset,
		entradaNPC => sADDER,
		salidaNPC => sNPC );

Inst_PC: PC PORT MAP(
		clk => clk,
		reset => reset,
		entradaPC => sNPC,
		salidaPC => sPC );

Inst_IM: IM PORT MAP(
		reset => reset,
		direccion => sPC,
		salidaIM => sIM );

Inst_UC: UC PORT MAP(
		op => sIM(31 downto 30),
		op3 => sIM(24 downto 19),
		AlUOP => sUC );

Inst_RF: RF PORT MAP(
		reset => reset,
		rs1 => sIM(18 downto 14),
		rs2 => sIM(4 downto 0),
		rd => sIM(29 downto 25),
		DWR => sALU,
		srs1 => crs1,
		srs2 => crs2);
		
Inst_SEU: SEU PORT MAP(
		imm13 => sIM(12 downto 0),
		imm32 => sSEU );

Inst_MUX: MUX PORT MAP(
		i => sIM(13),
		rs2s => crs2,
		imm32 => sSEU,
		salidaMUX => sMUX );

	Inst_ALU: ALU PORT MAP(
		rs1 => crs1,
		rs2 => crs2,
		op => sUC,
		ALUr => sALU);
		
resultado <=  sALU;

end Behavioral;

