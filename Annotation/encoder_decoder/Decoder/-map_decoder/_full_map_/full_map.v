module MAP1(y1,y2,v);
input [9:0]y1,y2;
output [9:0]v;
wire signed[2:0]a1[9:0],a2[9:0],a3[9:0],a4[9:0],b1[9:0],b2[9:0],b3[9:0],b4[9:0];
wire signed[2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
gamma g1(y1,y2,c11,c12,c23,c24,c31,c32,c43,c44);
beta h1(c11,c12,c23,c24,c31,c32,c43,c44,b1,b2,b3,b4); 
alpha d1(c11,c12,c23,c24,c31,c32,c43,c44,a1,a2,a3,a4);
llr k1(a1,a2,a3,a4,b1,b2,b3,b4,c11,c12,c23,c24,c31,c32,c43,c44,v);
endmodule 



module gamma(y1,y2,c11,c12,c23,c24,c31,c32,c43,c44);
input  [9:0]y1,y2;
output wire signed[2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
genvar i;
generate
for(i=0;i<10;i=i+1)
     begin 
        c11[i] <=  -y1[i] - y2[i];
        c12[i] <=   y1[i] + y2[i];
        c23[i] <=   y1[i] - y2[i];
        c24[i] <=   y1[i] - y2[i];
        c31[i] <=   y1[i] + y2[i];
        c32[i] <=  -y1[i] - y2[i];
        c43[i] <=   y1[i] - y2[i];
        c44[i] <=   y1[i] - y2[i];         
    end 
endgenerate   
endmodule

module beta(c11,c12,c23,c24,c31,c32,c43,c44,b1,b2,b3,b4);
output wire signed[2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
output wire signed[2:0]b1[9:0],b2[9:0],b3[9:0],b4[9:0];
assign b1[9] = 3'b000;
assign b2[9] = 3'b000;
assign b3[9] = 3'b000;
assign b4[9] = 3'b000;
genvar i;
generate
for(i=8;i >= 0;i=i-1)
  begin
      b1[i] = (b1[i+1]+y11[i+1])>(b2[i+1]+y12[i+1])?(b1[i+1]+y11[i+1]):(b2[i+1]+y12[i+1]);	
			b2[i] = (b3[i+1]+y23[i+1])>(b4[i+1]+y24[i+1])?(b1[i+1]+y11[i+1]):(b2[i+1]+y12[i+1]);	
			b3[i] = (b1[i+1]+y31[i+1])>(b2[i+1]+y32[i+1])?(b1[i+1]+y11[i+1]):(b2[i+1]+y12[i+1]); 	
			b4[i] = (b3[i+1]+y43[i+1])>(b4[i+1]+y44[i+1])?(b1[i+1]+y11[i+1]):(b2[i+1]+y12[i+1]);
  end
endgenerate
endmodule 

module alpha(c11,c12,c23,c24,c31,c32,c43,c44,a1,a2,a3,a4);
output wire signed[2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
output wire signed[2:0]a1[9:0],a2[9:0],a3[9:0],a4[9:0];
assign a1[0] = 3'b001;
assign a2[0] = 3'b000;
assign a3[0] = 3'b000;
assign a4[0] = 3'b000;
genvar i;
generate
for(i=1;i<10;i=i+1)
     begin
        a1[i] = (a1[i-1]+c11[i-1])>(a3[i-1]+c31[i-1])?(a1[i-1]+c11[i-1]):(a3[i-1]+c31[i-1]); 	
				a2[i] = (a1[i-1]+c12[i-1])>(a3[i-1]+c32[i-1])?(a1[i-1]+c12[i-1]):(a3[i-1]+c32[i-1]); 	
				a3[i] = (a2[i-1]+c23[i-1])>(a4[i-1]+c43[i-1])?(a2[i-1]+c23[i-1]):(a4[i-1]+c43[i-1]); 	
				a4[i] = (a2[i-1]+c24[i-1])>(a4[i-1]+c44[i-1])?(a2[i-1]+c24[i-1]):(a4[i-1]+c44[i-1]);	 
     end
endgenerate     
endmodule  

module llr(a1,a2,a3,a4,b1,b2,b3,b4,c11,c12,c23,c24,c31,c32,c43,c44,v);
input wire signed[2:0]a1[9:0],a2[9:0],a3[9:0],a4[9:0],b1[9:0],b2[9:0],b3[9:0],b4[9:0];
input wire signed[2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
wire signed[3:0]l0[9:0],l1[9:0];
wire signed[2:0]w11[9:0],w12[9:0],w23[9:0],w24[9:0],w31[9:0],w32[9:0],w43[9:0],w44[9:0];
output reg v[9:0];
genvar i;
generate
for(i=0;i<10;i=i+1)
 begin 
  assign w11[i] = a1[i] + c11[i] + b1[i];
  assign w12[i] = a1[i] + c12[i] + b2[i];
  assign w23[i] = a2[i] + c23[i] + b3[i];
  assign w24[i] = a2[i] + c24[i] + b4[i];
  assign w31[i] = a3[i] + c31[i] + b1[i];
  assign w32[i] = a3[i] + c32[i] + b2[i];
  assign w43[i] = a4[i] + c43[i] + b3[i];
  assign w44[i] = a4[i] + c44[i] + b4[i];
 end
endgenerate 
maximum m1(w11,w23,w31,w43,l0);
maximum m2(w12,w24,w32,w44,l1);
cmp c1(l1,l0,v);
endmodule 

module maximum(a,b,c,d,e);
input wire signed[3:0]a[9:0],b[9:0],c[9:0],d[9:0];
output wire signed[3:0]e[9:0];
wire signed[3:0]s1,s2[9:0];
max m3(a,b,s1);
max m4(s1,c,s2);
max m5(s2,d,e); 
endmodule

module  max(g,h,k);
input wire signed[3:0]g,h[9:0];
output wire signed[3:0]k[9:0];
genvar i;
generate
for(i=0;i<10;i=i+1)
  begin
    always @ (*)
        begin 
                if (g[i] > h[i])begin 
                    k[i] = g[i];
                end 
                else begin 
                    k[i] = h[i];
                end
        end 
   end
endgenerate   
endmodule

module cmp(j,k,l);
input reg signed[3:0]j,k[9:0];
output reg l[9:0];

for(i=0;i<10;i=i+1)
  begin
    always @(*)
      begin 
        if (j[i]<k[i])begin 
            l[i] = 0;
        end 
        else begin 
            l[i] = 1;
        end
      end   
  end
endmodule                                                          
