function [31:0] get_32bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_32bit_signal = `U_EXECUTE.pc_nxt;
        3'd1: get_32bit_signal = `U_FETCH.i_address;
        3'd2: get_32bit_signal = `U_FETCH.i_address;
        3'd3: get_32bit_signal = `U_CACHE.i_write_data;
        3'd4: get_32bit_signal = `U_DECODE.i_read_data;
    endcase
end
endfunction