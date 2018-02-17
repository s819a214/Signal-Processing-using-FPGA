

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Rate_Counter_module_tb is
--  Port ( );
end Rate_Counter_module_tb;

architecture Behavioral of Rate_Counter_module_tb is
component Rate_counter_module
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           count : OUT std_logic_vector(4 downto 0)          
             );
end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='1';
            
---outputs
           
            signal count :  std_logic_vector(4 downto 0);
            

-- clock period 
            constant clk_period : time := 10 ns;

begin

-- instantiate UUT
                U : module PORT MAP (
                         clk => clk,
                         reset => reset,
                         count => count                         
                       
                         ); 
-- clock process
            clk_process : process
                               begin
                                   clk <= '0';
                                   wait for clk_period/2;
                                   clk <= '1';
                                   wait for clk_period/2;
                               end process;
                                 
                         
-- stimulus process
             stim_proc : process
                                 begin
                                                reset <= '1';
                                                wait for 100ns;
                                                reset <= '0';                                                
                                                wait  ;
                                       
                                 end process;         
end Behavioral;
