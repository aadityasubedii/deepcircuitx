  generate
    begin : inhbt_act_faw
      wire act_delayed;
      wire [4:0] shift_depth = nFAW_CLKS[4:0] - 5'd3;

      SRLC32E #(.INIT(32'h00000000) ) SRLC32E0
        (.Q(act_delayed), 
         .Q31(), 
         .A(shift_depth), 
         .CE(1'b1), 
         .CLK(clk), 
         .D(act_this_rank) 
        );

      reg [2:0] faw_cnt_ns;
      reg [2:0] faw_cnt_r;
      reg inhbt_act_faw_ns;