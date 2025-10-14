        PRBS_CALC_TAPS_WAIT:
        begin
          prbs_state_r <= #TCQ PRBS_CALC_TAPS;
        end