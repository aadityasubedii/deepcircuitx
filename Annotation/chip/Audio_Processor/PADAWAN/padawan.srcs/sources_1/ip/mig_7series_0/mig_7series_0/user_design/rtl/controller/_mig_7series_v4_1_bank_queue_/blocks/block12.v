  assign order_q_zero = ~|order_q_r ||
                        (adv_order_q && (order_q_r == BM_CNT_ONE)) ||
                        ((ORDERING == "NORM") && rd_wr_r);