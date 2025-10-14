	initial
	begin
		
		#5 s0=0; s1=0; s2=0; s3=0;
		#1 $display("Test ADD S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=0; s2=0; s3=1;
		#1 $display("Test SUB S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=0; s2=1; s3=0;
		#1 $display("Test AND S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=0; s2=1; s3=1;
		#1 $display("Test OR S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=1; s2=0; s3=0;
		#1 $display("Test SLT S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=1; s2=0; s3=1;
		#1 $display("Test LW S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=1; s2=1; s3=0;
		#1 $display("Test SW S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=0; s1=1; s2=1; s3=1;
		#1 $display("Test BNE S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
		
		
		#9 s0=1; s1=0; s2=0; s3=0;
		#1 $display("Test JMP S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
	
		
		#9 s0=1; s1=0; s2=0; s3=1;
		#1 $display("Test JMP S0=%b, S1=%b, S2=%b, S3=%b, Destination=%b, Jump=%b, Branch=%b, Memory read=%b, Memory write to register=%b, activation ALU=%b, ALUop=%b, ALUop=%b, ALUop=%b, Memory write=%b, ALU source=%b, Register write=%b\n\n",s0,s1,s2,s3,Out0,Out1,Out2,Out3,Out4,Out5Active,Out5A,Out5B,Out5C,Out6,Out7,Out8);
	end