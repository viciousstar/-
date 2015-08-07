--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.icode.ALL;

entity fetch is 
    port (CLK: in std_logic;
        RST: in std_logic;
        pc: in std_logic_vector(15 downto 0);
        tpc : out std_logic_vector(15 downto 0);
        valp: out std_logic_vector(15 downto 0)
        );
end fetch;

architecture fetch_B of fetch is


begin
-- clock register pc and reset
process(CLK, RST)
begin
    if (RST = '1') then
        tpc <= "0000000000000000";
		  valp <= "0000000000000000";
        -- reset
    elsif(CLK'event and CLK = '1') then
        tpc <= pc;
		  valp <= pc + "0000000000000001";
    end if;
end process;
-- fetch pc
end architecture;