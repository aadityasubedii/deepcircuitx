always @(aluActiveIn,aluOpB1, aluOpB2, aluOpB3,dataIn1, dataIn2)
begin
	zero=0;cOut=0; lt=0; gt=0;overflow=0; cIn=0;
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 0 && aluOpB3 == 0)
	begin
		dataOut=$signed(dataIn1) + $signed(dataIn2);
		
		
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=(temp3)+(temp4);
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 0 && aluOpB3 == 1)
	begin
	
		dataOut=$signed(dataIn1) - $signed(dataIn2);
		
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=temp3+temp4;
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 1 && aluOpB3 == 0)
	begin
	
		dataOut=dataIn1 & dataIn2;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 0 && aluOpB2 == 1 && aluOpB3 == 1)
	begin
	
		dataOut=dataIn1 | dataIn2;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 1 && aluOpB2 == 0 && aluOpB3 == 0)
	begin
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end

		dataOut=lt;
		
	end
	
	if (aluActiveIn == 1 && aluOpB1 == 1 && aluOpB2 == 0 && aluOpB3 == 1)
	begin
	
		dataOut=dataIn1 + dataIn2;
		
		temp2=$signed(dataIn1) + $signed(dataIn2);
		temp3=dataIn1;
		temp4=dataIn2;
		temp1=temp3+temp4;
		cIn=temp1[15];
		cOut=temp2[16];
		overflow=cIn^cOut;
		
		if(($signed(dataIn1) - $signed(dataIn2))<0)
		begin
			lt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))>0)
		begin
			gt=1;
		end
		else if(($signed(dataIn1) - $signed(dataIn2))==0)
		begin
			zero=1;
		end
		
	end
	

end