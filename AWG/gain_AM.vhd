library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity gain_AM is
  Port ( clk    : in  std_logic;
          reset : IN std_logic;
          level    : in  std_logic_vector(3 downto 0) ;
          data_in  : in  std_logic_vector(9 downto 0);
  		  data_out : out std_logic_vector(13 downto 0);
  		  audio_out : out std_logic_vector(9 downto 0) );
end gain_AM;


architecture Behavioral of gain_AM is

signal out_sig: std_logic_vector(13 downto 0) := "00000000000000";

--type gain_type is array (15 downto 0) of std_logic_vector (3 downto 0); 
--signal gain_vol: gain_type := (X"0",X"1",X"2",X"3",X"4",X"5",X"6",X"7",X"8",X"9",X"A",X"B",X"C",X"D",X"E",X"F");


begin



process(clk ,level,reset)
    begin
if reset = '0' then
    if rising_edge(clk) then
        
        if data_in = "0000000000" then
            out_sig  <= "00000000000000";
       else      
       out_sig <= data_in * level ;

       end if;
    end if;
    
    
elsif reset = '1' then
out_sig  <= "00000000000000";
end if;

end process;

data_out <= out_sig ;
audio_out <= out_sig(13 downto 4);
 
end Behavioral;
