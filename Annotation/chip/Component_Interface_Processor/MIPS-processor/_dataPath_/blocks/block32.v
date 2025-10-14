always @(posedge clock)     
begin

	if(regRead==1'b1)     
	begin
	Out=registers[dataInAdd];
	end
	
	if(regWrite==1'b1)    
	begin
	registers[dataInAdd]=dataIn;
	end	
end