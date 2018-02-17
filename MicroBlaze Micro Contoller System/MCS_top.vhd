library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


entity MCS_top is
 Port ( 
   Clk : IN STD_LOGIC;
   Reset : IN STD_LOGIC;
   led : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
   sw : IN STD_LOGIC_VECTOR(15 DOWNTO 0);   
   Tx : IN STD_LOGIC;
   Rx : OUT STD_LOGIC);
end MCS_top;

architecture Behavioral of MCS_top is
component microblaze_mcs_0
        PORT (
        Clk : IN STD_LOGIC;
        Reset : IN STD_LOGIC;
        IO_Addr_Strobe : OUT STD_LOGIC;
        IO_Read_Strobe : OUT STD_LOGIC;
        IO_Write_Strobe : OUT STD_LOGIC;
        IO_Address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        IO_Byte_Enable : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        IO_Write_Data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        IO_Read_Data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        IO_Ready : IN STD_LOGIC;
        UART_rxd : IN STD_LOGIC;
        UART_txd: OUT STD_LOGIC
  );
end component;


component RAM
port (clk  : in std_logic;
      ADDR  : in std_logic_vector(7 downto 0);
	  data_in :  in std_logic_vector(31 downto 0);
      read_EN   : in std_logic;
	  write_EN : in std_logic;
      data_out   : out std_logic_vector(31 downto 0)
          );
end component;



component DFT_mcs 
    port ( clock : in std_logic;
           x : in signed(31 downto 0);  
           Wr : in signed(15 downto 0) ; 
           Wi : in signed(15 downto 0);              
           Xr : out signed(15 downto 0);  
           Xi : out signed(15 downto 0));  

end component;



  signal IO_Addr_Strobe : STD_LOGIC;
  signal IO_Read_Strobe : STD_LOGIC;
  signal IO_Write_Strobe : STD_LOGIC;
  signal  IO_Address : STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal  IO_Byte_Enable : STD_LOGIC_VECTOR(3 DOWNTO 0);
  signal  IO_Write_Data : STD_LOGIC_VECTOR(31 DOWNTO 0) ;
  signal  IO_Read_Data :  STD_LOGIC_VECTOR(31 DOWNTO 0):= X"00000000" ;
  signal  IO_Ready :  STD_LOGIC := '0';
  
  
  
  
  signal Ar : signed(15 downto 0);
  signal Ai : signed(15 downto 0);
  signal Br : signed(15 downto 0);
  signal Bi : signed(15 downto 0);  
  signal Cr : signed(31 downto 0);
  signal Ci : signed(31 downto 0);
  signal Dr : signed(31 downto 0);
  signal Di : signed(31 downto 0);
  signal stage1a : signed(31 downto 0);
  signal stage1b : signed(31 downto 0);
  signal stage1c : signed(31 downto 0);
  signal stage1d : signed(31 downto 0);
  
  
  signal ADDR : std_logic_vector(7 downto 0);
  signal ADDR_to_read : std_logic_vector(7 downto 0);
  signal data_in : std_logic_vector(31 downto 0);
  signal data_out : std_logic_vector(31 downto 0);
  
signal X_0 : signed(31 downto 0);
signal X_1 : signed(31 downto 0);
signal X_2 : signed(31 downto 0);
signal X_3 : signed(31 downto 0);
signal X_4 : signed(31 downto 0);
signal X_5 : signed(31 downto 0);
signal X_6 : signed(31 downto 0);
signal X_7 : signed(31 downto 0);
signal X_8 : signed(31 downto 0);
signal X_9 : signed(31 downto 0);
signal X_10 : signed(31 downto 0);
signal X_11 : signed(31 downto 0);
signal X_12 : signed(31 downto 0);
signal X_13 : signed(31 downto 0);
signal X_14 : signed(31 downto 0);
signal X_15 : signed(31 downto 0);
signal X_16 : signed(31 downto 0);
signal X_17 : signed(31 downto 0);
signal X_18 : signed(31 downto 0);
signal X_19 : signed(31 downto 0);
signal X_20 : signed(31 downto 0);
signal X_21 : signed(31 downto 0);
signal X_22 : signed(31 downto 0);
signal X_23 : signed(31 downto 0);
signal X_24 : signed(31 downto 0);
signal X_25 : signed(31 downto 0);
signal X_26 : signed(31 downto 0);
signal X_27 : signed(31 downto 0);
signal X_28 : signed(31 downto 0);
signal X_29 : signed(31 downto 0);
signal X_30 : signed(31 downto 0);
signal X_31 : signed(31 downto 0);


