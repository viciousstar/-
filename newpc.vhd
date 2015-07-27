--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.ICODE.ALL;

entity newpc is
  port (
    vala : in std_logic_vector(7 downto 0);
    code : in std_logic_vector(3 downto 0);
    valp : in std_logic_vector(15 downto 0);
    vale : in std_logic_vector(15 downto 0);
    npc : out std_logic_vector(15 downto 0)
  );
end entity; -- newpc

architecture newpc_b of newpc is
begin

npc <= vale when (code = IJMP or (code = IJZ and vala = "00000000")) else
    valp;

end architecture; -- arch