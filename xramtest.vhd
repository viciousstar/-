LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.icode.ALL; 
 
ENTITY xramtest IS
END xramtest;
 
ARCHITECTURE behavior OF xramtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xmem
    PORT(
         clk : IN  std_logic;
         code : IN  std_logic_vector(3 downto 0);
         cxaddress : IN  std_logic_vector(1 downto 0);
         cxdataout : OUT  std_logic_vector(7 downto 0);
         cxdatain : IN  std_logic_vector(7 downto 0);
         xwe : OUT  std_logic;
         xre : OUT  std_logic;
         xdata : INOUT  std_logic_vector(7 downto 0);
         xe : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal code : std_logic_vector(3 downto 0) := (others => '0');
   signal cxaddress : std_logic_vector(1 downto 0) := (others => '0');
   signal cxdatain : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal xdata : std_logic_vector(7 downto 0);

 	--Outputs
   signal cxdataout : std_logic_vector(7 downto 0);
   signal xwe : std_logic;
   signal xre : std_logic;
   signal xaddress : std_logic_vector(1 downto 0);
   signal xe : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xmem PORT MAP (
          clk => clk,
          code => code,
          cxaddress => cxaddress,
          cxdataout => cxdataout,
          cxdatain => cxdatain,
          xwe => xwe,
          xre => xre,
          xaddress => xaddress,
          xdata => xdata,
          xe => xe
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ns;	


		code <= IOUT;
		cxdatain <= "00000001";
		xdata <= "ZZZZZZZZ";
		wait for 10 ns;
		
		
		
		wait for 20 ns;
		
		code <= IIN;
		xdata <= "00001111";
		wait for 10 ns;
      wait for clk_period*10;


      wait;
   end process;

END;
