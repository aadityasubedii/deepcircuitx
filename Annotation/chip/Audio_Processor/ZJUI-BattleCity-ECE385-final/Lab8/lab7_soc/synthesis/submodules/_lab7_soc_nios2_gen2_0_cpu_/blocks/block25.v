  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_ld_io <= 0;
      else if (R_en)
          R_ctrl_ld_io <= R_ctrl_ld_io_nxt;
    end


  assign D_ctrl_b_is_dst = D_op_addi|
    D_op_andhi|
    D_op_orhi|
    D_op_xorhi|
    D_op_andi|
    D_op_ori|
    D_op_xori|
    D_op_call|
    D_op_cmpgei|
    D_op_cmplti|
    D_op_cmpnei|
    D_op_cmpgeui|
    D_op_cmpltui|
    D_op_cmpeqi|
    D_op_jmpi|
    D_op_ldb|
    D_op_ldh|
    D_op_ldw|
    D_op_ldbio|
    D_op_ldhio|
    D_op_ldwio|
    D_op_ldbu|
    D_op_ldhu|
    D_op_ldbuio|
    D_op_ldhuio|
    D_op_initd|
    D_op_initda|
    D_op_flushd|
    D_op_flushda;

  assign R_ctrl_b_is_dst_nxt = D_ctrl_b_is_dst;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R_ctrl_b_is_dst <= 0;
      else if (R_en)
          R_ctrl_b_is_dst <= R_ctrl_b_is_dst_nxt;
    end


  assign D_ctrl_ignore_dst = D_op_br|
    D_op_bge|
    D_op_blt|
    D_op_bne|
    D_op_beq|
    D_op_bgeu|
    D_op_bltu|
    D_op_stb|
    D_op_sth|
    D_op_stw|
    D_op_stbio|
    D_op_sthio|
    D_op_stwio|
    D_op_jmpi;

  assign R_ctrl_ignore_dst_nxt = D_ctrl_ignore_dst;
  always @(posedge clk or negedge reset_n)
    begin