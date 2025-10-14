  reg wait_for_maint_r_lcl;
  reg pass_open_bank_r_lcl;
  wire pass_open_bank_ns_lcl = ~clear_req &&
          (pass_open_bank_r_lcl ||
           (accept_req && pass_open_bank_eligible &&