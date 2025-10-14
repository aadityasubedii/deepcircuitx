always @ (*)
begin
               push_cmd  = 1'b0;
               xfer_cmd = 1'b0;
               
               wdp_valid = 1'b0;
               wdp_validB = 1'b0;
               wdp_validC = 1'b0;
               
               rdp_valid = 1'b0;
               cmd_rdy = 1'b0;
               next_state = current_state;
case(current_state)
   READY:  
        begin
         if(rdp_rdy_i & cmd_rd & cmd_fifo_rdy)   

            begin
              next_state = READ;
              push_cmd = 1'b1;
              xfer_cmd = 1'b0;
              rdp_valid = 1'b1;
              
            end
         else if (wdp_rdy_i & cmd_wr & cmd_fifo_rdy)
             begin
              next_state = WRITE;
               push_cmd = 1'b1;
               wdp_valid     = 1'b1;
               wdp_validB = 1'b1;
               wdp_validC = 1'b1;
               
             end 
         else if ( cmd_others & cmd_fifo_rdy)
             begin
              next_state = REFRESH_ST;
               push_cmd = 1'b1;
               xfer_cmd = 1'b0;
               
             end 
             
         else
              begin
              next_state = READY;
              push_cmd = 1'b0;
              end
              
              
         if (cmd_fifo_rdy)
             cmd_rdy = 1'b1;
         else
             cmd_rdy = 1'b0;
         
         
         end
         
   REFRESH_ST : begin
   
         if (rdp_rdy_i && cmd_rd && cmd_fifo_rdy  )
            begin
               next_state = READ;
               push_cmd = 1'b1;
               rdp_valid = 1'b1;
               wdp_valid = 1'b0;
               xfer_cmd = 1'b1;
              
               
            end   
          else if (cmd_fifo_rdy && cmd_wr && wdp_rdy_i )
             begin
               next_state = WRITE;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               
               wdp_valid     = 1'b1;
               wdp_validB    = 1'b1;
               wdp_validC    = 1'b1;
               
             
              
             end
            
          else if (cmd_fifo_rdy && cmd_others)
             begin
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
             end
          else if (!cmd_fifo_rdy)

             begin
               next_state = CMD_WAIT;
               tstpointA    = 4'b1001;
               
             end  
          else
               next_state = READ; 
 
 
               
          if (cmd_fifo_rdy && ((rdp_rdy_i && cmd_rd) || (wdp_rdy_i && cmd_wr) || (cmd_others)))
              cmd_rdy = 1'b1;
         else 
              cmd_rdy = 1'b0;
          
         
   
          end
   READ:  begin
   
         if (rdp_rdy_i && cmd_rd && cmd_fifo_rdy  )
            begin
               next_state = READ;
               push_cmd = 1'b1;
               rdp_valid = 1'b1;
               wdp_valid = 1'b0;
               xfer_cmd = 1'b1;
               tstpointA    = 4'b0101;
               
            end   
          else if (cmd_fifo_rdy && cmd_wr && wdp_rdy_i )
             begin
               next_state = WRITE;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               
               wdp_valid     = 1'b1;
               wdp_validB    = 1'b1;
               wdp_validC    = 1'b1;
               
                tstpointA    = 4'b0110;
              
             end
            
         else if (!rdp_rdy_i )
            begin
               next_state = READ; 
               push_cmd  = 1'b0;
                 xfer_cmd  = 1'b0;
              
               tstpointA    = 4'b0111;
              
               wdp_valid = 1'b0;
               wdp_validB = 1'b0;
               wdp_validC    = 1'b0;
               rdp_valid = 1'b0;
            end                       
          else if (last_word_rd_i && cmd_others && cmd_fifo_rdy )

             begin
               next_state = REFRESH_ST;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               wdp_valid = 1'b0;
               wdp_validB = 1'b0;
               wdp_validC    = 1'b0;
               rdp_valid = 1'b0;
               tstpointA    = 4'b1000;
              
             end
          else if (!cmd_fifo_rdy || !wdp_rdy_i)

             begin
               next_state = CMD_WAIT;
               tstpointA    = 4'b1001;
               
             end  
          else
               next_state = READ; 
 
 
               
          if ((rdp_rdy_i && cmd_rd || cmd_wr && wdp_rdy_i || cmd_others) && cmd_fifo_rdy)
             cmd_rdy = wait_done;
         else 
              cmd_rdy = 1'b0;
          
        
        end
   WRITE: begin  
         if (cmd_fifo_rdy &&  cmd_rd && rdp_rdy_i && last_word_wr_i)
               begin
               next_state = READ;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               rdp_valid     = 1'b1;
               tstpointA    = 4'b0000;
               end
          else if (!wdp_rdy_i || (wdp_rdy_i && cmd_wr && cmd_fifo_rdy && last_word_wr_i) )
               begin
               next_state = WRITE;
               tstpointA    = 4'b0001;
               
               if (cmd_wr && last_word_wr_i) begin
                  wdp_valid     = 1'b1;
                  wdp_validB = 1'b1;
                  wdp_validC    = 1'b1;
                  
               end
               else begin
                  wdp_valid     = 1'b0;
                  wdp_validB = 1'b0;
               wdp_validC    = 1'b0;
                  
               end
               
               if (last_word_wr_i ) begin
                  push_cmd = 1'b1;
                  xfer_cmd = 1'b1;
               end
               else begin
                  push_cmd = 1'b0;
                  xfer_cmd = 1'b0;
               end
                             
               end
          else if (last_word_wr_i && cmd_others && cmd_fifo_rdy)
             begin
               next_state = REFRESH_ST;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               tstpointA    = 4'b0010;
               
               wdp_valid = 1'b0;
               wdp_validB = 1'b0;
               wdp_validC    = 1'b0;
               
               rdp_valid = 1'b0;
               
             end
               
          else if (!cmd_fifo_rdy && last_word_wr_i || !rdp_rdy_i || (!cmd_valid_i && wait_done) )

               begin
               next_state = CMD_WAIT;
               push_cmd = 1'b0;
               xfer_cmd = 1'b0;
               tstpointA    = 4'b0011;
               
               end
          
          else begin
                  next_state = WRITE;
               tstpointA    = 4'b0100;
                  
               end

         
         
   if (last_word_wr_i && (cmd_others || rdp_rdy_i && cmd_rd || cmd_wr && wdp_rdy_i) && cmd_fifo_rdy)
             cmd_rdy = wait_done;
         else 
             cmd_rdy = 1'b0;
         
              
         end
   
   
   

   
   CMD_WAIT: if (!cmd_fifo_rdy || wr_in_progress)
               begin
               next_state = CMD_WAIT;
               cmd_rdy = 1'b0;
               tstpointA    = 4'b1010;
               
               end
             else if (cmd_fifo_rdy && rdp_rdy_i && cmd_rd)
               begin
               next_state = READ;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;
               cmd_rdy = 1'b1;
               rdp_valid     = 1'b1;
               
               tstpointA    = 4'b1011;
               end
             else if (cmd_fifo_rdy  && cmd_wr && (wait_done || cmd_wr_pending_r1))

               begin
               next_state = WRITE;
               push_cmd = 1'b1;
               xfer_cmd = 1'b1;                                   
               wdp_valid     = 1'b1;
               wdp_validB = 1'b1;
               wdp_validC    = 1'b1;
               
               cmd_rdy = 1'b1;
               tstpointA    = 4'b1100;
               
               end
             else if (cmd_fifo_rdy &&  cmd_others)
               begin
               next_state = REFRESH_ST;
               push_cmd = 1'b1;  
               xfer_cmd = 1'b1;   
               tstpointA    = 4'b1101;
               cmd_rdy = 1'b1;
               
               end
             else
               begin
               next_state = CMD_WAIT;
               tstpointA    = 4'b1110;
               
               if ((wdp_rdy_i && rdp_rdy_i))
                  cmd_rdy = 1'b1;
               else
                  cmd_rdy = 1'b0;
                  
                  
               end
     
               
   default:
          begin
           push_cmd = 1'b0;
           xfer_cmd = 1'b0;
           
           wdp_valid = 1'b0;
           wdp_validB = 1'b0;
           wdp_validC    = 1'b0;
           next_state = READY;              
         
                    
                         

         end
   
 endcase
 end