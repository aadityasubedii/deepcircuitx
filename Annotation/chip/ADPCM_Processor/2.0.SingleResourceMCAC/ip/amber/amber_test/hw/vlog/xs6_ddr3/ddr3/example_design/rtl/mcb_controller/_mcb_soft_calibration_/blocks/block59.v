 always @(posedge UI_CLK or posedge MCB_UODATAVALID)
  begin
    if (MCB_UODATAVALID)
        MCB_UODATAVALID_U <= 1'b1;
    else
        MCB_UODATAVALID_U <= MCB_UODATAVALID;
  end