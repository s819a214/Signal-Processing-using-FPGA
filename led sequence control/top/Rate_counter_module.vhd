library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Rate_counter_module is
       Port (   clk: in std_logic;
                reset: in std_logic;
                --step : in std_logic;
                --limit: in std_logic;
                --EN :in std_logic;
                count : out std_logic_vector(4 downto 0);  
                --wrap: out std_logic_vector(4 downto 0);  
                END_count : out std_logic  
            );
end Rate_counter_module;

architecture Behavioral of Rate_counter_module is

signal rate: std_logic_vector(4 downto 0);

begin

process(clk, reset)
    begin
        if reset = '1' then
            rate <= "00000";  
        elsif rising_edge(clk) then
            rate <= rate + '1';
            if rate = "11111" then 
                 END_count <= '1' ;
            end if;
               if rate = "00000" then 
                  END_count <= '0';
               end if;
               
        end if;
    end process;

    count <= rate;

end Behavioral;
