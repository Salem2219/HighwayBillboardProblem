library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_ld, n_ld, wr : in std_logic;
    m, x, revenue, n, t : in std_logic_vector(7 downto 0);
    z : out std_logic_vector(2 downto 0);
    addr, y : out std_logic_vector(7 downto 0));
end dp;
architecture rtl of dp is

component ram is
port(clk, wr : in std_logic;
sel : in std_logic_vector(1 downto 0);
i, t, revenue, m : in std_logic_vector(7 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
component compgr is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component complt is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component comp is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component reg8 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(7 downto 0);
reg_out: out std_logic_vector(7 downto 0));
end component;
component mux8 is
    port (s : in std_logic;
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component adder8 is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
signal max_sel : std_logic_vector(1 downto 0);
signal c : std_logic_vector(3 downto 0);
signal nxtbb, i, n_in, i_in, nplus1, iplus1 : std_logic_vector(7 downto 0);
begin
    max_sel <= (c(1) and c(2) and c(3)) & (c(1) and c(2) and not (c(3)));
    z <= c(2 downto 0);
    addr <= nxtbb;
    maxRev_ram : ram port map (clk, wr, max_sel, i, t, revenue, m, y);
    im_comp : compgr port map (i, m, c(0));
    nxtbbn_comp : complt port map (nxtbb, n, c(1));
    ix_comp : comp port map (x, i, c(2));
    it_comp : compgr port map (i, t, c(3));
    nxtbb_reg : reg8 port map (clk, rst, n_ld, n_in, nxtbb);
    i_reg : reg8 port map (clk, rst, i_ld, i_in, i);
    n_mux : mux8 port map (wr, "00000000", nplus1, n_in);
    i_mux : mux8 port map (wr, "00000001", iplus1, i_in);
    n_op : adder8 port map (nxtbb, "00000001", nplus1);
    i_op : adder8 port map (i, "00000001", iplus1);
end rtl;