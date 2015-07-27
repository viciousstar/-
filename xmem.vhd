--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.icode.ALL;

entity xmem is
    port (
        clk : in std_logic;
		  code : in std_logic_vector(3 downto 0);
        cxaddress : in std_logic_vector(1 downto 0);
        cxdataout : out std_logic_vector(7 downto 0);
        cxdatain : in std_logic_vector(7 downto 0);
        xwe : out std_logic;
        xre : out std_logic;
        xaddress : out std_logic_vector(1 downto 0);
        xdata : inout std_logic_vector(7 downto 0);
        xe : out std_logic);
end xmem;

architecture xmem_b of xmem is

begin
process (clk, code, cxdatain, cxaddress, xdata)
begin
    if (code = IOUT) then
        xwe <= '0';
        xre <= '1';
        xe  <= '0';
        xdata <= cxdatain;
        xaddress <= cxaddress;
    elsif (code = IIN) then
        xwe <= '1';
        xre <= '0';
        xe  <= '0';
        xdata <= "ZZZZZZZZ";
        cxdataout <= xdata;
        xaddress <= cxaddress;
	 else 
		  xwe <= '1';
        xre <= '1';
        xe  <= '1';
        xdata <= "ZZZZZZZZ";
        cxdataout <= "ZZZZZZZZ";
        xaddress <= "ZZ";
    end if;
end process;

end xmem_b;