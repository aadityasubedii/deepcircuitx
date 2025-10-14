always @(posedge `U_DECOMPILE.i_clk)
    begin
    if ( `U_DECOMPILE.clk_count == 10 )
        begin
        $dumpon;
        $display("\nDump on at  %d ticks", `U_DECOMPILE.clk_count);
        end
            
    if ( `U_DECOMPILE.clk_count == 20 )
        begin
        $dumpoff;
        $display("\nDump off at %d ticks", `U_DECOMPILE.clk_count);
        end


    if ( `U_DECOMPILE.clk_count == ( `AMBER_DUMP_START + 0 ) )
        begin
        $dumpon;
        $display("\nDump on at  %d ticks", `U_DECOMPILE.clk_count);
        end
                                   
    if ( `U_DECOMPILE.clk_count == ( `AMBER_DUMP_START + `AMBER_DUMP_LENGTH ) )
        begin
        $dumpoff;
        $display("\nDump off at %d ticks", `U_DECOMPILE.clk_count);
        end
        
    `ifdef AMBER_TERMINATE
    if ( `U_DECOMPILE.clk_count == ( `AMBER_DUMP_START + `AMBER_DUMP_LENGTH + 100) )
        begin
        $display("\nAutomatic test termination after dump has completed");
        `TB_ERROR_MESSAGE
        end
    `endif
    end