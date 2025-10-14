always @ (posedge rst or posedge clk) begin
    if(rst) begin
        sof_cvi_reg <= 1'b0;
        sof_cvo_reg <= 1'b0;
    end else begin
        sof_cvi_reg <= sof_cvi;
        sof_cvo_reg <= sof_cvo;
    end
end