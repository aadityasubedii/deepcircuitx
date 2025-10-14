  always @(posedge tck)
    begin
      if (vs_cdr)
          case (ir_in)
          
              2'b00: begin
                  sr[35] <= debugack_sync;
                  sr[34] <= monitor_error;
                  sr[33] <= resetlatch;
                  sr[32 : 1] <= MonDReg;
                  sr[0] <= monitor_ready_sync;
              end 
          
              2'b01: begin
                  sr[35 : 0] <= tracemem_trcdata;
                  sr[37] <= tracemem_tw;
                  sr[36] <= tracemem_on;
              end 
          
              2'b10: begin
                  sr[37] <= trigger_state_1;
                  sr[36] <= dbrk_hit3_latch;
                  sr[35] <= dbrk_hit2_latch;
                  sr[34] <= dbrk_hit1_latch;
                  sr[33] <= dbrk_hit0_latch;
                  sr[32 : 1] <= break_readreg;
                  sr[0] <= trigbrktype;
              end 
          
              2'b11: begin
                  sr[15 : 2] <= trc_im_addr;
                  sr[1] <= trc_wrap;
                  sr[0] <= trc_on;
              end 
          
          endcase 
      if (vs_sdr)
          case (DRsize)
          
              3'b000: begin
                  sr <= {tdi, sr[37 : 2], tdi};
              end 
          
              3'b001: begin
                  sr <= {tdi, sr[37 : 9], tdi, sr[7 : 1]};
              end 
          
              3'b010: begin
                  sr <= {tdi, sr[37 : 17], tdi, sr[15 : 1]};
              end 
          
              3'b011: begin
                  sr <= {tdi, sr[37 : 33], tdi, sr[31 : 1]};
              end 
          
              3'b100: begin
                  sr <= {tdi, sr[37],         tdi, sr[35 : 1]};
              end 
          
              3'b101: begin
                  sr <= {tdi, sr[37 : 1]};
              end 
          
              default: begin
                  sr <= {tdi, sr[37 : 2], tdi};
              end 
          
          endcase 
      if (vs_uir)
          case (ir_in)
          
              2'b00: begin
                  DRsize <= 3'b100;
              end 
          
              2'b01: begin
                  DRsize <= 3'b101;
              end 
          
              2'b10: begin
                  DRsize <= 3'b101;
              end 
          
              2'b11: begin
                  DRsize <= 3'b010;
              end 
          
          endcase 
    end