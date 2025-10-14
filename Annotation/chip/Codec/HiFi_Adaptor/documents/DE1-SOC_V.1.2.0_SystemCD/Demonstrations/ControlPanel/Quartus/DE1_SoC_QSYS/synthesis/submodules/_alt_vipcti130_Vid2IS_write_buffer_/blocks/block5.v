        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                write_buffer_data[i] <= {BPS{1'b0}};
                write_buffer_valid[i] <= 1'b0;
            end else begin
                if(wrreq_in && !early_eop) begin
                    if(!hd_sdn) begin
                        if(!convert) begin
                            
                            
                            write_buffer_data[i] <= data_in[BPS-1:0];
                            write_buffer_valid[i] <= 1'b1;
                        end else begin
                            if((i == 0) ? write_buffer_valid[i] == 0 || wrreq_out : write_buffer_valid[i] == 0 && write_buffer_valid[i-1] == 1) begin    
                                write_buffer_data[i] <= data_in[BPS-1:0]; 
                                write_buffer_valid[i] <= 1'b1;
                            end else begin
                                if(wrreq_out) begin
                                    write_buffer_valid[i] <= 1'b0;   
                                end
                            end
                        end
                    end else begin
                        write_buffer_data[i] <= data_in[(i*BPS)+(BPS-1):(i*BPS)];
                        write_buffer_valid[i] <= 1'b1;
                    end
                end else begin
                    if(wrreq_out) begin
                        write_buffer_valid[i] <= 1'b0;   
                    end
                end
            end
        end