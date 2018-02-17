library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RateCounter_KN_tb is
--  Port ( );
end RateCounter_KN_tb;

architecture Behavioral of RateCounter_KN_tb is

component RateCounter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           END_count : out std_logic; 
           count : OUT std_logic_vector(4 downto 0)          
             );
end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='1';
            
---outputs
           
            signal count :  std_logic_vector(4 downto 0);
            signal END_count : std_logic ;

-- clock period 
            constant clk_period : time := 10 ns;

begin


-- instantiate UUT
                U : RateCounter_KN PORT MAP (
                         clk => clk,
                         reset => reset,
                         count => count,
                         END_count => END_count                         
                       
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
