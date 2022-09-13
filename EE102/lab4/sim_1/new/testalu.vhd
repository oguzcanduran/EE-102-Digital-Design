library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity simu is
end simu;
architecture Behavioral of simu is
component alu
Port (input1: in std_logic_vector(3 downto 0);
 input2: in std_logic_vector(3 downto 0);
 select1: in std_logic_vector(2 downto 0);
 result1: out std_logic_vector(3 downto 0);
 Overflow: out std_logic);
end component;
signal in1: std_logic_vector(3 downto 0):= (others => '0');
signal in2: std_logic_vector(3 downto 0):= (others => '0');
signal selection1: std_logic_vector(2 downto 0):= (others => '0');
signal res1: std_logic_vector(3 downto 0);
signal ovf: std_logic;
begin
UUT: alu PORT MAP(
input1=>in1,
input2=>in2,
select1=>selection1,
result1=>res1,
overflow=>ovf
);
test: process
begin
in1<= "0111";
in2<= "0010";
selection1<="000";
wait for 100 ns;
selection1<="001";
wait for 100 ns;
selection1<="010";
wait for 100 ns;
selection1<="011";
wait for 100 ns;
selection1<="100";
wait for 100 ns;
selection1<="101";
wait for 100 ns;
selection1<="110";
wait for 100 ns;
selection1<="111";
wait for 100 ns;
end process;
end Behavioral;