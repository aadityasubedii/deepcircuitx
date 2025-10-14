module ALU 
(
Sclk, Reset, en, Start, sleep,
RJ_en, rr_ptr, r_valid, rj_data_in,
H_en, hr_ptr, h_valid, h_data_in, 
X_rd_en, xr_ptr, x_data_in, n, x_flagbit,
valid, prev_OutReady, y
);

input Sclk, Reset, en, valid, Start, x_flagbit, sleep;
output reg prev_OutReady;
output reg [39:0] y;
 
input r_valid;
input [15:0] rj_data_in;
output reg RJ_en;
output reg [3:0] rr_ptr;
reg [15:0] rj_data;
reg [4:0] rr_ptr_buff;
reg rj_read;

input h_valid;
input [15:0] h_data_in;
output reg H_en;
output reg [8:0] hr_ptr;
reg [15:0] h_data;
reg [8:0] hr_ptr_buff;
reg [7:0] h_cntr;
reg h_read, calc, h_finish, last_h, last_x;


input [15:0] x_data_in;
input [7:0] n;
output reg X_rd_en;
output reg [7:0] xr_ptr;
reg [15:0] x_data;

reg x_read, x_finish;

reg [1:0] neg;
reg h_sign ;
reg [39:0] U ;
reg [39:0] U_curr ;





