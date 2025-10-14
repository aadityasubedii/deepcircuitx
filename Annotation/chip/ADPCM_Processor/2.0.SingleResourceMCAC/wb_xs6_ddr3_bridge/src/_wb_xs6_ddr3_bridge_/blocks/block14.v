always @( posedge i_clk )
    if ( !i_cmd_full )
        begin
        o_cmd_byte_addr  <= {wb_adr_r[29:4], 4'd0};
        cmd_en_r         <= ( write_request_r || read_request_r );
        o_cmd_instr      <= write_request_r ? 3'd0 : 3'd1;
        end