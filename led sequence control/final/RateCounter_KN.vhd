library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RateCounter_KN is
    Port (      clk: in std_logic;
                reset: in std_logic;
                switch : in std_logic_vector(5 downto 0);
                --step : in std_logic;
                --limit: in std_logic;
                --EN :in std_logic;
                count : out std_logic_vector(23 downto 0);  
                --wrap: out std_logic_vector(4 downto 0);  
                END_count : out std_logic  
            );
end RateCounter_KN;

architecture Behavioral of RateCounter_KN is


signal rate: std_logic_vector(23 downto 0);
signal lim : std_logic_vector(23 downto 0);
type limit_type is array (5 downto 0) of std_logic_vector (23 downto 0); 
signal limit: limit_type := (X"0BEBC2",X"17D784",X"2FAF08",X"5F5E10",X"8F0D18",X"BEBC20");

begin



process(clk, reset,switch)
    begin
    lim <= X"FFFFFF" ;       
    if switch(0)= '1' then
        lim <= limit(0);
    elsif switch(1)= '1' then
        lim <= limit(1);
    elsif switch(2)= '1' then
        lim <= limit(2);
   elsif switch(3)= '1' then
        lim <= limit(3);
   elsif switch(4)= '1' then
        lim <= limit(4);
    elsif switch(5) = '1' then
        lim <= limit(5);                           
    end if; 

            
        if reset = '1' then
            rate <= X"000000";
            END_count <= '0';  
        elsif rising_edge(clk) then
            rate <= rate + '1';
            

            --if rate = X"FFFFFF"  then 
            if rate = X"FFFFFF" or rate = lim then 
                 END_count <= '1' ;
                 rate <= X"000000" ;
                
            end if;
            
               if rate = X"000000" then 
                  END_count <= '0';
               end if;
               
        end if;
    end process;

    count <= rate;



end Behavioral;
