
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ADDR_Counter_KN_tb is
--  Port ( );
end ADDR_Counter_KN_tb;

architecture Behavioral of ADDR_Counter_KN_tb is

component ADDR_Counter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           EN :in std_logic;
           count_out : OUT std_logic_vector(4 downto 0)
             );
end component;


---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='0';
            signal EN :  std_logic ;
---outputs
            signal count_out :  std_logic_vector(4 downto 0);

-- clock period 
            constant clk_period : time := 0.01 ns;
            constant EN_period : time := 10 ns;
begin

-- instantiate UUT
                uut : ADDR_Counter_KN PORT MAP (
                         clk => clk,
                         reset => reset,
                         EN => EN,
                         count_out => count_out
                         );                 
    

-- EN process
        EN_process : process
      begin
          EN <= '0';
          wait for 9.9 ns;
          EN <= '1';
          wait for 0.1 ns;
      end process;
      
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
