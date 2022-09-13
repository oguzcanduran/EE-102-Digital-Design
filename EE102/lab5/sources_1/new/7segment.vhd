library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity decode is
 Port ( ledchoice : in STD_LOGIC_VECTOR (3 downto 0);
 sevensegment : out STD_LOGIC_VECTOR (6 downto 0));
end decode;
architecture Behavioral of decode is
begin
process(ledchoice)
begin
case ledchoice is
 when "0000" => sevensegment <= "1000000"; -- "0"
 when "0001" => sevensegment <= "1111001"; -- "1"
 when "0010" => sevensegment <= "0100100"; -- "2"
 when "0011" => sevensegment <= "0110000"; -- "3"
 when "0100" => sevensegment <= "0011001"; -- "4"
 when "0101" => sevensegment <= "0010010"; -- "5"
 when "0110" => sevensegment <= "0000010"; -- "6"
 when "0111" => sevensegment <= "1111000"; -- "7"
 when "1000" => sevensegment <= "0000000"; -- "8"
 when "1001" => sevensegment <= "0011000"; -- "9"
 when others => sevensegment <= "1111111";
 end case;
end process;
end Behavioral;