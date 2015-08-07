--Author THL
--Time 2015/7
--Description: fetch stage for cup, generate instruction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use work.ICODE.ALL;

entity cpu is
  port (
    RST : in std_logic;
    CLK : in std_logic;
    ABUS : out std_logic_vector(15 downto 0);
    DBUS : inout std_logic_vector(15 downto 0);
    nMREQ : out std_logic;
    nRD : out std_logic;
    nWR : out std_logic;
    nBHE : out std_logic;
    nBLE : out std_logic;
    nPRD : out std_logic;
    nPWR : out std_logic;
    nPERQ : out std_logic;
    K0 : in std_logic_vector(7 downto 0);
    K1 : in std_logic_vector(7 downto 0);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    K2 : in std_logic_vector(7 downto 0);
    K3 : in std_logic_vector(7 downto 0);
    
    ir : out std_logic_vector(15 downto 0) ;

    tABUS : out std_logic_vector(15 downto 0);
    tDBUS : out std_logic_vector(15 downto 0);
    tnMREQ : out std_logic;
    tnRD : out std_logic;
    tnWR : out std_logic;
    tnBHE : out std_logic;
    tnBLE : out std_logic
  );

end entity; -- cpu

architecture cpu_b of cpu is
    signal tmpABUS :  std_logic_vector(15 downto 0);
    signal tmpnMREQ :  std_logic;
    signal tmpnRD :  std_logic;
    signal tmpnWR :  std_logic;
    signal tmpnBHE :  std_logic;
    signal tmpnBLE :  std_logic;
    signal tmpnPRD :  std_logic;
    signal tmpnPWR :  std_logic;
    signal tmpnPERQ :  std_logic;
    signal IODB : std_logic_vector(7 downto 0) ;	 
    signal IOAD : std_logic_vector(1 downto 0) ;
component fetch is 
    port (CLK: in std_logic;
        RST: in std_logic;
        pc: in std_logic_vector(15 downto 0);
        valp: out std_logic_vector(15 downto 0);
        tpc: out std_logic_vector(15 downto 0)
        );
end component;

component split is
port (ti : in std_logic_vector(15 downto 0);
    code : out std_logic_vector(3 downto 0) ;
    valc : out std_logic_vector(7 downto 0) ;
    ra : out std_logic_vector(2 downto 0) ;
    rb : out std_logic_vector(2 downto 0));
end component;

component alu is 
    port (valc : in std_logic_vector(7 downto 0);
        vala : in std_logic_vector(7 downto 0);
        valb : in std_logic_vector(7 downto 0);
        code : in std_logic_vector(3 downto 0);
        vale : out std_logic_vector(15 downto 0));
end component;

component reg8 is 
    port (CLK : in std_logic;
			rst : in std_logic;
        code : in std_logic_vector(3 downto 0);
        ra : in std_logic_vector(2 downto 0);
        rb : in std_logic_vector(2 downto 0);
        valM : in std_logic_vector(7 downto 0);
        valE : in std_logic_vector(15 downto 0);
        valX : in std_logic_vector(7 downto 0);
        valA : out std_logic_vector(7 downto 0);
        valB : out std_logic_vector(7 downto 0));
end component;

component mem is
    port(CLK: in std_logic;
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
end component;

component xmem is
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
end component;

component newpc is
  port (
    vala : in std_logic_vector(7 downto 0);
    code : in std_logic_vector(3 downto 0);
    valp : in std_logic_vector(15 downto 0);
    vale : in std_logic_vector(15 downto 0);
    npc : out std_logic_vector(15 downto 0)
  );
end component; -- newpc

--fetch
signal wcode:  std_logic_vector(3 downto 0) := "0000";
signal wra:  std_logic_vector(2 downto 0) := "000";
signal wrb:  std_logic_vector(2 downto 0) := "000";
signal wvalp:  std_logic_vector(15 downto 0) := "0000000000000000";
signal wvalc:  std_logic_vector(7 downto 0);
signal wtpc:  std_logic_vector(15 downto 0) := "0000000000000000";

--decode
signal wvalA: std_logic_vector(7 downto 0) := "00000000";
signal wvalB: std_logic_vector(7 downto 0) := "00000000";
-- alu
signal wvale: std_logic_vector(15 downto 0) := "0000000000000000";
-- ram
signal widata:  std_logic_vector(15 downto 0) := "0000000000000000";
signal wddata:  std_logic_vector(15 downto 0) := "0000000000000000";
signal wvalM : std_logic_vector(7 downto 0) := "00000000";
signal wvalX : std_logic_vector(7 downto 0) := "00000000";

-- newpc 
signal wnpc : std_logic_vector(15 downto 0) := "0000000000000000";
begin

fetchmap : fetch port map(
        CLK => CLK,
        RST => RST,
        pc => wnpc,
        valp => wvalp,
        tpc => wtpc);
splitmap : split port map(
    ti => widata ,
    code => wcode, 
    valc => wvalc, 
    ra => wra ,
    rb => wrb 
    );
decodemap : reg8 port map(
        CLK => CLK,
		  RST => RST,
        code => wcode,
        ra => wra,
        rb => wrb,
        valM => wvalM,
        valE => wvalE,
        valX => wvalX,
        valA => wvalA,
        valB => wvalB);
alumap : alu port map(
    valc => wvalc, 
        vala => wvala, 
        valb => wvalb, 
        code => wcode, 
        vale => wvale);
rammap: mem port map(
        CLK => CLK,
        code => wcode, 
        iaddress => wtpc,
        idata => widata,
        daddress => wvalE,
        me => tmpnMREQ, 
        ddataout => wvalM,
		  ddatain => wvalA,
        mwe => tmpnWR, 
        mre => tmpnRD, 
        maddress => tmpABUS, 
        mdata => DBUS,
		  nBLE => tmpnBLE,
		  nBHE => tmpnBHE);
xmemmap : xmem port map(
        CLK => CLK,
		 code => wcode,
        cxaddress => wvale(7 downto 6),
        cxdataout => wvalX,
		  cxdatain => wvalA,
        xwe => tmpnPWR,
        xre => tmpnPRD,
        xdataout => DBUS(7 downto 0),
        xe => tmpnPERQ,
        k1 => k1,
        k2 => k2,
        k3 => k3,
        k0 => k0
    );
newpcmap : newpc port map(
        vala => wvala,
        code => wcode,
        valp => wvalp,
        vale => wvale,
        npc => wnpc);

ABUS <= tmpABUS;
nMREQ <= tmpnMREQ;
nRD <= tmpnRD;
nWR <= tmpnWR;
nBHE <= tmpnBHE;
nBLE <= tmpnBLE;
nPRD <= tmpnPRD;
nPWR <= tmpnPWR;
nPERQ <= tmpnPERQ;

tABUS <= tmpABUS;
tDBUS <= DBUS;
tnMREQ <= tmpnMREQ;
tnRD <= tmpnRD;
tnWR <= tmpnWR;
tnBHE <= tmpnBHE;
tnBLE <= tmpnBLE;

ir <= widata;
end architecture; -- arch


-- r7 <= 00
-- r0 <= 11
-- r1 <= 22
-- add r1, r0
-- sub r1, r0
-- mov r2, r1
-- sta r0, 0080
-- r7 <= 01
-- sta r0, 0100
-- lda r3, 0100
-- r7 <= 00
-- in r0, 00
-- out r0, 00
-- jz r5, 000f
-- 0000
-- jz r0, 0000
-- jmp 0000
