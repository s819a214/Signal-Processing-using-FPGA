library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RateCounter_tb is
end RateCounter_tb;

architecture Behavioral of RateCounter_tb is

    component RateCounter
    Port ( 
            clk : IN std_logic;
            reset : IN std_logic;
            clk_out : OUT std_logic;
            count_out : OUT std_logic_vector(4 downto 0);
            WE   : in std_logic;
            EN   : in std_logic;
            ADDR : in std_logic_vector(4 downto 0);
            DI   : in std_logic_vector(15 downto 0);
            DO   : out std_logic_vector(15 downto 0))
            
    );
    end component;
    
    ---inputs
    signal clk :  std_logic :='0';
    signal reset :  std_logic :='0';
    signal WE :  std_logic :='1';
    signal EN :  std_logic :='1';
    signal ADDR :  std_logic_vector(4 downto 0) := count_out ;
    signal DI :  std_logic_vector(15 downto 0) :='0000000000000001';
    
      ---outputs
    signal clk_out :  std_logic ;
    signal count_out :  std_logic_vector(4 downto 0);
    signal DO :  std_logic_vector(15 downto 0);
    
    
    -- clock period 
    constant clk_period : time := 0.01 ns;
       
    begin
       -- instantiate UUT
     uut : RateCounter PORT MAP (
              clk => clk,
              reset => reset,
              clk_out => clk_out,
              count_out => count_out;
              
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
               reset <= '1';
               EN <= '0';
               wait for 100ns;
               reset <= '0';
               EN <= '1';
               wait;
        end process; 
        

end Behavioral;
