  generate
    if (SYS_RST_PORT == "TRUE")
      IBUF u_sys_rst_ibuf
        (
         .I (sys_rst),
         .O (sys_rst_i)
         );
    else
      assign sys_rst_i = sys_rst;
  endgenerate