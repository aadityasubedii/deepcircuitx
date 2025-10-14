module MAP(y,v);
input [1:0]y;
output v;
wire signed[2:0]a1,a2,a3,a4,b1,b2,b3,b4,c11,c12,c23,c24,c31,c32,c43,c44;
gamma g1(y,c11,c12,c23,c24,c31,c32,c43,c44);
beta h1(y,b1,b2,b3,b4);
alpha d1(y,a1,a2,a3,a4);
llr k1(a1,a2,a3,a4,b1,b2,b3,b4,c11,c12,c23,c24,c31,c32,c43,c44,v);
endmodule 



module gamma (y,c11,c12,c23,c24,c31,c32,c43,c44);
input  [1:0]y;
output signed[2:0]c11;
output signed[2:0]c12,c23,c24,c31,c32,c43,c44;
       assign c11 =  -y[1]-y[0];
       assign c12 =  y[1]+y[0];
       assign c23 =  y[1] - y[0];
       assign c24 =  y[0] - y[1];
       assign c31 =  y[1]+y[0];
       assign c32 =  -y[1]-y[0];
       assign c43 =  y[0]-y[1];
       assign c44 =  y[1]-y[0];         
endmodule

module beta(y,b1,b2,b3,b4);
input [1:0]y;
output signed[2:0]b1,b2,b3,b4;
assign b1 = 3'b001;
assign b2 = 3'b000;
assign b3 = 3'b000;
assign b4 = 3'b000;
endmodule 

module alpha(y,a1,a2,a3,a4);
input [1:0]y;
output signed[2:0]a1,a2,a3,a4;
assign a1 = 3'b001;
assign a2 = 3'b000;
assign a3 = 3'b000;
assign a4 = 3'b000;
endmodule  

module llr(
input signed[2:0]a1,a2,a3,a4,b1,b2,b3,b4,c11,c12,c23,c24,c31,c32,c43,c44,
output v
);
wire signed[3:0]w11,w12,w23,w24,w31,w32,w43,w44,l1,l0;
assign w11 = a1 + c11 + b1;
assign w12 = a1 + c12 + b2;
assign w23 = a2 + c23 + b3;
assign w24 = a2 + c24 + b4;
assign w31 = a3 + c31 + b1;
assign w32 = a3 + c32 + b2;
assign w43 = a4 + c43 + b3;
assign w44 = a4 + c44 + b4;
maximum m1(w11,w23,w31,w43,l0);
maximum m2(w12,w24,w32,w44,l1);
cmp c1(l1,l0,v);
endmodule 

module maximum(a,b,c,d,e);
input signed[3:0] a,b,c,d;
output signed[3:0]e;
wire signed[3:0]s1,s2;
max m3(a,b,s1);
max m4(s1,c,s2);
max m5(s2,d,e); 
endmodule

module  max(g,h,i);
input signed[3:0]g,h;
output reg signed [3:0]i;
always @ (g or h)
        begin 
                if (g > h)begin 
                    i = g;
                end 
                else begin 
                    i = h;
                end
        end
endmodule

module cmp(j,k,l);
input signed[3:0]j,k;
output reg l;
always @(j or k)
begin 
        if (j<k)begin 
            l = 0;
        end 
        else begin 
            l = 1;
        end
     end
endmodule                                                          