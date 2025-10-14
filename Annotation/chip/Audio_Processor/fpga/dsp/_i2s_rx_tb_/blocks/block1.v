    initial begin

        $display("start i2s tx 32 tests");

        left_tx_32 <= 16'hdead;
        right_tx_32 <= 16'hface;

        wait(!rst);
        @(posedge ck);

        
        wait(frame_posn == 'h0);
        @(posedge ck);
        wait(frame_posn == 'h1);
        @(posedge ck);
        
        wait(frame_posn == 'h0);
        
        wait_sample(sample);

        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);

        
        
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b0);
        wait_sample(sample);
        tb_assert(tx_32 == 1'b1);

    end