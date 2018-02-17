library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity DFT is
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

end DFT;


architecture Behavioral of DFT is

signal ar : signed(15 downto 0):= X"0000" ;
signal ai : signed(15 downto 0):= X"0000"   ;
signal ar_temp : signed(31 downto 0):= X"0000" &  X"0000" ;
signal ai_temp : signed(31 downto 0):= X"0000" &  X"0000"  ;
signal count : std_logic_vector(7 downto 0):= X"00";

begin

process(clock)
    begin
    
 if rising_edge(clock) then
     
  
     ar_temp <= (ar + x(31 downto 16))* Wr - (ai+ x(15 downto 0))*Wi  ; 
     ar_temp_out <= ar_temp; 
     --ar <=  ar_temp(21 downto 6);  --- result/ 64 , since multiplied 64 factor for W23    right shifted by 6 
     ar <=  ar_temp(15 downto 0); 
     ar_out <= ar;
     
     ai_temp <= (ar + x(31 downto 16))* Wi + (ai + x(15 downto 0))* Wr   ;
     ai_temp_out <= ai_temp;
     --ai <=  ai_temp(21 downto 6); 
     ai <=  ai_temp(15 downto 0);
     ai_out <= ai;
     count <= count + '1';
     if count = X"3E" then  ----- 31*2...count 32
         ar_temp <=   X"0000" &  X"0000" ;
         ai_temp <=  X"0000" &  X"0000"  ;
         count <= X"00";
         X_1r <= ar + x(31 downto 16);
         X_1i <= ai + x(15 downto 0);
         ar <=  X"0000" ;        
         ai <=  X"0000";         
         
     end if;
     

     
end if;

end process;


end Behavioral;

