    always @ (posedge clk) begin
      if(rst | (prbs_state_r == PRBS_NEW_DQS_WAIT)) begin
        match_flag_pb[eg*MIN_WIN+:MIN_WIN] <= #TCQ MATCH_ALL_ONE;  
        left_edge_pb[eg*6+:6] <= #TCQ 'b0;
        right_edge_pb[eg*6+:6] <= #TCQ 6'h3f;
        left_edge_found_pb[eg] <= #TCQ 1'b0;
        right_edge_found_pb[eg] <= #TCQ 1'b0;
        left_loss_pb[eg*6+:6] <= #TCQ 'b0;
        right_gain_pb[eg*6+:6] <= #TCQ 'b0;
        left_edge_updated[eg]  <= #TCQ 'b0;
      end else begin 
        if((prbs_state_r == FINE_PAT_COMPARE_PER_BIT) && num_samples_done_r) begin  
            
            if(match_flag_pb[eg*MIN_WIN+:MIN_WIN]== MIN_LEFT && compare_err_pb_latch_r[eg]==0) begin 
              left_edge_pb[eg*6+:6] <= #TCQ prbs_dqs_tap_cnt_r- (MIN_WIN-1);
              left_edge_found_pb[eg] <= #TCQ 1'b1;  
              left_edge_updated[eg] <= #TCQ 1'b1;
              
              if(~left_edge_found_pb[eg]) 
                left_loss_pb[eg*6+:6] <= #TCQ (left_edge_ref > prbs_dqs_tap_cnt_r -(MIN_WIN-1))? 'd0
                                 : prbs_dqs_tap_cnt_r-(MIN_WIN-1)-left_edge_ref;
            
            end else if (match_flag_pb[eg*MIN_WIN+:MIN_WIN]== MIN_PASS  && compare_err_pb_latch_r[eg]) begin 
               right_edge_pb[eg*6+:6] <= #TCQ prbs_dqs_tap_cnt_r-1;
               right_edge_found_pb[eg] <= #TCQ 1'b1;
               
               if(~right_edge_found_pb[eg])  
                 right_gain_pb[eg*6+:6] <= #TCQ (right_edge_ref > prbs_dqs_tap_cnt_r-1)?
                                           ((right_edge_pb[eg*6 +:6] > prbs_dqs_tap_cnt_r-1)? 0: prbs_dqs_tap_cnt_r-1- right_edge_pb[eg*6+:6]):
                                           ((right_edge_pb[eg*6+:6] > right_edge_ref)? 0 : right_edge_ref - right_edge_pb[eg*6+:6]);
           
           end else if (prbs_dqs_tap_cnt_r == 6'h3f && ~right_edge_found_pb[eg]) begin
             right_edge_pb[eg*6+:6] <= #TCQ 6'h3f;
             right_edge_found_pb[eg] <= #TCQ 1'b1;
             
             right_gain_pb[eg*6+:6] <= #TCQ (right_edge_ref > right_edge_pb[eg*6+:6])?
                                   (right_edge_ref - right_edge_pb[eg*6+:6]) : 0;
           end
           
           match_flag_pb[eg*MIN_WIN+:MIN_WIN] <= #TCQ {match_flag_pb[(eg*MIN_WIN)+:(MIN_WIN-1)],compare_err_pb_latch_r[eg]};
         end else if (prbs_state_r == FINE_PI_DEC) begin
           left_edge_found_pb[eg] <= #TCQ 1'b0;
           right_edge_found_pb[eg] <= #TCQ 1'b0;
           left_loss_pb[eg*6+:6] <= #TCQ 'b0;
           right_gain_pb[eg*6+:6] <= #TCQ 'b0; 
           match_flag_pb[eg*MIN_WIN+:MIN_WIN] <= #TCQ MATCH_ALL_ONE ;  
           left_edge_updated[eg] <= #TCQ 'b0;   
         end else if (prbs_state_r == FINE_PI_INC) begin
           left_edge_updated[eg] <= #TCQ 'b0;   
         end
       end
     end  
   end 