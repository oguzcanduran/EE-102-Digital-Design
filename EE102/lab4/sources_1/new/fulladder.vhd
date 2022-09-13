library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder is
 Port (Cin,x,y: in std_logic;
 Sout, Cout: out std_logic );
end full_adder;
architecture Behavioral of full_adder is
begin
 Sout<= x XOR y XOR Cin;
 Cout<= (Cin AND x)OR (Cin AND y) OR (y AND x);
end Behavioral;