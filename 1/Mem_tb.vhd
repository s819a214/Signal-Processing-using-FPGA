library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Memory_tb is
--  Port ( );
end Memory_tb;

architecture Behavioral of Memory_tb is

    component Memory
    Port ( 
            clk : IN std_logic;
            WE   : in std_logic;
            EN   : in std_logic;
            ADDR : in std_logic_vector(4 downto 0);
            DI   : in std_logic_vector(15 downto 0);
            DO   : out std_logic_vector(15 downto 0));
           
    );
    end component;
    
    ---inputs
    signal clk :  std_logic :='0';
    signal WE :  std_logic :='1';
    signal EN :  std_logic :='1';
    signal ADDR :  std_logic_vector(4 downto 0) :='00000';
    signal DI :  std_logic_vector(15 downto 0) :='0000000000000001';
    
      ---outputs
    
    signal DO :  std_logic_vector(15 downto 0);
    
    -- clock period 
    constant clk_period : time := 0.01 ns;
       
    begin
       -- instantiate UUT
     uut2 : Memory PORT MAP (
              clk => clk,
              WE => WE;
              EN => EN;
              ADDR => ADDR ;
              DI  => DI ;
              DO  => DO ;
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
               EN <= '0';
               wait for 100ns;
               EN <= '1';
               wait;
        end process; 
        

end Behavioral;
