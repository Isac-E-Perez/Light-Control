library ieee;
use ieee.std_logic_1164.all;

entity light_tb is 
end light_tb;
  
architecture behavior of light_tb is
  
-- component declaration for the Unit Under Test (UUT)
  
  component light
    port(
        SW2, SW1, SW0 : in std_logic;
        LED1, LED0 : out std_logic
        );
  end component;
  
-- Input
signal SW2 : std_logic := '0';
signal SW1 : std_logic := '0';
signal SW0 : std_logic := '0';

-- Output
signal LED1 : std_logic;
signal LED0 : std_logic;

begin 
-- Instantiate the Unit Under Test (UUT)
  uut : light port map (SW2=>SW2, SW1=>SW1, SW0=>SW0, LED1=>LED1, LED0=>LED0);
    
-- Stimulus process
    stim_proc: process
    begin
      wait for 100 ns; -- hold reset state for 100 ns
      
      -- Stimuli:
		SW2 <= '0'; SW1 <= '0'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '0'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '1'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '1'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '0'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '0'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '1'; SW0 <= '0'; wait for 20 ns;
		SW2 <= '1'; SW1 <= '1'; SW0 <= '1'; wait for 20 ns;
		SW2 <= '0'; SW1 <= '0'; SW0 <= '0';

    assert false report "Reached end of test";
    wait;
  end process;
end behavior;
