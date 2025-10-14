 always @ (posedge clk_i)
 begin
    if (rst_i[2]) begin
       pipe_data_in[40:32] <= #TCQ    'b0;
       force_smallvalue <= #TCQ  1'b0;
       end
    else if (instr_vld) begin
      if (instr_mode_reg == 0) begin
              pipe_data_in[34:32] <= #TCQ    instr_out;
              end
      else if (instr_out[2]) begin
              pipe_data_in[34:32] <= #TCQ    3'b100;
              end
        
      else if ( FAMILY == "SPARTAN6" && PORT_MODE == "RD_MODE")
      begin
            pipe_data_in[34:32] <= #TCQ  {instr_out[2:1],1'b1};
              end
            
      else if ((force_wrcmd_gen || buf_avail_r <=  15) && FAMILY == "SPARTAN6" &&  PORT_MODE != "RD_MODE")
      begin
            pipe_data_in[34:32] <= #TCQ    {instr_out[2],2'b00};
              end
      else begin
             pipe_data_in[34:32] <= #TCQ    instr_out; 
              end

   
   
     if (bl_mode_i[1:0] == 2'b00)                                        
          pipe_data_in[40:35] <=  #TCQ   bl_out;
     else if (FAMILY == "VIRTEX6")
              pipe_data_in[40:35] <=  #TCQ   bl_out;
     else if (force_bl1 && (bl_mode_reg == 2'b10 ) && FAMILY == "SPARTAN6") 

      pipe_data_in[40:35] <=  #TCQ   6'b000001;
     else if ((buf_avail_r[5:0]  >= 6'b111100 && buf_avail_r[6] == 1'b0) && pipe_data_in[32] == 1'b1 && FAMILY == "SPARTAN6")         


       begin
        if (bl_mode_reg == 2'b10)
            force_smallvalue    <= #TCQ  ~force_smallvalue;
      
        if ((buf_avail_r[6] && bl_mode_reg == 2'b10))


             pipe_data_in[40:35] <= #TCQ    {2'b0,bl_out[3:1],1'b1};
        else
            pipe_data_in[40:35] <=   #TCQ  bl_out;
        end
   else if (buf_avail_r  < 64 && rd_buff_avail_i >= 0 && instr_out[0] == 1'b1 && (bl_mode_reg == 2'b10 )) 
         if (FAMILY == "SPARTAN6")
         pipe_data_in[40:35] <=  #TCQ   {2'b0,bl_out[3:0] + 1};
         else
            pipe_data_in[40:35] <=   #TCQ  bl_out;

    end  