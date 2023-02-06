----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 03:25:28 PM
-- Design Name: 
-- Module Name: TFF_s - Behavioral
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

entity TFF_s is
    port (  t : in std_logic;
            en : in std_logic; 
            clk : in std_logic; 
            q : out std_logic 
);

end TFF_s;

architecture Behavioral of TFF_s is
    signal q_prev : std_logic := '0'; 
begin
    proc1 : process( clk, en )
    begin
        if (en = '1') then
            if (falling_edge(clk)) then
                if (t = '1') then
                    q_prev <= not q_prev; 
                else 
                    q_prev <= q_prev; 
                end if ;
            end if ;
        else
            q_prev <= '0'; 
        end if ;
        q <= q_prev; 
    end process ; -- proc1


end Behavioral;
