
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;



entity Mem_KN is
port (CLK  : in std_logic;
      ADDR  : in std_logic_vector(4 downto 0);
      --EN   : in std_logic;
      DO   : out std_logic_vector(15 downto 0)
          );
end Mem_KN;

architecture Behavioral of Mem_KN is

type ram_type is array (31 downto 0) of std_logic_vector (15 downto 0); 
signal RAM: ram_type := (X"8000", X"4000",X"2000", X"1000",X"0800", X"0400",X"0200", X"0100",X"0080", X"0040",X"0020", X"0010",X"0008", X"0004",X"0002", X"0001",X"0001",X"0002",X"0004",X"0008",X"0010",X"0020",X"0040",X"0080",X"0100",X"0200",X"0400",X"0800",X"1000",X"2000",X"4000",X"8000");
--signal ADDR : std_logic_vector(4 downto 0):= "00000";


begin

process (clk,ADDR)
begin
      
    --if CLK'event and CLK = '1' then
     
            DO <= RAM(conv_integer(ADDR)) ;     -- read enable
     --   end if;

end process;


end Behavioral;
