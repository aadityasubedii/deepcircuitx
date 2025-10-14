        always @(posedge clk or posedge reset) begin
            if (reset) begin
                empty <= 1;
                full  <= 0;
            end
            else begin 
                empty <= next_empty;
                full  <= next_full;
            end
        end