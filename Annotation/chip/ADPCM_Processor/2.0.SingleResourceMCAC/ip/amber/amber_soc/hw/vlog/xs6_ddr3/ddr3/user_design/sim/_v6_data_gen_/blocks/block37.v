      always @ (posedge clk_i) begin


        if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
            if (sel_w1gen_logic) begin
              case (addr_i[9:5])

                 0, 18:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(0);
                              else
                                  w1data <= #TCQ Data_GenW0(0);

                 1, 19:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(1);
                              else
                                  w1data <= #TCQ Data_GenW0(1);

                 2, 20:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(2);
                              else
                                  w1data <= #TCQ Data_GenW0(2);

                 3, 21:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(3);
                              else
                                  w1data <= #TCQ Data_GenW0(3);

                 4, 22:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(4);
                              else
                                  w1data <= #TCQ Data_GenW0(4);

                 5, 23:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(5);
                              else
                                  w1data <= #TCQ Data_GenW0(5);

                 6, 24:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(6);
                              else
                                  w1data <= #TCQ Data_GenW0(6);

                 7, 25:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(7);
                              else
                                  w1data <= #TCQ Data_GenW0(7);

                8, 26:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(8);
                              else
                                  w1data <= #TCQ Data_GenW0(8);

                 9, 27:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(9);
                              else
                                  w1data <= #TCQ Data_GenW0(9);

                 10, 28:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(10);
                              else
                                  w1data <= #TCQ Data_GenW0(10);

                 11, 29:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(11);
                              else
                                  w1data <= #TCQ Data_GenW0(11);

                 12, 30:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(12);
                              else
                                  w1data <= #TCQ Data_GenW0(12);

                 13, 31:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(13);
                              else
                                  w1data <= #TCQ Data_GenW0(13);

                 14:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(14);
                              else
                                  w1data <= #TCQ Data_GenW0(14);

                 15:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(15);
                              else
                                  w1data <= #TCQ Data_GenW0(15);

                 16:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(16);
                              else
                                  w1data <= #TCQ Data_GenW0(16);

                 17:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(17);
                              else
                                  w1data <= #TCQ Data_GenW0(17);
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
    end