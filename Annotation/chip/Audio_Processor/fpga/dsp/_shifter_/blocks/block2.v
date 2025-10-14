    generate

        for (i = 0; i < OUT_W; i = i + 1) begin
            assign shifted[i] = in[i+shift];
        end

    endgenerate