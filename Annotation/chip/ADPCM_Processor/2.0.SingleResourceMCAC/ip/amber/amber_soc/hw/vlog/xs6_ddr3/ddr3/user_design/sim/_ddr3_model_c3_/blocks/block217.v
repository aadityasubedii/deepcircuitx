    task initialize;
        input [ADDR_BITS-1:0] mode_reg0;
        input [ADDR_BITS-1:0] mode_reg1;
        input [ADDR_BITS-1:0] mode_reg2;
        input [ADDR_BITS-1:0] mode_reg3;
        begin
            if (DEBUG) $display ("%m: at time %t INFO: Performing Initialization Sequence", $time);
            cmd_task(1,       NOP, 'bx, 'bx);
            cmd_task(1,        ZQ, 'bx, 'h400); 
            cmd_task(1, LOAD_MODE, 3, mode_reg3);
            cmd_task(1, LOAD_MODE, 2, mode_reg2);
            cmd_task(1, LOAD_MODE, 1, mode_reg1);
            cmd_task(1, LOAD_MODE, 0, mode_reg0 | 'h100); 
            cmd_task(0,       NOP, 'bx, 'bx);
        end
    endtask