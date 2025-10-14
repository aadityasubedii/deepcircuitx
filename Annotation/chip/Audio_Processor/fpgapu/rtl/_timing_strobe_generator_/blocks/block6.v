  function integer divide_round(input integer dividend, input integer divisor);
    divide_round = (dividend + (divisor / 2)) / divisor;
  endfunction