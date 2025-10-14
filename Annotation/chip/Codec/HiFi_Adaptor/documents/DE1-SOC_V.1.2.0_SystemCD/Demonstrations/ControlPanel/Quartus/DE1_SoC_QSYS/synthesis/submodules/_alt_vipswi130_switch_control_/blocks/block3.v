        always @ (posedge clk or posedge rst) begin
            if(rst) begin
                output_control[i] <= {NO_INPUTS{1'b0}};
                select[(i*NO_INPUTS)+NO_INPUTS-1:(i*NO_INPUTS)] <= {NO_INPUTS{1'b0}};
            end else begin
                if(av_write && av_address == i + 3) begin
                    output_control[i] <= av_writedata[NO_INPUTS-1:0];
                end
                
                if(global_synced) begin
                    select[(i*NO_INPUTS)+NO_INPUTS-1:(i*NO_INPUTS)] <= output_control[i];
                end
            end
        end