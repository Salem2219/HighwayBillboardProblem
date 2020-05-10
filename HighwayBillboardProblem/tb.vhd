library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal addr,y, m, x, revenue, n, t  : std_logic_vector (7 downto 0);
  component toplevel
    port (clk, rst, start : in std_logic;
    m, x, revenue, n, t : in std_logic_vector(7 downto 0);
    addr, y : out std_logic_vector(7 downto 0));
  end component ;
  component rom is
port(addr: in std_logic_vector (7 downto 0);
x, revenue : out std_logic_vector (7 downto 0));
end component;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    m <= "00010100"; -- M = 20
    n <= "00000101"; -- n = sizeof(x_arr) = 5
    t <= "00000101"; -- t = 5
    dut: toplevel port map(clk,rst,start,m, x, revenue, n, t, addr, y);
    xrevenue_rom : rom port map (addr, x, revenue);
  end behav;