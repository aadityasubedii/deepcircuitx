module Map_decoder(
input [11:0]input1,input2,L,    // inputs (systematic and parity bits) and priori llr 
input clock,reset,    // clock and reset for control unit
output LLR);               

wire reset_in,in_rdwr1,in_rdwr2;
wire reset_gamma,reset2_gamma,reset3_gamma,gamma_rdwr1,gamma_rdwr2;
wire mux_alpha,mux_beta,mux_dummy;
wire reset_alpha,alpha_rdwr1,alpha_rdwr2;

control_unit control(
clock,reset,
reset_in,in_rdwr1,in_rdwr2,
reset_gamma,reset2_gamma,reset3_gamma,gamma_rdwr1,gamma_rdwr2,
mux_alpha,mux_beta,mux_dummy,
reset_alpha,alpha_rdwr1,alpha_rdwr2
);

MAP_Datapath Datapath(
input1,input2,L,    // inputs (systematic and parity bits) and priori llr 
clock,                    // clock
in_rdwr1,in_rdwr2,       // rdwr of input memories
gamma_rdwr1,gamma_rdwr2,  // rdwr of gamma memories
alpha_rdwr1,alpha_rdwr2, // rdwr of alpha memoty
mux_alpha,mux_beta,mux_dummy,  // select lines of muxes
reset_in,reset_gamma,reset2_gamma,reset3_gamma,reset_alpha, // counter reset
LLR);

endmodule