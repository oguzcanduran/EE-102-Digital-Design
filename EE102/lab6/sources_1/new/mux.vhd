library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity multiplexer is
 Port (
 inputmux1 :in std_logic_vector (7 downto 0);
 inputmux2: in std_logic_vector (7 downto 0);
 selectmux: in std_logic;
 resultmux: out std_logic_vector (7 downto 0));
end multiplexer;
architecture Behavioral of multiplexer is
begin
 process (inputmux1,inputmux2,selectmux)
 begin
 if selectmux ='0' then
 resultmux <= inputmux1;
 else
 resultmux<= inputmux2;
 end if;
 end process;
end Behavioral;