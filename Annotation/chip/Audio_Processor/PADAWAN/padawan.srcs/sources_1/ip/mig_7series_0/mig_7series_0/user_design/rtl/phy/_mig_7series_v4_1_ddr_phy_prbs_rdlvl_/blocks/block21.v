  always @ (posedge clk) begin
    left_edge_ref <= #TCQ left_edge_pb[ref_bit*6+:6];
    right_edge_ref <= #TCQ right_edge_pb[ref_bit*6+:6];
  end