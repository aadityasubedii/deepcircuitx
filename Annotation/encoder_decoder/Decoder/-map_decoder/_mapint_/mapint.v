module MAPint(y1,y2,v,clk);
input [9:0]y1,y2;
input clk;
output reg [9:0]v;
reg signed [2:0]a1[9:0],a2[9:0],a3[9:0],a4[9:0],b1[9:0],b2[9:0],b3[9:0],b4[9:0];
reg signed [2:0]c11[9:0],c12[9:0],c23[9:0],c24[9:0],c31[9:0],c32[9:0],c43[9:0],c44[9:0];
reg signed [3:0]w11[9:0],w12[9:0],w23[9:0],w24[9:0],w31[9:0],w32[9:0],w43[9:0],w44[9:0];
reg signed [3:0]s1[9:0],s2[9:0],s3[9:0],s4[9:0],l0[9:0],l1[9:0];
genvar i;
 
generate  
for(i=0;i<10;i=i+1)
 begin : gen0
       always@(y1,y2)
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
end
endgenerate

always@(posedge(clk))
begin
b1[9] <= 3'b001;
b2[9] <= 3'b000;
b3[9] <= 3'b000;
b4[9] <= 3'b000;
end
//genvar j;
generate
for(i=8;i>=0;i=i-1)
begin : gen1
 always@(posedge(clk))
 begin
			b1[i] = (b1[i+1]+c11[i+1])>(b2[i+1]+c12[i+1])?(b1[i+1]+c11[i+1]):(b2[i+1]+c12[i+1]);	
			b2[i] = (b3[i+1]+c23[i+1])>(b4[i+1]+c24[i+1])?(b3[i+1]+c23[i+1]):(b2[i+1]+c24[i+1]);	
			b3[i] = (b1[i+1]+c31[i+1])>(b2[i+1]+c32[i+1])?(b1[i+1]+c31[i+1]):(b2[i+1]+c32[i+1]); 	
			b4[i] = (b3[i+1]+c43[i+1])>(b4[i+1]+c44[i+1])?(b3[i+1]+c43[i+1]):(b4[i+1]+c44[i+1]);
  end
end
endgenerate


always@(posedge(clk))
begin
a1[0] <= 3'b001;
a2[0] <= 3'b000;
a3[0] <= 3'b000;
a4[0] <= 3'b000;
end
//genvar i;
generate
//begin : gen2  
for(i=1;i<10;i=i+1)
begin : gen2
  always@(posedge(clk))
  begin
				a1[i] <= (a1[i-1]+c11[i-1])>(a3[i-1]+c31[i-1])?(a1[i-1]+c11[i-1]):(a3[i-1]+c31[i-1]); 	
				a2[i] <= (a1[i-1]+c12[i-1])>(a3[i-1]+c32[i-1])?(a1[i-1]+c12[i-1]):(a3[i-1]+c32[i-1]); 	
				a3[i] <= (a2[i-1]+c23[i-1])>(a4[i-1]+c43[i-1])?(a2[i-1]+c23[i-1]):(a4[i-1]+c43[i-1]); 	
				a4[i] <= (a2[i-1]+c24[i-1])>(a4[i-1]+c44[i-1])?(a2[i-1]+c24[i-1]):(a4[i-1]+c44[i-1]);	 
     end
end     
endgenerate     
  

//genvar i;
generate
 // begin : gen3
for(i=0;i<10;i=i+1)
begin : gen3
  always@(posedge(clk))
    begin 
    w11[i] <= a1[i] + c11[i] + b1[i];
    w12[i] <= a1[i] + c12[i] + b2[i];
    w23[i] <= a2[i] + c23[i] + b3[i];
    w24[i] <= a2[i] + c24[i] + b4[i];
    w31[i] <= a3[i] + c31[i] + b1[i];
    w32[i] <= a3[i] + c32[i] + b2[i];
    w43[i] <= a4[i] + c43[i] + b3[i];
    w44[i] <= a4[i] + c44[i] + b4[i];
  end
end
endgenerate 

//genvar i;
generate
  //begin gen4
for(i=0;i<10;i=i+1)
begin : gen4
  
always@(posedge(clk))
	begin
    s1[i] <= w11[i]>w23[i]?w11[i]:w23[i];
    s2[i] <= s1[i]>w31[i]?s1[i]:w31[i];
    l0[i] <= s2[i]>w43[i]?s2[i]:w43[i];

    s3[i] <= w12[i]>w24[i]?w12[i]:w24[i];
    s4[i] <= s3[i]>w32[i]?s3[i]:w32[i];
    l1[i] <= s4[i]>w44[i]?s2[i]:w44[i];

    v[i]  <= l0[i]>l1[i]?0:1;
  end
  end
endgenerate
endmodule 
