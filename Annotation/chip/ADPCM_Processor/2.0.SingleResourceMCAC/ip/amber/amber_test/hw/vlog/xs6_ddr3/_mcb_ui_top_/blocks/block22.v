function [17:0] blso (
  input [17:0] a,
  input integer shift,
  input integer width
);
begin : func_blso
  integer i;
  integer w;
  integer s;
  w = width*3;
  s = (shift*3) % w;
  blso = 18'o000000;
  for (i = 0; i < w; i = i + 1) begin
    blso[i] = a[(i+w-s)%w];
    
  end
end
endfunction