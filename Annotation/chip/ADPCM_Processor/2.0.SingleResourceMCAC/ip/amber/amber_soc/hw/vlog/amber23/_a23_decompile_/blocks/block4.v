function get_1bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_1bit_signal = `U_FETCH.i_write_enable;
        3'd1: get_1bit_signal = `U_AMBER.fetch_stall;
        3'd2: get_1bit_signal = 1'd0;
        3'd3: get_1bit_signal = `U_FETCH.i_data_access;
    endcase
end
endfunction