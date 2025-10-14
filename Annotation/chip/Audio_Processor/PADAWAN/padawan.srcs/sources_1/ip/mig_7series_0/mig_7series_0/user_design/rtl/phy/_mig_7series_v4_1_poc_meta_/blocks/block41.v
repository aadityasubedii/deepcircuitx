  function [TAPCNTRWIDTH:0] center (input [TAPCNTRWIDTH-1:0] left, 
                                    input [TAPCNTRWIDTH-1:0] diff,
                                    input integer base);
    integer center_ii;
    begin
      center_ii = ({left, 1'b0} + diff < base * 2)
                    ? {left, 1'b0} + diff + 32'h0
	            : {left, 1'b0} + diff - base * 2;
      center = center_ii[TAPCNTRWIDTH:0];
    end
  endfunction 