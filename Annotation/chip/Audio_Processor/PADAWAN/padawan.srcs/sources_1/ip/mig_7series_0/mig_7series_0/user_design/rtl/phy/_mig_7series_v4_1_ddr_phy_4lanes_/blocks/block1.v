generate
if ( GENERATE_IDELAYCTRL == "TRUE")
IDELAYCTRL idelayctrl (
    .RDY                (),
    .REFCLK             (idelayctrl_refclk),
    .RST                (rst)
);
endgenerate