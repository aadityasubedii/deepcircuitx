  always @ (*) begin
    addr_data_sel_n = 1'b0;
    load_shift_n = 1'b0;
    case (state)
      READY:  begin
         load_shift_n = 0;
         if(cmd_valid)
          nextstate = DECIDE;
         else
          nextstate = READY;
        end
      DECIDE: begin
          load_shift_n = 1;
          addr_data_sel_n = 1;
          nextstate = ADDR_PHASE;
        end
      ADDR_PHASE: begin
         load_shift_n = 0;
         if(&bit_cnt[2:0])
           if (`ALTERNATE_READ && rd_not_write_reg)
             if (AddressPhase)
               
               nextstate = ALMOST_READY;
             else
               
               nextstate = DECIDE;
           else
            nextstate = ADDR_TO_DATA_GAP;
         else
          nextstate = ADDR_PHASE;
        end
      ADDR_TO_DATA_GAP: begin
          load_shift_n = 1;
          nextstate = ADDR_TO_DATA_GAP2;
        end
      ADDR_TO_DATA_GAP2: begin
         load_shift_n = 1;
         nextstate = ADDR_TO_DATA_GAP3;
        end
      ADDR_TO_DATA_GAP3: begin
         load_shift_n = 1;
         nextstate = DATA_PHASE;
        end
      DATA_PHASE: begin
         load_shift_n = 0;
         if(&bit_cnt)
            nextstate = ALMOST_READY;
         else
          nextstate = DATA_PHASE;
        end
      ALMOST_READY: begin
         load_shift_n = 0;
         nextstate = ALMOST_READY2;
         end
      ALMOST_READY2: begin
         load_shift_n = 0;
         nextstate = ALMOST_READY3;
         end
      ALMOST_READY3: begin
         load_shift_n = 0;
         nextstate = READY;
         end
      default: begin
         load_shift_n = 0;
         nextstate = READY;
       end
    endcase
  end