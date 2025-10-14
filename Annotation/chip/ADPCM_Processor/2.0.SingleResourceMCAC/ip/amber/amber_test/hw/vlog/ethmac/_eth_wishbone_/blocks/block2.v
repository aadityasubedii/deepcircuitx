always @ (posedge MRxClk)
begin
    Busy_IRQ_syncb1 <=#Tp Busy_IRQ_sync2;
    Busy_IRQ_syncb2 <=#Tp Busy_IRQ_syncb1;
end