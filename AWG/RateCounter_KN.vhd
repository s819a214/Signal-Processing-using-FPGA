library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RateCounter_KN is
    Port (      clk: in std_logic;
                reset: in std_logic;
                --switch : in std_logic_vector(5 downto 0);
                --step : in std_logic;
                --limit: in std_logic;
               EN_rate :in std_logic;
               count : out std_logic_vector(15 downto 0); 
                --wrap: out std_logic_vector(4 downto 0);  
                END_count : out std_logic  
            );
end RateCounter_KN;

architecture Behavioral of RateCounter_KN is

signal rate: std_logic_vector(15 downto 0):= X"0000";
signal lim : std_logic_vector(15 downto 0);



begin

process(clk ,reset,EN_rate)
    begin
    
 if EN_rate = '1' then   
    lim <= X"2000" ;       
    if reset = '1'  then
    rate <= X"0000";            
    END_count <= '0';  
    elsif clk'event and clk = '1' then
    if (rate = lim) then
    rate <= X"0000" ;
    END_count <= '1';
     else --not limit
    rate <= rate + '1';
    END_count <= '0';
    end if; --limit
    end if; --rising edge    
 else
   rate <= X"0000" ; 
   END_count <= '0';
 end if;  
    end process;

    count <= rate;



end Behavioral;
