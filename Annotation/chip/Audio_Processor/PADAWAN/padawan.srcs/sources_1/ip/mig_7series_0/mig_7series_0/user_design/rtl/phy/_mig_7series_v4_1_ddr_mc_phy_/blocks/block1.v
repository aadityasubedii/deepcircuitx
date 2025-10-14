always @(*) begin
      case (calib_sel[5:3])
      3'b000: begin
          po_coarse_overflow  = po_coarse_overflow_w[0];
          po_fine_overflow    = po_fine_overflow_w[0];
          po_counter_read_val = po_counter_read_val_w[0];
          pi_fine_overflow    = pi_fine_overflow_w[0];
          pi_counter_read_val = pi_counter_read_val_w[0];
          pi_phase_locked     = pi_phase_locked_w[0];
          if ( calib_in_common)
             pi_dqs_found        = pi_dqs_found_any;
          else
             pi_dqs_found        = pi_dqs_found_w[0];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[0];
        end
      3'b001: begin
          po_coarse_overflow  = po_coarse_overflow_w[1];
          po_fine_overflow    = po_fine_overflow_w[1];
          po_counter_read_val = po_counter_read_val_w[1];
          pi_fine_overflow    = pi_fine_overflow_w[1];
          pi_counter_read_val = pi_counter_read_val_w[1];
          pi_phase_locked     = pi_phase_locked_w[1];
          if ( calib_in_common)
              pi_dqs_found        = pi_dqs_found_any;
          else
              pi_dqs_found        = pi_dqs_found_w[1];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[1];
        end
      3'b010: begin
          po_coarse_overflow  = po_coarse_overflow_w[2];
          po_fine_overflow    = po_fine_overflow_w[2];
          po_counter_read_val = po_counter_read_val_w[2];
          pi_fine_overflow    = pi_fine_overflow_w[2];
          pi_counter_read_val = pi_counter_read_val_w[2];
          pi_phase_locked     = pi_phase_locked_w[2];
          if ( calib_in_common)
             pi_dqs_found        = pi_dqs_found_any;
          else
             pi_dqs_found        = pi_dqs_found_w[2];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[2];
        end
       default: begin
          po_coarse_overflow  = 0;
          po_fine_overflow    = 0;
          po_counter_read_val = 0;
          pi_fine_overflow    = 0;
          pi_counter_read_val = 0;
          pi_phase_locked     = 0;
          pi_dqs_found        = 0;
          pi_dqs_out_of_range = 0;
        end
       endcase
end