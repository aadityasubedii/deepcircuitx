always @(posedge reset, posedge clk)
begin
	if(reset)
	begin
		f1<=16'h0000;
		f2<=11'h000;
		in_sel <= 4'h0;
		clear<=1'b1;
		done<=1'b0;
		sez<=15'h0000;
		se <=15'h0000;
	end
	else begin
		if (start) begin
			case (in_sel)
				4'h0: begin
					f1<=16'h0000;
					f2<=11'h000;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end

				4'h1: begin
					f1 <= b1;
					f2 <= dq1;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end 

				4'h2: begin
					f1 <= b2;
					f2 <= dq2;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end

				4'h3: begin
					f1 <= b3;
					f2 <= dq3;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end
				
				4'h4: begin
					f1 <= b4;
					f2 <= dq4;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end
		
				4'h5: begin
					f1 <= b5;
					f2 <= dq5;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end
		
				4'h6: begin
					f1 <= b6;
					f2 <= dq6;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=15'h0000;
					se <=15'h0000;
				end
		
				4'h7: begin
					f1 <= a1;
					f2 <= sr1;
					sez <= 15'h0000;
					se <=15'h0000;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
				end
				 
				4'h8: begin
					f1 <= a2;
					f2 <= sr2;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez[14:0]<=S[15:1];
					se <=15'h0000;
				end
		
				4'h9: begin
					f1 <= 16'h0000;
					f2 <= 11'h000;
					in_sel<= in_sel + 1'b1;
					clear<=1'b0;
					done<=1'b0;
					sez<=sez;
					se <=15'h0000;
				end
		
				default: begin
					f1<=16'h0000;
					f2<=11'h000;
					se[14:0]<=S[15:1];
					sez<=sez;
					in_sel<=1'b0;
					clear<=1'b1;
					done<=1'b1;
				end
			endcase 
		end 
	end 
end 