module manch_decoder (
    input  clk2x, din, enable,
    output dout, error
);
    reg[3:0] fifo;
    reg syn_flg, error_buf, dout_buf;
    reg clk1x;

    /* syn_flg and fifo and divider */
    always @(posedge clk2x)
    begin  
        fifo <= {fifo[2], fifo[1], fifo[0], din};       /* 4bits fifo buffer */ 

        if ((fifo == 4'b1111) || (fifo == 4'b0000))
        begin
            syn_flg <= 0;
            clk1x <= 0;
        end
        else if (fifo[1:0] == 2'b01)
        begin
            syn_flg <= 1;
            clk1x   <= ~clk1x;
        end 
        else if (syn_flg)
        begin
            clk1x <= ~clk1x;
        end
    end

    // /* divider */
    // always @(posedge clk2x)
    // begin
    //     if (syn_flg)
    //         clk1x <= ~clk1x;
    //     else
    //         clk1x <= 0;
    // end

    /* decoder */
    always @(posedge clk1x)
    begin
        case (fifo[1:0])
            2'b10: begin
                dout_buf  <= 1;
                error_buf <= 0;   
            end

            2'b01: begin
                dout_buf  <= 0;
                error_buf <= 0;   
            end

            default: begin
                error_buf <= 1;   
            end
        endcase 
    end

    assign error = (enable) ? (error_buf || (!syn_flg))  : 'bz;
    assign dout =  (enable) ? dout_buf  : 'bz;

endmodule