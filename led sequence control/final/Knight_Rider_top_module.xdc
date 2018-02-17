# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
#set_property PACKAGE_PIN E3 [get_ports clk]
#	set_property IOSTANDARD LVCMOS33 [get_ports clk]
#	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


#set_property -dict { PACKAGE_PIN U9   IOSTANDARD LVCMOS33 } [get_ports { switch[0] }];
#set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { switch[1] }];
#set_property -dict { PACKAGE_PIN R7   IOSTANDARD LVCMOS33 } [get_ports { switch[2] }];
#set_property -dict { PACKAGE_PIN R6   IOSTANDARD LVCMOS33 } [get_ports { switch[3] }];

## LEDs
#Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]
#Bank = 34, Pin name = IO_L24P_T3_34,						Sch name = LED2
set_property PACKAGE_PIN R8 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]
#Bank = 34, Pin name = IO_L23N_T3_34,						Sch name = LED3
set_property PACKAGE_PIN T6 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]
#Bank = 34, Pin name = IO_L12P_T1_MRCC_34,					Sch name = LED4
set_property PACKAGE_PIN T5 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[4]}]
#Bank = 34, Pin name = IO_L12N_T1_MRCC_34,					Sch	name = LED5
set_property PACKAGE_PIN T4 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[5]}]
#Bank = 34, Pin name = IO_L22P_T3_34,						Sch name = LED6
set_property PACKAGE_PIN U7 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[6]}]
#Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[7]}]
#Bank = 34, Pin name = IO_L10N_T1_34,						Sch name = LED8
set_property PACKAGE_PIN V4 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[8]}]
#Bank = 34, Pin name = IO_L8N_T1_34,						Sch name = LED9
set_property PACKAGE_PIN U3 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[9]}]
#Bank = 34, Pin name = IO_L7N_T1_34,						Sch name = LED10
set_property PACKAGE_PIN V1 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[10]}]
#Bank = 34, Pin name = IO_L17P_T2_34,						Sch name = LED11
set_property PACKAGE_PIN R1 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[11]}]
#Bank = 34, Pin name = IO_L13N_T2_MRCC_34,					Sch name = LED12
set_property PACKAGE_PIN P5 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[12]}]
#Bank = 34, Pin name = IO_L7P_T1_34,						Sch name = LED13
set_property PACKAGE_PIN U1 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[13]}]
#Bank = 34, Pin name = IO_L15N_T2_DQS_34,					Sch name = LED14
set_property PACKAGE_PIN R2 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[14]}]
#Bank = 34, Pin name = IO_L15P_T2_DQS_34,					Sch name = LED15
set_property PACKAGE_PIN P2 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led[15]}]




set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]


set_property IOSTANDARD LVCMOS18 [get_ports END_count]


set_property PACKAGE_PIN V7 [get_ports {switch[0]}]
set_property PACKAGE_PIN R5 [get_ports {switch[1]}]
set_property PACKAGE_PIN R7 [get_ports {switch[3]}]
set_property PACKAGE_PIN U9 [get_ports {switch[5]}]
set_property PACKAGE_PIN P4 [get_ports reset_switch]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports reset_switch]


set_property PACKAGE_PIN U8 [get_ports {switch[4]}]
set_property PACKAGE_PIN R6 [get_ports {switch[2]}]
set_property PACKAGE_PIN T1 [get_ports END_count]
set_property PACKAGE_PIN T3 [get_ports reset]
