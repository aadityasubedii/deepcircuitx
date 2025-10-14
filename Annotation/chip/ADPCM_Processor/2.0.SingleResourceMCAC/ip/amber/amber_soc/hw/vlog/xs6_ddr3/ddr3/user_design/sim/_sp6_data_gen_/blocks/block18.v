always @ (data_mode_i) begin
  if (data_mode_i == 3'b101 || data_mode_i == 3'b100) begin 
    BLANK   = 8'h00;
    SHIFT_0 = 8'h01;
    SHIFT_1 = 8'h02;    
    SHIFT_2 = 8'h04;    
    SHIFT_3 = 8'h08;    
    SHIFT_4 = 8'h10;    
    SHIFT_5 = 8'h20;    
    SHIFT_6 = 8'h40;    
    SHIFT_7 = 8'h80;    
    
    end
    else if (data_mode_i == 3'b100)begin 
    BLANK   = 8'h00;
    SHIFT_0 = 8'h01;
    SHIFT_1 = 8'h02;    
    SHIFT_2 = 8'h04;    
    SHIFT_3 = 8'h08;    
    SHIFT_4 = 8'h10;    
    SHIFT_5 = 8'h20;    
    SHIFT_6 = 8'h40;    
    SHIFT_7 = 8'h80;    
    end       
    


    else if (data_mode_i == 3'b110) begin  
    BLANK   = 8'hff;
    SHIFT_0 = 8'hfe;
    SHIFT_1 = 8'hfd;    
    SHIFT_2 = 8'hfb;    
    SHIFT_3 = 8'hf7;    
    SHIFT_4 = 8'hef;    
    SHIFT_5 = 8'hdf;    
    SHIFT_6 = 8'hbf;    
    SHIFT_7 = 8'h7f;    
    end   
    else begin
    BLANK   = 8'hff;
    SHIFT_0 = 8'hfe;
    SHIFT_1 = 8'hfd;    
    SHIFT_2 = 8'hfb;    
    SHIFT_3 = 8'hf7;    
    SHIFT_4 = 8'hef;    
    SHIFT_5 = 8'hdf;    
    SHIFT_6 = 8'hbf;    
    SHIFT_7 = 8'h7f;    
    end   

end