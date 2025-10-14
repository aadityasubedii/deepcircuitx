`timescale 1ns/1ns
module cirTest ();
  reg [3:0] wi1, wi2, wi3;
  wire [3:0] outi;
  
  absolutemax MUT ( wi1, wi2, wi3, outi );
  
  initial begin
    #20 wi1=4'b1001; wi2=4'0011; wi3=4'b0010;
    #80 $stop;
  end
    
endmodule
