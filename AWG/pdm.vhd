library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pdm is
  port (
   clk : in std_logic;
   reset: in std_logic;
   din : in std_logic_vector (9 downto 0);
   dout : out std_logic;
   error : out std_logic_vector (9 downto 0) 
  );
end pdm;

architecture Behavioral of pdm is

  signal din_sig : std_logic_vector (9 downto 0) ;
  signal error_0 : std_logic_vector (9 downto 0) ;
  signal error_1 : std_logic_vector (9 downto 0) ;
  signal error_sig : std_logic_vector (9 downto 0) := "0000000000";
begin
  process(clk)
  begin
    if rising_edge(clk) then      
        din_sig <= din;
        error_1 <= error_sig + "1111111111" - din_sig;
        error_0 <= error_sig - din_sig;
        
        
        
        if reset = '1' then
              dout <= '0';
              error_sig <= "0000000000";
       elsif (din_sig >= error_sig) then
              dout <= '1';
              error_sig <= error_1;
       else 
              dout <= '0';
              error_sig <= error_0;
       end if;

    end if;
    
 
  end process;
error <= error_sig;
end Behavioral;

