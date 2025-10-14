always @ (posedge clk_i) begin
if (addr_out[31:24] >= end_addr_r[31:24])
    AC3_G_E3 <= #TCQ    1'b1;
else
    AC3_G_E3 <= #TCQ    1'b0;

if (addr_out[23:16] >= end_addr_r[23:16])
    AC2_G_E2 <= #TCQ    1'b1;
else
    AC2_G_E2 <= #TCQ    1'b0;

if (addr_out[15:8] >= end_addr_r[15:8])
    AC1_G_E1 <= #TCQ    1'b1;
else
    AC1_G_E1 <= #TCQ    1'b0;
end