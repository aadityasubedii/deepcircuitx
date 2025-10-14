    task memory_read;
        input  [BA_BITS-1:0]  bank;
        input  [ROW_BITS-1:0] row;
        input  [COL_BITS-1:0] col;
        output [BL_MAX*DQ_BITS-1:0] data;
        reg    [`MAX_BITS-1:0] addr;
        begin
`ifdef MAX_MEM
            addr = {row, col}/BL_MAX;
            data = read_from_file( memfd[bank], addr );
`else
            
            addr = {bank, row, col}/BL_MAX;
            if (get_index(addr)) begin
                data = memory[memory_index];
            end else begin
                data = {BL_MAX*DQ_BITS{1'bx}};
            end
`endif
        end
    endtask