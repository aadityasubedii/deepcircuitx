    task set_level(input [15:0] value);
        begin
            @(posedge ck);
            level_en <= 1;
            level_in <= value;
            @(posedge ck);
            level_en <= 0;
            level_in <= 16'hZ;
            @(posedge ck);
            wait(ready);
        end
    endtask