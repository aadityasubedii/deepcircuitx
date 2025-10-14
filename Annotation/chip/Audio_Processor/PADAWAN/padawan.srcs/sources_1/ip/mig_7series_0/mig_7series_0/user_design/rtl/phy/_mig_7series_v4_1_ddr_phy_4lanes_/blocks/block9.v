always @(posedge phy_clk ) begin
    case (calib_sel[1:0])
    2'h0: begin
       po_coarse_overflow <= #1 A_po_coarse_overflow;
       po_fine_overflow <= #1 A_po_fine_overflow;
       po_counter_read_val <= #1 A_po_counter_read_val;

       pi_fine_overflow <= #1 A_pi_fine_overflow;
       pi_counter_read_val<= #1 A_pi_counter_read_val;

       pi_phase_locked  <= #1 A_pi_phase_locked;
       if ( calib_in_common)
           pi_dqs_found     <= #1 pi_dqs_found_any;
       else
           pi_dqs_found     <= #1 A_pi_dqs_found;
       pi_dqs_out_of_range <= #1 A_pi_dqs_out_of_range;
      end

    2'h1: begin
       po_coarse_overflow     <= #1 B_po_coarse_overflow;
       po_fine_overflow       <= #1 B_po_fine_overflow;
       po_counter_read_val    <= #1 B_po_counter_read_val;

       pi_fine_overflow       <= #1 B_pi_fine_overflow;
       pi_counter_read_val    <= #1 B_pi_counter_read_val;

       pi_phase_locked        <= #1 B_pi_phase_locked;
       if ( calib_in_common)
          pi_dqs_found           <= #1 pi_dqs_found_any;
       else
          pi_dqs_found           <= #1 B_pi_dqs_found;
       pi_dqs_out_of_range    <= #1 B_pi_dqs_out_of_range;
       end

    2'h2: begin
       po_coarse_overflow     <= #1 C_po_coarse_overflow;
       po_fine_overflow       <= #1 C_po_fine_overflow;
       po_counter_read_val    <= #1 C_po_counter_read_val;

       pi_fine_overflow       <= #1 C_pi_fine_overflow;
       pi_counter_read_val    <= #1 C_pi_counter_read_val;

       pi_phase_locked        <= #1 C_pi_phase_locked;
       if ( calib_in_common)
           pi_dqs_found           <= #1 pi_dqs_found_any;
       else
           pi_dqs_found           <= #1 C_pi_dqs_found;
       pi_dqs_out_of_range    <= #1 C_pi_dqs_out_of_range;
      end

    2'h3: begin
       po_coarse_overflow     <= #1 D_po_coarse_overflow;
       po_fine_overflow       <= #1 D_po_fine_overflow;
       po_counter_read_val    <= #1 D_po_counter_read_val;

       pi_fine_overflow       <= #1 D_pi_fine_overflow;
       pi_counter_read_val    <= #1 D_pi_counter_read_val;

       pi_phase_locked        <= #1 D_pi_phase_locked;
       if ( calib_in_common)
          pi_dqs_found           <= #1 pi_dqs_found_any;
       else
          pi_dqs_found           <= #1 D_pi_dqs_found;
       pi_dqs_out_of_range    <= #1 D_pi_dqs_out_of_range;

       end
     default: begin
        po_coarse_overflow <= po_coarse_overflow;
     end
    endcase
end