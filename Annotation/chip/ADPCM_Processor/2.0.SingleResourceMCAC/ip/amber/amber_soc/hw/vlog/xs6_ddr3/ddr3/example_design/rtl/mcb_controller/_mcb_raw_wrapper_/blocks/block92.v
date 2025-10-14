  function integer cdiv (input integer num,
                         input integer div); 
    begin
      cdiv = (num/div) + (((num%div)>0) ? 1 : 0);
    end
  endfunction 