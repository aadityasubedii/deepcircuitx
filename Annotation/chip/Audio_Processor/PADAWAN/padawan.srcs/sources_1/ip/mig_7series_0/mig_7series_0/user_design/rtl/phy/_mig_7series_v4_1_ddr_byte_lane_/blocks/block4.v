generate

if (PO_DATA_CTL == "TRUE")   begin : in_fifo_gen

IN_FIFO #(
  .ALMOST_EMPTY_VALUE                ( IF_ALMOST_EMPTY_VALUE ),
  .ALMOST_FULL_VALUE                 ( IF_ALMOST_FULL_VALUE ),
  .ARRAY_MODE                        ( L_IF_ARRAY_MODE),
  .SYNCHRONOUS_MODE                  ( IF_SYNCHRONOUS_MODE)
) in_fifo  (
  .ALMOSTEMPTY                       (if_a_empty_),
  .ALMOSTFULL                        (if_a_full_),
  .EMPTY                             (if_empty_),
  .FULL                              (if_full_),
  .Q0                                (if_q0),
  .Q1                                (if_q1),
  .Q2                                (if_q2),
  .Q3                                (if_q3),
  .Q4                                (if_q4),
  .Q5                                (if_q5),
  .Q6                                (if_q6),
  .Q7                                (if_q7),
  .Q8                                (if_q8),
  .Q9                                (if_q9),

  .D0                                (if_d0),
  .D1                                (if_d1),
  .D2                                (if_d2),
  .D3                                (if_d3),
  .D4                                (if_d4),
  .D5                                ({dummy_i5,if_d5}),
  .D6                                ({dummy_i6,if_d6}),
  .D7                                (if_d7),
  .D8                                (if_d8),
  .D9                                (if_d9),
  .RDCLK                             (phy_clk),
  .RDEN                              (phy_rd_en_),
  .RESET                             (ififo_rst),
  .WRCLK                             (iserdes_clkdiv),
  .WREN                              (ififo_wr_enable)
);
end

endgenerate