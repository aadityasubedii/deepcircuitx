assign FA= PKS1 ? FA1 : (131072-FA1);

assign UGA2B =(UGA2A+FA);

assign UGA2S =UGA2B[16];

assign a = UGA2S ? {6'b000000, UGA2B[16:7]}+64512 : {6'b000000, UGA2B[16:7]} ;

assign UGA2 = SIGPK ? 0 : a ;         

assign A2S=A2[15];