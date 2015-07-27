LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY fetchtest IS
END fetchtest;
 
ARCHITECTURE behavior OF fetchtest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetch
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         pc : IN  std_logic_vector(15 downto 0);
         tpc : OUT  std_logic_vector(15 downto 0);
         valp : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal pc : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal tpc : std_logic_vector(15 downto 0);
   signal valp : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetch PORT MAP (
          CLK => CLK,
          RST => RST,
          pc => pc,
          tpc => tpc,
          valp => valp
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
		pc  <= "1111111111111111";
		wait for clk_period * 2;
		rst <= '0';
		pc  <= "1000000000000000";
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
