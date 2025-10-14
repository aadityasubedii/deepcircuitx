function [4:0] reg_addr;
input [1:0] mode;
input [3:0] sel;
begin
	casez ({mode, sel}) 
		6'b??0???:	reg_addr = {1'b0, sel};		
		6'b1?1100:	reg_addr = {1'b0, sel};		
		6'b001???:	reg_addr = {1'b0, sel};		
		6'b011???:	reg_addr = {2'b10, sel[2:0]};	
		6'b1?10??:	reg_addr = {1'b0, sel};		
		6'b101101:	reg_addr = {3'b110, sel[1:0]};	
		6'b101110:	reg_addr = {3'b110, sel[1:0]};	
		6'b101111:	reg_addr = {3'b110, sel[1:0]};	
		6'b111101:	reg_addr = {3'b111, sel[1:0]};	
		6'b111110:	reg_addr = {3'b111, sel[1:0]};	
		6'b111111:	reg_addr = {3'b111, sel[1:0]};	
	endcase
end
endfunction