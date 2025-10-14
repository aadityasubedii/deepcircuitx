       always @(posedge clk)  begin
          if (rst) 
	      final_do_max[i] <= #TCQ 0;
	  else begin
	     final_do_max[i] <= #TCQ final_do_max[i]; 
             case (final_do_index[i])
	        3'b000: if ( | DATA_PRESENT[3:0]) 
	               if (final_do_max[i] < final_do_cand[i])
	                 if (CWL_M % 2) 
		            final_do_max[i] <= #TCQ final_do_cand[i] - 1;
		         else
		            final_do_max[i] <= #TCQ final_do_cand[i];
	        3'b001: if ( | DATA_PRESENT[7:4]) 
	               if (final_do_max[i] < final_do_cand[i])
		         if (CWL_M % 2) 
		            final_do_max[i] <= #TCQ final_do_cand[i] - 1;
		         else
		            final_do_max[i] <= #TCQ final_do_cand[i];
	        3'b010: if ( | DATA_PRESENT[11:8]) 
	               if (final_do_max[i] < final_do_cand[i])
		         if (CWL_M % 2) 
		            final_do_max[i] <= #TCQ final_do_cand[i] - 1;
		         else
		            final_do_max[i] <= #TCQ final_do_cand[i];
                default:
	               final_do_max[i] <= #TCQ final_do_max[i];
	      endcase
	   end
	end