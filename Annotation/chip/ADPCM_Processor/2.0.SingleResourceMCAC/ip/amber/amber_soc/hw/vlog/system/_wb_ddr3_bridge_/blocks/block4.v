always @( posedge i_clk )
    begin
    o_wr_en          <= start_write;
    
    `ifdef XILINX_VIRTEX6_FPGA
        o_wr_mask        <= i_wb_adr[2] == 2'd2 ? { 8'h0, 4'hf,  ~i_wb_sel        } : 
                                                  { 8'h0,        ~i_wb_sel, 4'hf  } ; 
    `else
        o_wr_mask        <= i_wb_adr[3:2] == 2'd0 ? { 12'hfff, ~i_wb_sel          } : 
                            i_wb_adr[3:2] == 2'd1 ? { 8'hff,   ~i_wb_sel, 4'hf    } : 
                            i_wb_adr[3:2] == 2'd2 ? { 4'hf,    ~i_wb_sel, 8'hff   } : 
                                                    {          ~i_wb_sel, 12'hfff } ; 
    `endif
    
    o_wr_data        <= {4{i_wb_dat}};
    end