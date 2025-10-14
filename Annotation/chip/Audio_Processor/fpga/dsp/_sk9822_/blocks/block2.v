    always @(posedge wb_clk) begin

        if (led_en) begin
            bit_count <= bit_count + 1; 
            shift <= { shift[30:0], 1'b0 };

            if (bit_count == 0) begin
                ram_addr <= ram_addr + 1;
                case (ram_addr)
                    0   :   shift <= tx_data;
                    1   :   shift <= tx_data;
                    2   :   shift <= tx_data;
                    3   :   shift <= tx_data;
                    4   :   shift <= tx_data;
                    5   :   shift <= tx_data;
                    6   :   shift <= tx_data;
                    7   :   shift <= tx_data;
                    8   :   shift <= tx_data;
                    9   :   shift <= tx_data;
                    10  :   shift <= tx_data;
                    11  :   shift <= tx_data;
                    12  :   shift <= 32'h0; 
                    13  :   shift <= 32'hffff_ffff; 
                    14  :   ; 
                    15  :   shift <= 32'h0; 
                endcase
            end
        end

        if (enabled && (ram_addr != 14)) begin
            if (led_en) begin
                led_ck <= 0;
            end
            if (led_half) begin
                led_ck <= 1;
            end
        end

    end