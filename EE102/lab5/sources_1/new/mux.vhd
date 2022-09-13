library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux is
 Port ( inputchoicer : in STD_LOGIC_VECTOR (1 downto 0);
 chosen : out STD_LOGIC_VECTOR (3 downto 0));
end mux;
architecture Behavioral of mux is
begin
process(inputchoicer)
begin
case inputchoicer is
 when "00" => chosen <= "1110"; -- "0"
 when "01" => chosen <= "1101"; -- "1"
 when "10" => chosen <= "1011"; -- "2"
 when "11" => chosen <= "0111"; -- "3"

 end case;
end process;
end Behavioral;