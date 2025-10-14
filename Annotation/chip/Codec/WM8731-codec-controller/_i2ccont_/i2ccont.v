module i2cc(clk, reset, din, wr_i2c, i2c_idle, i2c_sclk, i2c_sdat);
  
  parameter [2:0]
		idle 	= 3'd0,
		inici 	= 3'd1,
		tdata 	= 3'd2,
		akn		= 3'd3,
		stop	= 3'd4,
		turn	= 3'd5;

	input clk, reset, wr_i2c;
	input [23:0] din;
	output i2c_idle, i2c_sclk;
	inout i2c_sdat;
	
	reg [2:0] estat, estat_s;
	reg [23:0] regdin;
	reg sda, scl, resetcq, idl, ackn;
	
	wire [1:0] q;
	wire [4:0] nbit;
	
	comptadorquarts comptadorquarts_i(.clk(clk),.reset(resetcq),.quart(q), .nbit(nbit));
	
	//~ MÃ?QUINA D'ESTATS
	
	always @ (posedge clk)
	if (reset == 1) begin
		estat <= idle;
		end
	else begin
		estat <= estat_s;
		ackn <= (i2c_sdat & estat[1] & estat[0]);
	end
		
	assign i2c_sclk = scl;

	//Transistor sobre el bus.
	assign i2c_sdat = sda ? 1'bz : 1'b0;
	
	assign i2c_idle = idl;
	
	
	
		
	always @ (estat or wr_i2c or nbit or q or ackn)
	case(estat)
		idle:	if (wr_i2c == 1) estat_s = inici;
				else estat_s = idle;
				
		inici:	if (nbit == 5'd1 && q == 2'd2)estat_s = tdata;
				else estat_s = inici;
		
		tdata:	if ((nbit == 5'd9 && q == 2'd2) || (nbit == 5'd18 && q == 2'd2) || (nbit == 5'd27 && q == 2)) estat_s = akn;
				else estat_s = tdata;
				
		//Si estem en el 3er byte o esclau no respon
		akn:	if ((nbit == 5'd28 && q == 2) || (ackn == 1 && q == 2'd3)) estat_s = stop;
				else if ((nbit == 5'd10 || nbit == 5'd19) && q == 2'd2) estat_s = tdata;
				else estat_s = akn;
		
		stop:	if ((nbit == 5'd11 || nbit == 5'd20 || nbit == 5'd29)) estat_s = turn;
				else estat_s = stop;
		
		turn:	if ((nbit == 5'd12 || nbit == 5'd21 || nbit == 5'd30)) estat_s = idle;
				else estat_s = turn;
				
		default: if (wr_i2c == 1) estat_s = inici;
				else estat_s = idle;
		
	endcase	
	
	always@(estat or nbit or q or din or regdin or estat_s)
	case(estat)
		idle:
			begin
			regdin = din;
			sda = 1;
			scl = 1;
			resetcq = 1;
			idl = 1;
			end
			
		inici:
			begin
			resetcq = 0;
			if (nbit == 5'd0 && (q == 2'd0 || q == 2'd1)) sda = 1;
			else sda = 0;
			if (nbit == 5'd1) scl = q[1] ~^ q[0];
			else scl = 1;
			idl = 0;
			end
			
		tdata:
			begin
			scl = q[1] ~^ q[0];
			if(!((nbit == 5'd1) || (nbit == 5'd10) || (nbit == 5'd19) ) && q == 2) regdin = {regdin[22:0], 1'b0};
			if ((scl == 0) && (estat_s[0] == 0) ) sda = regdin[23]; //Per evitar glitches en el canvi a akn
			idl = 0;
			resetcq = 0;
			end
			
		akn:
			begin
			scl = q[1] ~^ q[0];
			if ((nbit == 5'd10 || nbit == 5'd19 || nbit == 5'd28) && q != 2'd0) sda = 0;
			else sda = 1;
			idl = 0;
			resetcq = 0;
			end
			
		stop:
			begin
			scl = q[1] ~^ q[0];
			if (scl == 1) sda = 1;
			else sda = 0;
			idl = 0;
			resetcq = 0;
			end
			
		turn:
			begin
			sda = 1;
			scl = 1;
			idl = 0;
			resetcq = 0;
			end
			
		default:
			begin
			regdin = din;
			sda = 1;
			scl = 1;
			resetcq = 1;
			idl = 1;
			end
			
	endcase
endmodule
