
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package icode is

    constant  IADD : std_logic_vector(3 downto 0) := "0001";
    constant  ISUB : std_logic_vector(3 downto 0) := "0010";
    constant  IMOV : std_logic_vector(3 downto 0) := "0011";
    constant  IMVI : std_logic_vector(3 downto 0) := "0100";
    constant  ISTA : std_logic_vector(3 downto 0) := "0101";
    constant  ILDA : std_logic_vector(3 downto 0) := "0110";
    constant  IJMP : std_logic_vector(3 downto 0) := "0111";
    constant  IJZ : std_logic_vector(3 downto 0) := "1000";
    constant  IIN : std_logic_vector(3 downto 0) := "1001";
    constant  IOUT : std_logic_vector(3 downto 0) := "1010";
end icode;

package body icode is

 
end icode;
