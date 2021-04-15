library verilog;
use verilog.vl_types.all;
entity multiplex is
    port(
        dado1           : in     vl_logic_vector(2 downto 0);
        dado2           : in     vl_logic_vector(2 downto 0);
        dado3           : in     vl_logic_vector(2 downto 0);
        dado4           : in     vl_logic_vector(2 downto 0);
        sinalControle   : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end multiplex;
