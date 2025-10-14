module fmiller_decoder (
    input  clk2x, din, enable,
    output dout
);
    reg[3:0] fifo;
    reg flg, dout_buf;
    reg clk1x;   

    always @(posedge clk2x)
    begin
        clk1x <= ~clk1x;
    end

    always @ (posedge din or negedge clk1x) 
    begin
        if(flg) 
        begin
            if(clk1x == 0) begin
                flg <= 0;
            end
        end 
        else if(din) 
        begin
            flg <= 1;
        end
    end

    // always @ (posedge din or negedge clk1x) 
    // begin 
    //     if (flg)
    //     begin
    //         if (clk1x == 0)
    //         begin
    //             flg <= 0;
    //         end
    //     end
    //     else if (din)
    //     begin
    //         flg <= 1;
    //     end        
    //     // if (!clk1x) 
    //     // begin             
    //     //     if (din) flg <= ~flg;            
    //     // end
    //     // else if(din)
    //     // begin
    //     //     flg <= 1;
    //     // end
    // end

    always @(posedge clk1x)
    begin
        dout_buf <= flg;
    end
 
    assign dout  = (enable) ? dout_buf  : 'bz;

    initial begin
        flg   <= 0;        
        clk1x <= 0;
    end

endmodule