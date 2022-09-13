library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Control is
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
end Control;
architecture Behavioral of Control is
    type state_type is (input, firsttest , secondtest, firstupdate, secondupdate, data);
    signal present, nextst: state_type;
begin
    process (clk, clr)
    begin
        if clr ='1' then
            present <= input;
        elsif rising_edge (clk)then
            present <= nextst;
        end if;
    end process;
    process (present, equality, lessthan)
    begin
        case present is
            when input =>
                nextst <= firsttest;
            when firsttest =>
                if equality = '1' then
                    nextst <= data;
                else
                    nextst <= secondtest;
                end if;
            when secondtest =>
                if lessthan ='1' then
                    nextst <= firstupdate;
                else
                    nextst <= secondupdate;
                end if;
            when firstupdate =>
                nextst <= firsttest;
            when secondupdate =>
                nextst <= firsttest;
            when data =>
                nextst <= data;
            when others => null;
        end case;
    end process;
    process (present)
    begin
        registeroneselect <= '0';
        registertwoselect<= '0';
        registeroneload <= '0';
        registertwoload <= '0';
        registergcdload <= '0';
        case present is
            when input =>
                registeroneselect <= '1';
                registertwoselect<= '1';
                registeroneload <= '1';
                registertwoload <= '1';
            when firstupdate =>
                registertwoload <= '1';
            when secondupdate =>
                registeroneload <= '1';
            when data =>
                registergcdload <= '1';
            when others => null;
        end case;
    end process;
end Behavioral;