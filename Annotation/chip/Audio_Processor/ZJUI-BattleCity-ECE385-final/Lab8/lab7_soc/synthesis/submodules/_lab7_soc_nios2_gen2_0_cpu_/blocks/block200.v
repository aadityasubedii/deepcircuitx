  assign D_dst_regnum = D_ctrl_implicit_dst_retaddr    ? 5'd31 : 
    D_ctrl_implicit_dst_eretaddr   ? 5'd29 : 
    D_ctrl_b_is_dst                ? D_iw_b :
    D_iw_c;
