function get_1bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_1bit_signal = `U_EXECUTE.o_write_enable;
        3'd1: get_1bit_signal = `U_AMBER.mem_stall;
        3'd2: get_1bit_signal = `U_EXECUTE.o_daddress_valid;
        3'd3: get_1bit_signal = `U_AMBER.core_stall;
        3'd4: get_1bit_signal = `U_WB.mem_read_data_valid_r;
    endcase
end
endfunction