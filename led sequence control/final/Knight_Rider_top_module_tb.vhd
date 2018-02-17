
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Knight_Rider_top_module_tb is
--  Port ( );
end Knight_Rider_top_module_tb;


architecture Behavioral of Knight_Rider_top_module_tb is

component Knight_Rider_top_module
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           --EN : in std_logic;
           --step : in std_logic;
           --limit: in std_logic;
           END_count : out std_logic;
           led   : out std_logic_vector(15 downto 0)           
             );
end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='0';
           
---outputs
            signal led :  std_logic_vector(15 downto 0);
            signal END_count : std_logic;
-- clock period 
            constant clk_period : time := 10 ns;



begin


-- instantiate UUT
                UUT : Knight_Rider_top_module PORT MAP (
                         clk => clk,
                         reset => reset,
                         END_count => END_count,                        
                         led  => led
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
