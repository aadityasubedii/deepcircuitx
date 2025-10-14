  assign fifo_4_mux = (((fifo_wrptr == 4'd4) && itm_valid))? itm :
    (((fifo_wrptr == 4'd4) && atm_valid))? overflow_pending_atm :
    (((fifo_wrptr == 4'd4) && dtm_valid))? overflow_pending_dtm :
    (((fifo_wrptr_plus1 == 4'd4) && (ge2_free & itm_valid & atm_valid)))? overflow_pending_atm :
    (((fifo_wrptr_plus1 == 4'd4) && (ge2_free & itm_valid & dtm_valid)))? overflow_pending_dtm :
    (((fifo_wrptr_plus1 == 4'd4) && (ge2_free & atm_valid & dtm_valid)))? overflow_pending_dtm :
    overflow_pending_dtm;