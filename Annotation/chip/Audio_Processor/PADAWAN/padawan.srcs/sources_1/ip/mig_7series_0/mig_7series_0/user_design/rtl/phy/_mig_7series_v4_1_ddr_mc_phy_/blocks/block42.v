generate




if (PHYCTL_CMD_FIFO == "TRUE") begin : cmd_fifo_soft
    reg  [31:0] phy_wd_reg = 0;
    reg  [3:0]  aux_in1_reg = 0;
    reg  [3:0]  aux_in2_reg = 0;
    reg         sfifo_ready = 0;
    assign _phy_ctl_wd     = phy_wd_reg;
    assign aux_in_[1]      = aux_in1_reg;
    assign aux_in_[2]      = aux_in2_reg;
    assign phy_ctl_a_full  = |_phy_ctl_a_full_p;
    assign phy_ctl_full[0] = |_phy_ctl_full_p;
    assign phy_ctl_full[1] = |_phy_ctl_full_p;
    assign phy_ctl_full[2] = |_phy_ctl_full_p;
    assign phy_ctl_full[3] = |_phy_ctl_full_p;
    assign _phy_clk        = phy_clk;
