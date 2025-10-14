generate
if (WB_DWIDTH == 128) 
    begin : wbs128
    assign o_s_wb_wdat = i_s_wb_adr[3:2] == 2'd3 ? i_s_wb_wdat[127:96] :
                         i_s_wb_adr[3:2] == 2'd2 ? i_s_wb_wdat[ 95:64] :
                         i_s_wb_adr[3:2] == 2'd1 ? i_s_wb_wdat[ 63:32] :
                                                   i_s_wb_wdat[ 31: 0] ;
                                                  
    assign o_s_wb_sel  = i_s_wb_adr[3:2] == 2'd3 ? i_s_wb_sel[15:12] :
                         i_s_wb_adr[3:2] == 2'd2 ? i_s_wb_sel[11: 8] :
                         i_s_wb_adr[3:2] == 2'd1 ? i_s_wb_sel[ 7: 4] :
                                                   i_s_wb_sel[ 3: 0] ;
                                                  
    assign o_s_wb_rdat = i_s_wb_adr[3:2] == 2'd3 ? {       i_s_wb_rdat, 96'd0} :
                         i_s_wb_adr[3:2] == 2'd2 ? {32'd0, i_s_wb_rdat, 64'd0} :
                         i_s_wb_adr[3:2] == 2'd1 ? {64'd0, i_s_wb_rdat, 32'd0} :
                                                   {96'd0, i_s_wb_rdat       } ;
    end
else
    begin : wbs32
    assign o_s_wb_wdat = i_s_wb_wdat;
    assign o_s_wb_sel  = i_s_wb_sel;
    assign o_s_wb_rdat = i_s_wb_rdat;
    end
endgenerate