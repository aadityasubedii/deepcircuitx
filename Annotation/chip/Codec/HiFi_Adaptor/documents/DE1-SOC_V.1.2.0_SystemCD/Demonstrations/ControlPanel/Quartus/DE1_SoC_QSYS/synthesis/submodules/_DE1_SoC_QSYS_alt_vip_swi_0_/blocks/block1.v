always @ (select[1:0]
          or input_int_valid0 or input_int_data0
          or input_int_sop0 or input_int_eop0
          or input_int_valid1 or input_int_data1
          or input_int_sop1 or input_int_eop1
          or output_int_ready0
          ) begin
    case(select[1:0])
        2'd1: begin
                 output_int_valid0 = input_int_valid0;
                 output_int_data0 = input_int_data0;
                 output_int_sop0 = input_int_sop0;
                 output_int_eop0 = input_int_eop0;
                 input_int_ready0[0] = output_int_ready0;
                 input_int_ready1[0] = 1'b0;
                 end

        2'd2: begin
                 output_int_valid0 = input_int_valid1;
                 output_int_data0 = input_int_data1;
                 output_int_sop0 = input_int_sop1;
                 output_int_eop0 = input_int_eop1;
                 input_int_ready0[0] = 1'b0;
                 input_int_ready1[0] = output_int_ready0;
                 end

        default: begin
                 output_int_valid0 = 1'b0;
                 output_int_data0 = {24{1'b0}};
                 output_int_sop0 = 1'b0;
                 output_int_eop0 = 1'b0;
                 input_int_ready0[0] = 1'b0;
                 input_int_ready1[0] = 1'b0;
                 end
    endcase
end