----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 03:25:28 PM
-- Design Name: 
-- Module Name: JKFF_s - Behavioral
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

entity JKFF_s is
    port (  jk : in std_logic_vector (1 downto 0);
            en : in std_logic; 
            clk : in std_logic; 
            q : out std_logic 
     );
end JKFF_s;

architecture Behavioral of JKFF_s is
    signal q_prev : std_logic := '0'; 
begin
    proc1 : process( clk, en )
    begin
        if (en = '1') then
            if (falling_edge(clk)) then
                case jk is
                    when "00" => q_prev <= q_prev; 
                    when "01" => q_prev <= '0';
                    when "10" => q_prev <= '1';
                    when others => q_prev <= NOT q_prev;
                end case ;
            end if ;
        else
            q_prev <= '0'; 
        end if ;
        q <= q_prev; 
    end process ; -- proc1


end Behavioral;
