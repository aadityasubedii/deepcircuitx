`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2023 01:34:20 PM
// Design Name: 
// Module Name: rcarcarca
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rcarcarca(
    input [4:0] a,
    input [4:0] b,
    output [4:0] sum,
    output co
    );
    
   
   wire [3:0]  co_s; 
   
 ha  my_ha0  ( //ha instantiation
    .a (a[0]),
    .b (b[0]),
    .sum (sum[0]),
    .co (co_s[0])
    );
    

 my_fa  my_fa_1  ( //fa instantiation
    .a (a[1]),
    .b (b[1]),
    .cin (co_s[0]),
    .sum (sum[1]),
    .co (co_s[1])
    );


 my_fa  my_fa_2  ( //fa instantiation
    .a (a[2]),
    .b (b[2]),
    .cin (co_s[1]),
    .sum (sum[2]),
    .co (co_s[2])
    );
            

 my_fa  my_fa_3  ( //fa instantiation
    .a (a[3]),
    .b (b[3]),
    .cin (co_s[2]),
    .sum (sum[3]),
    .co (co_s[3])
    );
          
    
    
 my_fa  my_fa_4  ( //fa instantiation
    .a (a[4]),
    .b (b[4]),
    .cin (co_s[3]),
    .sum (sum[4]),
    .co (co)
    );
      
    
endmodule
