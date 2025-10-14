  function integer factorial (input integer i);
    integer index;
    if (i == 1) factorial = 1;
    else begin
      factorial = 1;
      for (index=2; index<=i; index=index+1)
        factorial = factorial * index;
    end
  endfunction 