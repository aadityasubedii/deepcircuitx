always @( posedge i_clk )
    if ( !i_core_stall )
        begin
        if ( i_copro_operation == 2'd2 )  
            case ( i_copro_crn )
                4'd 1: begin `TB_DEBUG_MESSAGE $display ("Write 0x%08h to   Co-Pro 15 #1, Flush Cache", i_copro_write_data); end
                4'd 2: begin `TB_DEBUG_MESSAGE $display ("Write 0x%08h to   Co-Pro 15 #2, Cache Control", i_copro_write_data); end
                4'd 3: begin `TB_DEBUG_MESSAGE $display ("Write 0x%08h to   Co-Pro 15 #3, Cacheable area", i_copro_write_data); end
                4'd 4: begin `TB_DEBUG_MESSAGE $display ("Write 0x%08h to   Co-Pro 15 #4, Updateable area", i_copro_write_data); end
                4'd 5: begin `TB_DEBUG_MESSAGE $display ("Write 0x%08h to   Co-Pro 15 #5, Disruptive area", i_copro_write_data); end
            endcase
            
        if ( copro_operation_d1 == 2'd1 ) 
            case ( copro_crn_d1 )
                4'd 0: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #0, ID Register", o_copro_read_data); end
                4'd 2: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #2, Cache control", o_copro_read_data); end
                4'd 3: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #3, Cacheable area", o_copro_read_data); end
                4'd 4: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #4, Updateable area", o_copro_read_data); end
                4'd 5: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #4, Disruptive area", o_copro_read_data); end
                4'd 6: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #6, Fault Status Register", o_copro_read_data); end
                4'd 7: begin `TB_DEBUG_MESSAGE $display ("Read  0x%08h from Co-Pro 15 #7, Fault Address Register", o_copro_read_data); end
            endcase
    end