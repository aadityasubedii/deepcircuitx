always @ ( posedge i_clk )
    if (!i_fetch_stall)
        begin

        
        
        
        
        reg_ram_n[wr_addr]      <= i_reg;
        reg_ram_m[wr_addr]      <= i_reg;
        reg_ram_ds[wr_addr]     <= i_reg;
        r15                     <= i_pc_wen ? i_pc : r15;

        
        rn_addr_reg             <= rn_addr;
        rm_addr_reg             <= rm_addr;
        rds_addr_reg            <= rds_addr;

        rn_15                   <= i_rn_sel == 4'hF;
        rm_15                   <= i_rm_sel == 4'hF;
        rds_15                  <= i_rds_sel == 4'hF;
        end