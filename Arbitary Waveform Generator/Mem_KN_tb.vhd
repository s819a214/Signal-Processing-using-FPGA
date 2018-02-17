
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mem_KN_tb is

end Mem_KN_tb;

architecture Behavioral of Mem_KN_tb is

component Mem_KN
    Port ( 
            clk : IN std_logic;
            EN   : in std_logic;
            DO   : out std_logic_vector(15 downto 0)
           
    );
    end component;

 ---inputs
    signal clk :  std_logic ;
    signal EN :  std_logic :='0' ;
   ---outputs
    
    signal DO :  std_logic_vector(15 downto 0);
    
    -- clock period 
    constant clk_period : time := 0.01 ns;


begin


  -- instantiate UUT
     uut2 : Mem_KN PORT MAP (
              clk => clk,
              EN => EN,          
              DO  => DO 
      );

        -- clock process
        clk_process : process
        begin
            clk <= '1';
            wait for clk_period/2;
            clk <= '0';
            wait for clk_period/2;
        end process;
        

        -- stimulus process
        stim_proc : process
        begin
                      EN <= '1';
                      wait;
        end process; 


end Behavioral;
