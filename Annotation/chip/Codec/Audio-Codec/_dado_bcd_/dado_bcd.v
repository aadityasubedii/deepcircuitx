module dado_bcd(
//Codigo traduzido de uma fonte
//Codigo original disponivel em: https://pubweb.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
input [25:0] dado,
output reg[3:0] zero,
output reg[3:0] um,
output reg[3:0] dois,
output reg[3:0] tres,
output reg[3:0] quatro,
output reg[3:0] cinco,
output reg[3:0] seis,
output reg[3:0] sete);

integer i;
always @(dado)
begin
	sete = 4'd0;
	seis = 4'd0;
	cinco = 4'd0;
	quatro = 4'd0;
	tres = 4'd0;
	dois = 4'd0;
	um = 4'd0;
	zero = 4'd0;
	
	for(i=25; i>=0; i=i-1)
	begin
		if(sete>=5)
			sete = sete + 4'd3;
		if(seis>=5)
			seis = seis + 4'd3;
		if(cinco>=5)
			cinco = cinco + 4'd3;
		if(quatro>=5)
			quatro = quatro + 4'd3;
		if(tres>=5)
			tres = tres + 4'd3;
		if(dois>=5)
			dois = dois + 4'd3;
		if(um>=5)
			um = um + 4'd3;
		if(zero>=5)
			zero = zero + 4'd3;
		
		sete = sete << 1;
		sete[0] = seis[3];
		seis = seis << 1;
		seis[0] = cinco[3];
		cinco = cinco << 1;
		cinco[0] = quatro[3];
		quatro = quatro << 1;
		quatro[0] = tres[3];	
		tres = tres << 1;	
		tres[0] = dois[3];
		dois = dois << 1;
		dois[0] = um[3];
		um = um << 1;
		um[0] = zero[3];
		zero = zero << 1;
		zero[0] = dado[i];
	end
end

endmodule 