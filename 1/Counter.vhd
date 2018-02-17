library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity Counter is
Port (
        clk: in std_logic;
        reset: in std_logic;
        clk_out: out std_logic;
        count_out: out std_logic_vector(4 downto 0)
        );
end Counter;

architecture Behavioral of Counter is
    signal rate: std_logic_vector(4 downto 0);
    signal count: std_logic_vector(4 downto 0);





begin
process(clk, reset)
    begin
        if reset = '1' then
            rate <= "00000";
        elsif rising_edge(clk) then
            rate <= rate + '1';
        end if;
    end process;
    clk_out <= rate(1); -- input clk divided by 8
    
     process(rate(1),reset)
       begin
           if reset = '1' then
               count <= "00000";
           elsif rising_edge(rate(1)) then
               count <= count + '1';
           end if;
       end process;
count_out <= count ;

end Behavioral;
