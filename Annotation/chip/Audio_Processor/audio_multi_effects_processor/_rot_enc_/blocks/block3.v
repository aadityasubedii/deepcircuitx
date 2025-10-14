always@(posedge clk)
begin
	rot_A_in <= rot_A;
	rot_B_in <= rot_B;
	rot_in <= {rot_B_in, rot_A_in};
	case(rot_in)
		2'b00: begin
					rot_q1 <= 0; rot_q2 <= rot_q2;
				 end
		2'b01: begin
					rot_q1 <= rot_q1; rot_q2 <= 0;
				 end
		2'b10: begin
					rot_q1 <= rot_q1; rot_q2 <= 1;
				 end
		2'b11: begin
					rot_q1 <= 1; rot_q2 <= rot_q2;
				 end
		default: begin
						rot_q1 <= rot_q1; rot_q2 <= rot_q2;
					end
	endcase
end