function integer alt_vipfunc_required_width;
  input [511:0] value;
  integer i;
  begin
    alt_vipfunc_required_width = 512;
    for (i=512; i>0; i=i-1) begin
      if (2**i>value)
        alt_vipfunc_required_width = i;
    end
  end
endfunction