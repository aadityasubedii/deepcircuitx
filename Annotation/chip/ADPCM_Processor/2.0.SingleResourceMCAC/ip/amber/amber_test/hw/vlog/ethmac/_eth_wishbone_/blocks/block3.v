always @ (posedge WB_CLK_I)
begin
    Busy_IRQ_sync1 <=#Tp Busy_IRQ_rck;
    Busy_IRQ_sync2 <=#Tp Busy_IRQ_sync1;
    Busy_IRQ_sync3 <=#Tp Busy_IRQ_sync2;
end