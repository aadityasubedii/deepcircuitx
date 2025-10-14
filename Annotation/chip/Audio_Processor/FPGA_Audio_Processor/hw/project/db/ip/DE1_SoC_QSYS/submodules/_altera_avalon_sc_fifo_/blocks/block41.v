            always @(posedge clk or posedge reset) begin
                if (reset) begin
                    mem_used[DEPTH-1] <= 0;
                end
                else begin 
                    if (write ^ read) begin            
                        mem_used[DEPTH-1] <= 0;
                        if (write)
                            mem_used[DEPTH-1] <= mem_used[DEPTH-2];
                    end
                end
            end