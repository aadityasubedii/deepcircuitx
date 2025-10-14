always @(posedge clock)
begin

	case ({s0,s1,s2,s3})
	
			
			4 'b0000 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end 
			
			4 'b0001 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			
			4 'b0010 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			
			4 'b0011 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			
			4 'b0100 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = s1; out5B = s2; out5C = s3; out6 = 0;  out7 = 0; out8 = 1; end
			
			
			
			
			
			
			
			
			
			
			4 'b0101 :  begin  out0 = 0;  out1 = 0;  out2 = 0;  out3 = 1; out4 = 1; out5Active = 1; out5A = 1; out5B = 0; out5C = 1;  out6 = 0;  out7 = 1; out8 = 1; end
			
			4 'b0110 :  begin  out0 = 0;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = 1; out5B = 0; out5C = 1;  out6 = 1;  out7 = 1; out8 = 0; end
			
			4 'b0111 :  begin  out0 = 1;  out1 = 0;  out2 = 1;  out3 = 0; out4 = 0; out5Active = 1; out5A = 0; out5B = 0; out5C = 1;  out6 = 0;  out7 = 0; out8 = 0; end
			
			4 'b1000 :  begin  out0 = 0;  out1 = 1;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 0; out5A = 0; out5B = 0; out5C = 0;  out6 = 0;  out7 = 0; out8 = 0; end
			
			4 'b1001 :  begin  out0 = 1;  out1 = 0;  out2 = 0;  out3 = 0; out4 = 0; out5Active = 1; out5A = 1; out5B = 0; out5C = 1; out6 = 0;  out7 = 0; out8 = 1; end 
			
		endcase
end