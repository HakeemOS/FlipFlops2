----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 03:25:28 PM
-- Design Name: 
-- Module Name: DFF_s - Behavioral
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

entity DFF_s is
    port (  d : in std_logic;
            en : in std_logic;
            clk : in std_logic;
            q : out std_logic );
end DFF_s;

architecture Behavioral of DFF_s is

begin
    
    proc1 : process( clk, en )
    begin
        if (en = '1' ) then
            if (rising_edge(clk)) then  
                q <= d; 
            end if ;
        else 
            q <= '0'; 
        end if ;
    end process ; -- proc1


end Behavioral;
