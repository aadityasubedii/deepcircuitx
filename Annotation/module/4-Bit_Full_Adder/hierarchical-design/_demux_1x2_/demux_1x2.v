`timescale 1ns / 1ps
module demux_1x2(
    input y,sel,
    output d0,d1 
    );
  assign {d0,d1} = sel?{1'b0,y}: {y,1'b0};
endmodule