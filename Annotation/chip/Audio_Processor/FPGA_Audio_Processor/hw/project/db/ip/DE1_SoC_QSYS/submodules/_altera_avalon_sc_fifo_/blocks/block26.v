        always @* begin
            internal_out_valid = !empty & ok_to_forward;
        end