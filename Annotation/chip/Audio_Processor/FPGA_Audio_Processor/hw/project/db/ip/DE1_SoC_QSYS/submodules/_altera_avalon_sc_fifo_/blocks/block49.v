        always @(posedge clk, posedge reset) begin
            if (reset) begin
                mem[DEPTH-1] <= 0;
            end 
            else begin
                if (DEPTH == 1) begin
                    if (write)
                        mem[DEPTH-1] <= in_payload;
                end
                else if (!mem_used[DEPTH-1])
                    mem[DEPTH-1] <= in_payload;    
            end
        end