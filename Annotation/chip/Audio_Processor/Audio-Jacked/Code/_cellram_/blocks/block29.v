    task memory_write;
        input [ADDR_BITS-1:0] addr;
        input [BY_BITS-1:0] data_mask;
        input [DQ_BITS-1:0] data;

        reg [DQ_BITS-1:0] bit_mask;
        reg [DQ_BITS-1:0] write_data;
        integer i;
        begin : memory_write_task
            if (par_enabled && (partial_address_size == 0)) begin
                $display ("%t  WARN: Illegal Address = %h.  Address range is NULL", $realtime, addr);
                disable memory_write_task; 
            end else if (par_enabled && ((addr < partial_address_offset) || (addr > partial_address_offset + partial_address_size - 1))) begin
                $display ("%t  WARN: Illegal Address = %h.  Address range is %h - %h", $realtime, addr, partial_address_offset, partial_address_offset + partial_address_size - 1);
                disable memory_write_task; 
            end else if (addr > (1<<ADDR_BITS) - 1) begin
                $display ("%t  WARN: Illegal Address = %h.  Max Address is %h", $realtime, addr, (1<<ADDR_BITS) - 1);
                disable memory_write_task; 
            end else if (data_mask == {BY_BITS{1'b1}}) begin
                disable memory_write_task; 
            end else if (data_mask == {BY_BITS{1'b0}}) begin
                write_data = {DQ_BITS{1'b1}} & data;
            end else begin
                bit_mask = 0;
                for (i=0; i<BY_BITS; i=i+1) begin
                    bit_mask = bit_mask | ({`DQ_PER_BY{!data_mask[i]}}<<(i*`DQ_PER_BY));
                end
                write_data = (data & bit_mask) | (memory_read(addr) & ~bit_mask);
            end

            if (memory_used == 1<<MEM_BITS) begin
                $display ("%t ERROR: Memory overflow.  Write to Address %h with Data %h will be lost.\nYou must increase the MEM_BITS parameter.", $realtime, addr, data);
                $stop(0);
            end else begin
                if (!memory_addr_exists(addr)) begin
                    memory_used = memory_used + 1;
                end
                memory_addr[memory_index] = addr;
                memory[memory_index] = write_data;
            end
        end
    endtask