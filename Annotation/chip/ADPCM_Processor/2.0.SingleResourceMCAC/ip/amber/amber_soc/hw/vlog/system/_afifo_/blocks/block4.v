always @( posedge rd_clk )
    begin
    wr_pointer_d1 <= gray8(wr_pointer);
    wr_pointer_d2 <= wr_pointer_d1;
    end