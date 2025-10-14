    always @( posedge i_clk )
        begin
        wr_en          <= start_write;
        wr_mask        <= i_wb_adr[3:2] == 2'd0 ? { 12'hfff, ~i_wb_sel          } : 
                          i_wb_adr[3:2] == 2'd1 ? { 8'hff,   ~i_wb_sel, 4'hf    } : 
                          i_wb_adr[3:2] == 2'd2 ? { 4'hf,    ~i_wb_sel, 8'hff   } : 
                                                  {          ~i_wb_sel, 12'hfff } ; 
        wr_data        <= {4{i_wb_dat}};

                          
        addr_d1        <= i_mem_ctrl ? {5'd0, i_wb_adr[24:2]} : i_wb_adr[29:2];
        
        if ( wr_en )
            begin
            ram [addr_d1[27:2]]  <= masked_wdata;
            `ifdef AMBER_MEMIF_DEBUG
            $write("%09d  ", `U_TB.clk_count);
            $display("Main memory write: address %h, data %h, be %d%d%d%d",
                        {2'd0, addr_d1, 2'd0}, wr_data[31:0], 
                        ~wr_mask[addr_d1[1:0]*4+3],
                        ~wr_mask[addr_d1[1:0]*4+2],
                        ~wr_mask[addr_d1[1:0]*4+1],
                        ~wr_mask[addr_d1[1:0]*4+0]                        );
            `endif
            end
        end