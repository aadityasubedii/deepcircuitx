assign xMODE  = mode_name ( status_bits_mode_r );

assign xTYPE  =
                               type == REGOP    ? "REGOP"    :
                               type == MULT     ? "MULT"     :
                               type == SWAP     ? "SWAP"     :
                               type == TRANS    ? "TRANS"    :
                               type == MTRANS   ? "MTRANS"   :
                               type == BRANCH   ? "BRANCH"   :
                               type == CODTRANS ? "CODTRANS" :
                               type == COREGOP  ? "COREGOP"  :
                               type == CORTRANS ? "CORTRANS" :
                               type == SWI      ? "SWI"      :
                                                  "UNKNOWN"  ;