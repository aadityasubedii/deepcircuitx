function integer alt_clogb2;
  input [31:0] value;
  integer i;
  begin
    alt_clogb2 = 32;
    for (i=31; i>0; i=i-1) begin
      if (2**i>=value)
        alt_clogb2 = i;
    end
  end
endfunction