----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.01.2021 19:14:23
-- Design Name: 
-- Module Name: Clkdiv - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clkdiv is
port ( clk, rst : in std_logic;
         clk25 : out std_logic;
         clk190 : out std_logic);
end Clkdiv;

architecture archi of Clkdiv is

signal q_int :std_logic_vector(18 downto 0);


begin
process (clk,rst)
 begin                
        if rst = '1' then
             q_int <= (others => '0');
        elsif clk'event and clk='1' then                                   
             q_int <= q_int + 1;
        end if;                
      
end process;

clk25 <= q_int(1);
clk190 <= q_int(18);
end archi;