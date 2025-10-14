        always @(posedge clk) begin
          if (rst) begin
            final_data_offset[i][6*j+:6] <= #TCQ 'b0;
	  end
          else begin
	  
           
          
          if (init_dqsfound_done_r && ~init_dqsfound_done_r1) begin
	    if ( DATA_PRESENT [ j*4+:4] != 0) begin 
               final_data_offset[i][6*j+:6] <= #TCQ rd_byte_data_offset[i][6*j+:6];
               if (CWL_M % 2) 
                 final_data_offset_mc[i][6*j+:6] <= #TCQ rd_byte_data_offset[i][6*j+:6] - 1;
               else 
                 final_data_offset_mc[i][6*j+:6] <= #TCQ rd_byte_data_offset[i][6*j+:6];
            end 
	  end
          else if (init_dqsfound_done_r5 ) begin
	       if ( DATA_PRESENT [ j*4+:4] == 0) begin 
                  final_data_offset[i][6*j+:6] <= #TCQ final_do_max[i];
                  final_data_offset_mc[i][6*j+:6] <= #TCQ final_do_max[i];
               end	
          end
	  end
        end
      end
    end