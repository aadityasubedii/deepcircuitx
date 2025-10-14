   generate 
   genvar f_pb;
   for(f_pb=0; f_pb<DRAM_WIDTH; f_pb=f_pb+1) begin
     always @ (posedge clk) begin
       if(rst | prbs_state_r == PRBS_NEW_DQS_WAIT ) begin