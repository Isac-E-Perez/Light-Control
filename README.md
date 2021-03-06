# Light Control Project

### About:

For this project, I created a logic circuit and used VHDL code to implement the following circuit whose outputs is *LED1* and *LED0*. There are three switches available. I want LED1 **ON** when only one of the switches is in the **ON** position. I want LED0 **OFF** only when the three switches are in the **ON** position.

**Digital Design Simulation**

<img width="1104" alt="Screen Shot 2021-10-13 at 8 45 15 PM" src="https://user-images.githubusercontent.com/89553126/137236650-3151c64f-7216-4118-b9b8-c063fa3a50ca.png">

**Schematic**

<img width="381" alt="Screen Shot 2021-10-13 at 9 15 07 PM" src="https://user-images.githubusercontent.com/89553126/137239320-33a83e1a-da2a-49a7-a29c-dfa05bfeedf7.png">

**Karnaugh map**

<img width="710" alt="Screen Shot 2021-10-13 at 10 26 26 PM" src="https://user-images.githubusercontent.com/89553126/137246017-ad897070-f914-42ee-8c24-5b146fdc528b.png">


### Note: 

The code is made for the Nexys 4 Artix-7 FPGA Board. I do not have access or own the board so my code is based on the manual specifications found here, https://www.xilinx.com/content/dam/xilinx/support/documentation/university/XUP%20Boards/XUPNexys4DDR/documentation/Nexys4-DDR_rm.pdf 

### Results:

In VHDL, *SW2*, *SW1* and *SW0* are inputs (**IN**), *LED1* and *LED0* are outputs (**OUT**), and *x* and *y* are internal signals (**signal**) of my project.

**I/O's are specified here (the circuit is specified using a Hardware Desciption Language)**

```VHDL
library ieee;
use ieee.std_logic_1164.all;

entity light is 
  port(
    SW2, SW1, SW0 : in std_logic;
    LED1, LED0 : out std_logic
    );
end light;
```

**Internal description of the logic circuit is specified here**

```VHDL
architecture behavior of light is 
  
  -- The intermediate signals must be declared within the body of the architecture 
  -- because they have no link to the outside world and thus do not appear in the entity declaration.
  signal A, B, C : std_logic; -- intermediate signals
  signal x, y, f : std_logic; -- intermediate signals

begin
  A <= SW2;
  B <= SW1;
  C <= SW0;

  x <= not(A) and (B xor C);
  y <= A and (not(B) and not(C));
  LED1 <= x or y;
  LED0 <= not (A and B and C);
end behavior; 
```
 
Although the use of intermediate signals is not mandatory, the tool was used in my VDHL model. The idea here is that I am trying to describe a digital circuit using a textual description language: I will often need to use intermediate signals in order to accomplish my goal of modeling the circuit. The use of intermediate signals allows me to more easily model digital circuits without making the generated hardware more complicated.

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the logical operation of the circuit. Stimuli is provided to the logic circuit, so I can verify the outputs behave as I expect. The VHDL file called '*light_tb*' is where I specified the stimuli to the logic circuit.

```VHDL
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
```

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the logic circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, the process statement is a concurrent statement which is constituted of sequential statements exclusively.

Finally, I verified the units outputted by using a waveform viewer. 

**Test where the variables start at 0**

![1](https://user-images.githubusercontent.com/89553126/137387999-eb119852-69d9-4aa2-b70e-16d21c190cb6.PNG)

**Test where the variables start at *SW2* = 0, *SW1* = 0, and *SW0* = 1**

![2](https://user-images.githubusercontent.com/89553126/137388005-c946dd9b-5777-4569-9dfd-b1c6a8d51162.PNG)

**Test where the variables start at *SW2* = 0, *SW1* = 1, and *SW0* = 0**

![3](https://user-images.githubusercontent.com/89553126/137388011-2a264208-2ea8-4bdd-bf0c-7f3babc1597d.PNG)

**Test where the variables start at *SW2* = 0, *SW1* = 1, and *SW0* = 1**

![4](https://user-images.githubusercontent.com/89553126/137388016-ff62f57a-14b8-4353-ab1e-e37fbc3be47f.PNG)

**Test where the variables start at *SW2* = 1, *SW1* = 0, and *SW0* = 0**

![5](https://user-images.githubusercontent.com/89553126/137388021-1522810c-bde2-45c5-863b-39762c0382a0.PNG)

**Test where the variables start at *SW2* = 1, *SW1* = 0, and *SW0* = 1**

![6](https://user-images.githubusercontent.com/89553126/137388025-f9b8fe76-4a7e-43b3-9ab3-379775462140.PNG)

**Test where the variables start at *SW2* = 1, *SW1* = 1, and *SW0* = 0**

![7](https://user-images.githubusercontent.com/89553126/137388036-76d93cd1-95b0-454b-be1b-731f764c92c6.PNG)

**Test where the variables start at *SW2* = 1, *SW1* = 1, and *SW0* = 1**

![8](https://user-images.githubusercontent.com/89553126/137388043-9b3409b0-fd08-427e-80f6-d5dfa2727f1a.PNG)

**Test where the variables start at *SW2* = 0, *SW1* = 0, and *SW0* = 0 again**

![9](https://user-images.githubusercontent.com/89553126/137388049-fde73679-a47e-40c2-aba0-9db35cba5253.PNG)

Looking back to the Karnaugh map and waveform, the code produce what should be expected, therefore, I know my light code is logically correct. The simulation also confirms that the logic is correct.
