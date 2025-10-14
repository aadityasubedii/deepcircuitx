    initial begin

        @(posedge ck);
        wait(!rst);
        @(posedge ck);

        p_in <= 16'h1234;
        @(posedge ck);
        tb_assert(p_out == 16'h0);

        p_in <= 16'haaaa;
        @(posedge ck);
        tb_assert(p_out == 16'h0);
        
        p_in <= 16'h5555;
        @(posedge ck);
        tb_assert(p_out == 16'h0);
        
        p_in <= 16'h4545;
        @(posedge ck);
        tb_assert(p_out == 16'h1234);
        
        p_in <= 16'h4321;
        @(posedge ck);
        tb_assert(p_out == 16'haaaa);
        
        @(posedge ck);
        tb_assert(p_out == 16'h5555);
        
        @(posedge ck);
        tb_assert(p_out == 16'h4545);
        
        @(posedge ck);
        tb_assert(p_out == 16'h4321);
        
        @(posedge ck);
        tb_assert(p_out == 16'h4321);
        
    end