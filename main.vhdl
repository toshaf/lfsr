library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(output : out std_logic_vector(15 downto 0));
end;

architecture main_impl of main is
	signal clk : std_logic;
begin
	c : entity work.clock(clock_impl)
		port map(tick => clk);
	l : entity work.lfsr(lfsr_impl)
		port map(clk => clk, output => output);
end main_impl;
