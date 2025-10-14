  always @(posedge clk)
    if (rst) begin
      prech_req_r         <= #TCQ 1'b0;
      prech_req_posedge_r <= #TCQ 1'b0;
      prech_pending_r     <= #TCQ 1'b0;
    end else begin
      prech_req_r         <= #TCQ prech_req;
      prech_req_posedge_r <= #TCQ prech_req & ~prech_req_r;
      if (prech_req_posedge_r)
        prech_pending_r   <= #TCQ 1'b1;
      
      
      else if (prech_done_pre)
        prech_pending_r   <= #TCQ 1'b0;
    end