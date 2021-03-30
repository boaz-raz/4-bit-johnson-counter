----------------------------------------------------------------------------------
-- Engineer: Boaz Raz
-- Create Date: 03/28/2021
-- Project Name: 4 bit johnson counter testbench
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_counter_tb is
end johnson_counter_tb;


architecture Behavioral of johnson_counter_tb is
   --Inputs
   signal CLOCK : std_logic := '0';
   signal RESET : std_logic := '0';

    --Outputs
    signal Q : std_logic_vector(3 downto 0);

   constant CLOCK_PERIOD : time := 10 ns;

begin

   uut: entity work.johnson_counter PORT MAP (
          CLOCK => CLOCK,
          RESET => RESET,
          Q => Q
        );


   CLOCK_PROCESS :process
   begin
        CLOCK <= '0';
        wait for CLOCK_PERIOD/2;
        CLOCK <= '1';
        wait for CLOCK_PERIOD/2;
   end process;

   stim_proc: process
   begin       
        RESET <= '1';
      wait for 2 ns;   
        RESET <= '0';
        wait for 2 ns; 
      wait;
   end process;
   
end Behavioral;
