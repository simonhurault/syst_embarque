----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2021 09:20:39
-- Design Name: 
-- Module Name: plasma_basys3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity plasma_basys3 is
    Port ( clk : in STD_LOGIC;
           RsRx : in STD_LOGIC;
           RsTX : out STD_LOGIC;
           led : out STD_LOGIC_VECTOR (7 downto 0);
           bntR : in STD_LOGIC;
           bntL : in STD_LOGIC;
           bntU : in STD_LOGIC;
           bntD : in STD_LOGIC;
           bntC : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (7 downto 0));
end plasma_basys3;

architecture Behavioral of plasma_basys3 is

signal clk25_temp : std_logic;

signal address      : std_logic_vector(31 downto 2);
signal byte_we      : std_logic_vector(3 downto 0); 
signal data_write   : std_logic_vector(31 downto 0);
signal data_read    : std_logic_vector(31 downto 0);
signal pause        : std_logic;
signal no_ddr_start : std_logic;
signal no_ddr_stop  : std_logic;
signal gpioA_in_0   : std_logic_vector(20 downto 0);
signal gpio0_out_0   : std_logic_vector(23 downto 0);

component plasma is
   generic(memory_type : string := "XILINX_16X"; --"DUAL_PORT_" "ALTERA_LPM";
           log_file    : string := "UNUSED";
           ethernet    : std_logic := '0';
           use_cache   : std_logic := '0');
   port(clk          : in std_logic;
        reset        : in std_logic;

        uart_write   : out std_logic;
        uart_read    : in std_logic;

        address      : out std_logic_vector(31 downto 2);
        byte_we      : out std_logic_vector(3 downto 0); 
        data_write   : out std_logic_vector(31 downto 0);
        data_read    : in std_logic_vector(31 downto 0);
        mem_pause_in : in std_logic;
        no_ddr_start : out std_logic;
        no_ddr_stop  : out std_logic;
        
        gpio0_out    : out std_logic_vector(31 downto 0);
        gpioA_in     : in std_logic_vector(31 downto 0));
end component; --entity plasma

component Clkdiv is
port ( clk, rst : in std_logic;
         clk25 : out std_logic);
end component;

begin


inst_1: Clkdiv port map ( clk => clk,
                          rst => bntC,
                        clk25 => clk25_temp); 

inst_2: plasma port map (
                             clk                  => clk25_temp,
                             reset                => bntC,
                             uart_read            => RsRx,
                             uart_write           => RsTx,
                     
                             address              => address,
                             byte_we              => byte_we,
                             data_write           => data_write,
                             data_read            => data_read,
                             mem_pause_in         => pause,
                             no_ddr_start         => no_ddr_start,
                             no_ddr_stop          => no_ddr_stop,
                              
                             gpio0_out(7 downto 0)=> led,
                             gpio0_out(31 downto 8)=> gpio0_out_0,
                             gpioA_in(11)        => bntR,
                             gpioA_in(10)        => bntL,
                             gpioA_in(9)         => bntU,
                             gpioA_in(8)         => bntD,
                             gpioA_in(7 downto 0)=> sw,
                             gpioA_in(31 downto 12) => gpioA_in_0);
                             
gpioA_in_0 <= (others => '0');

end Behavioral;
