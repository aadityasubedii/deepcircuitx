always @( posedge i_clk )
    begin
    o_cmd_byte_addr  <= {wb_adr_d1[29:4], 4'd0};
    o_cmd_en         <= !ddr3_busy && ( start_write_d1 || start_read_d1 );
    o_cmd_instr      <= start_write_d1 ? 3'd0 : 3'd1;
    end