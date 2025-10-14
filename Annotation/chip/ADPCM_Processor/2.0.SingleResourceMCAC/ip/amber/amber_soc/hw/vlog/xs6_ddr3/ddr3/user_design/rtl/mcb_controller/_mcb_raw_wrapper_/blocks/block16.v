generate
if(C_NUM_DQ_PINS == 16 ) begin : dq_15_0_data




wire aux_sdi_out_14;
wire aux_sdi_out_15;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ14_TAP_DELAY_VAL),  
.MCB_ADDRESS          (7),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  
)
iodrp2_dq_14
(
  .AUXSDO             (aux_sdi_out_14),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[14]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[14]),
  .SDO(),
  .TOUT               (t_dq[14]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_15),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[14]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[14]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[14]) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ15_TAP_DELAY_VAL),  
.MCB_ADDRESS          (7),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_15
(
  .AUXSDO             (aux_sdi_out_15),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[15]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[15]),
  .SDO(),
  .TOUT               (t_dq[15]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (1'b0),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[15]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[15]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[15]) 
);



wire aux_sdi_out_12;
wire aux_sdi_out_13;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ12_TAP_DELAY_VAL),  
.MCB_ADDRESS          (6),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_12
(
  .AUXSDO             (aux_sdi_out_12),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[12]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[12]),
  .SDO(),
  .TOUT               (t_dq[12]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_13),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[12]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[12]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[12]) 
);






IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ13_TAP_DELAY_VAL),  
.MCB_ADDRESS          (6),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_13
(
  .AUXSDO             (aux_sdi_out_13),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[13]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[13]),
  .SDO(),
  .TOUT               (t_dq[13]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_14),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[13]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[13]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[13]) 
);


wire aux_sdi_out_udqsp;
wire aux_sdi_out_udqsn;



IODRP2_MCB #(
.DATA_RATE            (C_DQS_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (UDQSP_TAP_DELAY_VAL),  
.MCB_ADDRESS          (14),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQS_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_udqsp_0
(
  .AUXSDO             (aux_sdi_out_udqsp),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_udqs),
  .DQSOUTN(),
  .DQSOUTP            (idelay_udqs_ioi_m),
  .SDO(),
  .TOUT               (t_udqs),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_udqsn),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_udqsp),
  .IOCLK0             (ioclk0),
  .IOCLK1(),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (udqsp_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (udqsp_tq) 
);




IODRP2_MCB #(
.DATA_RATE            (C_DQS_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (UDQSN_TAP_DELAY_VAL),  
.MCB_ADDRESS          (14),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQS_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_udqsn_0
(
  .AUXSDO             (aux_sdi_out_udqsn),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_udqsn),
  .DQSOUTN(),
  .DQSOUTP            (idelay_udqs_ioi_s),
  .SDO(),
  .TOUT               (t_udqsn),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_12),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_udqsp),
  .IOCLK0             (ioclk0),
  .IOCLK1(),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (udqsn_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (udqsn_tq) 
);


wire aux_sdi_out_10;
wire aux_sdi_out_11;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ10_TAP_DELAY_VAL),  
.MCB_ADDRESS          (5),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_10
(
  .AUXSDO             (aux_sdi_out_10),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[10]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[10]),
  .SDO(),
  .TOUT               (t_dq[10]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_11),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[10]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[10]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[10]) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ11_TAP_DELAY_VAL),  
.MCB_ADDRESS          (5),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_11
(
  .AUXSDO             (aux_sdi_out_11),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[11]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[11]),
  .SDO(),
  .TOUT               (t_dq[11]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_udqsp),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[11]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[11]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[11])
);



wire aux_sdi_out_8;
wire aux_sdi_out_9;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ8_TAP_DELAY_VAL),  
.MCB_ADDRESS          (4),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_8
(
  .AUXSDO             (aux_sdi_out_8),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[8]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[8]),
  .SDO(),
  .TOUT               (t_dq[8]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_9),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[8]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[8]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[8]) 
);





IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ9_TAP_DELAY_VAL),  
.MCB_ADDRESS          (4),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_9
(
  .AUXSDO             (aux_sdi_out_9),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[9]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[9]),
  .SDO(),
  .TOUT               (t_dq[9]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_10),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[9]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[9]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[9]) 
);


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
  .AUXSDOIN           (aux_sdi_out_8),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[1]),
  .IOCLK0             (ioclk90),
  .IOCLK1(),
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

wire aux_sdi_out_6;
wire aux_sdi_out_7;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ6_TAP_DELAY_VAL),  
.MCB_ADDRESS          (3),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_6
(
  .AUXSDO             (aux_sdi_out_6),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[6]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[6]),
  .SDO(),
  .TOUT               (t_dq[6]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_7),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[6]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[6]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[6]) 
);




IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ7_TAP_DELAY_VAL),  
.MCB_ADDRESS          (3),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_7
(
  .AUXSDO             (aux_sdi_out_7),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[7]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[7]),
  .SDO(),
  .TOUT               (t_dq[7]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_dqsp),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[7]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[7]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[7]) 
);



wire aux_sdi_out_4;
wire aux_sdi_out_5;



IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ4_TAP_DELAY_VAL),  
.MCB_ADDRESS          (2),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_MASTER),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_4
(
  .AUXSDO             (aux_sdi_out_4),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[4]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[4]),
  .SDO(),
  .TOUT               (t_dq[4]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_5),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[4]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[4]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[4]) 
);




IODRP2_MCB #(
.DATA_RATE            (C_DQ_IODRP2_DATA_RATE),   
.IDELAY_VALUE         (DQ5_TAP_DELAY_VAL),  
.MCB_ADDRESS          (2),  
.ODELAY_VALUE         (0),  
.SERDES_MODE          (C_DQ_IODRP2_SERDES_MODE_SLAVE),   
.SIM_TAPDELAY_VALUE   (10)  

)
iodrp2_dq_5
(
  .AUXSDO             (aux_sdi_out_5),
  .DATAOUT(),
  .DATAOUT2(),
  .DOUT               (ioi_dq[5]),
  .DQSOUTN(),
  .DQSOUTP            (in_dq[5]),
  .SDO(),
  .TOUT               (t_dq[5]),
  .ADD                (ioi_drp_add),
  .AUXADDR            (ioi_drp_addr),
  .AUXSDOIN           (aux_sdi_out_6),
  .BKST               (ioi_drp_broadcast),
  .CLK                (ioi_drp_clk),
  .CS                 (ioi_drp_cs),
  .IDATAIN            (in_pre_dq[5]),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (dq_oq[5]),
  .SDI                (ioi_drp_sdo),
  .T                  (dq_tq[5]) 
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
  .IDATAIN(1'b0),
  .IOCLK0             (ioclk90),
  .IOCLK1(1'b0),
  .MEMUPDATE          (ioi_drp_update),
  .ODATAIN            (ldm_oq),
  .SDI                (ioi_drp_sdo),
  .T                  (ldm_t) 
);
end
endgenerate