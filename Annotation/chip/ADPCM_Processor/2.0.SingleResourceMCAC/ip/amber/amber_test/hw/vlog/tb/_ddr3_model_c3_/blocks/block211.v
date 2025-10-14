    always @ (posedge rst_n_in) begin : reset
        integer i;
        if (rst_n_in) begin
            if ($time < 200000000 && check_strict_timing) 
                $display ("%m at time %t WARNING: 200 us is required before RST_N goes inactive.", $time);
            if (cke_in !== 1'b0)
                $display ("%m: at time %t ERROR: CKE must be inactive when RST_N goes inactive.", $time);
            if ($time - tm_cke < 10000)
                $display ("%m: at time %t ERROR: CKE must be maintained inactive for 10 ns before RST_N goes inactive.", $time);

            
`ifdef MAX_MEM
            
    
    
    
    
`else
            memory_used <= 0; 
`endif

        end
    end