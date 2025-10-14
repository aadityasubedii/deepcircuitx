always @ ( posedge i_clk )
    if ( i_cache_flush )
        begin
        c_state     <= CS_INIT;
        source_sel  <= 1'd1 << C_INIT;
        init_count  <= 'd0;
        `ifdef A25_CACHE_DEBUG  
        `TB_DEBUG_MESSAGE  
        $display("Cache Flush");
        `endif            
        end
    else    
        case ( c_state )
            CS_INIT :
                if ( init_count < CACHE_LINES [CACHE_ADDR_WIDTH:0] )
                    begin
                    init_count  <= init_count + 1'd1;
                    source_sel  <= 1'd1 << C_INIT;
                    end
                else
                    begin
                    source_sel  <= 1'd1 << C_CORE;
                    c_state     <= CS_TURN_AROUND;
                    end 
                       
             CS_IDLE :
                begin
                source_sel  <= 1'd1 << C_CORE;
                
                if ( read_miss ) 
                    c_state <= CS_FILL3; 
               end
                   
                
             CS_FILL3 :
                begin
                
                
                
                select_way  <= next_way; 
                random_num  <= {random_num[2], random_num[1], random_num[0], 
                                 random_num[3]^random_num[2]};
                                 
                
                
                if ( i_wb_ready ) 
                    begin
                    c_state     <= CS_FILL_COMPLETE;
                    end
                end
                

             
             CS_FILL_COMPLETE : 
                begin
                
                
                
                
                source_sel  <= 1'd1 << C_CORE;              
                c_state     <= CS_TURN_AROUND;    
                end                                 
                                                        

             
             
             CS_TURN_AROUND : 
                begin
                c_state     <= CS_IDLE;
                end
                
        endcase                       