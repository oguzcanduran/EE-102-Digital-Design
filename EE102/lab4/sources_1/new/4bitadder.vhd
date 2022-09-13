library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity add_sub is
 Port (in1: in std_logic_vector(3 downto 0);
 in2 : in std_logic_vector(3 downto 0);
 Cin : in std_logic;
 out1: out std_logic_vector(3 downto 0);
 Cout : out std_logic);
end add_sub;
architecture Behavioral of add_sub is
 component full_adder
 Port (Cin,x,y: in std_logic;
 Sout, Cout: out std_logic );
 end component;
 signal c1,c2,c3: std_logic;

begin

 step0: full_adder port map (Cin, in1(0),in2(0) XOR Cin,out1(0),c1);
 step1: full_adder port map (c1,in1(1),in2(1) XOR Cin,out1(1),c2);
 step2: full_adder port map (c2,in1(2),in2(2) XOR Cin,out1(2),c3);
 step3: full_adder port map (
 Cin=>c3,
 x=>in1(3),
 y=>in2(3)XOR Cin,
 sout=>out1(3),
 Cout=>Cout);

end Behavioral;