module miller_encoder (
    input  rst_n, clk2x, din, enable,
    output dout
);   
    
    reg    odevity, ready_buf, out_buf, last_din; 

    always @(posedge clk2x)
    begin
        
        if (!rst_n)
        begin
            odevity   <= 0;
            out_buf   <= 0;
            ready_buf <= 0;
            last_din  <= 1;
        end  
        else if (!odevity)
        begin 
 
            /*
             * odevity == 0:
             * 1 -> 1, keep;
             * 1 -> 0, keep;
             * 0 -> 1, keep;
             * 0 -> 0, toggle.
             */
            if (!din)
            begin
                if (last_din == 0)
                    out_buf   <= ~out_buf;
                ready_buf <= 1;
            end
            
            odevity <= 1; 
        end
        else begin 

            /*
             * odevity == 1
             * 1 -> 1, toggle;
             * 1 -> 0, keep;
             * 0 -> 1, toggle;
             * 0 -> 0, keep.
             */
            if (din)
                out_buf <= ~out_buf;                 
            
            last_din <= din;
            odevity  <= 0;
        end
    end
 
    assign dout  = (enable) ? out_buf   : 'bz;
    assign ready = (enable) ? ready_buf : 'bz;

    initial begin
        out_buf = 0;
    end

endmodule