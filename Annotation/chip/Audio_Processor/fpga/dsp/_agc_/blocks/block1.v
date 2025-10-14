    wire busy;
    assign busy = busy_start | out_we;
    assign done = !busy;