begin






microblaze_mcs: microblaze_mcs_0 port map (Clk => Clk,Reset => Reset,IO_Addr_Strobe => IO_Addr_Strobe, IO_Read_Strobe  =>  IO_Read_Strobe,IO_Write_Strobe  =>  IO_Write_Strobe,
                                            IO_Address => IO_Address, IO_Byte_Enable => IO_Byte_Enable, IO_Write_Data => IO_Write_Data ,IO_Read_Data => IO_Read_Data,
                                            IO_Ready => IO_Ready, UART_rxd => Tx, UART_txd => Rx);
											
microblaze_RAM: RAM port map (clk => Clk , ADDR => ADDR, data_in => data_in, read_EN => '1' , write_EN => '1', data_out => data_out)	;									
								
microblaze_DFT0: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0040" ,Wi => X"0000" , Xr => X_0(31 downto 16) , Xi => X_0(15 downto 0) );
microblaze_DFT1: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"003F" ,Wi => X"FFF4" , Xr => X_1(31 downto 16) , Xi => X_1(15 downto 0) );
microblaze_DFT2: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"003B" ,Wi => X"FFE8" , Xr => X_2(31 downto 16) , Xi => X_2(15 downto 0) );
microblaze_DFT3: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0035" ,Wi => X"FFDC" , Xr => X_3(31 downto 16) , Xi => X_3(15 downto 0) );
microblaze_DFT4: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"002D" ,Wi => X"FFD3" , Xr => X_4(31 downto 16) , Xi => X_4(15 downto 0) );
microblaze_DFT5: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0024" ,Wi => X"FFCB" , Xr => X_5(31 downto 16) , Xi => X_5(15 downto 0) );
microblaze_DFT6: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0018" ,Wi => X"FFC5" , Xr => X_6(31 downto 16) , Xi => X_6(15 downto 0) );
microblaze_DFT7: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"000D" ,Wi => X"FFC1" , Xr => X_7(31 downto 16) , Xi => X_7(15 downto 0) );
microblaze_DFT8: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0000" ,Wi => X"FFC0" , Xr => X_8(31 downto 16) , Xi => X_8(15 downto 0) );
microblaze_DFT9: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFF3" ,Wi => X"FFC1" , Xr => X_9(31 downto 16) , Xi => X_9(15 downto 0) );
microblaze_DFT10: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFE7" ,Wi => X"FFC5" , Xr => X_10(31 downto 16) , Xi => X_10(15 downto 0) );
microblaze_DFT11: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFDD" ,Wi => X"FFCB" , Xr => X_11(31 downto 16) , Xi => X_11(15 downto 0) );
microblaze_DFT12: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFD3" ,Wi => X"FFD3" , Xr => X_12(31 downto 16) , Xi => X_12(15 downto 0) );
microblaze_DFT13: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFCB" ,Wi => X"FFDC" , Xr => X_13(31 downto 16) , Xi => X_13(15 downto 0) );
microblaze_DFT14: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFE7" ,Wi => X"FFE8" , Xr => X_14(31 downto 16) , Xi => X_14(15 downto 0) );
microblaze_DFT15: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFC1" ,Wi => X"00F3" , Xr => X_15(31 downto 16) , Xi => X_15(15 downto 0) );
microblaze_DFT16: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFC0" ,Wi => X"0000" , Xr => X_16(31 downto 16) , Xi => X_16(15 downto 0) );
microblaze_DFT17: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFC1" ,Wi => X"000D" , Xr => X_17(31 downto 16) , Xi => X_17(15 downto 0) );
microblaze_DFT18: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFC5" ,Wi => X"0018" , Xr => X_18(31 downto 16) , Xi => X_18(15 downto 0) );
microblaze_DFT19: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFCB" ,Wi => X"0024" , Xr => X_19(31 downto 16) , Xi => X_19(15 downto 0) );
microblaze_DFT20: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFD3" ,Wi => X"002D" , Xr => X_20(31 downto 16) , Xi => X_20(15 downto 0) );
microblaze_DFT21: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFDC" ,Wi => X"0035" , Xr => X_21(31 downto 16) , Xi => X_21(15 downto 0) );
microblaze_DFT22: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFE8" ,Wi => X"003B" , Xr => X_22(31 downto 16) , Xi => X_22(15 downto 0) );
microblaze_DFT23: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"FFF4" ,Wi => X"003F" , Xr => X_23(31 downto 16) , Xi => X_23(15 downto 0) );
microblaze_DFT24: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0000" ,Wi => X"0040" , Xr => X_24(31 downto 16) , Xi => X_24(15 downto 0) );
microblaze_DFT25: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"000D" ,Wi => X"003F" , Xr => X_25(31 downto 16) , Xi => X_25(15 downto 0) );
microblaze_DFT26: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0019" ,Wi => X"003B" , Xr => X_26(31 downto 16) , Xi => X_26(15 downto 0) );
microblaze_DFT27: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0024" ,Wi => X"0035" , Xr => X_27(31 downto 16) , Xi => X_27(15 downto 0) );
microblaze_DFT28: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"002D" ,Wi => X"002D" , Xr => X_28(31 downto 16) , Xi => X_28(15 downto 0) );
microblaze_DFT29: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"0035" ,Wi => X"0024" , Xr => X_29(31 downto 16) , Xi => X_29(15 downto 0) );
microblaze_DFT30: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"003B" ,Wi => X"0019" , Xr => X_30(31 downto 16) , Xi => X_30(15 downto 0) );
microblaze_DFT31: DFT_mcs port map (clock => Clk , x => signed(data_out), Wr => X"003F" ,Wi => X"000D" , Xr => X_31(31 downto 16), Xi => X_31(15 downto 0) );




