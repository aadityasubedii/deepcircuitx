

module dff(q,d,clk,reset);

	input d,clk,reset;
	output q;

  reg q;
  	
	always@(reset or posedge clk)
	begin	
		if(reset)
			q <=1'b0;
		
		else
			q <=d;
	end
endmodule


module mux(S,i0,i1,i2,i3,O);
  input  [1:0] S;
  input i0,i1,i2,i3;
  output O;
  reg O;
  always@(S or i0 or i1 or i2 or i3)
  begin
    case (S)
      2'b00: O=i0;
      2'b01: O=i1;
      2'b10: O=i2;
      2'b11: O=i3;
    endcase
  end
endmodule
module USR(S,i0,i1,i2,i3,sr,sl,q0,q1,q2,q3,clk,rst);
  input [1:0] S;
  input i0,i1,i2,i3,sr,sl,clk,rst;
  output q0,q1,q2,q3;
  wire w0,w1,w2,w3;
  dff d0(q0,w0,clk,rst);
  dff d1(q1,w1,clk,rst);
  dff d2(q2,w2,clk,rst);
  dff d3(q3,w3,clk,rst);
  
  mux m0(S,q0,sr,q1,i0,w0);
  mux m1(S,q1,q0,q2,i1,w1);
  mux m2(S,q2,q1,q3,i2,w2);
  mux m3(S,q3,q2,sl,i3,w3); 
endmodule 
module compre(S,i,a,f,s,c,clk,rst);
 // input i0,i1,i2,i3,a0,a1,a2,a3;
  input [3:0] i;
  input [3:0] a;
  input [1:0] S;
  input clk,rst;
  //reg [1:0] sum;
  wire [1:0] sum;
  wire D_out;
  //wire c0,c1,c2,c3,s0,s1,s2,s3;
 // output f4,f3,f2,f1,f0,s0,s1,s2,s3,c0,c1,c2,c3;
  output [4:0] f;
  output [3:0] s;
  output [3:0] c;
 //reg k0,f0,f1,f2,f3,f4;
 reg k0;
 reg [4:0] f;
  USR S1(S,i[3],i[2],i[1],i[0],sum[0],sl,s[3],s[2],s[1],s[0],clk,rst);
  USR C1(S,a[3],a[2],a[1],a[0],sum[1],sl,c[3],c[2],c[1],c[0],clk,rst);
//  USR S1(S,i0,i1,i2,i3,sum,sl,s0,s1,s2,s3,clk,rst);
//  USR C1(S,i0,i1,i2,i3,sum,sl,c0,c1,c2,c3,clk,rst);
  dff D1(D_out,sum[1],clk,rst);
//  dff D1(D_out,sum,clk,rst);
assign sum=s[0] + c[0] + D_out;
  always@(rst or posedge clk)
  begin
    k0=1'b0;
   //sum=s[0] + c[0] + D_out;
       if (s>4'b1001|c[3]==1'b1)  
    {k0,f[3],f[2],f[1],f[0]}={1'b0,s[3],s[2],s[1],s[0]}+5'b00110;
  else
    {k0,f[3],f[2],f[1],f[0]}={1'b0,s[3],s[2],s[1],s[0]};
 f[4]=k0|c[3];
  end
endmodule


module OP_TESTAA;
reg rst,clk;
reg [3:0] i;
reg [3:0] a;
reg [1:0] S;
wire [3:0] s;
wire [3:0] c;
wire [4:0]f;
compre OP(S,i,a,f,s,c,clk,rst);
initial
begin 
clk=1'b0;
i=4'b0000;
a=4'b0000;
S=2'b11;
rst = 1'b1;
#5 rst = 1'b0;
#5 i=4'b1000;a=4'b1001;
#5 S=2'b01;	
end

always
#3 clk= ~clk;


endmodule  
