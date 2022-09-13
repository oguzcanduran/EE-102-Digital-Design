library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity labcode2 is
 Port ( in1 : in STD_LOGIC;
 in2 : in STD_LOGIC;
 in3 : in STD_LOGIC;
 out1 : out STD_LOGIC);
end labcode2;
architecture Behavioral of labcode2 is
begin
out1 <= (in1 or in2) and (not in3);
end Behavioral;