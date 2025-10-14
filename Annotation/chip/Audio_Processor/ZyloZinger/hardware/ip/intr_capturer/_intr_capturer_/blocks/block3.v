  generate
  if (NUM_INTR>32) begin : two_intr_reg_needed
    assign access_higher_32     = read & (addr == 1);
    
    assign readdata_lower_intr  = interrupt_reg[31:0] & {(32){access_lower_32}};
    assign readdata_higher_intr = interrupt_reg[NUM_INTR-1:32] & {(NUM_INTR-32){access_higher_32}};
    end
  else begin : only_1_reg
    assign readdata_lower_intr  = interrupt_reg & {(NUM_INTR){access_lower_32}};
    assign readdata_higher_intr = {32{1'b0}};
    end
  endgenerate