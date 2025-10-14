module MAP_Datapath(
input [11:0]input1,input2,L,    // inputs (systematic and parity bits) and priori llr 
input clock,                    // clock
input in_rdwr1,in_rdwr2,       // rdwr of input memories
input gamma_rdwr1,gamma_rdwr2,  // rdwr of gamma memories
input alpha_rdwr1,alpha_rdwr2, // rdwr of alpha memoty
input mux_alpha,mux_beta,mux_dummy,  // select lines of muxes
input reset_input,reset_gamma,reset2_gamma,reset3_gamma,reset_alpha, // counter reset
output LLR);


wire [11:0]y1,y2;
wire [12:0]address_in;    
up_counter count_in(address_in,clock,reset_input);  //generate address for loading input to memory                      
input_RAM in1(clock,in_rdwr1,in_rdwr2,address_in,input1,y1); //loading input1 
input_RAM in2(clock,in_rdwr1,in_rdwr2,address_in,input2,y2); //loading input2


wire [11:0]wr1,wr2,wr3,wr4;
wire [12:0]gamma_address,gamma_address2,gamma_address3;
BMC BMC1(y1,y2,L,wr1,wr2,wr3,wr4);  // calculting Branch metrices
up_counter count_gamma(gamma_address,clock,reset_gamma); // generating address of gamma memories
skip_counter count_gamma2(gamma_address2,clock,reset2_gamma);
skip_counter count_gammaf(gamma_address3,clock,reset3_gamma);


wire [11:0]y11,y15,y21,y25,y32,y36,y42,y46,y53,y57,y63,y67,y74,y78,y84,y88;
wire [11:0]yf11,yf15,yf21,yf25,yf32,yf36,yf42,yf46,yf53,yf57,yf63,yf67,yf74,yf78,yf84,yf88;
gamma_RAM rm1(clock,gamma_rdwr1,gamma_rdwr2,gamma_address,gamma_address2,gamma_address3,wr1,y11,y36,y67,y84,yf11,yf36,yf67,yf84);// storing value of branch metrices =   -y1 - y2
gamma_RAM rm2(clock,gamma_rdwr1,gamma_rdwr2,gamma_address,gamma_address2,gamma_address3,wr2,y15,y32,y63,y88,yf15,yf32,yf63,yf88);//                                       y1 + y2 
gamma_RAM rm3(clock,gamma_rdwr1,gamma_rdwr2,gamma_address,gamma_address2,gamma_address3,wr3,y21,y46,y57,y74,yf21,yf46,yf57,yf74); //                                      y1 - y2 
gamma_RAM rm4(clock,gamma_rdwr1,gamma_rdwr2,gamma_address,gamma_address2,gamma_address3,wr4,y25,y42,y53,y78,yf25,yf42,yf53,yf78);//                                       -y1 + y2

// FORWARD RECURSION

wire [11:0]a1,a2,a3,a4,a5,a6,a7,a8; // previous alpha values
reg [11:0]temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8; // feedback wire 
// reg [11:0]mem[7:0]; // intermediate memory  


/* always@(posedge(clock))
begin
temp1 <= mem[0]; 
temp2 <= mem[1];
temp3 <= mem[2];
temp4 <= mem[3];
temp5 <= mem[4]; 
temp6 <= mem[5];
temp7 <= mem[6];
temp8 <= mem[7];
end  */


MUXIN mux1(mux_alpha,clock,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,1,0,0,0,0,0,0,0,a1,a2,a3,a4,a5,a6,a7,a8); // selecting input value to fsmcu  
wire [11:0] al1,al2,al3,al4,al5,al6,al7,al8; // output alpha 
FSMCU fsm1(y11,y15,y21,y25,y32,y36,y42,y46,y53,y57,y63,y67,y74,y78,y84,y88,a1,a2,a3,a4,a5,a6,a7,a8,al1,al2,al3,al4,al5,al6,al7,al8);// calculating alpha


// loading alpha value to intemediate value for feedback
always@(posedge(clock))
begin
temp1 <= al1;
temp2 <= al2;
temp3 <= al3;
temp4 <= al4;
temp5 <= al5;
temp6 <= al6;
temp7 <= al7;
temp8 <= al8;
end
// loading alpha3 values into alpha- memory

