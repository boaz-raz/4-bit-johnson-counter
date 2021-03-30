----------------------------------------------------------------------------------
-- Engineer: Boaz Raz
-- Create Date: 03/28/2021
-- Project Name: 4 bit johnson counter 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity johnson_counter is
port (
        CLOCK : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q : out  STD_LOGIC_VECTOR (3 downto 0)
        );
end johnson_counter;

architecture Behavioral of johnson_counter is

signal temp: std_logic_vector(3 downto 0):= "0000";


begin

process(CLOCK,RESET)
begin
    if RESET = '1' then 
        temp <= "0000";
    elsif Rising_edge(CLOCK) then
        temp(1) <= temp(0);
        temp(2) <= temp(1);
        temp(3) <= temp(2);
        temp(0) <= not temp(3);
    end if;
end process;
Q <= temp;
end Behavioral;
