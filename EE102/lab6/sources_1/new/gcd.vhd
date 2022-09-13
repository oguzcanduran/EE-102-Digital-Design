library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity GCD is
 Port ( clk: in std_logic;
 clr: in std_logic;
 registerone : in STD_LOGIC_VECTOR (7 downto 0);
 registertwo : in STD_LOGIC_VECTOR (7 downto 0);
 registeroneselect: in std_logic;
 registertwoselect: in std_logic;
 registeroneload: in std_logic;
 registertwoload: in std_logic;
 registergcdload: in std_logic;
 lessthan: out std_logic;
 equality: out std_logic;
 gcdresult: out STD_LOGIC_VECTOR (7 downto 0));
end GCD;
architecture Behavioral of GCD is
 component multiplexer
 Port (
 inputmux1 :in std_logic_vector (7 downto 0);
 inputmux2: in std_logic_vector (7 downto 0);
 selectmux: in std_logic;
 resultmux: out std_logic_vector (7 downto 0)
 );
 end component;
 component registergcd
 Port (
 loadreg: in std_logic;
 datareg: in std_logic_vector (7 downto 0);
 clk: in std_logic;
 clr: in std_logic;
 resultreg: out std_logic_vector (7 downto 0)
 );
 end component;
 signal numberone: std_logic_vector (7 downto 0);
 signal numbertwo: std_logic_vector (7 downto 0);
 signal newone: std_logic_vector (7 downto 0);
 signal newtwo: std_logic_vector (7 downto 0);
 signal subtract1: std_logic_vector (7 downto 0);
 signal subtract2: std_logic_vector (7 downto 0);
begin
 subtract1 <= numberone - numbertwo;
 subtract2 <= numbertwo - numberone;
 process (numberone, numbertwo)
 begin
 if numberone = numbertwo then
 equality <= '1';
 else
 equality <= '0';
 end if;
 end process;
 process (numberone, numbertwo)
 begin
 if numberone < numbertwo then
 lessthan <= '1';
 else
 lessthan <= '0';
 end if;
 end process;
 chose1: multiplexer
 port map (
 inputmux1 => subtract1, inputmux2 => registerone, selectmux => registeroneselect,
resultmux => newone);
 chose2: multiplexer
 port map (
 inputmux1 => subtract2, inputmux2 => registertwo, selectmux => registertwoselect,
resultmux => newtwo);
 Registerstage1: registergcd
 port map (
 loadreg => registeroneload, datareg => newone ,clk => clk ,clr => clr ,resultreg =>
numberone);
 Registerstage2: registergcd
 port map (
 loadreg => registertwoload, datareg => newtwo ,clk => clk ,clr => clr ,resultreg =>
numbertwo);
 Registerstage3: registergcd
 port map (
 loadreg => registergcdload, datareg => numberone ,clk => clk ,clr => clr ,resultreg =>
gcdresult);
end Behavioral;