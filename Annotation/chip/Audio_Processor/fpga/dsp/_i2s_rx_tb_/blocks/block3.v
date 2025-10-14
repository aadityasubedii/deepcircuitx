    task wait_sample(input signal);

        begin
            @(posedge ck);
            wait(sample);
            @(posedge ck);
            wait(!sample);
            @(posedge ck);
        end

    endtask