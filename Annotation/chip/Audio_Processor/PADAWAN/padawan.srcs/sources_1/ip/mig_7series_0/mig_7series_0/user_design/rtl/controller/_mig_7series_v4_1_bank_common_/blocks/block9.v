      always @(present) begin
        present_count = {RANK_WIDTH{1'b0}};
        for (i=0; i<8; i=i+1)
          present_count = present_count + {{RANK_WIDTH{1'b0}}, present[i]};
      end