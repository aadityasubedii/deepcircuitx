            always @(posedge clk, posedge reset) begin
                if (reset) begin
                    mem_used[i] <= 0;
                end 
                else begin
                    if (write ^ read) begin
                        if (write)
                            mem_used[i] <= mem_used[i-1];
                        else if (read)
                            mem_used[i] <= mem_used[i+1];     
                    end
                end
            end