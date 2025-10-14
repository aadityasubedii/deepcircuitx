generate
if (WB_DWIDTH == 128) 
    begin : wbm128
    assign o_m_wb_rdat = i_m_wb_adr[3:2] == 2'd3 ? endian_x32(i_m_wb_rdat[127:96]) :
                         i_m_wb_adr[3:2] == 2'd2 ? endian_x32(i_m_wb_rdat[ 95:64]) :
                         i_m_wb_adr[3:2] == 2'd1 ? endian_x32(i_m_wb_rdat[ 63:32]) :
                                                   endian_x32(i_m_wb_rdat[ 31: 0]) ;
                                                  
    assign o_m_wb_sel  = i_m_wb_adr[3:2] == 2'd3 ? {       endian_x4(i_m_wb_sel), 12'd0} :
                         i_m_wb_adr[3:2] == 2'd2 ? { 4'd0, endian_x4(i_m_wb_sel),  8'd0} :
                         i_m_wb_adr[3:2] == 2'd1 ? { 8'd0, endian_x4(i_m_wb_sel),  4'd0} :
                                                   {12'd0, endian_x4(i_m_wb_sel)       } ;
                                                  
    assign o_m_wb_wdat = i_m_wb_adr[3:2] == 2'd3 ? {       endian_x32(i_m_wb_wdat), 96'd0} :
                         i_m_wb_adr[3:2] == 2'd2 ? {32'd0, endian_x32(i_m_wb_wdat), 64'd0} :
                         i_m_wb_adr[3:2] == 2'd1 ? {64'd0, endian_x32(i_m_wb_wdat), 32'd0} :
                                                   {96'd0, endian_x32(i_m_wb_wdat)       } ;
    end 
else
    begin : wbm32
    assign o_m_wb_rdat = endian_x32(i_m_wb_rdat);
    assign o_m_wb_sel  = endian_x4 (i_m_wb_sel);
    assign o_m_wb_wdat = endian_x32(i_m_wb_wdat);
    end
endgenerate