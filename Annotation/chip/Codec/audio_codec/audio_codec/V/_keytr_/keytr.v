//key debouncer
module keytr (
    input wire clock,
    input wire key,
    output wire KEYON
    );

reg q1, q2, q3;
wire counter_carry, clear;
reg [4:0] counter;

assign counter_carry = (counter == 5'h1f)?1'b1:1'b0;
assign clear = q1 ^ q2;
assign KEYON = !q3;

initial begin
	q1 = 0; q2 = 0; q3 = 0;
end

always @(posedge clock) begin
	if (clear) begin
		counter <= 5'h0;
	end
	else begin
		if (!counter_carry)
			counter <= counter + 1;
	end
end

always@(posedge clock) begin
		q1 <= key;
		q2 <= q1;
		if (counter_carry) 
			q3 <= q2;
		else 
			q3 <= 1'b0;
end

endmodule
