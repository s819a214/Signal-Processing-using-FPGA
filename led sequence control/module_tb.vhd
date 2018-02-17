
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_tb is
--  Port ( );
end module_tb;

architecture Behavioral of module_tb is

component module
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           clk_out : OUT std_logic;
           count_out : OUT std_logic_vector(4 downto 0);
           DO   : out std_logic_vector(15 downto 0)           
             );
end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='0';
           
---outputs
            signal clk_out :  std_logic ;
            signal count_out :  std_logic_vector(4 downto 0);
            signal DO :  std_logic_vector(15 downto 0);

-- clock period 
            constant clk_period : time := 0.01 ns;

begin

-- instantiate UUT
                U : module PORT MAP (
                         clk => clk,
                         reset => reset,
                         clk_out => clk_out,
                         count_out => count_out,                         
                         DO  => DO
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
                                                wait;
                                       
                                 end process;                                  
                
    
end Behavioral;
