module adder(out,In1,In2);

output [15:0] out;
input [15:0] In1,In2;

reg [15:0] temp;
always @(In1,In2)
begin
	temp=$signed(In1)+$signed(In2);
end

assign out=temp;

endmodule