wire [12:0]alpha_address;
skip_counter count_alpha(alpha_address,clock,reset_alpha);

wire [11:0] ap1,ap2,ap3,ap4,ap5,ap6,ap7,ap8;
branch_mem alphaRAM1(clock,alpha_rdwr1,alpha_rdwr2,alpha_address,al1,al2,al3,al4,al5,al6,al7,al8,ap1,ap2,ap3,ap4,ap5,ap6,ap7,ap8);

//dummy backward iteration
 
wire [11:0]db1,db2,db3,db4,db5,db6,db7,db8;
  
reg [11:0]tmp1,tmp2,tmp3,tmp4,tmp5,tmp6,tmp7,tmp8;
//reg [11:0]mem2[7:0];


/*always@(posedge(clock))
begin
tmp1 <= mem2[0]; 
tmp2 <= mem2[1];
tmp3 <= mem2[2];
tmp4 <= mem2[3];
tmp5 <= mem2[4]; 
tmp6 <= mem2[5];
tmp7 <= mem2[6];
tmp8 <= mem2[7];
end */
 
MUXIN mux2(mux_dummy,clock,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,1,0,0,0,0,0,0,0,db1,db2,db3,db4,db5,db6,db7,db8);   

wire [11:0]dbl1,dbl2,dbl3,dbl4,dbl5,dbl6,dbl7,dbl8;
DBSMCU dbsm1(y11,y15,y21,y25,y32,y36,y42,y46,y53,y57,y63,y67,y74,y78,y84,y88,db1,db2,db3,db4,db5,db6,db7,db8,dbl1,dbl2,dbl3,dbl4,dbl5,dbl6,dbl7,dbl8);

always@(posedge(clock))
begin
tmp1 <= dbl1;
tmp2 <= dbl2;
tmp3 <= dbl3;
tmp4 <= dbl4;
tmp5 <= dbl5;
tmp6 <= dbl6;
tmp7 <= dbl7;
tmp8 <= dbl8;
end


//  backward iteration 

reg [11:0]tp1,tp2,tp3,tp4,tp5,tp6,tp7,tp8;
wire [11:0]b1,b2,b3,b4,b5,b6,b7,b8;
//reg [11:0]mem3[7:0];

/*always@(posedge(clock))
begin
tp1 <= mem3[0];
tp2 <= mem3[1];
tp3 <= mem3[2];
tp4 <= mem3[3];
tp5 <= mem3[4];
tp6 <= mem3[5];
tp7 <= mem3[6];
tp8 <= mem3[7]; 
end
*/

MUXIN mux3(mux_beta,clock,tp1,tp2,tp3,tp4,tp5,tp6,tp7,tp8,dbl1,dbl2,dbl3,dbl4,dbl5,dbl6,dbl7,dbl8,b1,b2,b3,b4,b5,b6,b7,b8); 

wire [11:0]bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8; 
BSMCU bsm1(yf11,yf15,yf21,yf25,yf32,yf36,yf42,yf46,yf53,yf57,yf63,yf67,yf74,yf78,yf84,yf88,b1,b2,b3,b4,b5,b6,b7,b8,bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8);

always@(posedge(clock))
begin 
tp1 <= bt1;
tp2 <= bt2;
tp3 <= bt3;
tp4 <= bt4;
tp5 <= bt5;
tp6 <= bt6;
tp7 <= bt7;
tp8 <= bt8;
end

/*always@(posedge(clock))
begin
mem3[0] <= bt1;
mem3[1] <= bt2;
mem3[2] <= bt3;
mem3[3] <= bt4;
mem3[4] <= bt5;
mem3[5] <= bt6;
mem3[6] <= bt7;
mem3[7] <= bt8;
end
*/

LLR_final llr1(
clock,
ap1,ap2,ap3,ap4,ap5,ap6,ap7,ap8,
bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,
yf11,yf15,yf21,yf25,yf32,yf36,yf42,yf46,yf53,yf57,yf63,yf67,yf74,yf78,yf84,yf88,
LLR);

endmodule   
