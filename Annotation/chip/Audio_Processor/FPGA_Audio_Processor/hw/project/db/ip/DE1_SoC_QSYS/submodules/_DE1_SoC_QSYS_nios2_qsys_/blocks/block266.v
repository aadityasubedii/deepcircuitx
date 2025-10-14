  assign fifo_read_mux = (fifo_rdptr == 4'd0)? fifo_0 :
    (fifo_rdptr == 4'd1)? fifo_1 :
    (fifo_rdptr == 4'd2)? fifo_2 :
    (fifo_rdptr == 4'd3)? fifo_3 :
    (fifo_rdptr == 4'd4)? fifo_4 :
    (fifo_rdptr == 4'd5)? fifo_5 :
    (fifo_rdptr == 4'd6)? fifo_6 :
    (fifo_rdptr == 4'd7)? fifo_7 :
    (fifo_rdptr == 4'd8)? fifo_8 :
    (fifo_rdptr == 4'd9)? fifo_9 :
    (fifo_rdptr == 4'd10)? fifo_10 :
    (fifo_rdptr == 4'd11)? fifo_11 :
    (fifo_rdptr == 4'd12)? fifo_12 :
    (fifo_rdptr == 4'd13)? fifo_13 :
    (fifo_rdptr == 4'd14)? fifo_14 :
    fifo_15;