--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:37:21 07/30/2015
-- Design Name:   
-- Module Name:   C:/Users/HL/Documents/homework/CPU/cputest.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
         nWR : OUT  std_logic;
         nBHE : OUT  std_logic;
         nBLE : OUT  std_logic;
         nPRD : OUT  std_logic;
         nPWR : OUT  std_logic;
         nPERQ : OUT  std_logic;
         K0 : IN  std_logic_vector(7 downto 0);
         K1 : IN  std_logic_vector(7 downto 0);
         K2 : IN  std_logic_vector(7 downto 0);
         K3 : IN  std_logic_vector(7 downto 0);
         ir : OUT  std_logic_vector(15 downto 0);
         tABUS : OUT  std_logic_vector(15 downto 0);
         tDBUS : OUT  std_logic_vector(15 downto 0);
         tnMREQ : OUT  std_logic;
         tnRD : OUT  std_logic;
         tnWR : OUT  std_logic;
         tnBHE : OUT  std_logic;
         tnBLE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal K0 : std_logic_vector(7 downto 0) := (others => '0');
   signal K1 : std_logic_vector(7 downto 0) := (others => '0');
   signal K2 : std_logic_vector(7 downto 0) := (others => '0');
   signal K3 : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal DBUS : std_logic_vector(15 downto 0);

 	--Outputs
   signal ABUS : std_logic_vector(15 downto 0);
   signal nMREQ : std_logic;
   signal nRD : std_logic;
   signal nWR : std_logic;
   signal nBHE : std_logic;
   signal nBLE : std_logic;
   signal nPRD : std_logic;
   signal nPWR : std_logic;
   signal nPERQ : std_logic;
   signal ir : std_logic_vector(15 downto 0);
   signal tABUS : std_logic_vector(15 downto 0);
   signal tDBUS : std_logic_vector(15 downto 0);
   signal tnMREQ : std_logic;
   signal tnRD : std_logic;
   signal tnWR : std_logic;
   signal tnBHE : std_logic;
   signal tnBLE : std_logic;

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
          nWR => nWR,
          nBHE => nBHE,
          nBLE => nBLE,
          nPRD => nPRD,
          nPWR => nPWR,
          nPERQ => nPERQ,
          K0 => K0,
          K1 => K1,
          K2 => K2,
          K3 => K3,
          ir => ir,
          tABUS => tABUS,
          tDBUS => tDBUS,
          tnMREQ => tnMREQ,
          tnRD => tnRD,
          tnWR => tnWR,
          tnBHE => tnBHE,
          tnBLE => tnBLE
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
      -- hold reset state for 100 ns.
    rst <= '1';
    wait for 5 ns;
    rst <= '0';

    DBUS <= x"4700";
        wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

        DBUS <= x"4011";
        wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

        DBUS <= x"4122";
        wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

        DBUS <= x"1010";
        wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";
      wait for 5 ns;
  
        DBUS <= x"2010";
        wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;


        DBUS <= x"3021";
        wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;


    DBUS <= x"5280";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;


    DBUS <= x"4701";
    wait for 5 ns;
        DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

    DBUS <= x"5000";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait  for 5 ns;


    DBUS <= x"6300";
    wait for 5 ns;
    DBUS <= x"0011";
    wait for 5 ns;

    DBUS <= x"4700";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

    DBUS <= x"9000";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    K0 <= x"ff";
    wait for 5 ns;

    DBUS <= x"a000";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

    DBUS <= x"850f";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

    DBUS <= x"8000";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;

    DBUS <= x"7000";
    wait for 5 ns;
    DBUS <= "ZZZZZZZZZZZZZZZZ";
    wait for 5 ns;


      wait;
   end process;

END;
