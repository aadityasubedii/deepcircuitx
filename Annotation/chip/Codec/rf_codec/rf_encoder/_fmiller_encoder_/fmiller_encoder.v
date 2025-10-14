module fmiller_encoder (
    input  rst_n, clk2x, din, enable,
    output dout
);   

    wire a, b;
    reg  count, out_buf;

    manchester_encoder(
        .rst_n(rst_n),
        .clk2x(clk2x),
        .din(din),
        .enable(enable),
        .dout(a)
    );

    assign b = ~a;

    always @(negedge clk2x)
    begin
        if (!rst_n)
        begin               
            count     <= 0;
        end   
        else if (b)
        begin 
            if (!count)  count   <= 1;
            else         count   <= 0;
        end 
        else begin
            count <= 0;
        end
    end


    assign dout  = (enable) ? (!clk2x & count) : 'bz; 

endmodule