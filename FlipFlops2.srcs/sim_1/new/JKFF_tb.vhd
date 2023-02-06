----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 04:39:10 PM
-- Design Name: 
-- Module Name: JKFF_tb - Behavioral
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

entity JKFF_tb is
--  Port ( );
end JKFF_tb;

architecture Behavioral of JKFF_tb is

    component JKFF_s 
        port (
            jk : in std_logic_vector (1 downto 0);
            en : in std_logic;
            clk : in std_logic;
            q : out std_logic 
        );
    end component; 

    signal jk : std_logic_vector (1 downto 0); 
    signal en : std_logic; 
    signal clk : std_logic; 
    signal q : std_logic; 

    constant clk_period : time := 20ns; 
    signal clk_stop : boolean; 


begin

    dut : JKFF_s
    port map (
        jk => jk, 
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

        jk <= "00";
        en <= '0'; 

        wait for 50ns; 
        
        jk <= "00";
        en <= '1'; 

        wait for 50ns; 
        
        jk <= "10";
        --en <= '1'; 
        
        wait for 50ns; 
        
        jk <= "01";
        --en <= '0';
        
        wait for 50ns; 
        
        jk <= "11";
        --en <= '0'; 

        wait for 150ns;

        jk <= "00";

        wait for 50ns;

        clk_stop <= false; 
        wait; 

    end process ; -- stim


end Behavioral;
