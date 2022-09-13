Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity testBench is
end testBench;
architecture Behavioral of testBench is
component decode
 Port ( ledchoice : in STD_LOGIC_VECTOR (3 downto 0);
 sevensegment : out STD_LOGIC_VECTOR (6 downto 0));
end component;
 SIGNAL activate : STD_LOGIC_VECTOR (3 downto 0);
 SIGNAL leds : STD_LOGIC_VECTOR(6 downto 0);
begin
 UUT: decode PORT MAP(
 ledchoice => activate,
 sevensegment => leds
 );
 testbench1: Process
 Begin
 activate <= "0000";
 wait for 60 ns;
 activate <= "0001";
 wait for 60 ns;
 activate <= "0010";
 wait for 60 ns;
 activate <= "0011";
 wait for 60 ns;
 activate <= "0100";
 wait for 60 ns;
 activate <= "0101";
 wait for 60 ns;
 activate <= "0110";
 wait for 60 ns;
 activate <= "0111";
 wait for 60 ns;
 activate <= "1000";
 wait for 60 ns;
 activate <= "1001";
 wait for 60 ns;
 activate <= "1010";
 wait for 60 ns;
 activate <= "1011";
 wait for 60 ns;
 activate <= "1100";
 wait for 60 ns;
 activate <= "1101";
 wait for 60 ns;
 activate <= "1110";
 wait for 60 ns;
 activate <= "1111";
 wait for 60 ns;
 end process;
 end Behavioral;