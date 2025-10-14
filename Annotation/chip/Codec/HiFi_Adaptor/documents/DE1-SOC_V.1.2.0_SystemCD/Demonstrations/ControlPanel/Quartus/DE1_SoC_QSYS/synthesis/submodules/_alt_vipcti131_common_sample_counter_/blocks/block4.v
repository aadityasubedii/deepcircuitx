        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                count_valids <= {LOG2_NUMBER_OF_COLOUR_PLANES{1'b0}};
            end else begin
                if(sclr)
                    count_valids <= {{LOG2_NUMBER_OF_COLOUR_PLANES-1{1'b0}}, count_cycle};
                else
                    count_valids <= (count_cycle) ? (new_sample) ? {LOG2_NUMBER_OF_COLOUR_PLANES{1'b0}} : count_valids + 1 : count_valids;
            end
        end