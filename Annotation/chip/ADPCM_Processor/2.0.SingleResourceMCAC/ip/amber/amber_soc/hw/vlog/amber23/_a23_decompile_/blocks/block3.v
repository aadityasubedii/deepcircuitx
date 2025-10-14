function [3:0] get_4bit_signal;
input [2:0] num;
begin
    case (num)
        3'd0: get_4bit_signal = `U_CACHE.i_byte_enable;
    endcase
end
endfunction