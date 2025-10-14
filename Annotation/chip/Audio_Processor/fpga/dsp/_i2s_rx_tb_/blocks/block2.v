    initial begin

        $display("start i2s tx tests");

        left_tx <= 16'h1234;
        right_tx <= 16'habcd;

        wait(!rst);
        @(posedge ck);

        
        wait(frame_posn == 'h0);
        @(posedge ck);
        wait(frame_posn == 'h1);
        @(posedge ck);
        
        wait(frame_posn == 'h0);
        
        wait_sample(sample);

        
        
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);

        
        for (i = 0; i < 16; i = i + 1) begin
            wait_sample(sample);
            tb_assert(tx == 1'b0);
        end

        
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b1);
        wait_sample(sample);
        tb_assert(tx == 1'b0);
        wait_sample(sample);
        tb_assert(tx == 1'b1);

        
        for (i = 0; i < 16; i = i + 1) begin
            wait_sample(sample);
            tb_assert(tx == 1'b0);
        end

    end