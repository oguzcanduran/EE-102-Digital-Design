library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity registergcd is
 Port (
 loadreg: in std_logic;
 datareg: in std_logic_vector (7 downto 0);
 clk: in std_logic;
 clr: in std_logic;
 resultreg: out std_logic_vector (7 downto 0)
 );
end registergcd;
architecture Behavioral of registergcd is
begin
 process (clk, clr)
 begin
 if clr ='1' then
 resultreg <= (others => '0');
 else
 if rising_edge (clk) then
 if loadreg = '1' then
 resultreg <= datareg;
 end if;
 end if;
 end if;
 end process;
end Behavioral;