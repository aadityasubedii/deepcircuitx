    if( C_MEM_TYPE != "DDR2") begin : gen_cketrain_b
    
        assign cke_train = 1'b0;
    end        