    generate

        for (i = 0; i < OUT_W; i = i + 1) begin
            assign shifted[OUT_W-(i+1)] = in[IN_W-(i+shift+1)];
        end

    endgenerate