

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;


entity DFT_tb is
   
end DFT_tb;

architecture Behavioral of DFT_tb is

component DFT
 port ( clock : in std_logic;
            x : in signed(31 downto 0);  
            Wr : in signed(15 downto 0) ; -- since multiplied by scaling factor of 64  ()6 bit value but to represent sign need one more bit 
            Wi : in signed(15 downto 0);
            ar_temp_out :  out signed(31 downto 0);
            ar_out :  out signed(15 downto 0);
            ai_temp_out :  out signed(31 downto 0); 
            ai_out :  out signed(15 downto 0);
            
                       
            
            X_1r : out signed(15 downto 0);  
            X_1i : out signed(15 downto 0)); 
end component;

---inputs
            signal clock :  std_logic ;
            signal x :   signed(31 downto 0); 
            signal Wr :   signed(15 downto 0):= X"0001"; --X"003F"; --     0.9629*64 => 61
            signal Wi :   signed(15 downto 0):= X"0000"; --X"FFF4"; --    -0.2698*64 => -17
                        


---outputs

         signal X_1r : signed(15 downto 0);  
         signal   X_1i : signed(15 downto 0); 
         signal ar_temp_out : signed(31 downto 0);   
         signal ar_out : signed(15 downto 0);  
         
         signal ai_temp_out : signed(31 downto 0);  
         signal ai_out : signed(15 downto 0); 

 
                   
-- clock period 
                     constant clk_period : time := 10 ns;
         
         
         
         begin
         
         
         -- instantiate UUT
                         UUT : DFT PORT MAP (
                                  clock => clock,
                                  x=> x,
                                  Wr => Wr , Wi => Wi,
                                  ar_out => ar_out,ai_out => ai_out,
                                  ar_temp_out => ar_temp_out,ai_temp_out => ai_temp_out,
                                  X_1r => X_1r,
                                  X_1i => X_1i
                                  ); 
         -- clock process
                     clk_process : process
                                        begin
                                            clock <= '0';
                                            wait for clk_period/2;
                                            clock <= '1';
                                            wait for clk_period/2;
                                        end process;
                                          
                                  
         -- stimulus process
                      stim_proc : process
                                           begin
                                              
                                               x <=  X"0001" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0002" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0003" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0004" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0005" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0006" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0007" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0008" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0009" &  X"0000";
--                                               wait for 20 ns;                                                                                              
--                                               x <=  X"000A" &  X"0000";
--                                               wait for 20 ns;  
--                                               x <=  X"0001" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0002" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0003" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0004" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0005" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0006" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0007" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0008" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0009" &  X"0000";
--                                               wait for 20 ns;                                                                                              
--                                               x <=  X"000A" &  X"0000";
--                                               wait for 20 ns; 
--                                               x <=  X"0001" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0002" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0003" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0004" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0005" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0006" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0007" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0008" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0009" &  X"0000";
--                                               wait for 20 ns;                                                                                              
--                                               x <=  X"000A" &  X"0000";
--                                               wait for 20 ns; 
--                                               x <=  X"0001" &  X"0000";
--                                               wait for 20 ns;
--                                               x <=  X"0002" &  X"0000";
--                                               wait for 20 ns;                                               
                                                                                                                                                                                                                                         
--                                               x <=  X"0000" &  X"0000";
                                           
                                              wait;
                                      end process;          
         end Behavioral;