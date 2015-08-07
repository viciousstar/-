--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.icode.ALL;

entity mem is
    port(clk : in std_logic;
        code : in std_logic_vector(3 downto 0);
        iaddress: in std_logic_vector(15 downto 0);
        idata: out std_logic_vector(15 downto 0);
        daddress: in std_logic_vector(15 downto 0);
        me : out std_logic;
        ddataout: out std_logic_vector(7 downto 0);
        ddatain: in std_logic_vector(7 downto 0);
        mwe : out std_logic;
        mre : out std_logic;
        maddress : out std_logic_vector(15 downto 0);
        mdata : inout std_logic_vector(15 downto 0);
		  nBHE: out std_logic;
		  nBLE: out std_logic);

end mem;

architecture mem_b of mem is
begin
process (clk, code, ddatain, daddress, mdata, iaddress)
begin
if (clk = '0') then 
    if (code = ISTA) then
        mwe <= '0';
        mre <= '1';
        me  <= '0';
        mdata <= "00000000" & ddatain;
        maddress <= daddress;
	 nBHE <= '1';
	 nBLE <= '0';
    elsif (code = ILDA) then
        mwe <= '1';
        mre <= '0';
        me  <= '0';
        mdata <= "ZZZZZZZZZZZZZZZZ";
        ddataout <= mdata(7 downto 0);
        maddress <= daddress;
	 nBHE <= '1';
	 nBLE <= '0';

	 else 
		  mwe <= '1';
        mre <= '1';
        me  <= '1';
        mdata <= "ZZZZZZZZZZZZZZZZ";
	 nBHE <= '1';
	 nBLE <= '1';
    end if;
else
    mwe <= '1';    
    mre <= '0';
    me  <= '0';
    mdata <= "ZZZZZZZZZZZZZZZZ";
    idata <= mdata;
    maddress <= iaddress;
	 nBHE <= '0';
	 nBLE <= '0';
end if;
end process;



end mem_b;



