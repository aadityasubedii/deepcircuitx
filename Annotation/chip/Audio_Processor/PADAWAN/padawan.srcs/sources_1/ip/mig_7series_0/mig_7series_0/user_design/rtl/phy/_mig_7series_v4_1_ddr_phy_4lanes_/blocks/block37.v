function [79:0] part_select_80;
input [319:0] vector;
input [1:0]  select;
begin
     case (select)
     2'b00 : part_select_80[79:0] = vector[1*80-1:0*80];
     2'b01 : part_select_80[79:0] = vector[2*80-1:1*80];
     2'b10 : part_select_80[79:0] = vector[3*80-1:2*80];
     2'b11 : part_select_80[79:0] = vector[4*80-1:3*80];
     endcase
end
endfunction