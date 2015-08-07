--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.ICODE.ALL;

entity split is
port (ti : in std_logic_vector(15 downto 0);
    code : out std_logic_vector(3 downto 0) ;
    valc : out std_logic_vector(7 downto 0) ;
    ra : out std_logic_vector(2 downto 0) ;
    rb : out std_logic_vector(2 downto 0));
end split;

architecture Behavioral of split is
signal needtworeg : std_logic;
signal tcode : std_logic_vector(3 downto 0);
begin

tcode <= ti(15 downto 12);
-- judge if we need X and two reg
needtworeg <= '1' when (tcode = IADD or tcode = ISUB or tcode = IMOV) else
    '0';
valc <=  ti(7 downto 0);
ra <= ti(6 downto 4) when needtworeg = '1' else
    ti(10 downto 8);
rb <= ti(2 downto 0) when needtworeg = '1';
code <= tcode;
end Behavioral;

