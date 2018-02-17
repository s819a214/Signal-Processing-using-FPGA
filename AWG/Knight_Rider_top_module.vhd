library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Knight_Rider_top_module is
  Port (     clk: in std_logic;
             reset: in std_logic; 
             button : in std_logic ;
             run     : out std_logic;
             level : in std_logic_vector(3 downto 0);
             
             END_count : out std_logic;
             count_out : out std_logic_vector(13 downto 0) ;
             wrap: out std_logic; 
             mem_out : out std_logic_vector(9 downto 0);
             data_out : out std_logic_vector(13 downto 0);
             audio_out : out std_logic_vector(9 downto 0);
             error : out std_logic_vector (9 downto 0);
             
             
             dout : out std_logic
             
             
         );
end Knight_Rider_top_module;

architecture Behavioral of Knight_Rider_top_module is


  component run_flag
    port (clk   : in  std_logic;
          start   : in  std_logic;
          done    : in  std_logic;
  		  run     : out std_logic);
  end component;



component RateCounter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           EN_rate :in std_logic;
           END_count : out std_logic;   
           count : OUT std_logic_vector(15 downto 0)            
             );
end component;

component ADDR_Counter_KN
        Port ( 
           clk : IN std_logic;
           reset : IN std_logic;
           EN :in std_logic;
           wrap: out std_logic; 
           
           count_out : OUT std_logic_vector(13 downto 0)
           
             );
end component;


component Mem_KN
    Port ( 
            clk : IN std_logic;
            
            ADDR  : in std_logic_vector(13 downto 0);
            DO   : out std_logic_vector(9 downto 0)
           
    );
    end component;
    
    
component gain_AM
          port (clk    : in  std_logic;
                reset : IN std_logic;
                level    : in  std_logic_vector(3 downto 0);
                data_in  : in  std_logic_vector(9 downto 0);
                data_out : out std_logic_vector(13 downto 0);
                audio_out : out std_logic_vector(9 downto 0));
        end component;
        
component  pdm 
         port (
          clk : in std_logic;
          reset: in std_logic;
          din : in std_logic_vector (9 downto 0);
          dout : out std_logic;
          error : out std_logic_vector (9 downto 0) 
         );

end component;


signal rate_END :  std_logic;
signal count_ADDR:  std_logic_vector(13 downto 0);
signal data : std_logic_vector(9 downto 0);
signal done_sig  : std_logic; --addr counter wrap
signal run_sig   : std_logic; --busy signal
signal mem_out_sig : std_logic_vector(9 downto 0);
signal gain_data : std_logic_vector(13 downto 0) := "00" & "0000" & "0000" & "0000";
signal audio_data : std_logic_vector(9 downto 0) := "00" & "0000" & "0000" ;
signal amp_pdm :  std_logic;
signal error_pdm :std_logic_vector (9 downto 0);


begin

run_ctrl : run_flag port map (clk => clk,start => button, done => done_sig, run => run_sig );
rate_counter : RateCounter_KN port map (clk => clk,reset => reset,END_count => rate_END, EN_rate => run_sig);
ADDR_counter : ADDR_Counter_KN port map (clk => clk,reset => reset,EN => rate_END,count_out => count_ADDR, wrap => done_sig);
Memory : Mem_KN port map (clk => clk,DO  => data, ADDR => count_ADDR);
audio_gain_AM : gain_AM port map (clk => clk,reset => reset , level => level, data_in => data, data_out => gain_data, audio_out => audio_data );
audio_pdm : pdm port map(clk => clk, reset => reset , din=> audio_data , dout => amp_pdm , error => error_pdm);



run <= run_sig;
dout <=  amp_pdm;

END_count <= rate_END ;
count_out <= count_ADDR ;
wrap <= done_sig;
data_out <=  gain_data ;
audio_out <=  audio_data ;
error <=  error_pdm;
mem_out <= data ;



--process(button,data,run_sig,reset,count_ADDR)
--begin
--if button = '0' or run_sig = '0' then 
--    mem_out_sig <= "00" & "0000" & "0000";
--elsif count_ADDR = "00000000000000" then
--       if reset = '1' then
--           mem_out_sig <= "00" & "0000" & "0000"; 
--       elsif reset = '0' then
--           mem_out_sig <= data;
--       end if;
--else
--       mem_out_sig <= data;
--end if;    
   
--end process;  






    
end Behavioral;
