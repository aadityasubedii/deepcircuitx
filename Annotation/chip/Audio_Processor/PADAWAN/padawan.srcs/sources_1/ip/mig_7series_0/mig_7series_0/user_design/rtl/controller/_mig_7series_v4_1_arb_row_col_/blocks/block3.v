          always @(sent_row_or_maint) begin
            cs_en1 = sent_row_or_maint;
            send_cmd0_row = sent_row_or_maint;
            send_cmd1_row = sent_row_or_maint;
          end