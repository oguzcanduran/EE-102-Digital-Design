library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb is
end tb;
architecture Behavioral of tb is
    constant ClockPeriod : time := 50 ns;
    signal clk : std_logic := '1';
    signal clr: std_logic := '0';
    signal registerone : std_logic_vector (7 downto 0);
    signal registertwo: std_logic_vector (7 downto 0);
    signal result : std_logic_vector (7 downto 0);

    COMPONENT topmodule
        Port ( registerone: in std_logic_vector (7 downto 0);
             registertwo: in std_logic_vector (7 downto 0);
             clk: in std_logic;
             clr: in std_logic;
             result: out std_logic_vector (7 downto 0) );
    end component;
begin
    uut: topmodule
        port map (
            clk => clk,
            registerone => registerone,
            registertwo => registertwo,
            clr => clr,
            result => result
        );
    clk <= not clk after ClockPeriod / 2;
    process is
    begin
        wait until rising_edge(Clk);
        registerone<= "10001100";
        registertwo<= "00001100";
        wait until rising_edge(Clk);
        clr <= '1';
        wait until rising_edge(Clk);
        clr <= '0';
        wait;
    end process;
end Behavioral;