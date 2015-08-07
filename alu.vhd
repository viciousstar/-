--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.ICODE.ALL;

entity alu is 
    port (valc : in std_logic_vector(7 downto 0);
        vala : in std_logic_vector(7 downto 0);
        valb : in std_logic_vector(7 downto 0);
        code : in std_logic_vector(3 downto 0);
        vale : out std_logic_vector(15 downto 0));
end alu;

architecture alu_b of alu is

begin
vale <="00000000" & (vala + valb) when code = IADD else
    "00000000" & (vala - valb)  when code = ISUB else
        "00000000" & valb when code = IMOV else
            "00000000" & (valc + "00000000") when code = IMVI or code = IIN or code = IOUT else
                valb & valc when code = ISTA or code = ILDA or code = IJZ or code = IJMP;

end alu_b;




                    
                     
