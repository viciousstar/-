LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.icode.all; 

 
ENTITY ramtest IS
END ramtest;
 
ARCHITECTURE behavior OF ramtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem
    PORT(
         clk : IN  std_logic;
         code : IN  std_logic_vector(3 downto 0);
         iaddress : IN  std_logic_vector(15 downto 0);
         idata : OUT  std_logic_vector(15 downto 0);
         daddress : IN  std_logic_vector(15 downto 0);
         me : OUT  std_logic;
         ddataout : OUT  std_logic_vector(7 downto 0);
         ddatain : IN  std_logic_vector(7 downto 0);
         mwe : OUT  std_logic;
         mre : OUT  std_logic;
         maddress : OUT  std_logic_vector(15 downto 0);
         mdata : INOUT  std_logic_vector(15 downto 0);
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal code : std_logic_vector(3 downto 0) := (others => '0');
   signal iaddress : std_logic_vector(15 downto 0) := (others => '0');
   signal daddress : std_logic_vector(15 downto 0) := (others => '0');
   signal ddatain : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal mdata : std_logic_vector(15 downto 0);

 	--Outputs
   signal idata : std_logic_vector(15 downto 0);
   signal me : std_logic;
   signal ddataout : std_logic_vector(7 downto 0);
   signal mwe : std_logic;
   signal mre : std_logic;
   signal maddress : std_logic_vector(15 downto 0);
   signal nBHE : std_logic;
   signal nBLE : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem PORT MAP (
          clk => clk,
          code => code,
          iaddress => iaddress,
          idata => idata,
          daddress => daddress,
          me => me,
          ddataout => ddataout,
          ddatain => ddatain,
          mwe => mwe,
          mre => mre,
          maddress => maddress,
          mdata => mdata,
          nBHE => nBHE,
          nBLE => nBLE
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

		code <= ISTA;
		ddatain <= "00000001";
		mdata <= "0000000011111111";
		wait for 5 ns;
		mdata <= "ZZZZZZZZZZZZZZZZ";
		wait for 5 ns;
		
		wait for 20 ns;
		
		code <= ILDA;
		mdata <= "1000000000000001";
		wait for 5 ns;
		mdata <= "0000000000001111";
		wait for 5 ns;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
