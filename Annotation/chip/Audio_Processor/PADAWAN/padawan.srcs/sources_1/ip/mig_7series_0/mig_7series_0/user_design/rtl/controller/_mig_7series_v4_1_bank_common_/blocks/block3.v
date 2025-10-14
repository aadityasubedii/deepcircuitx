      always @(insert_maint_r_lcl or maint_zq_r or maint_sre_r or maint_srx_r
               or rfc_zq_xsdll_timer_r or rst) begin
        rfc_zq_xsdll_timer_ns = rfc_zq_xsdll_timer_r;
        if (rst) rfc_zq_xsdll_timer_ns = {RFC_ZQ_TIMER_WIDTH{1'b0}};
        else if (insert_maint_r_lcl) rfc_zq_xsdll_timer_ns =  maint_zq_r ?
                                                                nZQCS_CLKS :
                                                              maint_sre_r ?
                                                                {RFC_ZQ_TIMER_WIDTH{1'b0}} :
                                                              maint_srx_r ?
                                                                nXSDLL_CLKS :
                                                                nRFC_CLKS;
        else if (|rfc_zq_xsdll_timer_r) rfc_zq_xsdll_timer_ns =
                                  rfc_zq_xsdll_timer_r - ONE[RFC_ZQ_TIMER_WIDTH-1:0];
      end