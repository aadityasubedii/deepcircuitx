function [127:0] insert_32_into_128;
input [1:0]   pos;
input [127:0] word128;
input [31:0]  word32;
begin
     case (pos)
         2'd0: insert_32_into_128 = {word128[127:32], word32};
         2'd1: insert_32_into_128 = {word128[127:64], word32, word128[31:0]};
         2'd2: insert_32_into_128 = {word128[127:96], word32, word128[63:0]};
         2'd3: insert_32_into_128 = {word32, word128[95:0]};
     endcase
end
endfunction