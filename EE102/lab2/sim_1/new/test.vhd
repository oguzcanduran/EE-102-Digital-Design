library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity testbenchlab2 is
-- Port ( );
end testbenchlab2;
architecture Behavioral of testbenchlab2 is
COMPONENT labcode2
PORT( in1 : IN STD_LOGIC;
in2 : IN STD_LOGIC;
in3 : IN STD_LOGIC;
out1 : OUT STD_LOGIC);
END COMPONENT;
SIGNAL in1 : STD_LOGIC;
SIGNAL in2 : STD_LOGIC;
SIGNAL in3 : STD_LOGIC;
SIGNAL out1 : STD_LOGIC;
begin
UUT: labcode2 PORT MAP(
in1 => in1,
in2 => in2,
in3 => in3,
out1 => out1
);
testbenchlab2 : PROCESS
BEGIN
wait for 100 ns;
in1<='0';
in2<='0';
in3<='0';
wait for 100 ns;
in1<='0';
in2<='0';
in3<='1';
wait for 100 ns;
in1<='0';
in2<='1';
in3<='0';
wait for 100 ns;
in1<='0';
in2<='1';
in3<='1';
wait for 100 ns;
in1<='1';
in2<='0';
in3<='0';
wait for 100 ns;
in1<='1';
in2<='0';
in3<='1';
wait for 100 ns;
in1<='1';
in2<='1';
in3<='0';
wait for 100 ns;
in1<='1';
in2<='1';
in3<='1';
END PROCESS;
end Behavioral;