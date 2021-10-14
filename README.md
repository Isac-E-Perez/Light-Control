# Light Control Project

### About:

For this project, I created a logic circuit and used VHDL code to implement the following circuit whose outputs is LED0 and LED1.

**Digital Design Simulation**

<img width="1104" alt="Screen Shot 2021-10-13 at 8 45 15 PM" src="https://user-images.githubusercontent.com/89553126/137236650-3151c64f-7216-4118-b9b8-c063fa3a50ca.png">

**Schematic**

<img width="381" alt="Screen Shot 2021-10-13 at 9 15 07 PM" src="https://user-images.githubusercontent.com/89553126/137239320-33a83e1a-da2a-49a7-a29c-dfa05bfeedf7.png">

**The logic**

<img width="710" alt="Screen Shot 2021-10-13 at 10 26 26 PM" src="https://user-images.githubusercontent.com/89553126/137246017-ad897070-f914-42ee-8c24-5b146fdc528b.png">


### Note: 

The code is made for the Nexys 4 Artix-7 FPGA Board. I do not have access or own the board so my code is based on the manual specifications found here, https://www.xilinx.com/content/dam/xilinx/support/documentation/university/XUP%20Boards/XUPNexys4DDR/documentation/Nexys4-DDR_rm.pdf 

### Results:

In VHDL, *SW2*, *SW1* and *SW0* are inputs (**IN**), *LED1* and *LED0* are outputs (**OUT**), and *x* and *y* are internal signals (**signal**) of my project.

**I/O's are specified here (the circuit is specified using a Hardware Desciption Language)**

<img width="251" alt="Screen Shot 2021-10-14 at 2 46 00 PM" src="https://user-images.githubusercontent.com/89553126/137385350-6c67ec95-4072-4002-a190-6eae8f722de1.png">

**Internal description of the logic circuit is specified here**

<img width="251" alt="Screen Shot 2021-10-14 at 2 47 44 PM" src="https://user-images.githubusercontent.com/89553126/137385587-f7a083ed-4406-4f2a-b337-67e7557300a3.png">

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the logical operation of the circuit. Stimuli is provided to the logic circuit, so I can verify the outputs behave as I expect. The VHDL file called '*light_tb*' is where I specified the stimuli to the logic circuit.

<img width="406" alt="Screen Shot 2021-10-14 at 2 49 05 PM" src="https://user-images.githubusercontent.com/89553126/137385769-248d03d8-dde6-46cf-9d73-13d94cd8ade1.png">

<img width="584" alt="Screen Shot 2021-10-14 at 2 49 24 PM" src="https://user-images.githubusercontent.com/89553126/137385779-7e372571-abae-46a0-8815-86f2d1f28660.png">

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the logic circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, a process was created so that I could deliver signals sequentially and not concurrenlty.

Finally, I verified the units outputted by using a waveform viewer. 

Looking back to the ***about*** section of ***logic*** conditions, I produce what should be expected therefore, I know my light code is logically correct.  
![1](https://user-images.githubusercontent.com/89553126/137387999-eb119852-69d9-4aa2-b70e-16d21c190cb6.PNG)
![2](https://user-images.githubusercontent.com/89553126/137388005-c946dd9b-5777-4569-9dfd-b1c6a8d51162.PNG)
![3](https://user-images.githubusercontent.com/89553126/137388011-2a264208-2ea8-4bdd-bf0c-7f3babc1597d.PNG)
![4](https://user-images.githubusercontent.com/89553126/137388016-ff62f57a-14b8-4353-ab1e-e37fbc3be47f.PNG)
![5](https://user-images.githubusercontent.com/89553126/137388021-1522810c-bde2-45c5-863b-39762c0382a0.PNG)
![6](https://user-images.githubusercontent.com/89553126/137388025-f9b8fe76-4a7e-43b3-9ab3-379775462140.PNG)
![7](https://user-images.githubusercontent.com/89553126/137388036-76d93cd1-95b0-454b-be1b-731f764c92c6.PNG)
![8](https://user-images.githubusercontent.com/89553126/137388043-9b3409b0-fd08-427e-80f6-d5dfa2727f1a.PNG)
![9](https://user-images.githubusercontent.com/89553126/137388049-fde73679-a47e-40c2-aba0-9db35cba5253.PNG)
