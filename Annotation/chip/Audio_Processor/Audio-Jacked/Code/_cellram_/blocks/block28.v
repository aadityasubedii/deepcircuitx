    function [DQ_BITS-1:0] memory_read;
        input [ADDR_BITS-1:0] addr;
        begin
            if (partial_address_size == 0) begin
                $display ("%t  WARN: Illegal Address = %h.  Address range is NULL", $realtime, addr);
                memory_read = {DQ_BITS{1'bx}};
            end else if ((addr < partial_address_offset) || (addr > partial_address_offset + partial_address_size - 1)) begin
                $display ("%t  WARN: Illegal Address = %h.  Address range is %h - %h", $realtime, addr, partial_address_offset, partial_address_offset + partial_address_size - 1);
                memory_read = {DQ_BITS{1'bx}};
            end else begin
                if (memory_addr_exists(addr)) begin
                    memory_read = memory[memory_index];
                end else begin
                    memory_read = {DQ_BITS{1'bx}};
                end
            end
        end
    endfunction