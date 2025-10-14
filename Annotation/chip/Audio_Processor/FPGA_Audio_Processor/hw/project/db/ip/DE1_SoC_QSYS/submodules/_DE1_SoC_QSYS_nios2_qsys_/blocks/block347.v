  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exc <= 0;
          pending_exc_addr <= 0;
          pending_exc_handler <= 0;
          pending_exc_record_handler <= 0;
          prev_pid <= 0;
          prev_pid_valid <= 0;
          snapped_pid <= 0;
          snapped_curr_pid <= 0;
          snapped_prev_pid <= 0;
          pending_curr_pid <= 0;
          pending_prev_pid <= 0;
        end
      else if (trc_clear || (!0 && !0))
        begin
          itm <= 0;
          dct_buffer <= 0;
          dct_count <= 0;
          sync_timer <= 0;
          pending_frametype <= 4'b0000;
          pending_exc <= 0;
          pending_exc_addr <= 0;
          pending_exc_handler <= 0;
          pending_exc_record_handler <= 0;
          prev_pid <= 0;
          prev_pid_valid <= 0;
          snapped_pid <= 0;
          snapped_curr_pid <= 0;
          snapped_prev_pid <= 0;
          pending_curr_pid <= 0;
          pending_prev_pid <= 0;
        end
      else 
        begin
          if (!prev_pid_valid)
            begin
              prev_pid <= curr_pid;
              prev_pid_valid <= 1;
            end
          if ((curr_pid != prev_pid) & prev_pid_valid & !snapped_pid)
            begin
              snapped_pid <= 1;
              snapped_curr_pid <= curr_pid;
              snapped_prev_pid <= prev_pid;
              prev_pid <= curr_pid;
              prev_pid_valid <= 1;
            end
          if (instr_retired | advanced_exc_occured)
            begin
              if (~record_itrace)
                  pending_frametype <= 4'b1010;
              else if (is_exception_no_break)
                begin
                  pending_exc <= 1;
                  pending_exc_addr <= exc_addr;
                  pending_exc_record_handler <= 0;
                  if (is_external_interrupt)
                      pending_exc_handler <= eic_addr;
                  else if (is_fast_tlb_miss_exception)
                      pending_exc_handler <= 32'h0;
                  else 
                    pending_exc_handler <= 32'h4020020;
                  pending_frametype <= 4'b0000;
                end
              else if (is_idct)
                  pending_frametype <= 4'b1001;
              else if (record_dct_outcome_in_sync)
                  pending_frametype <= 4'b1000;
              else if (!is_dct & snapped_pid)
                begin
                  pending_frametype <= 4'b0011;
                  pending_curr_pid <= snapped_curr_pid;
                  pending_prev_pid <= snapped_prev_pid;
                  snapped_pid <= 0;
                end
              else 
                pending_frametype <= 4'b0000;
              if ((dct_count != 0) & 
             (~record_itrace | 
              is_exception_no_break |
              is_idct |
              record_dct_outcome_in_sync |
              (!is_dct & snapped_pid)))
                begin
                  itm <= {4'b0001, dct_buffer, 2'b00};
                  dct_buffer <= 0;
                  dct_count <= 0;
                  sync_timer <= sync_timer_next;
                end
              else 
                begin
                  if (record_itrace & (is_dct & (dct_count != 4'd15)) & ~record_dct_outcome_in_sync & ~advanced_exc_occured)
                    begin
                      dct_buffer <= {dct_code, dct_buffer[29 : 2]};
                      dct_count <= dct_count + 1;
                    end
                  if (record_itrace & (
                  (pending_frametype == 4'b1000) |
                  (pending_frametype == 4'b1010) |
                  (pending_frametype == 4'b1001)))
                    begin
                      itm <= {pending_frametype, retired_pcb};
                      sync_timer <= sync_interval;
                      if (0 &
                      ((pending_frametype == 4'b1000) | (pending_frametype == 4'b1010)) &
                      !snapped_pid & prev_pid_valid)
                        begin
                          snapped_pid <= 1;
                          snapped_curr_pid <= curr_pid;
                          snapped_prev_pid <= prev_pid;
                        end
                    end
                  else if (record_itrace & 
                  0 & (pending_frametype == 4'b0011))
                      itm <= {4'b0011, 2'b00, pending_prev_pid, 2'b00, pending_curr_pid};
                  else if (record_itrace & is_dct)
                    begin
                      if (dct_count == 4'd15)
                        begin
                          itm <= {4'b0001, dct_code, dct_buffer};
                          dct_buffer <= 0;
                          dct_count <= 0;
                          sync_timer <= sync_timer_next;
                        end
                      else 
                        itm <= 4'b0000;
                    end
                  else 
                    itm <= {4'b0000, 32'b0};
                end
            end
          else if (record_itrace & pending_exc)
            begin
              if (pending_exc_record_handler)
                begin
                  itm <= {4'b0010, pending_exc_handler[31 : 1], 1'b1};
                  pending_exc <= 1'b0;
                  pending_exc_record_handler <= 1'b0;
                end
              else 
                begin
                  itm <= {4'b0010, pending_exc_addr[31 : 1], 1'b0};
                  pending_exc_record_handler <= 1'b1;
                end
            end
          else 
            itm <= {4'b0000, 32'b0};
        end
    end