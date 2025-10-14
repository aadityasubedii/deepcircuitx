  assign fifo_14_mux = (((fifo_wrptr == 4'd14) && itm_valid))? itm :
    (((fifo_wrptr == 4'd14) && atm_valid))? overflow_pending_atm :
    (((fifo_wrptr == 4'd14) && dtm_valid))? overflow_pending_dtm :
    (((fifo_wrptr_plus1 == 4'd14) && (ge2_free & itm_valid & atm_valid)))? overflow_pending_atm :
    (((fifo_wrptr_plus1 == 4'd14) && (ge2_free & itm_valid & dtm_valid)))? overflow_pending_dtm :
    (((fifo_wrptr_plus1 == 4'd14) && (ge2_free & atm_valid & dtm_valid)))? overflow_pending_dtm :
    overflow_pending_dtm;