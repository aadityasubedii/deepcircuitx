PHASER_REF phaser_ref_i(

 .LOCKED (ref_dll_lock),
 .CLKIN  (freq_refclk),
 .PWRDWN (1'b0),
 .RST    ( ! pll_lock)

);