library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Mem is
port (CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(4 downto 0);
          DI   : in std_logic_vector(15 downto 0);
          DO   : out std_logic_vector(15 downto 0));
end Mem;

architecture syn of Mem is

type ram_type is array (31 downto 0) of std_logic_vector (15 downto 0); -- 32 ROWS AND 16 COLUMNS ?????
signal RAM: ram_type := (X"8000", X"4000",X"2000", X"1000",X"0800", X"0400",X"0200", X"0100",X"0080", X"0040",X"0020", X"0010",X"0008", X"0004",X"0002", X"0001",X"0001",X"0002",X"0004",X"0008",X"0010",X"0020",X"0040",X"0080",X"0100",X"0200",X"0400",X"0800",X"1000",X"2000",X"4000",X"8000"); -- ???????
    --signal ADDR : integer range 0 to 31 ;
begin

process (CLK)
begin
    if CLK'event and CLK = '1' then
        if EN = '1' then
            if WE = '1' then            -- write enable
                RAM(conv_integer(ADDR)) <= DI;      -- DI data stored into memory ?????
            end if;
            DO <= RAM(conv_integer(ADDR)) ;     -- read enable
        end if;
    end if;
end process;

end syn; -----????????????????? why syn not behaviour... note in test i wrote behaviour