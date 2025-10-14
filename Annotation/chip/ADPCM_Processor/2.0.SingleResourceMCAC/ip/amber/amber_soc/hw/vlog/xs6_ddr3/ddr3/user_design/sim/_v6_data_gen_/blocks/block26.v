      always @ (posedge clk_i) begin


        if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
            if (sel_w1gen_logic) begin
               case (addr_i[9:5])
                 0, 28:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(0);
                              else
                                  w1data <= #TCQ Data_GenW0(0);

                 1, 29:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(1);
                              else
                                  w1data <= #TCQ Data_GenW0(1);

                 2, 30:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(2);
                              else
                                  w1data <= #TCQ Data_GenW0(2);

                 3, 31:
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



                 6 :
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

                    18:
                                 if (data_mode_i == 4'b0101)
                                     w1data <= #TCQ Data_Gen(18);
                                 else
                                     w1data <= #TCQ Data_GenW0(18);

                    19:
                                 if (data_mode_i == 4'b0101)
                                     w1data <= #TCQ Data_Gen(19);
                                 else
                                     w1data <= #TCQ Data_GenW0(19);

                    20:
                                 if (data_mode_i == 4'b0101)
                                     w1data <= #TCQ Data_Gen(20);
                                 else
                                     w1data <= #TCQ Data_GenW0(20);

                    21:
                                 if (data_mode_i == 4'b0101)
                                     w1data <= #TCQ Data_Gen(21);
                                 else
                                     w1data <= #TCQ Data_GenW0(21);

                    22:
                                 if (data_mode_i == 4'b0101)
                                     w1data <= #TCQ Data_Gen(22);
                                 else
                                     w1data <= #TCQ Data_GenW0(22);

                    23:
                                  if (data_mode_i == 4'b0101)
                                      w1data <= #TCQ Data_Gen(23);
                                  else
                                      w1data <= #TCQ Data_GenW0(23);

                    24:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(24);
                              else
                                  w1data <= #TCQ Data_GenW0(24);

                    25:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(25);
                              else
                                  w1data <= #TCQ Data_GenW0(25);

                 
                    26:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(26);
                              else
                                  w1data <= #TCQ Data_GenW0(26);

                    27:
                              if (data_mode_i == 4'b0101)
                                  w1data <= #TCQ Data_Gen(27);
                              else
                                  w1data <= #TCQ Data_GenW0(27);
                 default :
                    w1data[4*NUM_DQ_PINS-1:0*NUM_DQ_PINS ] <= #TCQ 'b0;    
            endcase
       end
     end