library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity RateCounter is
Port (
        clk: in std_logic;
        reset: in std_logic;
        clk_out: out std_logic;
        count_out: out std_logic_vector(4 downto 0);
        WE   : in std_logic;
        EN   : in std_logic;
        ADDR : in std_logic_vector(4 downto 0);
        DI   : in std_logic_vector(15 downto 0);
        DO   : out std_logic_vector(15 downto 0)
);

end RateCounter;

architecture Behavioral of RateCounter is
    signal rate: std_logic_vector(4 downto 0);
    signal count: std_logic_vector(4 downto 0);
    
    type ram_type is array (31 downto 0) of std_logic_vector (15 downto 0); -- 32 ROWS AND 16 COLUMNS ?????
    signal RAM: ram_type := (X"8000", X"4000",X"2000", X"1000",X"0800", X"0400",X"0200", X"0100",X"0080", X"0040",X"0020", X"0010",X"0008", X"0004",X"0002", X"0001",X"0001",X"0002",X"0004",X"0008",X"0010",X"0020",X"0040",X"0080",X"0100",X"0200",X"0400",X"0800",X"1000",X"2000",X"4000",X"8000"); -- ???????
    --signal ADDR : integer range 0 to 31 ;
    
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



end Behavioral;