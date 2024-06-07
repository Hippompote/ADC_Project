----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2024 08:27:37
-- Design Name: 
-- Module Name: control_logic - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_logic is
    Port ( cmp : in STD_LOGIC;
           rst : out STD_LOGIC:='1';
           clr : out STD_LOGIC:='1';
           enable : out STD_LOGIC:='0';
           clk : in STD_LOGIC);
end control_logic;

architecture Behavioral of control_logic is

    signal enable_reg : STD_LOGIC;
    signal rst_reg : STD_LOGIC;
    signal clr_reg : STD_LOGIC;

    type states is (LOGIC,DELAY);
    signal current_state, next_state : states;
    
    constant CNT : INTEGER := 100;
    
begin

process(clk,cmp)
begin
    if rising_edge(clk) then
        current_state <= next_state;
        enable <= enable_reg;
        clr <= clr_reg;
        rst <= rst_reg;
    end if;   
end process;

process(current_state, cmp)
begin
    next_state <= current_state;
    case current_state is
    
        when LOGIC =>
            if cmp = '1' then
                enable_reg <= '1';
                clr_reg <= '0';
                rst_reg <= '0';
            elsif falling_edge(cmp) then
                next_state <= DELAY;
            end if;

        when DELAY =>
            enable_reg <= '0';
            clr_reg <= '1';
            rst_reg <= '1';
            next_state <= LOGIC;
    end case;

end process;
    


end Behavioral;