    task set_latency;
        begin
            if (al == 0) begin
                additive_latency = 0;
            end else begin
                additive_latency = cas_latency - al;
            end
            read_latency = cas_latency + additive_latency;
            write_latency = cas_write_latency + additive_latency;
        end
    endtask