    always @(posedge o_sys_clk or posedge rst_tmp)
        if (rst_tmp)
            ddr_calib_done_sync_r <= {RST_SYNC_NUM{1'b0}};
        else
            ddr_calib_done_sync_r <= {ddr_calib_done_sync_r[RST_SYNC_NUM-2:0], i_ddr_calib_done};