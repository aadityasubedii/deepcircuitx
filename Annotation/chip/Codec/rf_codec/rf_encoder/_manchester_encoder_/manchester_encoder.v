module manchester_encoder (
    input  rst_n, clk2x, din, enable,
    output dout
);   

    reg    odevity, out_buf;

    always @(posedge clk2x)
    begin
        if (!rst_n)
        begin
            odevity   <= 0;
            out_buf   <= 0; 
        end   
        else if (!odevity)
        begin 
 
            /*
             * odevity == 0, out_buf is din;             
             */
            out_buf   <= din;  
            odevity   <= 1; 
        end
        else begin 

            /*
             * odevity == 1, out_buf is ~din
             */
            out_buf <= ~din;    
            odevity <= 0;
        end        
    end 

    assign dout  = (enable) ? out_buf   : 'bz; 
     
endmodule