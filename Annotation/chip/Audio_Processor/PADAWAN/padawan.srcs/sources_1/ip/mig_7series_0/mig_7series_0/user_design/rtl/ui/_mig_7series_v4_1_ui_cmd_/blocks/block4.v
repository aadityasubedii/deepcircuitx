  always @(posedge clk) begin
    if (rst) begin
      app_addr_r1 <= #TCQ {ADDR_WIDTH{1'b0}};
      app_addr_r2 <= #TCQ {ADDR_WIDTH{1'b0}};
    end else begin
      app_addr_r1 <= #TCQ app_addr_ns1;
      app_addr_r2 <= #TCQ app_addr_ns2;
    end 
    app_cmd_r1 <= #TCQ app_cmd_ns1;
    app_cmd_r2 <= #TCQ app_cmd_ns2;
    app_sz_r1 <= #TCQ app_sz_ns1;
    app_sz_r2 <= #TCQ app_sz_ns2;
    app_hi_pri_r1 <= #TCQ app_hi_pri_ns1;
    app_hi_pri_r2 <= #TCQ app_hi_pri_ns2;
    app_en_r1 <= #TCQ app_en_ns1;
    app_en_r2 <= #TCQ app_en_ns2;
  end 