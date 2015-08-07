LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.icode.ALL;


ENTITY decodetest IS
END decodetest;

ARCHITECTURE behavior OF decodetest IS 



COMPONENT reg8
PORT(
	clk : IN  std_logic;
	rst : IN  std_logic;
	code : IN  std_logic_vector(3 downto 0);
	ra : IN  std_logic_vector(2 downto 0);
	rb : IN  std_logic_vector(2 downto 0);
	valM : IN  std_logic_vector(7 downto 0);
	valE : IN  std_logic_vector(15 downto 0);
	valX : IN  std_logic_vector(7 downto 0);
	valA : OUT  std_logic_vector(7 downto 0);
	valB : OUT  std_logic_vector(7 downto 0))
	;
END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal code : std_logic_vector(3 downto 0) := (others => '0');
   signal ra : std_logic_vector(2 downto 0) := (others => '0');
   signal rb : std_logic_vector(2 downto 0) := (others => '0');
   signal valM : std_logic_vector(7 downto 0) := (others => '0');
   signal valE : std_logic_vector(15 downto 0) := (others => '0');
   signal valX : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
 	signal valA : std_logic_vector(7 downto 0);
 	signal valB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

   BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: reg8 PORT MAP (
		clk => clk,
		rst => rst,
		code => code,
		ra => ra,
		rb => rb,
		valM => valM,
		valE => valE,
		valX => valX,
		valA => valA,
		valB => valB
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
      wait for 5 ns;	
      rst <= '0';
      code <= IADD;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;

      code <= ISUB;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;	

      code <= IMOV;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;		

      code <= IMVI;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;	

      code <= ISTA;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;	

      code <= ILDA;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;		

      code <= IJZ;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;		

      code <= IJMP;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;	

      code <= IIN;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;		

      code <= IOUT;
      ra <= "001";
      rb <= "010";
      valM <= "11111110";
      valX <= "11101111";
      valE <= "1000000011011111";
      wait for 10 ns;
      rst <= '1';
      wait for 10 ns;


      wait for clk_period*10;

      -- insert stimulus here 

      wait;
      end process;

      END;
