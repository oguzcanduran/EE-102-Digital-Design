library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity addsub is
end addsub;
architecture Behavioral of addsub is
component add_sub
 Port (in1: in std_logic_vector(3 downto 0);
 in2 : in std_logic_vector(3 downto 0);
 Cin : in std_logic;
 out1: out std_logic_vector(3 downto 0);
 Cout : out std_logic);
end component;
signal in1: std_logic_vector(3 downto 0):= (others => '0');
signal in2: std_logic_vector(3 downto 0):= (others => '0');
signal out1: std_logic_vector(3 downto 0);
signal cin: std_logic;
signal cout: std_logic;
begin
UUT: add_sub PORT MAP(
in1=>in1,
in2=>in2,
out1=>out1,
cin=>cin,
cout=>cout
);
test: process
begin
in1<= "0111";
in2<= "0010";
cin<='0';
wait for 100 ns;
in1<= "0111";
in2<= "1110";
cin<='0';
wait for 100 ns;
in1<= "0111";
in2<= "1011";
cin<='0';
wait for 100 ns;
in1<= "1111";
in2<= "0110";
cin<='0';
wait for 100 ns;
in1<= "0111";
in2<= "0010";
cin<='1';
wait for 100 ns;
in1<= "0111";
in2<= "0110";
cin<='1';
wait for 100 ns;
in1<= "0011";
in2<= "1010";
cin<='1';
wait for 100 ns;
in1<= "0101";
in2<= "1011";
cin<='1';
wait for 100 ns;
end process;
end Behavioral;