      always @ (posedge clk_i) begin


        if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
            if (sel_w1gen_logic) begin
               case (addr_i[8:5])
                 0, 14:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(0);
                              else
                                  w1data <= #TCQ Data_GenW0(0);
                 

                 1, 15:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(1);
                              else
                                  w1data <= #TCQ Data_GenW0(1);
                 

                 2:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(2);
                              else
                                  w1data <= #TCQ Data_GenW0(2);
                 

                 3:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(3);
                              else
                                  w1data <= #TCQ Data_GenW0(3);
                 

                 4:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(4);
                              else
                                  w1data <= #TCQ Data_GenW0(4);
                 

                 5:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(5);
                              else
                                  w1data <= #TCQ Data_GenW0(5);
                 

                 6:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(6);
                              else
                                  w1data <= #TCQ Data_GenW0(6);
                 

                 7:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(7);
                              else
                                  w1data <= #TCQ Data_GenW0(7);
                 

                 8:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(8);
                              else
                                  w1data <= #TCQ Data_GenW0(8);
                 

                 9:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(9);
                              else
                                  w1data <= #TCQ Data_GenW0(9);
                 

                 10:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(10);
                              else
                                  w1data <= #TCQ Data_GenW0(10);
                 

                 11:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(11);
                              else
                                  w1data <= #TCQ Data_GenW0(11);
                 

                 12:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(12);
                              else
                                  w1data <= #TCQ Data_GenW0(12);
                 

                 13:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(13);
                              else
                                  w1data <= #TCQ Data_GenW0(13);
                 default :
                    w1data[4*NUM_DQ_PINS-1:0*NUM_DQ_PINS ] <= #TCQ 'b0;    
                 
            endcase
       end
     end
   else if ( MEM_BURST_LEN == 8)  begin
              w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ {w1data[4*NUM_DQ_PINS - 5:3*NUM_DQ_PINS  ],w1data[4*NUM_DQ_PINS - 1:4*NUM_DQ_PINS - 4]};
              w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ {w1data[3*NUM_DQ_PINS - 5:2*NUM_DQ_PINS  ],w1data[3*NUM_DQ_PINS - 1:3*NUM_DQ_PINS - 4]};
              w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ {w1data[2*NUM_DQ_PINS - 5:1*NUM_DQ_PINS  ],w1data[2*NUM_DQ_PINS - 1:2*NUM_DQ_PINS - 4]};
              w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ {w1data[1*NUM_DQ_PINS - 5:0*NUM_DQ_PINS  ],w1data[1*NUM_DQ_PINS - 1:1*NUM_DQ_PINS - 4]};
        end
      end