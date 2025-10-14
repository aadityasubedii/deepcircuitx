        always @* begin
            next_full = full;
            next_empty = empty;
     
            if (read && !write) begin
                next_full = 1'b0;
     
                if (incremented_rd_ptr == wr_ptr)
                    next_empty = 1'b1;
            end
            
            if (write && !read) begin
                if (!drop_on_error)
                  next_empty = 1'b0;
                else if (curr_sop_ptr == rd_ptr)   
                  next_empty = 1'b1;
     
                if (incremented_wr_ptr == rd_ptr && !drop_on_error)
                    next_full = 1'b1;
            end

            if (write && read && drop_on_error) begin
                if (curr_sop_ptr == next_rd_ptr)
                  next_empty = 1'b1;
            end
        end