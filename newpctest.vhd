LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.icode.ALL;

ENTITY newpctest IS
END newpctest;
 
ARCHITECTURE behavior OF newpctest IS 
 
   
 
    COMPONENT newpc
    PORT(
         vala : IN  std_logic_vector(7 downto 0);
         code : IN  std_logic_vector(3 downto 0);
         valp : IN  std_logic_vector(15 downto 0);
         vale : IN  std_logic_vector(15 downto 0);
         npc : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal vala : std_logic_vector(7 downto 0) := (others => '0');
   signal code : std_logic_vector(3 downto 0) := (others => '0');
   signal valp : std_logic_vector(15 downto 0) := (others => '0');
   signal vale : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal npc : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: newpc PORT MAP (
          vala => vala,
          code => code,
          valp => valp,
          vale => vale,
          npc => npc
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		vala <= "00000001";
    valp <= "0000000000000010";
    vale <= "0000000000000100";
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
    code <= IJZ;
	 vala <= "00000000";
    wait for 10 ns;
    code <= IIN;
    wait for 10 ns;
    code <= IOUT;
    wait for 10 ns;
    code <= IADD;

      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
