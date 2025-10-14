module PISO (Sclk, Clear, Frame, Shifted, Serial_out, p2s_enable, OutReady);
input Sclk, Clear, p2s_enable, Frame;
input [39:0] Shifted;
output reg Serial_out, OutReady;
reg [5:0] bit_count; 

reg out_rdy, frame_flag;
reg [39:0] piso_reg;
