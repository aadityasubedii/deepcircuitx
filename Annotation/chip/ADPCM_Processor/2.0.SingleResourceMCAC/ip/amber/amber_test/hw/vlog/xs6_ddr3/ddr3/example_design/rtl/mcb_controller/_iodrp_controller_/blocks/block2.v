  always @ (*) begin
    addr_data_sel_n = 1'b0;
    load_shift_n    = 1'b0;
    case (state)
      READY:  begin
        if(cmd_valid)
          nextstate   = DECIDE;
        else
          nextstate   = READY;
      end
      DECIDE: begin
        load_shift_n    = 1;
        addr_data_sel_n = 1;
        nextstate       = ADDR_PHASE;
      end
      ADDR_PHASE: begin
        if(&bit_cnt)
          if (rd_not_write_reg)
            if (AddressPhase)
              
              nextstate = ALMOST_READY;
            else
              
              nextstate = DECIDE;
          else
            nextstate = ADDR_TO_DATA_GAP;
        else
          nextstate   = ADDR_PHASE;
      end
      ADDR_TO_DATA_GAP: begin
        load_shift_n  = 1;
        nextstate     = ADDR_TO_DATA_GAP2;
      end
      ADDR_TO_DATA_GAP2: begin
        load_shift_n  = 1;
        nextstate     = ADDR_TO_DATA_GAP3;
      end
      ADDR_TO_DATA_GAP3: begin
        load_shift_n  = 1;
        nextstate     = DATA_PHASE;
      end
      DATA_PHASE: begin
        if(&bit_cnt)
          nextstate   = ALMOST_READY;
        else
          nextstate   = DATA_PHASE;
      end
      ALMOST_READY: begin
        nextstate     = READY;
      end
      default: begin
        nextstate     = READY;
      end
    endcase
  end