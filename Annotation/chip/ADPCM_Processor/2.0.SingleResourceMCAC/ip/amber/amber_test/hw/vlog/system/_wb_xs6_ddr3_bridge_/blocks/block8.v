    always @( posedge i_clk )
        if ( !i_cmd_full )
            begin
            wr_en_r    <= write_request || write_buf_r;
            
            o_wr_mask  <= wb_adr[3:2] == 2'd0 ? { 12'hfff, ~wb_sel          } : 
                          wb_adr[3:2] == 2'd1 ? { 8'hff,   ~wb_sel, 4'hf    } : 
                          wb_adr[3:2] == 2'd2 ? { 4'hf,    ~wb_sel, 8'hff   } : 
                                                {          ~wb_sel, 12'hfff } ; 
            
            o_wr_data  <= {4{wb_dat}};
            end

end