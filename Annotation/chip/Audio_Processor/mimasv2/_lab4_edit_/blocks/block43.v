module FilterControlModule(
  input wire clock,	           
  input wire reset,                
  input wire ready,                
  input wire [15:0]step,             
  input wire [3:0] filtnum,        
  input wire [7:0] from_ac97_data, 
  output reg [7:0] to_ac97_data    
);  