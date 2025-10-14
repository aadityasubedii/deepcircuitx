    function automatic [32:0] mul16(input signed [15:0] a, signed [15:0] b);

        integer sign;
        integer twosc;
        integer out;
        integer m16;

        begin

            $display("a=%x b=%x", a, b);

            sign = a[15];
            twosc = 16'hffff & ((~a) + 1);

            out = b * (sign ? twosc : a);
            $display("o=%x", out);

            m16 = sign ? (1 + ~out) : out;
            $display("m16=%x", m16);
            mul16 = m16;

        end

    endfunction