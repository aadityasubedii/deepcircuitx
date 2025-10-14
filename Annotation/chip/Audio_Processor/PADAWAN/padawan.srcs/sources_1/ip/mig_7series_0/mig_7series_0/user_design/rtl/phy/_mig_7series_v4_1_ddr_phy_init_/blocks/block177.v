  always @(posedge clk) begin
    case (init_state_r)
      INIT_LOAD_MR_WAIT,
      INIT_WRLVL_LOAD_MR_WAIT,
      INIT_WRLVL_LOAD_MR2_WAIT,
      INIT_MPR_WAIT,
      INIT_MPR_DISABLE_PREWAIT,
      INIT_MPR_DISABLE_WAIT,
      INIT_OCLKDELAY_ACT_WAIT,
      INIT_OCLKDELAY_WRITE_WAIT,
      INIT_RDLVL_ACT_WAIT,
      INIT_RDLVL_STG1_WRITE_READ,
      INIT_RDLVL_STG2_READ_WAIT,
      INIT_WRCAL_ACT_WAIT,
      INIT_WRCAL_WRITE_READ,
      INIT_WRCAL_READ_WAIT,
      INIT_PRECHARGE_PREWAIT,
      INIT_PRECHARGE_WAIT,
      INIT_DDR2_PRECHARGE_WAIT,
      INIT_REG_WRITE_WAIT,
      INIT_REFRESH_WAIT,
      INIT_REFRESH_RNK2_WAIT: begin
        if (phy_ctl_full || phy_cmd_full)
          cnt_cmd_r <= #TCQ cnt_cmd_r;
        else
          cnt_cmd_r <= #TCQ cnt_cmd_r + 1;
      end
      INIT_WRLVL_WAIT:
        cnt_cmd_r <= #TCQ 'b0;
      default:
        cnt_cmd_r <= #TCQ 'b0;
    endcase
  end