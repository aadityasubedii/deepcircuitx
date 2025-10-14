    always @ (posedge clk_i) begin
    if (rst_i[0])
       pipe_data_in[31:0] <= #TCQ    start_addr_i;
    else if (instr_vld)
         if (gen_addr_larger && (addr_mode_reg == 3'b100 || addr_mode_reg == 3'b010)) 
            if (DWIDTH == 32)
              pipe_data_in[31:0] <= #TCQ  {end_addr_i[31:8],8'h0};
            else if (DWIDTH == 64)
              pipe_data_in[31:0] <= #TCQ  {end_addr_i[31:9],9'h0};
            else
              pipe_data_in[31:0] <= #TCQ  {end_addr_i[31:10],10'h0};
            
         else begin
             if (DWIDTH == 32)
              pipe_data_in[31:0] <= #TCQ    {addr_out[31:2],2'b00} ;
             else if (DWIDTH == 64)
              pipe_data_in[31:0] <= #TCQ    {addr_out[31:3],3'b000} ;
             else if (DWIDTH == 128)
              pipe_data_in[31:0] <= #TCQ    {addr_out[31:4],4'b0000} ;
             end
end