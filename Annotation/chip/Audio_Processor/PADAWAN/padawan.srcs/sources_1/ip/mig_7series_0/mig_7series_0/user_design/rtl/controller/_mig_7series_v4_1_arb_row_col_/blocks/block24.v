          always @(sent_row_or_maint) begin 
            cs_en0 = sent_row_or_maint;
            send_cmd0_row = sent_row_or_maint;
          end