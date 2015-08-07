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
        cxdataout : out std_logic_vector(7 downto 0);
        cxdatain : in std_logic_vector(7 downto 0);
        cxaddress : in std_logic_vector(1 downto 0);
        xdataout : out std_logic_vector(7 downto 0) ;
        xwe : out std_logic;
        xre : out std_logic;
        xe : out std_logic;
    K0 : in std_logic_vector(7 downto 0);
    K1 : in std_logic_vector(7 downto 0);
    K2 : in std_logic_vector(7 downto 0);
    K3 : in std_logic_vector(7 downto 0));
end xmem;

architecture xmem_b of xmem is

begin
process (clk, code, cxdatain, cxaddress, k0, k1, k2, k3)
begin
if (clk = '0') then
    if (code = IOUT) then
        xwe <= '0';
        xre <= '1';
        xe  <= '0';
        xdataout <= cxdatain;
    elsif (code = IIN) then
        xwe <= '1';
        xre <= '0';
        xe  <= '0';
        if (cxaddress = "00") then
            cxdataout <= k0;
        elsif (cxaddress = "01") then
            cxdataout <= k1;
        elsif (cxaddress = "10") then
             cxdataout <= k2;
        elsif (cxaddress = "11") then
            cxdataout <= k3;
        end if;
	 else 
        xwe <= '1';
        xre <= '1';
        xe  <= '1';
		  xdataout <= "ZZZZZZZZ";
    end if;
end if;
end process;

end xmem_b;