process(Clk)
begin
if rising_edge(Clk) then
 
if Reset = '1' then

else

--IO_Ready <= IO_Addr_Strobe and not(IO_Ready);
IO_Ready <= IO_Addr_Strobe;

--data transfer
if(IO_Addr_Strobe = '1') then


--write operation
if(IO_Write_Strobe = '1') then
case IO_Address is

    when X"C0000000" => led <= IO_Write_Data(15 DOWNTO 0);
    when X"C0000010" => Ar <= signed(IO_Write_Data(31 DOWNTO 16));
                        Ai <= signed(IO_Write_Data(15 DOWNTO 0));
    when X"C0000014" => Br <= signed(IO_Write_Data(31 DOWNTO 16));
                        Bi <= signed(IO_Write_Data(15 DOWNTO 0));
    when X"C0000018" => Cr <= signed(IO_Write_Data(31 DOWNTO 0));
	
    when X"C000001C" => Ci <= signed(IO_Write_Data(31 DOWNTO 0));
	
	when X"C0000050" => ADDR_to_read <= IO_Write_Data(7 DOWNTO 0);
	
	when X"C0000058" => ADDR <= IO_Write_Data(7 DOWNTO 0);
	
	when X"C000005C" => data_in <= IO_Write_Data(31 DOWNTO 0);
                      				
    when others =>
end case;
end if;




--CMAC 

stage1a <= Ar*Br;
stage1b <= Ai*Bi;
stage1c <= Ai*Br;
stage1d <= Ar*Bi;

Dr <= stage1a - stage1b + Cr;
Di <= stage1c + stage1d + Ci;



 
--read operation

