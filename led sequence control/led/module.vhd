library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity module is
 Port ( 
        clk: in std_logic;
        reset: in std_logic;
        clk_out: out std_logic;
        count_out: out std_logic_vector(4 downto 0);        
        led   : out std_logic_vector(15 downto 0)
        
 );
end module;

architecture Behavioral of module is

   signal rate: std_logic_vector(23 downto 0);
   signal count: std_logic_vector(4 downto 0);
   type ram_type is array (31 downto 0) of std_logic_vector (15 downto 0); 
   signal RAM: ram_type := (X"8000", X"4000",X"2000", X"1000",X"0800", X"0400",X"0200", X"0100",X"0080", X"0040",X"0020", X"0010",X"0008", X"0004",X"0002", X"0001",X"0001",X"0002",X"0004",X"0008",X"0010",X"0020",X"0040",X"0080",X"0100",X"0200",X"0400",X"0800",X"1000",X"2000",X"4000",X"8000");
   

begin


process(clk, reset)
    begin
        if reset = '1' then
            rate <= "000000000000000000000000";
        elsif rising_edge(clk) then
            rate <= rate + '1';
        end if;
    end process;
    clk_out <= rate(23); -- input clk divided by 4
    
     process(rate(23),reset)
       begin
           if reset = '1' then
               count <= "00000";
           elsif rising_edge(rate(23)) then
               count <= count + '1';
           end if;
       end process;
count_out <= count ;


process (rate(23),count)
    begin
            
            led <= RAM(conv_integer(count)) ;     -- read enable   
            
           

end process;


end Behavioral;
