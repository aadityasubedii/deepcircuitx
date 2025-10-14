generate
if(C_NUM_DQ_PINS == 4 ) begin : dq_3_0_data

wire aux_sdi_out_0;
wire aux_sdi_out_1;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ0_TAP_DELAY_VAL),  
.MCB_ADDRESS          (0),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_0
(
  .AUXSDO             (aux_sdi_out_0),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[0]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[0]),
  .SDO(),
  .TOUT               (t_dq[0]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_1),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[0]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[0]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[0]) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ1_TAP_DELAY_VAL),  
.MCB_ADDRESS          (0),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_1
(
  .AUXSDO             (aux_sdi_out_1),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[1]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[1]),
  .SDO(),
  .TOUT               (t_dq[1]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (1'b0),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[1]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[1]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[1]) 
);


wire aux_sdi_out_2;
wire aux_sdi_out_3;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ2_TAP_DELAY_VAL),  
.MCB_ADDRESS          (1),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_2
(
  .AUXSDO             (aux_sdi_out_2),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[2]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[2]),
  .SDO(),
  .TOUT               (t_dq[2]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_3),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[2]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[2]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[2]) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ3_TAP_DELAY_VAL),  
.MCB_ADDRESS          (1),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_3
(
  .AUXSDO             (aux_sdi_out_3),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[3]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[3]),
  .SDO(),
  .TOUT               (t_dq[3]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_0),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[3]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[3]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[3]) 
);


wire aux_sdi_out_dqsp;
wire aux_sdi_out_dqsn;



IODRP2_MCB #(
.DATA_RATE            (C_DQS_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (LDQSP_TAP_DELAY_VAL),  
.MCB_ADDRESS          (15),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQS_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dqsp_0
(
  .AUXSDO             (aux_sdi_out_dqsp),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dqs),
  .DQSOUTN(),
  .DQSOUTP            (idelay_dqs_ioi_m),
  .SDO(),
  .TOUT               (t_dqs),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_dqsn),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dqsp),
  .IOCLK0             (ioclk0),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dqsp_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (dqsp_tq) 
);




IODRP2_MCB #(
.DATA_RATE            (C_DQS_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (LDQSN_TAP_DELAY_VAL),  
.MCB_ADDRESS          (15),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQS_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dqsn_0
(
  .AUXSDO             (aux_sdi_out_dqsn),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dqsn),
  .DQSOUTN(),
  .DQSOUTP            (idelay_dqs_ioi_s),
  .SDO(),
  .TOUT               (t_dqsn),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_2),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dqsp),
  .IOCLK0             (ioclk0),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dqsn_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (dqsn_tq) 
);



wire aux_sdi_out_ldm;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (0),  
.MCB_ADDRESS          (8),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_udm
(
  .AUXSDO             (ioi_drp_sdi),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_udm),
  .DQSOUTN(),
  .DQSOUTP(),
  .SDO(),
  .TOUT               (t_udm),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_ldm),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN(1'b0),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (udm_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (udm_t) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (0),  
.MCB_ADDRESS          (8),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_ldm
(
  .AUXSDO             (aux_sdi_out_ldm),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_ldm),
  .DQSOUTN(),
  .DQSOUTP(),
  .SDO(),
  .TOUT               (t_ldm),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_4),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN(),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (ldm_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (ldm_t) 
);

end
endgenerate