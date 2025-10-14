    always @( posedge reset, posedge clk ) begin
	if (reset) begin

	end else begin
        if ( (data_hit_way[0] + data_hit_way[1] + 
              data_hit_way[2] + data_hit_way[3] +
              data_hit_way[4] + data_hit_way[5] +
              data_hit_way[6] + data_hit_way[7] ) > 4'd1 )
            begin
            `TB_ERROR_MESSAGE
            $display("Hit in more than one cache ways!");                                                  
            end
	end
    end                  