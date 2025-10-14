module RJmem (en, Start, rd_addr, wr_addr, wr, rst, data_in, data_out, w_done, data_valid );
input en, rst, wr, Start;
input [3:0] wr_addr, rd_addr;
input [15:0] data_in;
output reg w_done;
output reg data_valid;
output reg [15:0] data_out;
reg [15:0] MEM [15:0];
