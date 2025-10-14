always @ (posedge clk_i) begin
if (addr_out[31:24] >= end_addr_i[31:24])
    A3_G_E3 <= #TCQ    1'b1;
else
    A3_G_E3 <= #TCQ    1'b0;

if (addr_out[23:16] >= end_addr_i[23:16])
    A2_G_E2 <= #TCQ    1'b1;
else
    A2_G_E2 <= #TCQ    1'b0;

if (addr_out[15:8] >= end_addr_i[15:8])
    A1_G_E1 <= #TCQ    1'b1;
else
    A1_G_E1 <= #TCQ    1'b0;

if (addr_out[7:0] > end_addr_i[7:0] - DWIDTH/8* bl_out + 1)
    A0_G_E0 <= #TCQ    1'b1;
else
    A0_G_E0 <= #TCQ    1'b0;
end