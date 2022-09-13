LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;
ENTITY fourbitcounter IS
 PORT (clk, rst: IN std_logic;
 muxresult : out STD_LOGIC_VECTOR (3 downto 0);
 decoderesult : out STD_LOGIC_VECTOR (6 downto 0));
END fourbitcounter;
ARCHITECTURE Behavioral OF fourbitcounter IS
component mux
 Port ( inputchoicer : in STD_LOGIC_VECTOR (1 downto 0);
 chosen : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component decode
 Port ( ledchoice : in STD_LOGIC_VECTOR (3 downto 0);
 sevensegment : out STD_LOGIC_VECTOR (6 downto 0));
 end component;

signal outthree, outtwo, outone, outzero: std_logic_vector(3 DOWNTO 0);
signal decimaltho, decimalthoNext, decimalhu, decimalhuNext, decimalten, decimaltenNext,
decimalone, decimaloneNext: unsigned (3 DOWNTO 0);
signal realcounter: STD_LOGIC_VECTOR (27 downto 0);
signal en: std_logic;
signal count: STD_LOGIC_VECTOR (3 downto 0);
signal refresher: STD_LOGIC_VECTOR (22 downto 0);
signal muxcho: std_logic_vector(1 downto 0);
BEGIN
 process (clk, rst, en)
 begin
 if (rst = '1') then
 decimaltho <= (others =>'0');
 decimalhu <= (others =>'0');
 decimalten <= (others =>'0');
 decimalone <= (others =>'0');
 elsif (en = '1') then
 IF (rising_edge(clk)) then
 decimaltho <= decimalthoNext;
 decimalhu <= decimalhuNext;
 decimalten <= decimaltenNext;
 decimalone <= decimaloneNext;
 end if;
 end if;
 end process;
 decimalthoNext <= "0000" when (decimaltho="1001" and decimalhu="1001" and
decimalten="1001" and decimalone="1001") else
 decimaltho+1 when (decimalhu="1001" and decimalten="1001" and
decimalone="1001") else
 decimaltho;
 decimalhuNext <= "0000" when (decimalhu="1001" and decimalten="1001" and
decimalone="1001") else
 decimalhu+1 when (decimalten="1001" and decimalone="1001") else
 decimalhu;
 decimaltenNext <= "0000" when (decimalten="1001" and decimalone="1001") else
 decimalten+1 when (decimalone="1001") else
 decimalten;
 decimaloneNext <= "0000" when (decimalone="1001") else
 decimalone+1;
 outthree <= std_logic_vector(decimaltho);
 outtwo <= std_logic_vector(decimalhu);
 outone <= std_logic_vector(decimalten);
 outzero <= std_logic_vector(decimalone);
 muxcho<=refresher(18 downto 17);
sevensegmentmodule: decode port map(count, decoderesult);
digitchoicermodule: mux port map(muxcho,muxresult);
 process(clk,rst)
 begin
 if(rst='1') then
 refresher <= (others => '0');
 elsif(rising_edge(clk)) then
 refresher <= refresher + 1;
 end if;
 end process;
 process(muxcho)
 begin
 case muxcho is
 when "00" =>
 count <= outzero;
 when "01" =>
 count <= outone;
 when "10" =>
 count <= outtwo;
 when "11" =>
 count <= outthree;
 end case;
 end process;
process(clk, rst)
 begin
 if(rst='1') then
 realcounter <= (others => '0');
 elsif(rising_edge(clk)) then
 if(realcounter>=x"17D7840") then
 realcounter <= (others => '0');
 else
 realcounter <= realcounter + x"0000001";
 end if;
 end if;
 end process;
 en <= '1' when realcounter=x"17D7840" else '0';
end Behavioral;