        always @ (posedge rst or posedge sync_clock) begin
            if(rst) begin
                data_out_sync0 <= {WIDTH{1'b0}};
                data_out_sync1 <= {WIDTH{1'b0}};
            end else begin
                data_out_sync0 <= data_in;
                data_out_sync1 <= data_out_sync0;
            end
        end