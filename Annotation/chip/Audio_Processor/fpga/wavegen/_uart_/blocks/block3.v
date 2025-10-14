    always @(negedge ck) begin
        if (baud_counter < 104)
            baud_counter <= baud_counter + 1;
        else
            baud_counter <= 0;
    end