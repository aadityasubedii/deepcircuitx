always @ (data_mode_i) begin

if (data_mode_i == 3'b101 ) begin 
   
    SHIFTB_0 = 32'h0002_0001;
    SHIFTB_1 = 32'h0008_0004;    
    SHIFTB_2 = 32'h0020_0010;    
    SHIFTB_3 = 32'h0080_0040;    
    SHIFTB_4 = 32'h0200_0100;    
    SHIFTB_5 = 32'h0800_0400;    
    SHIFTB_6 = 32'h2000_1000;    
    SHIFTB_7 = 32'h8000_4000;    
    end
else if (data_mode_i == 3'b100)begin 
   
    SHIFTB_0 = 32'h0000_0001;
    SHIFTB_1 = 32'h0000_0002;    
    SHIFTB_2 = 32'h0000_0004;    
    SHIFTB_3 = 32'h0000_0008;    
    SHIFTB_4 = 32'h0000_0010;    
    SHIFTB_5 = 32'h0000_0020;    
    SHIFTB_6 = 32'h0000_0040;    
    SHIFTB_7 = 32'h0000_0080;    
    end    
    
else begin  
    SHIFTB_0 = 32'hfffd_fffe;
    SHIFTB_1 = 32'hfff7_fffb;    
    SHIFTB_2 = 32'hffdf_ffef;    
    SHIFTB_3 = 32'hff7f_ffbf;    
    SHIFTB_4 = 32'hfdff_feff;    
    SHIFTB_5 = 32'hf7ff_fbff;    
    SHIFTB_6 = 32'hdfff_efff;    
    SHIFTB_7 = 32'h7fff_bfff;    
    end

end