    function memory_addr_exists;
        input [ADDR_BITS-1:0] addr;
        begin : index
            memory_addr_exists = 0;
            for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
                if (memory_addr[memory_index] == addr) begin
                    memory_addr_exists = 1;
                    disable index;
                end
            end
        end
    endfunction