library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity topmodule is
 Port ( clk: in std_logic;
 clr: in std_logic;
 registerone : in STD_LOGIC_VECTOR (7 downto 0);
 registertwo : in STD_LOGIC_VECTOR (7 downto 0);
 result: out STD_LOGIC_VECTOR (7 downto 0)
 );
end topmodule;
architecture Behavioral of topmodule is
 component GCD
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
 end component;
 component Control
 Port ( clk: in std_logic;
 clr: in std_logic;
 equality: in std_logic;
 lessthan: in std_logic;
 registeroneselect: out std_logic;
 registertwoselect: out std_logic;
 registeroneload: out std_logic;
 registertwoload: out std_logic;
 registergcdload: out std_logic
 );
 end component;
 signal registeroneselect: std_logic;
 signal registertwoselect: std_logic;
 signal registeroneload: std_logic;
 signal registertwoload: std_logic;
 signal registergcdload: std_logic;
 signal equality: std_logic;
 signal lessthan: std_logic;
begin
 fsmstep: Control port map (
 clk => clk, clr => clr, lessthan=> lessthan, equality=> equality, registeroneselect =>
registeroneselect,
 registertwoselect => registertwoselect, registeroneload => registeroneload,
 registertwoload => registertwoload,
 registergcdload => registergcdload
 );
 gcdstep: GCD port map(
 clk => clk, clr => clr, registerone => registerone, registertwo => registertwo,
 registeroneselect => registeroneselect,
 registertwoselect => registertwoselect, registeroneload => registeroneload,
 registertwoload => registertwoload,
 registergcdload => registergcdload, lessthan=> lessthan, equality=> equality, gcdresult
=> result);
end Behavioral;