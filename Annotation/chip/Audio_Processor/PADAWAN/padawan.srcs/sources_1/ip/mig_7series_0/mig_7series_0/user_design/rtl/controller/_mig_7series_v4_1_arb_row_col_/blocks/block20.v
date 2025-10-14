          always @(sent_row_or_maint or sent_row_or_maint_r) begin
            send_cmd0_row = sent_row_or_maint_r;
            send_cmd1_row = sent_row_or_maint;
          end