    task memory_write;
        input  [BA_BITS-1:0]  bank;
        input  [ROW_BITS-1:0] row;
        input  [COL_BITS-1:0] col;
        input  [BL_MAX*DQ_BITS-1:0] data;
        reg    [`MAX_BITS-1:0] addr;
        begin
`ifdef MAX_MEM
            addr = {row, col}/BL_MAX;
            write_to_file( memfd[bank], addr, data );
`else
            
            addr = {bank, row, col}/BL_MAX;
            if (get_index(addr)) begin
                address[memory_index] = addr;
                memory[memory_index] = data;
            end else if (memory_used == `MEM_SIZE) begin
                $display ("%m: at time %t ERROR: Memory overflow.  Write to Address %h with Data %h will be lost.\nYou must increase the MEM_BITS parameter or define MAX_MEM.", $time, addr, data);
                if (STOP_ON_ERROR) $stop(0);
            end else begin
                address[memory_used] = addr;
                memory[memory_used] = data;
                memory_used = memory_used + 1;
            end
`endif
        end
    endtask
