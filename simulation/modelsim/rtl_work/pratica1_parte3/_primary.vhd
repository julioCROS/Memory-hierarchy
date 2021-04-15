library verilog;
use verilog.vl_types.all;
entity pratica1_parte3 is
    port(
        clock           : in     vl_logic;
        bits            : in     vl_logic_vector(2 downto 0);
        conjunto        : in     vl_logic_vector(2 downto 0);
        write           : in     vl_logic;
        dataToWrite     : in     vl_logic_vector(2 downto 0);
        hit             : out    vl_logic;
        data            : out    vl_logic_vector(2 downto 0)
    );
end pratica1_parte3;
