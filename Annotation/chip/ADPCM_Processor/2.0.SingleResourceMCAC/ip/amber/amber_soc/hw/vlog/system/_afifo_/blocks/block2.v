function [2:0] gray8;
input [2:0] binary;
begin
    case(binary)
        3'b000 : gray8 = 3'b000;
        3'b001 : gray8 = 3'b001;
        3'b010 : gray8 = 3'b011;
        3'b011 : gray8 = 3'b010;
        3'b100 : gray8 = 3'b110;
        3'b101 : gray8 = 3'b111;
        3'b110 : gray8 = 3'b101;
        3'b111 : gray8 = 3'b100;
    endcase
end
endfunction