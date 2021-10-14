library ieee;
use ieee.std_logic_1164.all;

entity light is 
  port(
    SW2, SW1, SW0 : in std_logic;
    LED1, LED0 : out std_logic
    );
end light
  
architecture behavior of light is 
  
  signal A, B, C : std_logic;
  signal x, y, f : std_logic;

begin
  A <= SW2;
  B <= SW1;
  C <= SW0;

  x <= not(A) and (B xor C);
  y <= A and (not(B) and not(C));
  LED1 <= x or y;
  LED0 <= not(A) or not(B) or not(C);
end behavior; 
