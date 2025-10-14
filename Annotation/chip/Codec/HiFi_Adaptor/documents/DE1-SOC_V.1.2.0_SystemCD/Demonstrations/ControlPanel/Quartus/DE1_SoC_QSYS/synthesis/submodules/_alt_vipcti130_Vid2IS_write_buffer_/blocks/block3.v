always @ (posedge rst or posedge clk) begin
    if(rst) begin
        write_buffer_packet <= 1'b0;
    end else begin
        if(wrreq_in && !early_eop) begin
            if(!hd_sdn) begin
                if(packet_in) begin
                    write_buffer_packet <= 1'b1;
                end else if(wrreq_out) begin
                    write_buffer_packet <= 1'b0;
                end
            end else begin
                write_buffer_packet <= packet_in;
            end
        end else begin
            if(wrreq_out) begin
                write_buffer_packet <= 1'b0;
            end
        end
    end
end