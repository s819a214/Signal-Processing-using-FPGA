
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.numeric_std.all;


entity Mem_KN is
port (CLK  : in std_logic;
      ADDR  : in std_logic_vector(13 downto 0);
      --EN   : in std_logic;
      DO   : out std_logic_vector(9 downto 0)
          );
end Mem_KN;

architecture Behavioral of Mem_KN is
----------------------------------------------------

type mem_type is array(0 to 16383) of std_logic_vector(9 downto 0);
impure function load_mem(file_name : in string) return mem_type is
FILE ram_file : text is in file_name;
variable ram_line : line;
variable temp_value : bit_vector(9 downto 0);
variable ram : mem_type;
begin
for i in mem_type'range loop
readline(ram_file, ram_line);
read(ram_line, temp_value);
ram(i) := to_stdlogicvector(temp_value);
end loop;
return ram;
end function;

signal ROM : mem_type := load_mem("waveform_ten_new.txt");
signal temp : std_logic_vector(9 downto 0) := "0000000000";
--------------------------------------------------

begin

process (clk,ADDR)
begin
      
    if clk'event and clk = '1' then
     
          temp <= ROM(conv_integer(ADDR)) ;     -- read enable
         
     end if;

end process;

DO <= temp;

end Behavioral;
