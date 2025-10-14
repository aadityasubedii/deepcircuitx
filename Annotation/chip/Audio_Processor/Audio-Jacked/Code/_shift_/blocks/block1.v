always @(a, b, control)
begin
neg = 0;
if (b[WIDTH-1] == 1) begin  
			b2 = ~b;
			b2 = b2 + 1;
			neg = 1;
			end
else b2 = b;
case (control)
	0:	if (neg) c = a >> b2; 
		else 		c = a << b2;
	1: if(neg)	c = a >>> b2; 
		else 		c = a <<< b2;
	default: c = a;
endcase
end