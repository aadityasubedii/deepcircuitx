always @ (posedge clk_i) begin
if (addr_out[31:8] >= end_addr_i[31:8])
    gen_addr_larger <=     1'b1;
else
    gen_addr_larger <=     1'b0;
end