`timescale 1ns / 1ps

module maintest;

	// Inputs
	reg Sclk;
	reg Dclk;
	reg Frame;
	reg InputL;
	reg InputR;
	reg Start;
	reg Reset_n;
	
	reg [15:0]input_data[0:15055];
	// Outputs
	reg [39:0] data_outl[0:6999];
	reg [39:0] data_outr[0:6999];

	// Outputs
	wire OutputL;
	wire OutputR;
	wire OutReady;
	wire InReady;

	// Instantiate the Unit Under Test (UUT)
	main_module uut (
		.Sclk(Sclk), 
		.Dclk(Dclk), 
		.Frame(Frame), 
		.InputL(InputL), 
		.InputR(InputR), 
		.Start(Start), 
		.Reset_n(Reset_n), 
		.OutputL(OutputL), 
		.OutputR(OutputR), 
		.OutReady(OutReady), 
		.InReady(InReady)
	);
	
	
integer ib,jb,data_out,k,l;
always
begin
	if(Reset_n==1'b0)
	begin
		#1
		Dclk=1'b0;
		//Reset_n=1'b1;
	end
	else
	begin
		#651 Dclk = ~Dclk;
		//Reset_n=1'b1;
	end
end


always #4.65 Sclk = ~Sclk;
always @ (*)
begin
	if(ib==9456 && jb==5)
	begin
		Reset_n = 1'b0;
		#13020; Reset_n = 1'b1;
	end
	if(ib==13056 && jb==9)
	begin
		Reset_n = 1'b0;
		#13020; Reset_n = 1'b1;
	end
end



	initial 
	begin
		Dclk=1'b0;
		Sclk=1'b0;
		Reset_n=1'b1;
		
		Start = 1;
		$readmemh("midin.in", input_data) ;
		data_out=$fopen("data_out.out","w");
		//right=$fopen("output_right.out","w");
	
		#1302; Start = 0;
		Frame = 0;
		ib = 0;
		jb = 15;
		k = -1;
		l = 40;
	
	end

always @(posedge Dclk)
begin
	if(Reset_n==1'b1)
	begin
	if(InReady	== 1)
	begin
		
		if(ib<15056)
		begin
			if(jb==15)
			begin
				Frame = 1'b1;
			end
			if(jb>-1)
			begin
				InputL = input_data[ib][jb]; 
				InputR = input_data[ib+1][jb];#1302;
				Frame = 1'b0;
				jb = jb-1;
			end
			if(jb==-1)
			begin
				ib=ib+2;
				jb=15;
			end
		end
	end
	end
end

always @(posedge Sclk)
begin
	if(OutReady==1'b1)
	begin
	if (l==40)
	begin
		if(Frame==1'b1)
			k=k+1;
	end
	if(k<7000 && k>=0)
	begin
		if(l>-1)
		begin
			l=l-1;
			data_outl[k][l]= OutputL;
			data_outr[k][l]= OutputR;	
			if(l==0)
			begin
				$fwrite(data_out,"   %h      %h\n",data_outl[k],data_outr[k]);
				//$fwrite(right,"%h\n",data_outr[k]);
				l=40;
			end
		end
	end
	if(k==7000)
	begin
		$fclose(data_out);
		//$fclose(right);
	end
	end
end


      
endmodule

