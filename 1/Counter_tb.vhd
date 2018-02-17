library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Counter_tb is
--  Port ( );
end Counter_tb;

architecture Behavioral of Counter_tb is
     component RateCounter
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           clk_out : OUT std_logic;
           count_out : OUT std_logic_vector(4 downto 0)
             );
end component;
                 
---inputs
            signal clk :  std_logic :='0';
            signal reset :  std_logic :='0';
---outputs
            signal clk_out :  std_logic ;
            signal count_out :  std_logic_vector(4 downto 0);

-- clock period 
            constant clk_period : time := 0.01 ns;
    
begin
 -- instantiate UUT
                uut : Counter PORT MAP (
                         clk => clk,
                         reset => reset,
                         clk_out => clk_out,
                         count_out => count_out
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
               wait for 100ns;
               reset <= '1';
               wait for 100ns;
               reset <= '0';
               wait;
        end process; 

end Behavioral;
