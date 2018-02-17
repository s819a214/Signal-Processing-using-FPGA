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
                    count_out : out std_logic_vector(4 downto 0) 
                    --wrap: out std_logic_vector(4 downto 0);  
                    --END_count : out std_logic
    );
end ADDR_Counter_KN;

architecture Behavioral of ADDR_Counter_KN is

    signal count: std_logic_vector(4 downto 0);

begin

process(EN,reset)
       begin
           if reset = '1' then
               count <= "00000";
           elsif rising_edge(EN) then  --- include the logic with EN and clk
               count <= count + '1';
           end if;
       end process;
count_out <= count ;


end Behavioral;
