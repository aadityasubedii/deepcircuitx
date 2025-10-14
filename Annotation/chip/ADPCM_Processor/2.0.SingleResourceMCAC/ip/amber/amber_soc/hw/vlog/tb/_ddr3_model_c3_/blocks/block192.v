    task dqs_odd_receiver;
        input [3:0] i;
        reg [63:0] bit_mask;
        begin
            bit_mask = {`DQ_PER_DQS{1'b1}}<<(i*`DQ_PER_DQS);
            if (dqs_odd[i]) begin
                if (tdqs_en) begin 
                    dm_in_neg[i] = 1'b0;
                end else begin
                    dm_in_neg[i] = dm_in[i];
                end
                dq_in_neg = (dq_in & bit_mask) | (dq_in_neg & ~bit_mask);
            end
        end
    endtask