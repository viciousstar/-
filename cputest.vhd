LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.icode.ALL; 
 
ENTITY cputest IS
END cputest;
 
ARCHITECTURE behavior OF cputest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         ABUS : OUT  std_logic_vector(15 downto 0);
         DBUS : INOUT  std_logic_vector(15 downto 0);
         nMREQ : OUT  std_logic;
         nRD : OUT  std_logic;
         nWD : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
         IOAD : OUT  std_logic_vector(1 downto 0);
         IODB : INOUT  std_logic_vector(7 downto 0);
         nPERQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);
   signal IODB : std_logic_vector(7 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWD : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   signal IOAD : std_logic_vector(1 downto 0);
   signal nPERQ : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu PORT MAP (
          RST => RST,
          CLK => CLK,
          ABUS => ABUS,
          DBUS => DBUS,
          nMREQ => nMREQ,
          nRD => nRD,
          nWD => nWD,
          nBHE => nBHE,
          nBLE => nBLE,
          nPRD => nPRD,
          nPWR => nPWR,
          IOAD => IOAD,
          IODB => IODB,
          nPERQ => nPERQ
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	rst <= '1';
	wait for 5 ns;
	rst <= '0';
	
		DBUS <= IADD & "111100101000";
		wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;
		DBUS <= ISUB & "111100101000";
		wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
		DBUS <= IMOV & "111100101000";
		wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
		DBUS <= IMVI & "111100101000";
		wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
		DBUS <= ISTA & "111100101000";
		wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
		DBUS <= ILDA & "111100101000";
		wait for 5 ns;
    DBUS <= "1111111111111111";
    wait for 5 ns;
    DBUS <= IJZ & "111100101000";
    wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
    DBUS <= IJMP & "111100101000";
    wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;
    DBUS <= IIN & "111100101000";
    wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    IODB <= "10000000";
    wait for 5 ns;
    DBUS <= IOUT & "111100101000";
    wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";

    wait for 5 ns;

	

      wait;
   end process;

END;
