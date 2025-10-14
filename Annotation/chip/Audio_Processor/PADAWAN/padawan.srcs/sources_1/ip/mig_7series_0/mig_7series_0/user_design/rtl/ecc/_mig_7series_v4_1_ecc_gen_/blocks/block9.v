  function integer combos (input integer n, k);
    combos = factorial(n)/(factorial(k)*factorial(n-k));
  endfunction 