  always @(posedge clk) begin
    case (init_state_r)
      INIT_WRCAL_READ_WAIT: begin
        if (phy_ctl_full || phy_cmd_full)
          cnt_wait <= #TCQ cnt_wait;
        else
          cnt_wait <= #TCQ cnt_wait + 1;
      end
      default:
        cnt_wait <= #TCQ 'b0;
    endcase
  end