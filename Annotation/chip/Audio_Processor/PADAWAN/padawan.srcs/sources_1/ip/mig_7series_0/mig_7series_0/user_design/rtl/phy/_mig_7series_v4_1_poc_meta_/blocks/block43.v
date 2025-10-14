  function [TAPCNTRWIDTH-1:0] offset (input [TAPCNTRWIDTH-1:0] a, 
                                      input [1:0] b,
                                      input integer base);
    integer offset_ii;
    begin
      offset_ii = (a + b * NINETY) < base
                     ? (a + b * NINETY) 
                     : (a + b * NINETY - base);
      offset = offset_ii[TAPCNTRWIDTH-1:0];
    end
  endfunction 