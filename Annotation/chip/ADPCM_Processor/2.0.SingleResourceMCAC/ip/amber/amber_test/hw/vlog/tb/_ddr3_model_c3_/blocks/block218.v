    task erase_banks;
        input  [`BANKS-1:0] banks; 
        reg [BA_BITS-1:0] ba;
        reg [`MAX_BITS-1:0] i;
        integer bank;

        begin

`ifdef MAX_MEM
        for (bank = 0; bank < `BANKS; bank = bank + 1)
            if (banks[bank] === 1'b1) begin
	        $fclose(memfd[bank]);
                memfd[bank] = open_bank_file(bank);
	    end
`else
        memory_index = 0;
        i = 0;
        
        for (memory_index=0; memory_index<memory_used; memory_index=memory_index+1) begin
            ba = (address[memory_index]>>(ROW_BITS+COL_BITS-BL_BITS));
            if (!banks[ba]) begin 
                address[i] = address[memory_index];
                memory[i] = memory[memory_index];
                i = i + 1;
            end
        end
        
        for (memory_index=i; memory_index<memory_used; memory_index=memory_index+1) begin
            address[memory_index] = 'bx;
            memory[memory_index] = {8*DQ_BITS{1'bx}};
        end
        memory_used = i;
`endif
        end
    endtask