wire    [(2*8)-1:0]    xCONDITION;
wire    [(4*8)-1:0]    xMODE;

assign  xCONDITION           = i_condition == EQ ? "EQ"  :
                               i_condition == NE ? "NE"  :
                               i_condition == CS ? "CS"  :
                               i_condition == CC ? "CC"  :
                               i_condition == MI ? "MI"  :
                               i_condition == PL ? "PL"  :
                               i_condition == VS ? "VS"  :
                               i_condition == VC ? "VC"  :
                               i_condition == HI ? "HI"  :
                               i_condition == LS ? "LS"  :
                               i_condition == GE ? "GE"  :
                               i_condition == LT ? "LT"  :
                               i_condition == GT ? "GT"  :
                               i_condition == LE ? "LE"  :
                               i_condition == AL ? "AL"  :
                                                   "NV " ;