module PISO (en, Sclk, Start, data_in, word_sent, data_out);

input en, Sclk, Start;
input [39:0] data_in;
output reg word_sent, data_out;
reg [5:0] ybt;
reg [39:0] data;
