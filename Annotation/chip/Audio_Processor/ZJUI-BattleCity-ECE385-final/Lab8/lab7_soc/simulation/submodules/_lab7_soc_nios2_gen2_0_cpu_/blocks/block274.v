  assign F_iw = hbreak_req     ? 4040762 :
    1'b0   ? 127034 :
    intr_req       ? 3926074 : 
    F_av_iw;