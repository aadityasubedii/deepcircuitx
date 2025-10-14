            always @(posedge clk or posedge reset) begin
                if (reset) begin
                    mem[i] <= 0;
                end 
                else if (read || !mem_used[i]) begin
                    if (!mem_used[i+1])
                        mem[i] <= in_payload;
                    else
                        mem[i] <= mem[i+1];
                end
            end