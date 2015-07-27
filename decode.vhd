--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.ICODE.ALL;

entity reg8 is 
    port (clk : in std_logic;
			rst : in std_logic;
        code : in std_logic_vector(3 downto 0);
        ra : in std_logic_vector(2 downto 0);
        rb : in std_logic_vector(2 downto 0);
        valM : in std_logic_vector(7 downto 0);
        valE : in std_logic_vector(15 downto 0);
        valX : in std_logic_vector(7 downto 0);
        valA : out std_logic_vector(7 downto 0);
        valB : out std_logic_vector(7 downto 0));
		  
end reg8;

architecture reg8_b of reg8 is

type reg1 is array(0 to 7) of std_logic_vector(7 downto 0);
signal reg : reg1;  --need init
signal dstE : std_logic_vector(2 downto 0);
signal dstM : std_logic_vector(2 downto 0);
signal dstX : std_logic_vector(2 downto 0);
signal srcA : std_logic_vector(2 downto 0);
signal srcB : std_logic_vector(2 downto 0);
begin
process (code, ra, rb)
begin
if (code = IADD or code = ISUB or code = IMOV) then
    dstE <= ra;
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= ra;
    srcB <= rb;
elsif (code = IMVI) then
    dstE <= ra;
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= "ZZZ";
    srcB <= "ZZZ";
elsif (code = ISTA) then
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= ra;
    srcB <= "111";
elsif (code = ILDA) then
    dstE <="ZZZ";
    dstM <= ra;
    dstX <= "ZZZ";
    srcA <= "ZZZ";
    srcB <= "111";
elsif (code = IJZ) then
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= ra;
    srcB <= "111";
elsif (code = IJMP) then
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= "ZZZ";
    srcB <= "111";
elsif (code = IOUT) then
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= ra;
    srcB <= "111";
elsif (code = IIN) then
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= ra;
    srcA <= "ZZZ";                           
    srcB <= "111";
else
    dstE <="ZZZ";
    dstM <= "ZZZ";
    dstX <= "ZZZ";
    srcA <= "ZZZ";
    srcB <= "ZZZ";
end if;
end process;
  
process(clk, rst)
begin
    if(rst = '1') then
        reg <= ("00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000");
    elsif(clk'event and clk='1') then
        if (dstE /= "ZZZ") then
            reg(conv_integer(dstE)) <= valE(7 downto 0);
        end if;
        if (dstM /= "ZZZ") then
            reg(conv_integer(dstM)) <= valM;
        end if;
        if (dstX /= "ZZZ") then
            reg(conv_integer(dstX)) <= valX;
        end if;
    end if;
end process;

valA <= reg(conv_integer(srcA)) when srcA /= "ZZZ" else
    "ZZZZZZZZ";
valB <= reg(conv_integer(srcB)) when srcB /= "ZZZ" else
    "ZZZZZZZZ";

end reg8_b;