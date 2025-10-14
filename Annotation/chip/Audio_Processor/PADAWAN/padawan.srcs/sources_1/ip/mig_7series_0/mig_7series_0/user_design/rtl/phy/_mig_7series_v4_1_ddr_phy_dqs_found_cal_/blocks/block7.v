         always @(*) begin
            case (final_do_index[i])
	      3'b000:  final_do_cand[i]  = final_data_offset[i][5:0];
	      3'b001:  final_do_cand[i]  = final_data_offset[i][11:6];
	      3'b010:  final_do_cand[i]  = 'd0;
	      default: final_do_cand[i]  = 'd0;
	    endcase
         end