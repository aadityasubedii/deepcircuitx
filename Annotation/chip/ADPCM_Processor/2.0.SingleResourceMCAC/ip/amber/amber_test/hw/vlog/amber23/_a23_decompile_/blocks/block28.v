assign TYPE_NAME    = itype == REGOP    ? "REGOP   " :
                      itype == MULT     ? "MULT    " :
                      itype == SWAP     ? "SWAP    " :
                      itype == TRANS    ? "TRANS   " : 
                      itype == MTRANS   ? "MTRANS  " : 
                      itype == BRANCH   ? "BRANCH  " : 
                      itype == CODTRANS ? "CODTRANS" : 
                      itype == COREGOP  ? "COREGOP " : 
                      itype == CORTRANS ? "CORTRANS" : 
                      itype == SWI      ? "SWI     " : 
                                         "UNKNOWN " ;