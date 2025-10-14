function [2:0] ungray8;
input [2:0] gray;
begin
    case(gray)
        3'b000 : ungray8 = 3'b000;
        3'b001 : ungray8 = 3'b001;
        3'b011 : ungray8 = 3'b010;
        3'b010 : ungray8 = 3'b011;
        3'b110 : ungray8 = 3'b100;
        3'b111 : ungray8 = 3'b101;
        3'b101 : ungray8 = 3'b110;
        3'b100 : ungray8 = 3'b111;
    endcase
end
endfunction