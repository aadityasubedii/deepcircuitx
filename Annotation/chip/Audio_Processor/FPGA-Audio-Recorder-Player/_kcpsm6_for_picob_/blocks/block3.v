assign aaa_decode[1:8]   = hexcharacter(instruction[11:8]);
assign aaa_decode[9:16]  = hexcharacter(instruction[7:4]);
assign aaa_decode[17:24] = hexcharacter(instruction[3:0]);
