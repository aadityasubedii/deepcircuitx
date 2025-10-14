generate 
    if(TOTALS_MINUS_ONE) begin : totals_minus_one_generate
        assign h_total_int = h_total;
        assign v_total_int = v_total;
    end else begin
        assign h_total_int = h_total - 14'd1;
        assign v_total_int = v_total - 13'd1;
    end
endgenerate