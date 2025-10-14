    initial
    begin
        altera_reset_synchronizer_int_chain <= {RSTREQ_ASRT_SYNC_TAP{1'b1}};
    end