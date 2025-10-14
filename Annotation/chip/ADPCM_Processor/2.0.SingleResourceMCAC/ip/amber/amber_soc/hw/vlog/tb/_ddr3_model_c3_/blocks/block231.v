    initial begin
        if (BL_MAX < 2) 
            $display("%m ERROR: BL_MAX parameter must be >= 2.  \nBL_MAX = %d", BL_MAX);
        if ((1<<BO_BITS) > BL_MAX) 
            $display("%m ERROR: 2^BO_BITS cannot be greater than BL_MAX parameter.");

        $timeformat (-12, 1, " ps", 1);
        seed = RANDOM_SEED;

        ck_cntr = 0;
    end