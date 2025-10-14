      always @(posedge clk or posedge reset) begin
        if (reset) begin
          sop_ptr <= 0;
          error_in_pkt <= 0;
        end
        else begin
          
          if ( in_pkt_start ) 
            sop_ptr <= wr_ptr;

          
          
          if (in_pkt_eop_arrive)
            error_in_pkt <= 1'b0;
          else if ( in_pkt_error & (pkt_has_started | in_pkt_start))
            error_in_pkt <= 1'b1;
        end
      end