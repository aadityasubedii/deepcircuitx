always @(negedge AUD_BCLK)
begin
    if (DataAcquisition == 1 && Q == 240254)
        Q <= 0;
    else if (Q != 240254)
        Q <= Q + 1;
    else
        Q <= 0;
end