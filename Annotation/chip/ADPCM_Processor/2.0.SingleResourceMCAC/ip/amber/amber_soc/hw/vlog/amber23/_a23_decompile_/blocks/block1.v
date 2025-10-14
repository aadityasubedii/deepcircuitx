function more_to_come;
input [15:0] regs;
input [31:0] i;
begin
case (i)
    15 : more_to_come = 1'd0;
    14 : more_to_come =  regs[15]    ? 1'd1 : 1'd0;
    13 : more_to_come = |regs[15:14] ? 1'd1 : 1'd0;
    12 : more_to_come = |regs[15:13] ? 1'd1 : 1'd0;
    11 : more_to_come = |regs[15:12] ? 1'd1 : 1'd0;
    10 : more_to_come = |regs[15:11] ? 1'd1 : 1'd0;
     9 : more_to_come = |regs[15:10] ? 1'd1 : 1'd0;
     8 : more_to_come = |regs[15: 9] ? 1'd1 : 1'd0;
     7 : more_to_come = |regs[15: 8] ? 1'd1 : 1'd0;
     6 : more_to_come = |regs[15: 7] ? 1'd1 : 1'd0;
     5 : more_to_come = |regs[15: 6] ? 1'd1 : 1'd0;
     4 : more_to_come = |regs[15: 5] ? 1'd1 : 1'd0;
     3 : more_to_come = |regs[15: 4] ? 1'd1 : 1'd0;
     2 : more_to_come = |regs[15: 3] ? 1'd1 : 1'd0;
     1 : more_to_come = |regs[15: 2] ? 1'd1 : 1'd0;
     0 : more_to_come = |regs[15: 1] ? 1'd1 : 1'd0;
endcase
end
endfunction