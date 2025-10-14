always @ (posedge clk_i)
begin
if( (fifo_rdy_i ) || cmd_startC )

  
 if (cmd_startC ) 
    begin
    if (sel_w1gen_logic) begin  

 

            
             case (addr_i[3])
           
                 0: begin 
                    if (data_mode_i == 4'b0101)
                    w1data <= #TCQ Data_Gen(0);
                    else
                    w1data <= #TCQ Data_GenW0(0);
                    
                    end
                 1:  begin 
                    if (data_mode_i == 4'b0101)
                    w1data <= #TCQ Data_Gen(1);
                    else
                    w1data <= #TCQ Data_GenW0(1);
                    end
                 default :begin
                    w1data[4*NUM_DQ_PINS-1:0*NUM_DQ_PINS ] <= #TCQ 'b0;    
                    end
                    
             endcase         

     end 
     
   end 
   else if( MEM_BURST_LEN == 8)  begin

              w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ {w1data[4*NUM_DQ_PINS - 5:3*NUM_DQ_PINS  ],w1data[4*NUM_DQ_PINS - 1:4*NUM_DQ_PINS - 4]};
              w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ {w1data[3*NUM_DQ_PINS - 5:2*NUM_DQ_PINS  ],w1data[3*NUM_DQ_PINS - 1:3*NUM_DQ_PINS - 4]};
              w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ {w1data[2*NUM_DQ_PINS - 5:1*NUM_DQ_PINS  ],w1data[2*NUM_DQ_PINS - 1:2*NUM_DQ_PINS - 4]};
              w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ {w1data[1*NUM_DQ_PINS - 5:0*NUM_DQ_PINS  ],w1data[1*NUM_DQ_PINS - 1:1*NUM_DQ_PINS - 4]};


               end           
             
  end  
end 