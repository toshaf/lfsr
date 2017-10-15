library ieee;
use ieee.std_logic_1164.all;

entity clock is
	port(tick : out std_logic);
end clock;

architecture clock_impl of clock is
begin
	process is
		variable state : std_logic := '0';
	begin
		tick <= state;
		state := not state;
		wait for 1 ms;
	end process;
end clock_impl;
