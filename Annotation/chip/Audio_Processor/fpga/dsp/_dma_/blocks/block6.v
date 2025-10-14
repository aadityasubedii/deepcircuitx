    always @(posedge wb_clk) begin

        if (wb_rst) begin

            block <= 0;
            addr <= 0;
            running <= 0;
            run_addr <= 0;
            run_cycles <= 0;

            dma_cyc <= 0;
            dma_we <= 0;
            dma_sel <= 0;
            dma_adr <= 0;

            block_done <= 0;
            xfer_done <= 0;
            xfer_match <= 0;
            xfer_adr <= 0;

        end

        if (!reg_start_req) begin
            
            block_done <= 0;
            xfer_done <= 0;
            xfer_match <= 0;
            running <= 0;
        end

        if (reg_start_req & !running) begin
            
            run_addr <= reg_addr;
            run_cycles <= reg_cycles;
            running <= 1;
            block_done <= 0;
            block <= reg_blocks;
            xfer_done <= 0;
            xfer_match <= 0;
            running <= 1;
        end

        if (reg_start_req & xfer_block & !xfer_done) begin
            
            block_en <= 1;
            addr <= run_addr;
            block <= reg_blocks;
            block_done <= 0;
            xfer_adr <= 0;
        end

        if (block_en & !dma_cyc) begin
            
            dma_cyc <= 1;
            dma_we <= 1;
            case (addr[1])
                0 : dma_sel <= 4'b0011;
                1 : dma_sel <= 4'b1100;
            endcase
            dma_adr <= { 8'h0, addr[23:2], 2'b0 };
 
        end

        if (dma_ack) begin
            
            dma_cyc <= 0;
            dma_we <= 0;
            dma_sel <= 4'b0000;
            dma_adr <= 0;

            
            addr <= addr + { 8'h0, reg_step };
            xfer_adr <= xfer_adr + 1;
            block <= block - 1;

        end

        if (block_en & (block == 1) & dma_ack) begin
            
            block_en <= 0;
            run_cycles <= run_cycles - 1;
            run_addr <= run_addr + 2;
        end

        if ((addr == reg_match) & (reg_match != 0)) begin
            xfer_match <= 1;
        end

        if (running & (block == 0) & !(block_en | xfer_block)) begin
            
            block_done <= 1;

            if (run_cycles == 0) begin
                
                xfer_done <= 1;
            end
        end

    end
