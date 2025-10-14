    task gain_run;
        begin
            gain_en <= 1;
            @(posedge ck);
            gain_en <= 0;
            @(posedge ck);
            wait(gain_done);
            @(posedge ck);
        end
    endtask