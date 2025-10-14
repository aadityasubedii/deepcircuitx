assign xSOURCE_SEL = source_sel[C_CORE]               ? "C_CORE"                :
                     source_sel[C_INIT]               ? "C_INIT"                :
                     source_sel[C_FILL]               ? "C_FILL"                :
                     source_sel[C_INVA]               ? "C_INVA"                :
                                                        "UNKNON"                ;