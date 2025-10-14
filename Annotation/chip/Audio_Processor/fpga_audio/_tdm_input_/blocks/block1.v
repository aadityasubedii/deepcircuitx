    always @(posedge mclk)begin
        if(cnt256_n == 8'd0)begin
            
            ch1_out <= data_reg[63:48];
            ch2_out <= data_reg[31:16];
        end
        else if(cnt256_n[1:0] == 2'd2)begin
            
            data_reg <= {data_reg[62:0], tdm_in};
        end
        else begin
            
        end
    end