    initial begin
        wait(!rst);
        @(posedge ck);
        @(posedge ck);
        @(posedge ck);

        
        i = COEF;
        write(i, 32'h08000000); i += 4; 
        write(i, 32'h48081234); i += 4; 
        write(i, 32'h78000000); i += 4; 
        write(i, 32'h78000000); i += 4; 

        
        write(RESET, 0);
        @(posedge ck);
        tb_assert(!engine_ready);

        
        poll_addr <= STATUS;
        wait(rd_data & 32'h1);
        poll_addr <= 32'h0;
        tb_assert(engine_ready);
        @(posedge ck);

        
        read(STATUS + 4);
        
        @(posedge ck);
        tb_assert(rd_data == 32'h48081234);
        

        
        write(STATUS, 1);
        @(posedge ck);

        

        
        write(INPUT + ('h104 * 2), 16'h1234); 
        @(posedge ck);

        i = COEF;
        write(i, 32'h48213456); i += 4; 
        write(i, 32'h00000000); i += 4; 
        write(i, 32'h00000000); i += 4; 
        write(i, 32'h08100000); i += 4; 
        write(i, 32'h78000000); i += 4; 
        write(i, 32'h78000000); i += 4; 

        
        write(RESET, 0);
        @(posedge ck);
        wait(engine_ready);
        @(posedge ck);

    end