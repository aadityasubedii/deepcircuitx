always @*
    begin
    
    count_nxt           = count;
    product_nxt         = product;
    
    
    
    
    
    flags_nxt   = { product[32], product[32:1] == 32'd0 }; 
    

    if ( count == 6'd0 )
        product_nxt = {33'd0, 1'd0, i_b_in, 1'd0 } ;
    else if ( count <= 6'd33 )
        product_nxt = { sum[33], sum, product[33:1]} ;
    else if ( count == 6'd34 && accumulate )
        begin
        
        
        product_nxt         = { product[64:33], sum_acc1[31:0], 1'd0}; 
        end
        
    
    if (count == 6'd0)  
        count_nxt   = enable ? 6'd1 : 6'd0;
    else if ((count == 6'd34 && !accumulate) ||  
             (count == 6'd35 &&  accumulate)  )  
        count_nxt   = 6'd0;
    else
        count_nxt   = count + 1'd1;
    end