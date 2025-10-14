module shift_accumulator(
       input shift_enable,
	   input clear,
	   input load,
	   input Sclk,
	   input [39:0] data_in,
	   output [39:0] data_out);
 reg [39:0] shift_acc_reg;
 always @(posedge Sclk or clear)
  begin
   if (clear ==1'b1) 
     shift_acc_reg = 40'b0;
   else if(load && shift_enable)
     shift_acc_reg = {data_in[39],data_in[39:1]};
   else if (load && !shift_enable)
     shift_acc_reg = data_in;
  end
 assign data_out = shift_acc_reg;
endmodule