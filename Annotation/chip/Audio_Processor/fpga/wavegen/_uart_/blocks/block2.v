    always @(negedge ck) begin
        if (baud_counter == 0) begin
            
            if (count == 0)
                shift <= { 1'b1, tx_data, 1'b0 };
            else
                shift <= { 1'b1, shift[9:1] };

            if (count == 10)
                count <= 0;
            else
                count <= count + 1;            
        end
    end