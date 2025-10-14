        always @(posedge clk or posedge reset) begin
           if (reset) begin
              full0    <= 1'b0;
              full1    <= 1'b0;
           end else begin
              
              if (~full0 & ~full1) begin
                 if (in_valid) begin
                    full1 <= 1'b1;
                 end
              end 

              
              if (full1 & ~full0) begin
                 if (in_valid & ~out_ready) begin
                    full0 <= 1'b1;
                 end
                 
                 if (~in_valid & out_ready) begin
                    full1 <= 1'b0;
                 end
              end 
              
              
              if (full1 & full0) begin
                 
                 if (out_ready) begin
                    full0 <= 1'b0;
                 end
              end 
           end
        end