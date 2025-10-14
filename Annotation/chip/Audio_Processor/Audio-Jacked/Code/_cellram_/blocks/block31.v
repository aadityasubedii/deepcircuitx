    always @(par_enabled or partial_address_offset or partial_address_size) begin : corrupt_memory
        integer i;
        if (par_enabled) begin
            i = 0;
            
            if (partial_address_size > 0) begin
                for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
                    if ((memory_addr[memory_index] > partial_address_offset) && (memory_addr[memory_index] < partial_address_offset + partial_address_size)) begin
                        memory_addr[i] = memory_addr[memory_index];
                        memory[i] = memory[memory_index];
                        i = i + 1;
                    end
                end
            end
            
            for (memory_index=i; memory_index<memory_used; memory_index=memory_index+1) begin
                memory_addr[memory_index] = 'bx;
                memory[memory_index] = {DQ_BITS{1'bx}};
            end
            memory_used = i;
        end
    end