          always @(sent_row_or_maint) begin
            cs_en2 = sent_row_or_maint;
            send_cmd1_row = sent_row_or_maint;
            send_cmd2_row = sent_row_or_maint;
          end