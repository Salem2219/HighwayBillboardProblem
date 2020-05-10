library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity rom is
port(addr: in std_logic_vector (7 downto 0);
x, revenue : out std_logic_vector (7 downto 0));
end rom;
architecture rtl of rom is
type rom_type is array (0 to 255) of
std_logic_vector (7 downto 0);
signal x_arr, revenue_arr : rom_type ;
begin
-- x[]       = {6, 7, 12, 13, 14}
-- revenue[] = {5, 6, 5,  3,  1}
x_arr(0 to 4) <= ("00000110", "00000111", "00001100", "00001101", "00001110");
revenue_arr(0 to 4) <= ("00000101", "00000110", "00000101", "00000011", "00000001");
x <= x_arr(conv_integer(unsigned(addr)));
revenue <= revenue_arr(conv_integer(unsigned(addr)));
end rtl;
