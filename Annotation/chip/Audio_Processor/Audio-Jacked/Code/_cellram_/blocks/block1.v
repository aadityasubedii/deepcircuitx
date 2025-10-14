    specify
        specparam PATHPULSE$ = 0; 

        (clk   =>clk2waite) = (   tKHTL,  tHZ);
        (adv_n =>  adv2dqe) = (    tALZ, tAHZ);
        (negedge adv_n => (adv2dq +: adv_n)) = (tAADV,  tOH);
        (negedge adv_n => (adv2wi +: adv_n)) = (tWI,  0);
        (zz_n  =>    zz2pd) = (    tDPD,    0);
        (ce_n  =>   ce2dqe) = (     tLZ,  tHZ);
        (ce_n  =>    ce2dq) = (     tCO,    0);
        (ce_n  =>   ce2cem) = (    tCEM,    0);
        (ce_n  =>    ce2wi) = (     tWI,    0);
        (ce_n  => ce2waite) = (tCEW_MIN,  tHZ);
        (ce_n  =>  ce2wait) = (tCEW_MAX,    0);
        (ce_n  =>   ce2rst) = (      15,    0);
        (oe_n  =>   oe2dqe) = (    tOLZ, tOHZ);
        (oe_n  =>    oe2dq) = (     tOE,    0);
        (oe_n  =>   soe2dq) = (    tBOE,    0);
        (oe_n  => oe2waite) = (tOEW_MIN,  tHZ);
        (oe_n  =>  oe2wait) = (tOEW_MAX,    0);
        (we_n  =>   we2dqe) = (       0, tWHZ);
        (we_n  =>    we2dq) = (       0,    0);
        (we_n  => we2waite) = (       0,    0);
        (by_n  *>   by2dqe) = (    tBLZ, tBHZ);
        (by_n  *>    by2dq) = (     tBA,    0);
        (addr  *>  addr2dq) = (     tAA,  tOH);
        (addr  *>  addr2wi) = (     tWI,    0);
        (posedge clk   => (saddr2dq +: clk)) = (tABA,  tKOH);
    endspecify