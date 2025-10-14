    always @ (posedge clk_i) begin
    if (rst_i[1])
       pipe_data_in[31:0] <= #TCQ    start_addr_i;
    else if (instr_vld)
       
      if (gen_addr_larger && (addr_mode_reg == 3'b100 || addr_mode_reg == 3'b010)) 
              pipe_data_in[31:0] <= #TCQ  {end_addr_i[31:8],8'h0};
      else if ((NUM_DQ_PINS >= 128) && (NUM_DQ_PINS <=  144))
      begin
         if (MEM_BURST_LEN == 8)
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:7], 7'b0000000};
         else      
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:6], 6'b000000};
       end
            
      else if ((NUM_DQ_PINS >= 64) && (NUM_DQ_PINS < 128))
            begin

         if (MEM_BURST_LEN == 8)
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:6], 6'b000000};
         else
         pipe_data_in[31:0] <= #TCQ    {addr_out[31:5], 5'b00000};
       end
         
      else if ((NUM_DQ_PINS == 32) || (NUM_DQ_PINS == 40) || (NUM_DQ_PINS == 48) || (NUM_DQ_PINS == 56))
            begin

         if (MEM_BURST_LEN == 8)     
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:5], 5'b00000};
         else
         pipe_data_in[31:0] <= #TCQ    {addr_out[31:4], 4'b0000};
       end
         
      else if ((NUM_DQ_PINS == 16) || (NUM_DQ_PINS == 24))
         if (MEM_BURST_LEN == 8)     
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:4], 4'b0000};
         else
         pipe_data_in[31:0] <= #TCQ    {addr_out[31:3], 3'b000};
         
      else if ((NUM_DQ_PINS == 8) )
         if (MEM_BURST_LEN == 8)             
            pipe_data_in[31:0] <= #TCQ    {addr_out[31:3], 3'b000};
         else
         pipe_data_in[31:0] <= #TCQ    {addr_out[31:2], 2'b00};
         
end