library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr : in std_logic;
sel : in std_logic_vector(1 downto 0);
i, t, revenue, m : in std_logic_vector(7 downto 0);
y : out std_logic_vector(7 downto 0));
end ram;
architecture rtl of ram is
component mux4_1 is
    port (sel : in std_logic_vector(1 downto 0);
    a, b, c, d : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component max is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component adder8 is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component sub8 is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
type ram_type is array (0 to 255) of
std_logic_vector(7 downto 0);
signal maxRev: ram_type := (others => (others => '0'));
signal maxRev_in, maxReviminus1, maxorrev, maxplusrevormax, iminus1, maxReviminustminus1, iminustminus1, iminust, maxplusrev : std_logic_vector(7 downto 0);
begin
maxReviminus1 <= maxRev(conv_integer(unsigned(iminus1)));
maxRev_mux : mux4_1 port map (sel, maxReviminus1, maxorrev, maxplusrevormax, maxReviminus1, maxRev_in);
maxRev_max1 : max port map (maxReviminus1, revenue, maxorrev);
maxRev_adder : adder8 port map (maxReviminustminus1, revenue, maxplusrev);
i_op : minus1 port map (i, iminus1);
maxReviminustminus1 <= maxRev(conv_integer(unsigned(iminustminus1)));
it_op1 : sub8 port map (i, t, iminust);
it_op2 : minus1 port map (iminust, iminustminus1);
maxRev_max2 : max port map (maxplusrev, maxReviminus1, maxplusrevormax);
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
maxRev(conv_integer(unsigned(i))) <= maxRev_in;
end if;
end if;
end process;
y <= maxRev(conv_integer(unsigned(m)));
end rtl;