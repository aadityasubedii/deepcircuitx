function [7:0] Mult_Divide;
input   [7:0]   Input;
input   [7:0]   Mult;
input   [7:0]   Div;
reg     [3:0]   count;
reg     [15:0]   Result;
begin
  Result  = 0;
  for (count = 0; count < Mult; count = count+1) begin
    Result    = Result + Input;
  end
  Result      = Result / Div;
  Mult_Divide = Result[7:0];
end
endfunction