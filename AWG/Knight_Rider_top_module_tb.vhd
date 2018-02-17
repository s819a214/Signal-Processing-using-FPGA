
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
           run     : out std_logic;
           level : in std_logic_vector(3 downto 0);
           button : in std_logic;
          
          END_count : out std_logic;
           count_out : out std_logic_vector(13 downto 0) ;
           wrap: out std_logic; 
           mem_out   : out std_logic_vector(9 downto 0);
          data_out : out std_logic_vector(13 downto 0);
          audio_out : out std_logic_vector(9 downto 0);
          error : out std_logic_vector (9 downto 0); 
          
          
          dout : out std_logic
         
                    
             );
end component;

---inputs
            signal clk :  std_logic ;
            signal reset :  std_logic :='0';
         
            signal level :  std_logic_vector(3 downto 0) ;
            signal button :  std_logic ;

           
---outputs

           signal dout : std_logic;
           signal run     : std_logic;
           
           signal mem_out :  std_logic_vector(9 downto 0);
            signal data_out : std_logic_vector(13 downto 0); 
            signal audio_out : std_logic_vector(9 downto 0);              
             signal error : std_logic_vector (9 downto 0);
            signal END_count : std_logic;
            signal count_out : std_logic_vector(13 downto 0) ;
           signal wrap:  std_logic ; 
           
-- clock period 
            constant clk_period : time := 10 ns;



begin


-- instantiate UUT
                UUT : Knight_Rider_top_module PORT MAP (
                         clk => clk,
                         reset => reset,
                         run => run,
                         button => button,
                         level => level,
                         
                         END_count => END_count,
                         count_out => count_out,
                         wrap => wrap,                           
                         mem_out  => mem_out,
                         data_out => data_out,
                         audio_out => audio_out,
                          error => error,
                         
                         
                         dout => dout
                      
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
                                 level <= "0000";
                                 button<='0';
                                 wait for 50 ns;
                                        
                                                button<='1';
                                                level <= "0001";
                                                reset <= '1';
                                                wait for 200ns;
                                                reset <= '0'; 
                                                button <= '1' ;                        
                                                wait for 30 ns  ;
                                       button<='0';
                                       wait for 50 ns;
                                 end process; 


end Behavioral;
