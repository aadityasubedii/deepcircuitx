      always @ (posedge clk_i) begin


        if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
            if (sel_w1gen_logic) begin
              case (addr_i[11:6])

               0:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(0);
                              else
                                  w1data <= #TCQ Data_GenW0(0);


               1, 35:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(1);
                              else
                                  w1data <= #TCQ Data_GenW0(1);


               2, 36:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(2);
                              else
                                  w1data <= #TCQ Data_GenW0(2);


               3, 37:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(3);
                              else
                                  w1data <= #TCQ Data_GenW0(3);


               4, 38:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(4);
                              else
                                  w1data <= #TCQ Data_GenW0(4);


               5, 39:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(5);
                              else
                                  w1data <= #TCQ Data_GenW0(5);


               6, 40:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(6);
                              else
                                  w1data <= #TCQ Data_GenW0(6);


               7, 41:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(7);
                              else
                                  w1data <= #TCQ Data_GenW0(7);


               8, 42:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(8);
                              else
                                  w1data <= #TCQ Data_GenW0(8);


               9, 43:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(9);
                              else
                                  w1data <= #TCQ Data_GenW0(9);


               10, 44:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(10);
                              else
                                  w1data <= #TCQ Data_GenW0(10);


               11, 45:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(11);
                              else
                                  w1data <= #TCQ Data_GenW0(11);


               12, 46:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(12);
                              else
                                  w1data <= #TCQ Data_GenW0(12);


               13, 47:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(13);
                              else
                                  w1data <= #TCQ Data_GenW0(13);


               14, 48:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(14);
                              else
                                  w1data <= #TCQ Data_GenW0(14);


               15, 49:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(15);
                              else
                                  w1data <= #TCQ Data_GenW0(15);


               16, 50:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(16);
                              else
                                  w1data <= #TCQ Data_GenW0(16);


               17, 51:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(17);
                              else
                                  w1data <= #TCQ Data_GenW0(17);


               18, 52:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(18);
                              else
                                  w1data <= #TCQ Data_GenW0(18);


               19, 53:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(19);
                              else
                                  w1data <= #TCQ Data_GenW0(19);


               20, 54:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(20);
                              else
                                  w1data <= #TCQ Data_GenW0(20);


               21, 55:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(21);
                              else
                                  w1data <= #TCQ Data_GenW0(21);


               22, 56:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(22);
                              else
                                  w1data <= #TCQ Data_GenW0(22);


               23, 57:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(23);
                              else
                                  w1data <= #TCQ Data_GenW0(23);


               24, 58:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(24);
                              else
                                  w1data <= #TCQ Data_GenW0(24);


               25, 59:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(25);
                              else
                                  w1data <= #TCQ Data_GenW0(25);


               26, 60:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(26);
                              else
                                  w1data <= #TCQ Data_GenW0(26);


               27, 61:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(27);
                              else
                                  w1data <= #TCQ Data_GenW0(27);


               28, 62:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(28);
                              else
                                  w1data <= #TCQ Data_GenW0(28);


               29, 63:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(29);
                              else
                                  w1data <= #TCQ Data_GenW0(29);


               30:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(30);
                              else
                                  w1data <= #TCQ Data_GenW0(30);


               31:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(31);
                              else
                                  w1data <= #TCQ Data_GenW0(31);


               32:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(32);
                              else
                                  w1data <= #TCQ Data_GenW0(32);


               33:
                             if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(33);
                              else
                                  w1data <= #TCQ Data_GenW0(33);
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
  endgenerate