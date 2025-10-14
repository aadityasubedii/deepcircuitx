    task mac(input zero, input add);
        acc_en_req <= 1;
        acc_rst_req <= zero;
        acc_add_req <= add;
        out_en_req <= 0;
    endtask