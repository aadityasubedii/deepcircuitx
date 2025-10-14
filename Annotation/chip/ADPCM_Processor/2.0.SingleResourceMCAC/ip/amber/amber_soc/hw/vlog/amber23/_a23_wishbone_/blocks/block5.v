always @( posedge i_clk )
    case ( wishbone_st )
        WB_IDLE :
            begin 
                
            if ( start_access )
                begin
                o_wb_stb            <= 1'd1; 
                o_wb_cyc            <= 1'd1; 
                o_wb_sel            <= byte_enable;
                end
            else if ( !wait_write_ack )
                begin
                o_wb_stb            <= 1'd0;
                
                
                
                o_wb_cyc            <= exclusive_access;
                end

            
            servicing_cache <= cache_read_request && !wait_write_ack;

            if ( wait_write_ack )
                begin
                
                wishbone_st      <= WB_WAIT_ACK;
                end  
            
            else if ( cache_read_request )
                begin
                wishbone_st         <= WB_BURST1;
                exclusive_access    <= 1'd0;
                end                    
            else if ( core_read_request )
                begin
                wishbone_st         <= WB_WAIT_ACK;
                exclusive_access    <= i_exclusive;
                end                    
           
           
           
            else if ( core_write_request )
                exclusive_access <= i_exclusive;

                            
            if ( start_access )
                begin
                if (wbuf_busy_r)
                    begin
                    o_wb_we              <= 1'd1;
                    o_wb_adr[31:2]       <= wbuf_addr_r[31:2];
                    end
                else
                    begin
                    o_wb_we              <= core_write_request || cache_write_request;
                    
                    o_wb_adr[31:2]       <= i_address[31:2];
                    end
                    
                o_wb_adr[1:0]        <= byte_enable == 4'b0001 ? 2'd0 :
                                        byte_enable == 4'b0010 ? 2'd1 :
                                        byte_enable == 4'b0100 ? 2'd2 :
                                        byte_enable == 4'b1000 ? 2'd3 :
                                       
                                        byte_enable == 4'b0011 ? 2'd0 :
                                        byte_enable == 4'b1100 ? 2'd2 :
                                       
                                                                 2'd0 ;
                end
            end
                    

        
        WB_BURST1:  
            if ( i_wb_ack )
                begin
                
                o_wb_adr[3:2]   <= o_wb_adr[3:2] + 1'd1;
                wishbone_st     <= WB_BURST2;
                end
            
            
        
        WB_BURST2:  
            if ( i_wb_ack )
                begin
                
                o_wb_adr[3:2]   <= o_wb_adr[3:2] + 1'd1;
                wishbone_st     <= WB_BURST3;
                end
            
            
        
        WB_BURST3:  
            if ( i_wb_ack )
                begin
                
                o_wb_adr[3:2]   <= o_wb_adr[3:2] + 1'd1;
                wishbone_st     <= WB_WAIT_ACK;
                end


        
        WB_WAIT_ACK:   
            if ( i_wb_ack )
                begin
                wishbone_st         <= WB_IDLE;
                o_wb_stb            <= 1'd0; 
                o_wb_cyc            <= exclusive_access; 
                o_wb_we             <= 1'd0;
                servicing_cache     <= 1'd0;
                end
                         
    endcase