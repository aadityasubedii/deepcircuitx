always @( posedge wr_clk )
    begin
    rd_pointer_d1 <= gray8(rd_pointer);
    rd_pointer_d2 <= rd_pointer_d1;
    end