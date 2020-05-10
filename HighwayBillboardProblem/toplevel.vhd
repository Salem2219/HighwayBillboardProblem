library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is 
    port (clk, rst, start : in std_logic;
    m, x, revenue, n, t : in std_logic_vector(7 downto 0);
    addr, y : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, i_ld, n_ld, wr : in std_logic;
    m, x, revenue, n, t : in std_logic_vector(7 downto 0);
    z : out std_logic_vector(2 downto 0);
    addr, y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
  port(clk,rst, start : in std_logic;
      z : in std_logic_vector(2 downto 0);
       wr, i_ld, n_ld: out std_logic);
end component;
signal i_ld, n_ld, wr : std_logic;
signal z : std_logic_vector(2 downto 0);
begin
    datapath : dp port map (clk, rst, i_ld, n_ld, wr, m, x, revenue, n, t, z, addr, y);
    control : ctrl port map (clk, rst, start, z, wr, i_ld, n_ld);
end rtl;