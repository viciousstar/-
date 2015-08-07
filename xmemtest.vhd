--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:30:31 07/31/2015
-- Design Name:   
-- Module Name:   C:/Users/HL/Documents/homework/CPU/xmemtest.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: xmem
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
 
ENTITY xmemtest IS
END xmemtest;
 
ARCHITECTURE behavior OF xmemtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT xmem
    PORT(
         clk : IN  std_logic;
         code : IN  std_logic_vector(3 downto 0);
         cxdataout : OUT  std_logic_vector(7 downto 0);
         cxdatain : IN  std_logic_vector(7 downto 0);
         cxaddress : IN  std_logic_vector(1 downto 0);
         xdataout : OUT  std_logic_vector(7 downto 0);
         xwe : OUT  std_logic;
         xre : OUT  std_logic;
         xe : OUT  std_logic;
         K0 : IN  std_logic_vector(7 downto 0);
         K1 : IN  std_logic_vector(7 downto 0);
         K2 : IN  std_logic_vector(7 downto 0);
         K3 : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal code : std_logic_vector(3 downto 0) := (others => '0');
   signal cxdatain : std_logic_vector(7 downto 0) := (others => '0');
   signal cxaddress : std_logic_vector(1 downto 0) := (others => '0');
   signal K0 : std_logic_vector(7 downto 0) := (others => '0');
   signal K1 : std_logic_vector(7 downto 0) := (others => '0');
   signal K2 : std_logic_vector(7 downto 0) := (others => '0');
   signal K3 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal cxdataout : std_logic_vector(7 downto 0);
   signal xdataout : std_logic_vector(7 downto 0);
   signal xwe : std_logic;
   signal xre : std_logic;
   signal xe : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: xmem PORT MAP (
          clk => clk,
          code => code,
          cxdataout => cxdataout,
          cxdatain => cxdatain,
          cxaddress => cxaddress,
          xdataout => xdataout,
          xwe => xwe,
          xre => xre,
          xe => xe,
          K0 => K0,
          K1 => K1,
          K2 => K2,
          K3 => K3
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
		
		CODE <= x"9";
		wait for 5 ns;
		K0 <= x"FF";
		wait for 5 ns;
		
		CODE <= x"a";
		wait for 5 ns;
		cxdatain <= x"ff";
      wait for 5 ns;
		wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
