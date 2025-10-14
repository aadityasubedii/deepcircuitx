module miller_decoder (
    input  clk2x, din, enable,
    output dout, error
);   
    reg[3:0] fifo;
    reg syn_flg, dout_buf;
    reg clk1x;   

    /* syn_flg and fifo */
    always @(posedge clk2x)
    begin 

        fifo <= {fifo[2], fifo[1], fifo[0], din};       /* 4bits fifo buffer */

        if (fifo[1:0] == 2'b10)
            syn_flg <= 1; 
        else if ((fifo == 4'b1111) || (fifo == 4'b0000))
            syn_flg <= 0;
    end

    /* divider */
    always @(posedge clk2x)
    begin
        if (syn_flg)
            clk1x <= ~clk1x;
        else
            clk1x <= 0;
    end

    /* decoder */
    always @(posedge clk1x)
    begin
        if ((fifo[1:0] == 2'b00) || (fifo[1:0] == 2'b11))
            dout_buf  <= 0;
        else 
            dout_buf  <= 1;         
    end

    assign error = (enable) ? !syn_flg  : 'bz;
    assign dout  = (enable) ? dout_buf  : 'bz;

endmodule