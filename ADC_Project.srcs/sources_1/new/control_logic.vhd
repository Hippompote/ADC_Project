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
           rst : out STD_LOGIC;
           clr : out STD_LOGIC;
           enable : out STD_LOGIC;
           clk : in STD_LOGIC);
end control_logic;

architecture Behavioral of control_logic is

    signal enable_reg : STD_LOGIC;
    signal rst_reg : STD_LOGIC;
    signal clr_reg : STD_LOGIC;
    signal counter : INTEGER := 0;
    
    type states is (LOGIC,DELAY);
    signal current_state, next_state : states;
    
    constant CNT : INTEGER := 100;
    
begin

process(clk,cmp)
begin
    if rising_edge(clk) then
        current_state <= next_state;
    end if;   
end process;

process(current_state, cmp, counter)
begin
    next_state <= current_state;
--    enable <= enable_reg;
--    rst <= rst_reg;
--    clr <= clr_reg; 
    case current_state is
    
        when LOGIC =>
            if falling_edge(cmp) then
                counter <= 0;
                enable <= '0';
                clr <= '1';
                rst <= '1';
                next_state <= DELAY;
            elsif cmp = '1' then
                enable <= '1';
                clr <= '0';
                rst <= '0';
            end if;
            
        when DELAY =>
            next_state <= LOGIC;
    end case;

end process;
    


end Behavioral;