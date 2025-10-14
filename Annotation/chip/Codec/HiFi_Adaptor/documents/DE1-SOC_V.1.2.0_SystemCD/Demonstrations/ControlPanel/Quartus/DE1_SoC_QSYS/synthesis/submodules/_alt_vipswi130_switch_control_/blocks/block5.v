always @ (posedge clk or posedge rst) begin
    if(rst) begin
        master_enable <= 1'b0;
        output_switch <= 1'b0;
        av_readdata <= {AV_DATA_WIDTH{1'b0}};
    end else begin
        if(av_write) begin
            master_enable <= (av_address == 0) ? av_writedata[0] : master_enable;
        end
        
        output_switch <= (av_write && av_address == 2) ? av_writedata[0] : output_switch & ~global_synced;
        
        if(av_read) begin
            case(av_address)
                0: av_readdata <= {{AV_DATA_WIDTH-1{1'b0}}, master_enable};
                2: av_readdata <= {{AV_DATA_WIDTH-1{1'b0}}, output_switch};
                default: av_readdata <= {{AV_DATA_WIDTH-1{1'b0}}, !global_synced};
            endcase
        end
        
    end
end