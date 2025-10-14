    task dqs_even_receiver;
        input [3:0] i;
        reg [63:0] bit_mask;
        begin
            bit_mask = {`DQ_PER_DQS{1'b1}}<<(i*`DQ_PER_DQS);
            if (dqs_even[i]) begin
                if (tdqs_en) begin 
                    dm_in_pos[i] = 1'b0;
                end else begin
                    dm_in_pos[i] = dm_in[i];
                end
                dq_in_pos = (dq_in & bit_mask) | (dq_in_pos & ~bit_mask);
            end
        end
    endtask