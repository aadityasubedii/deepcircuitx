    always @(posedge ck) begin
        if (gain_out_we) begin
            case (gain_out_addr)
                0   :   out_0 <= gain_out_data;
                1   :   out_1 <= gain_out_data;
                2   :   out_2 <= gain_out_data;
                3   :   out_3 <= gain_out_data;
            endcase
        end
    end