  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) interrupt_reg <= 'b0;
    else        interrupt_reg <= interrupt_in;
    end