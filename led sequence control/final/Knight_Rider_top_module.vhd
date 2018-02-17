library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Knight_Rider_top_module is
  Port (     clk: in std_logic;
             reset: in std_logic; 
             --EN : in std_logic;
             --step : in std_logic;
             --limit: in std_logic;
             END_count : out std_logic;
             switch : in std_logic_vector(5 downto 0);
             reset_switch : in std_logic;
             led : out std_logic_vector(15 downto 0)
         );
end Knight_Rider_top_module;

architecture Behavioral of Knight_Rider_top_module is



component RateCounter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           --step : in std_logic;
           --limit: in std_logic;
           --EN :in std_logic;
           END_count : out std_logic; 
           switch : in std_logic_vector(5 downto 0);          
           count : OUT std_logic_vector(23 downto 0)          
             );
end component;

component ADDR_Counter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           --step : in std_logic;
           --limit: in std_logic;
           EN :in std_logic;
           --wrap: out std_logic_vector(4 downto 0);  
           --END_count : out std_logic;
           count_out : OUT std_logic_vector(4 downto 0)
           
             );
end component;


component Mem_KN
    Port ( 
            clk : IN std_logic;
            --EN   : in std_logic;
            ADDR  : in std_logic_vector(4 downto 0);
            DO   : out std_logic_vector(15 downto 0)
           
    );
    end component;


signal rate_END :  std_logic;
signal count_ADDR:  std_logic_vector(4 downto 0);
signal data : std_logic_vector(15 downto 0);



begin

rate_counter : RateCounter_KN port map (clk => clk,reset => reset,switch => switch ,END_count => rate_END);
ADDR_counter : ADDR_Counter_KN port map (clk => clk,reset => reset,EN => rate_END,count_out => count_ADDR);
Memory : Mem_KN port map (clk => clk,DO  => data, ADDR => count_ADDR);

END_count <= rate_END ;

process(reset_switch)
begin
if reset_switch = '1' then
    led <= X"0000";
else
        led <= data;
end if;       
end process;      
end Behavioral;
