library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity alu is
Port (input1: in std_logic_vector(3 downto 0);
 input2: in std_logic_vector(3 downto 0);
 select1: in std_logic_vector(2 downto 0);
 result1: out std_logic_vector(3 downto 0);
 Overflow: out std_logic);
end alu;
architecture Behavioral of alu is
signal sum1:std_logic_vector(3 downto 0);
signal sub1: std_logic_vector(3 downto 0);
signal cout1: std_logic;
signal cout2: std_logic;
signal cin1: std_logic:='0';
component add_sub
 Port (in1: in std_logic_vector(3 downto 0);
 in2 : in std_logic_vector(3 downto 0);
 Cin : in std_logic:='0';
 out1: out std_logic_vector(3 downto 0);
 Cout : out std_logic
 );
end component;
begin
add: add_sub port map(in1=>input1,
 in2=>input2,
 Cin=>cin1,
 out1=>sum1,
 Cout => cout1);
sub: add_sub port map(in1=>input1,
 in2=>input2,
 Cin=> (NOT cin1),
 out1=>sub1,
 Cout => cout2);
process (input1, input2, select1)
begin
case select1 is
when "000" =>
result1 <= sum1;
when "001" =>
result1 <= sub1;
when "010" =>
result1<= input1 XOR input2;
when "011" =>
result1<= input1 XNOR input2;
when "100" =>
result1<= input1 NAND input2;
when "101" =>
result1<= input1 NOR input2;
when "110" =>
result1<= input2(2 downto 0)& input2(3);
when others =>
result1<= input1(0)& input1(3 downto 1);
end case;
end process;
end Behavioral;