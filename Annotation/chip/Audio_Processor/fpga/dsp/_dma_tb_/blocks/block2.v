    initial begin

        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;
        @(posedge wb_clk);
        @(posedge wb_clk);

        write(REG_ADDR,   32'h00010000);
        write_wait();

        write(REG_MATCH,  32'h00010010);
        write_wait();

        write(REG_STEPS,  32'h00001000);
        write_wait();

        write(REG_CYCLES, 32'h00000010);
        write_wait();

        write(REG_BLOCKS, 32'h8);
        write_wait();

        write(REG_START,  32'h0);
        write_wait();

        @(posedge wb_clk);

        while (!xfer_done) begin
            xfer_pulse();
            wait(block_done);
        end

        write(REG_STOP,  32'h1);
        write_wait();

        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);

        write(REG_START,  32'h0);
        write_wait();

        while (!xfer_done) begin
            xfer_pulse();
            wait(block_done);
        end

        

        read(REG_ADDR);
        read_wait();
        tb_assert(rd_data == 32'h10000);
        @(posedge wb_clk);

        read(REG_STEPS);
        read_wait();
        tb_assert(rd_data == 32'h1000);
        @(posedge wb_clk);

        read(REG_CYCLES);
        read_wait();
        tb_assert(rd_data == 32'h10);
        @(posedge wb_clk);

        read(REG_BLOCKS);
        read_wait();
        tb_assert(rd_data == 32'h8);
        @(posedge wb_clk);

        read(REG_STATUS);
        read_wait();
        tb_assert(rd_data == 32'h7); 
        @(posedge wb_clk);

        
        tb_assert(xfer_done);
        tb_assert(block_done);

        xfer_pulse();

        @(posedge wb_clk);
        @(posedge wb_clk);
        @(posedge wb_clk);
        tb_assert(xfer_done);
        tb_assert(block_done);
        
        
        write(REG_STOP,  32'h1);
        write_wait();

        
        read(REG_STATUS);
        read_wait();
        tb_assert(rd_data == 32'h0); 
        @(posedge wb_clk);

        write(REG_START,  32'h0);
        write_wait();
        @(posedge wb_clk);

        while (!xfer_done) begin
            xfer_pulse();
            wait(block_done);
        end

        

        read(REG_STATUS);
        read_wait();
        
        @(posedge wb_clk);

        
        wb_rst <= 1;
        @(posedge wb_clk);
        @(posedge wb_clk);
        wb_rst <= 0;
        @(posedge wb_clk);
        @(posedge wb_clk);

        read(REG_ADDR);
        read_wait();
        tb_assert(rd_data == 32'h0);
        @(posedge wb_clk);

        read(REG_STEPS);
        read_wait();
        tb_assert(rd_data == 32'h0);
        @(posedge wb_clk);

        read(REG_CYCLES);
        read_wait();
        tb_assert(rd_data == 32'h0);
        @(posedge wb_clk);

        read(REG_BLOCKS);
        read_wait();
        tb_assert(rd_data == 32'h0);
        @(posedge wb_clk);

        read(REG_STATUS);
        read_wait();
        tb_assert(rd_data == 32'h0);
        @(posedge wb_clk);

        

        write(REG_ADDR,   32'h00010000);
        write_wait();

        write(REG_MATCH,  32'h00010004);
        write_wait();

        write(REG_STEPS,  32'h00001000);
        write_wait();

        write(REG_CYCLES, 32'h00000004);
        write_wait();

        write(REG_BLOCKS, 32'h4);
        write_wait();

        
        write(REG_START,  32'h1);
        write_wait();

        while (!xfer_done) begin
            xfer_pulse();
            wait(block_done);
        end

        
        wait(!xfer_done);

        
        write(REG_START,  32'h0);

        
        while (!xfer_done) begin
            xfer_pulse();
            wait(block_done);
        end


        
        

        $display("done");

    end