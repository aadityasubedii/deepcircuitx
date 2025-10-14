generate

 if ( PO_DATA_CTL == "TRUE" )  begin : dqs_gen

   ODDR  
      #(.DDR_CLK_EDGE  (ODDR_CLK_EDGE))
      oddr_dqs 
   (
       .Q   (oserdes_dqs_buf),
       .D1  (oserdes_dqs[0]),
       .D2  (oserdes_dqs[1]),
       .C   (oserdes_clk_delayed),
       .R   (1'b0),
       .S   (),
       .CE  (1'b1)
   );

   ODDR
     #(.DDR_CLK_EDGE  (ODDR_CLK_EDGE))
     oddr_dqsts 
   (    .Q  (oserdes_dqsts_buf),
        .D1 (oserdes_dqsts[0]),
        .D2 (oserdes_dqsts[0]),
        .C  (oserdes_clk_delayed),
        .R  (),
        .S  (1'b0),
        .CE (1'b1)
   );

 end 
 else begin:null_dqs 
 end 
endgenerate