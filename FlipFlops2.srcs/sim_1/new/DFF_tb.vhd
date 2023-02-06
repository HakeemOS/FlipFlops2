----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 03:43:45 PM
-- Design Name: 
-- Module Name: DFF_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF_tb is
--  Port ( );
end DFF_tb;

architecture Behavioral of DFF_tb is

    component DFF_s 
        port (
            d : in std_logic;
            en : in std_logic;
            clk : in std_logic;
            q : out std_logic 
        );
    end component; 

    signal d : std_logic; 
    signal en : std_logic; 
    signal clk : std_logic; 
    signal q : std_logic; 

    constant clk_period : time := 20ns; 
    signal clk_stop : boolean; 


begin

    dut : DFF_s
    port map (
        d => d, 
        en => en, 
        clk => clk, 
        q => q
    ); 

    clkproc : process 
    begin
        clk <= '1';  
        wait for clk_period/2; 
        clk <= '0'; 
        wait for clk_period/2; 
    end process ; -- clkproc

    stim : process 
    begin
        wait for 1ns; 

        d <= '1';
        en <= '0'; 

        wait for 50ns; 
        
        --d <= '1';
        en <= '1'; 

        wait for 50ns; 
        
        d <= '0';
        --en <= '1'; 
        
        wait for 50ns; 
        
        d <= '1';
        --en <= '0';
        
        wait for 50ns; 
        
        d <= '0';
        --en <= '0'; 

        clk_stop <= false; 
        wait; 

    end process ; -- stim


end Behavioral;
