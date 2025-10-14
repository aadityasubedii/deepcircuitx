        always @(posedge clk or posedge reset) begin
            if (reset) begin
                mem_used[0] <= 0;
            end 
            else begin
                if (write ^ read) begin
                    if (write)
                        mem_used[0] <= 1;
                    else if (read) begin
                        if (DEPTH > 1)
                            mem_used[0] <= mem_used[1];
                        else
                            mem_used[0] <= 0;
                    end    
                end
            end
        end