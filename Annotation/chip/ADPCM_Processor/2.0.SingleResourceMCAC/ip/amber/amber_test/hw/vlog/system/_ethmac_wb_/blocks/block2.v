else
    begin : wbs32
    assign o_s_wb_wdat = i_s_wb_wdat;
    assign o_s_wb_sel  = i_s_wb_sel;
    assign o_s_wb_rdat = i_s_wb_rdat;
    end