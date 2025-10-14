always @(*) begin
    case (lut_index)
        4'h0: lut_data <= 16'h0c10; 
        4'h1: lut_data <= 16'h0017; 
        4'h2: lut_data <= 16'h0217; 
        4'h3: lut_data <= 16'h0479; 
        4'h4: lut_data <= 16'h0679; 
        4'h5: lut_data <= 16'h08d4; 
        4'h6: lut_data <= 16'h0a04; 
        4'h7: lut_data <= 16'h0e01; 
        4'h8: lut_data <= 16'h1020; 
        4'h9: lut_data <= 16'h0c00; 
        4'ha: lut_data <= 16'h1201; 
        default: lut_data <= 16'h0000;
    endcase
end