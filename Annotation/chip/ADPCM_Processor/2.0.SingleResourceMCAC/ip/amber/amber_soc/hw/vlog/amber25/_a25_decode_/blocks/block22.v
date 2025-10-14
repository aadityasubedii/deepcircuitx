always @*
    casez (instruction[15:0])
    16'b???????????????1 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 1],  1'd0};
    16'b??????????????10 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 2],  2'd0};
    16'b?????????????100 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 3],  3'd0};
    16'b????????????1000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 4],  4'd0};
    16'b???????????10000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 5],  5'd0};
    16'b??????????100000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 6],  6'd0};
    16'b?????????1000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 7],  7'd0};
    16'b????????10000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 8],  8'd0};
    16'b???????100000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15: 9],  9'd0};
    16'b??????1000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:10], 10'd0};
    16'b?????10000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:11], 11'd0};
    16'b????100000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:12], 12'd0};
    16'b???1000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:13], 13'd0};
    16'b??10000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15:14], 14'd0};
    16'b?100000000000000 : mtrans_instruction_nxt = {instruction[31:16], instruction[15   ], 15'd0};
    default              : mtrans_instruction_nxt = {instruction[31:16],                     16'd0};
    endcase