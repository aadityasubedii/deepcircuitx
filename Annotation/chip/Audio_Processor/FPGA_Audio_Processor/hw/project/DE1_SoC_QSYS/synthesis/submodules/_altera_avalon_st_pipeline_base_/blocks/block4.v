        always @(posedge clk, posedge reset) begin
           if (reset) begin
              data0 <= {DATA_WIDTH{1'b0}};
              data1 <= {DATA_WIDTH{1'b0}};
           end else begin
              
              
              
              if (~full0)
                data0 <= in_data;
              
              
              
              
              if (~full1 || (out_ready && out_valid)) begin
                 if (full0)
                   data1 <= data0;
                 else
                   data1 <= in_data;
              end
           end
        end