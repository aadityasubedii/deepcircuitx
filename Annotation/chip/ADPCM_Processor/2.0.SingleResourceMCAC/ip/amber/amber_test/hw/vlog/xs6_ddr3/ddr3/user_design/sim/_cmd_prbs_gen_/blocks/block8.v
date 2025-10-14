function integer logb2;
  input [31:0] in;
  integer i;
  begin
    i = in;
      for(logb2=1; i>0; logb2=logb2+1)
        i = i >> 1;
  end
endfunction