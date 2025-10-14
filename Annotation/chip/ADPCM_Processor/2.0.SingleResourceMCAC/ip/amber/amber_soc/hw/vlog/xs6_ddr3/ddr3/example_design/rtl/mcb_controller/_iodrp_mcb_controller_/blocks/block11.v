   always @(*) begin
    case(drp_ioi_addr)
`ifdef DRP_v1_0_FIX
      IOI_DQ0       : data_out_mux  = data_out<<1;
      IOI_DQ1       : data_out_mux  = data_out;
      IOI_DQ2       : data_out_mux  = data_out<<1;

      IOI_DQ3       : data_out_mux  = data_out;
      IOI_DQ4       : data_out_mux  = data_out;
      IOI_DQ5       : data_out_mux  = data_out;
      IOI_DQ6       : shift_n_expand (data_out, data_out_mux);

      IOI_DQ7       : data_out_mux  = data_out;
      IOI_DQ8       : data_out_mux  = data_out<<1;
      IOI_DQ9       : data_out_mux  = data_out;
      IOI_DQ10      : data_out_mux  = data_out<<1;
      IOI_DQ11      : data_out_mux  = data_out;
      IOI_DQ12      : data_out_mux  = data_out<<1;
      IOI_DQ13      : data_out_mux  = data_out;
      IOI_DQ14      : data_out_mux  = data_out<<1;
      IOI_DQ15      : data_out_mux  = data_out;
      IOI_UDQS_CLK  : data_out_mux  = data_out<<1;
      IOI_UDQS_PIN  : data_out_mux  = data_out<<1;
      IOI_LDQS_CLK  : data_out_mux  = data_out;
      IOI_LDQS_PIN  : data_out_mux  = data_out;
`else
`endif
      IOI_DQ0       : data_out_mux  = data_out;
      IOI_DQ1       : data_out_mux  = data_out;
      IOI_DQ2       : data_out_mux  = data_out;
      IOI_DQ3       : data_out_mux  = data_out;
      IOI_DQ4       : data_out_mux  = data_out;
      IOI_DQ5       : data_out_mux  = data_out;
      IOI_DQ6       : data_out_mux  = data_out;
      IOI_DQ7       : data_out_mux  = data_out;
      IOI_DQ8       : data_out_mux  = data_out;
      IOI_DQ9       : data_out_mux  = data_out;
      IOI_DQ10      : data_out_mux  = data_out;
      IOI_DQ11      : data_out_mux  = data_out;
      IOI_DQ12      : data_out_mux  = data_out;
      IOI_DQ13      : data_out_mux  = data_out;
      IOI_DQ14      : data_out_mux  = data_out;
      IOI_DQ15      : data_out_mux  = data_out;
      IOI_UDQS_CLK  : data_out_mux  = data_out;
      IOI_UDQS_PIN  : data_out_mux  = data_out;
      IOI_LDQS_CLK  : data_out_mux  = data_out;
      IOI_LDQS_PIN  : data_out_mux  = data_out;
      default       : data_out_mux  = data_out;
    endcase
   end