    always @(posedge clk) begin
      if (wrdata_en) begin
        fi_xor_data[i*DQ_PER_DQS+:DQ_PER_DQS] <= {DQ_PER_DQS{1'b0}};
      end
      else if (fi_xor_we[i]) begin
        fi_xor_data[i*DQ_PER_DQS+:DQ_PER_DQS] <= fi_xor_wrdata[i*DQ_PER_DQS+:DQ_PER_DQS];
      end 
      else begin
        fi_xor_data[i*DQ_PER_DQS+:DQ_PER_DQS] <= fi_xor_data[i*DQ_PER_DQS+:DQ_PER_DQS];
      end
    end