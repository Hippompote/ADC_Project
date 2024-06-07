----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2024 08:43:54
-- Design Name: 
-- Module Name: control_logic_tb - Behavioral
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

entity control_logic_tb is
--  Port ( );
end control_logic_tb;

architecture Behavioral of control_logic_tb is

component control_logic is
    Port(
    cmp : in STD_LOGIC;           
    rst : out STD_LOGIC;
    clr : out STD_LOGIC;
    enable : out STD_LOGIC;
    clk : in STD_LOGIC
    );
end component;

signal cmp : std_logic;
signal rst : std_logic;
signal clr : std_logic;
signal enable : std_logic;
signal clk : std_logic;

constant clk_period : time:= 100ns;

begin

uut : control_logic
    port map(
        cmp => cmp,
        rst => rst,
        clr => clr,
        enable => enable,
        clk => clk
        );

clk_proc : process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

cmp_proc: process
begin
    cmp <= '1';
    wait for 5us;
    cmp <= '0';
    wait for 100ns;
end process;

stim_proc : process
begin

wait;

end process;


end Behavioral;
