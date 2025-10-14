  task updt_ptrs;
    input rd;
    input wr;
    reg [1:0] next_rd_ptr;
    reg [1:0] next_wr_ptr;
    begin
      next_rd_ptr = (rd_ptr + 1'b1)%DEPTH;
      next_wr_ptr = (wr_ptr + 1'b1)%DEPTH;
      casez ({rd, wr, my_empty[1], my_full[1]})
        4'b00zz: ; 
        4'b0100: begin
          
          wr_ptr  <= #TCQ next_wr_ptr;
          my_full[0] <= #TCQ (next_wr_ptr == rd_ptr);
          my_full[1] <= #TCQ (next_wr_ptr == rd_ptr);
          
        end
        4'b0110: begin
          
          wr_ptr   <= #TCQ next_wr_ptr;
          my_empty <= #TCQ 5'b00000;
          
        end     
        4'b1000: begin
          
          rd_ptr   <= #TCQ next_rd_ptr;
          rd_ptr_timing   <= #TCQ next_rd_ptr;
          my_empty[0] <= #TCQ (next_rd_ptr == wr_ptr);
          my_empty[1] <= #TCQ (next_rd_ptr == wr_ptr);
          my_empty[2] <= #TCQ (next_rd_ptr == wr_ptr);
          my_empty[3] <= #TCQ (next_rd_ptr == wr_ptr);
          my_empty[4] <= #TCQ (next_rd_ptr == wr_ptr);
        end
        4'b1001: begin
          
          rd_ptr <= #TCQ next_rd_ptr;
          rd_ptr_timing <= #TCQ next_rd_ptr;
          my_full[0] <= #TCQ 1'b0;
          my_full[1] <= #TCQ 1'b0;
        end
        4'b1100, 4'b1101, 4'b1110: begin
          
          
          rd_ptr <= #TCQ next_rd_ptr;
          rd_ptr_timing <= #TCQ next_rd_ptr;
          wr_ptr <= #TCQ next_wr_ptr;
          
        end
        4'b0101, 4'b1010: ;
          
          
          
          
          
          
        
        default: begin
          
          
          $display("ERR %m @%t: Bad access: rd:%b,wr:%b,empty:%b,full:%b", 
                   $time, rd, wr, my_empty[1], my_full[1]);    
          rd_ptr <=  #TCQ 2'bxx;
          rd_ptr_timing <=  #TCQ 2'bxx;
          wr_ptr <=  #TCQ 2'bxx;
        end
        
      endcase
    end
  endtask
