library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    port(
        operate : in std_logic_vector(1 downto 0);
        led : out std_logic
    );
end top;

architecture synth of top is
-- components
    -- This is the same as HSOSC in Radiant, just different names
    component SB_HFOSC is
        generic (
            CLKHF_DIV : String := "0b00"
        );
        port (
            CLKHFPU : in std_logic := 'X';
            CLKHFEN : in std_logic := 'X';
            CLKHF : out std_logic := 'X'
        );
    end component;
-- signals
    signal clk : std_logic;
begin
    -- counter/timer control
    osc : SB_HFOSC generic map (CLKHF_DIV => "0b00")
                   port map (CLKHFPU => '1',
                             CLKHFEN => '1',
                             CLKHF => clk);
    
    led <= '1' when (operate = "11") else
           clk when (operate = "10") else
           '0';
end;
