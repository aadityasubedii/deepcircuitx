  always @(*) begin
    qcntr_ns = qcntr_r;
    inv_poc_sample_ns = inv_poc_sample_r;
    if (rstdiv0) begin
      qcntr_ns = 'b0;
      inv_poc_sample_ns = 'b0;
    end else if (psen) begin
      if (qcntr_r < TAPSPERFCLK_MINUS_ONE[QCNTR_WIDTH-1:0])
        qcntr_ns = (qcntr_r + ONE[QCNTR_WIDTH-1:0]);
      else begin
        qcntr_ns = {QCNTR_WIDTH{1'b0}};
	inv_poc_sample_ns = ~inv_poc_sample_r;
      end
    end
  end 