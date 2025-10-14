always @(posedge clk)begin
    if(cnt256_n == 8'd0)begin
        state <= ST_CLIP_L;
    end
end