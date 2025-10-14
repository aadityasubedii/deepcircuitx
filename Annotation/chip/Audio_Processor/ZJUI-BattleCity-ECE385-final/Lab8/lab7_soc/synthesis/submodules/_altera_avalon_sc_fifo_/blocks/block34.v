        always @* begin
            full  = mem_used[DEPTH-1];
            empty = !mem_used[0];

            
            
            
            
            if (DEPTH == 1)
                full = mem_used[0] && !read;

            internal_out_payload = mem[0];

            
            
            
            
            
            
            
            
            
            if (EMPTY_LATENCY == 0) begin
                empty = !mem_used[0] && !in_valid;

                if (!mem_used[0] && in_valid)
                    internal_out_payload = in_payload;
            end
        end