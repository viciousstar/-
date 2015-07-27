--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:51:46 07/27/2015
-- Design Name:   
-- Module Name:   C:/Users/HL/Documents/homework/CPU/alutest.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
use work.icode.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alutest IS
END alutest;
 
ARCHITECTURE behavior OF alutest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         valc : IN  std_logic_vector(7 downto 0);
         vala : IN  std_logic_vector(7 downto 0);
         valb : IN  std_logic_vector(7 downto 0);
         code : IN  std_logic_vector(3 downto 0);
         vale : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal valc : std_logic_vector(7 downto 0) := (others => '0');
   signal vala : std_logic_vector(7 downto 0) := (others => '0');
   signal valb : std_logic_vector(7 downto 0) := (others => '0');
   signal code : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal vale : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          valc => valc,
          vala => vala,
          valb => valb,
          code => code,
          vale => vale
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		


    vala <= "00000001";
    valb <= "00000010";
    valc <= "00000100";
    code <= IADD;
    wait for 10 ns;
    code <= ISUB;
    wait for 10 ns;
    code <= IMOV;
    wait for 10 ns;
    code <= IMVI;
    wait for 10 ns;
    code <= ISTA;
    wait for 10 ns;
    code <= ILDA;
    wait for 10 ns;
    code <= IJMP;
    wait for 10 ns;
    code <= IJZ;
    wait for 10 ns;
    code <= IIN;
    wait for 10 ns;
    code <= IOUT;
    wait for 10 ns;
    code <= IADD;


      -- insert stimulus here 

      wait;
   end process;

END;



