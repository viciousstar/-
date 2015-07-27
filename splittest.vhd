LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.icode.ALL;

ENTITY splittest IS
END splittest;
 
ARCHITECTURE behavior OF splittest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT split
    PORT(
         ti : IN  std_logic_vector(15 downto 0);
         code : OUT  std_logic_vector(3 downto 0);
         valc : OUT  std_logic_vector(7 downto 0);
         ra : OUT  std_logic_vector(2 downto 0);
         rb : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ti : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal code : std_logic_vector(3 downto 0);
   signal valc : std_logic_vector(7 downto 0);
   signal ra : std_logic_vector(2 downto 0);
   signal rb : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: split PORT MAP (
          ti => ti,
          code => code,
          valc => valc,
          ra => ra,
          rb => rb
        );


   -- Stimulus process
   stim_proc: process
   begin
		ti <= IADD & "111100101000";
		wait for 10 ns;
		ti <= ISUB & "111100101000";
		wait for 10 ns;
		ti <= IMOV & "111100101000";
		wait for 10 ns;
		ti <= IMVI & "111100101000";
		wait for 10 ns;
		ti <= ISTA & "111100101000";
		wait for 10 ns;
		ti <= IJZ & "111100101000";
		wait for 10 ns;
		ti <= IJMP & "111100101000";
		wait for 10 ns;
		ti <= IIN & "111100101000";
		wait for 10 ns;
		ti <= IOUT & "111100101000";
		wait for 10 ns;
		ti <= ILDA & "111100101000";
		wait for 10 ns;
      wait;
   end process;

END;
