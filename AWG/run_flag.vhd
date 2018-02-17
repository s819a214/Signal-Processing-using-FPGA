library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity run_flag is
 Port ( clk: in std_logic;
        start : in std_logic;
        done : in std_logic;
        run      : out std_logic  );
end run_flag;

architecture Behavioral of run_flag is
signal temp: std_logic;
begin

process(clk,start,done)
       begin
    if rising_edge(clk) then 
                if start = '1' then  
                 temp<='1';
                end if; 
        
            if temp<='1' then
                if done = '1' then 
               --then EN_rate = 1 and project runs
                temp<='0'; 
                run<='0';       
                else 
                run<='1';              
                end if; 
           end if;
       
      end if;
 end process;
       
       
       
       
       
       
       
       
run<=temp;

end Behavioral;
