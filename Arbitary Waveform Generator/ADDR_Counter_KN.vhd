library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity ADDR_Counter_KN is
    Port ( 
                    clk: in std_logic;
                    reset: in std_logic;
                    --step : in std_logic;
                    --limit: in std_logic;
                    EN :in std_logic;
                    count_out : out std_logic_vector(13 downto 0) ;
                    wrap: out std_logic 
                    
    );
end ADDR_Counter_KN;

architecture Behavioral of ADDR_Counter_KN is

    signal count: std_logic_vector(13 downto 0):= "00" & "0000" & "0000" & "0000" ;
    signal wrap_sig : std_logic := '0'; 

begin


process(EN,reset,wrap_sig)
       begin
       
           if reset = '1' then
               count <= "00" & "0000" & "0000" & "0000";
               wrap_sig <= '0'; 
           else
                        if rising_edge(EN) then  --- include the logic with EN and clk
                            if (count = "00" & "0000" & "0000" & "0111") then
                            count <= "00" & "0000" & "0000" & "0000";
                            wrap_sig <= '1'; 
                           else
                                   count <= count + '1';
                                   wrap_sig <= '0'; 
                            end if; --limit
                     
                       end if; --rising edge
           end if;
          end process;
           
wrap <= wrap_sig;
count_out <= count ;


end Behavioral;
