 always @ (posedge clk_i)
 begin
 if (rst_i) begin
    rd_data_counts_asked <= #TCQ 'b0;
    end
 else if (cmd_en_i && cmd_sent[0] == 1) begin

    rd_data_counts_asked <= #TCQ rd_data_counts_asked + (bl_sent + 7'b0000001) ;

    end
 end