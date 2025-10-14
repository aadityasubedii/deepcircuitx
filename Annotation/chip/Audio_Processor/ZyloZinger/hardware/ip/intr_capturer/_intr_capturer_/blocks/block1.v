  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) readdata_with_waitstate <= 32'b0;
    else        readdata_with_waitstate <= act_readdata;
    end