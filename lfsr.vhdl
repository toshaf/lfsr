library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lfsr is
	port(
		clk : in std_logic;
	  output : out std_logic_vector(15 downto 0)
	);
end lfsr;

architecture lfsr_impl of lfsr is
begin
	process(clk) is 
		variable reg : std_logic_vector(15 downto 0) := "0000000000000001";
		variable nb : std_logic := '0';
	begin
		if rising_edge(clk) then
			nb := reg(15) xor reg(13) xor reg(12) xor reg(10);
			reg := std_logic_vector(shift_left(unsigned(reg), 1));
			reg(0) := nb;
		end if;
		output <= reg;
	end process;
end lfsr_impl;
