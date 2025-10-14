   always@(*)
      case(alucont[2:0])
			3'b000: result <= alu_in1 & alu_in2;
			3'b001: result <= alu_in1 | alu_in2;
			3'b010: result <= sum[WIDTH-1:0];
			3'b011: result <= alu_in2;
			3'b100: result <= alu_in1 ^ alu_in2;
			3'b101: result <= ~alu_in1;
			3'b110: result <= sum[WIDTH-1:0] + Cin;
			3'b111:	result <= alu_in1*alu_in2;
			default: result <= 0;
      endcase