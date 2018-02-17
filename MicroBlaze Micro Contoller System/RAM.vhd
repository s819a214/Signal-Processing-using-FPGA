library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;



entity RAM is
port (clk  : in std_logic;
      ADDR  : in std_logic_vector(7 downto 0);
	  data_in :  in std_logic_vector(31 downto 0);
      read_EN   : in std_logic;
	  write_EN : in std_logic;
      data_out   : out std_logic_vector(31 downto 0)
          );
end RAM;


architecture Behavioral of RAM is

type ram_type is array (255 downto 0) of std_logic_vector (31 downto 0); 
signal RAM: ram_type ;


begin

process (clk,ADDR)
begin
      
    if clk'event and clk = '1' then
     if read_EN = '1'  then                             -- read enable
            data_out <= RAM(conv_integer(ADDR)) ;     
	 end if;

	 if write_EN = '1'   then
	      RAM(conv_integer(ADDR)) <= data_in ; 
		  
	 end if;
			
			
			
			
    end if;

end process;


end Behavioral;


