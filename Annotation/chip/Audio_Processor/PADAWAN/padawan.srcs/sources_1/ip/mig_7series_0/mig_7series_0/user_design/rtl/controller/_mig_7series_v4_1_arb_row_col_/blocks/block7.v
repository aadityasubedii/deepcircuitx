        always @(sent_pre_lcl) begin
          cs_en2 = sent_pre_lcl;
          send_cmd2_pre = sent_pre_lcl;
        end