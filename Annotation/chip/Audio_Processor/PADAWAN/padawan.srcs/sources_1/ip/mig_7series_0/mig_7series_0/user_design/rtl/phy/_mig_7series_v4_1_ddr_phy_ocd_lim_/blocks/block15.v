  function [TAPCNTRWIDTH:0] mod_sub (input [TAPCNTRWIDTH-1:0] a, 
                                     input [TAPCNTRWIDTH-1:0] b, 
                                     input integer base); 
  begin
    mod_sub = (a>=b) ? a-b : a+base[TAPCNTRWIDTH-1:0]-b;
  end
  endfunction 