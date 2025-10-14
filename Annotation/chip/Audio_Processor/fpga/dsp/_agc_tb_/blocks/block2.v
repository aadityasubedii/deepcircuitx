    function automatic signed [15:0] calc(input [23:0] value, input [15:0] gain);

        integer mantissa;
        integer exp;
        integer shift;
        integer v;

        begin

            $display("v=%x g=%x", value, gain);

            mantissa = { 1'b1, gain[12:0], 2'b1 };
            exp = gain[15:13];
            shift = 7 - exp;
            v = 16'hffff & (value >>> shift);
            $display("e=%x m=%x", exp, mantissa);
            $display("v=%x s=%x", v, shift);

            calc = mul16(v, mantissa);
        end

    endfunction