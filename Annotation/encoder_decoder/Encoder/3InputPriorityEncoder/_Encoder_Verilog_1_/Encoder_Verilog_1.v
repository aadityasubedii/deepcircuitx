module Encoder(P0,P1,E0,E1,E2);

	input E2,E1,E0;
	output P1,P0;
	wire E2n,E2nn,nand2out,nand2outn,nand3out,nand3outn;
	not(E2n,E2);
	not(E2nn,E2n);
	nand(nand2out,E2n,E1);
	not(nand2outn,nand2out);
	nand(nand3out,nand2out,E2n,E0);
	not(nand3outn,nand3out);
	or(P1,nand2oun,nand3outn);
	or(P0,E2nn,nand3outn);
	
	
endmodule