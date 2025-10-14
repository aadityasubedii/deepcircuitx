module control_unit(
//input [2:0]state,
input clk,reset,
output reg reset_in,in_rdwr1,in_rdwr2,
output reg reset_gamma,reset2_gamma,reset3_gamma,gamma_rdwr1,gamma_rdwr2,
output reg mux_alpha,mux_beta,mux_dummy,
output reg reset_alpha,alpa_rdwr1,alpha_rdwr2
);

reg [12:0]count;
parameter s0 = 3'b000 , s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101 , s6 = 3'b110 , s7 = 3'b111;
reg [2:0]current_state,next_state;

always@(posedge(clk))
begin 
  if(reset)
 begin 
    current_state <= s0;  
    count <= 0;
    next_state <= s0;
  end
else
  begin
    current_state <= next_state;  
    count <= count + 1;
  end
end


always@(posedge(clk)) 
begin 
  
//next_state = current_state; 

 case(current_state)
  s0 : 
  begin 
    
  //while(count < 14'b11000000000000)
   reset_in <= 1;
   in_rdwr1 <= 0;
   in_rdwr2 <=  0;
   reset_gamma <= 1;
   gamma_rdwr1 <= 0;
   gamma_rdwr2 <= 1;
   mux_alpha <=   0;
   mux_beta <=    1;
   mux_dummy <=   0; 
   reset_alpha <= 1;
   alpa_rdwr1 <=  0;
   alpha_rdwr2 <= 1;
   if(count >= 13'b0000000000000)
      begin
      next_state = s1;
      count <= 0;       
    end
end
 
 s1 :
  begin 
   reset_in <=    0;
   in_rdwr1 <=    0;
   in_rdwr2 <=    0;
   reset_gamma <= 1;
   gamma_rdwr1 <= 0;
   gamma_rdwr2 <= 1;
   mux_alpha <=   0;
   mux_beta <=    1;
   mux_dummy <=   0; 
   reset_alpha <= 1;
   alpa_rdwr1 <=  0;
   alpha_rdwr2 <= 1;
   if(count >= 13'b1011111111110)
      begin 
        next_state =  s2;
        count <= 0; 
      end    
end



s2 :
 begin 
  reset_in <=    1;
  in_rdwr1 <=    1;
 //in_rdwr2 <=    1;
  reset_gamma <= 1;
  gamma_rdwr1 <= 0;
  gamma_rdwr2 <= 1;
  mux_alpha <=   0;
  mux_beta <=    1;
  mux_dummy <=   0; 
  reset_alpha <= 1;
  alpa_rdwr1 <=  0;
  alpha_rdwr2 <= 1;
  if(count >= 13'b0000000000000)
       begin 
       next_state =  s3;
       count <= 0; 
     end    
end


s3 :
 begin 
  reset_in <=    0;
  in_rdwr1 <=    1;
  in_rdwr2 <=    1;
  reset2_gamma <= 1;
  gamma_rdwr1 <= 0;
  gamma_rdwr2 <= 1;
  mux_alpha <=   0;
  mux_beta <=    1;
  mux_dummy <=   0; 
  reset_alpha <= 1;
  alpa_rdwr1 <=  0;
  alpha_rdwr2 <= 1;
  if(count >= 13'b0000000000000)
     begin 
       next_state =  s4;
       count <= 0; 
     end    
end


s4 : 
  
  begin 
   reset_in <=    0;
   in_rdwr1 <=    1;
   in_rdwr2 <=    1;
   reset_gamma <= 0;
   reset2_gamma <= 0;
   gamma_rdwr1 <= 0;
   gamma_rdwr2 <= 1;
   mux_alpha <=   0;
   mux_beta <=    1;
   mux_dummy <=   0; 
   alpa_rdwr1 <=  0;
   alpha_rdwr2 <= 1;
   if(count >= 13'b0000000000001)
      begin 
        next_state =  s5;
        count <= 0; 
      end    
   
   
end

s5 : 
  
  begin 
   reset_in <=    0;
   in_rdwr1 <=    1;
   in_rdwr2 <=    1;
   reset_gamma <= 0;
  reset3_gamma <= 1;
   gamma_rdwr1 <= 0;
   gamma_rdwr2 <= 1;
   mux_alpha <=   1;
   mux_beta <=    1;
   mux_dummy <=   1; 
   reset_alpha <= 0;
   alpa_rdwr1 <=  0;
   alpha_rdwr2 <= 1;
   if(count >= 13'b0000000000000)
      begin 
        next_state =  s6;
        count <= 0; 
      end    
   
   
end



s6 : 
  
  begin 
   reset_in <=    0;
   in_rdwr1 <=    1;
   in_rdwr2 <=    1;
   reset_gamma <= 0;
   gamma_rdwr1 <= 0;
   gamma_rdwr2 <= 1;
   mux_alpha <=   1;
   mux_beta <=    1;
   mux_dummy <=   1; 
   reset_alpha <= 0;
   alpa_rdwr1 <=  0;
   alpha_rdwr2 <= 1;
  if(count >= 13'b0000001111001)
      begin 
        next_state =  s7;
        count <= 0; 
      end    
  
      

end


s7 : 
begin 
  reset_in <=    0;
  in_rdwr1 <=    1;
  in_rdwr2 <=    1;
  reset_gamma <= 0;
  reset3_gamma <= 0;
  gamma_rdwr1 <= 0;
  gamma_rdwr2 <= 1;
  mux_alpha <=   1;
  mux_beta <=    0;
  mux_dummy <=   1; 
  reset_alpha <= 0;
  alpa_rdwr1 <=  0;
  alpha_rdwr2 <= 1; 
  if(count >= 13'b0000000000010)
      begin 
        next_state =  s6;
        count <= 0; 
      end    
end
  
  
 endcase
end 
endmodule   