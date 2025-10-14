  always @(posedge clk) begin
    if (rst)
      rdlvl_assrt_common <= #TCQ 1'b0;
    else if ((SIM_CAL_OPTION == "FAST_CAL") & rdlvl_stg1_start &
            !rdlvl_stg1_start_r)
      rdlvl_assrt_common <= #TCQ 1'b1;
    else if (!idel_pat_data_match_r & idel_pat_data_match)
      rdlvl_assrt_common <= #TCQ 1'b0;
  end