if (IO_Read_Strobe = '1') then 
case IO_Address is
when X"C0000000" => IO_Read_Data <= X"0000" & sw;
when X"C0000010" => IO_Read_Data <= std_logic_vector(Ar) & std_logic_vector(Ai);
when X"C0000014" => IO_Read_Data <= std_logic_vector(Br) & std_logic_vector(Bi);
when X"C0000018" => IO_Read_Data <=  std_logic_vector(Cr) ;
when X"C000001C" => IO_Read_Data <=  std_logic_vector(Ci) ;
when X"C0000020" => IO_Read_Data <=  std_logic_vector(Dr) ;
when X"C0000024" => IO_Read_Data <= std_logic_vector(Di) ;

when  X"C0000050" => IO_Read_Data <=   X"000000" &  ADDR_to_read ;
when  X"C0000054" => IO_Read_Data <= std_logic_vector(X_0)  ;  -- to read DFT output
when  X"C0000060" => IO_Read_Data <= std_logic_vector(X_1) ;
when  X"C0000064" => IO_Read_Data <= std_logic_vector(X_2) ;
when  X"C0000068" => IO_Read_Data <= std_logic_vector(X_3) ;
when  X"C000006C" => IO_Read_Data <= std_logic_vector(X_4) ;
when  X"C0000070" => IO_Read_Data <= std_logic_vector(X_5) ;
when  X"C0000074" => IO_Read_Data <= std_logic_vector(X_6) ;
when  X"C0000078" => IO_Read_Data <= std_logic_vector(X_7) ;
when  X"C000007C" => IO_Read_Data <= std_logic_vector(X_8) ;
when  X"C0000080" => IO_Read_Data <= std_logic_vector(X_9) ;
when  X"C0000084" => IO_Read_Data <= std_logic_vector(X_10) ;
when  X"C0000088" => IO_Read_Data <= std_logic_vector(X_11) ;
when  X"C000008C" => IO_Read_Data <= std_logic_vector(X_12) ;
when  X"C0000090" => IO_Read_Data <= std_logic_vector(X_13) ;
when  X"C0000094" => IO_Read_Data <= std_logic_vector(X_14) ;
when  X"C0000098" => IO_Read_Data <= std_logic_vector(X_15) ;
when  X"C000009C" => IO_Read_Data <= std_logic_vector(X_16) ;
when  X"C00000A0" => IO_Read_Data <= std_logic_vector(X_17) ;
when  X"C00000A4" => IO_Read_Data <= std_logic_vector(X_18) ;
when  X"C00000A8" => IO_Read_Data <= std_logic_vector(X_19) ;
when  X"C00000AC" => IO_Read_Data <= std_logic_vector(X_20) ;
when  X"C00000B0" => IO_Read_Data <= std_logic_vector(X_21) ;
when  X"C00000B4" => IO_Read_Data <= std_logic_vector(X_22) ;
when  X"C00000B8" => IO_Read_Data <= std_logic_vector(X_23) ;
when  X"C00000BC" => IO_Read_Data <= std_logic_vector(X_24) ;
when  X"C00000C0" => IO_Read_Data <= std_logic_vector(X_25) ;
when  X"C00000C4" => IO_Read_Data <= std_logic_vector(X_26) ;
when  X"C00000C8" => IO_Read_Data <= std_logic_vector(X_27) ;
when  X"C00000CC" => IO_Read_Data <= std_logic_vector(X_28) ;
when  X"C00000D0" => IO_Read_Data <= std_logic_vector(X_29) ;
when  X"C00000D4" => IO_Read_Data <= std_logic_vector(X_30) ;
when  X"C00000D8" => IO_Read_Data <= std_logic_vector(X_31) ;




when  X"C0000058" => IO_Read_Data <= X"000000" & ADDR ;
when  X"C000005C" => IO_Read_Data <=   std_logic_vector(data_out) ;

when others =>
end case;
end if;

end if; -- addr_srtobe


end if;  --reset



end if;-- rising edge
end process;


end Behavioral;