function [3:0] numchars;
input [(5*8)-1:0] xINSTRUCTION_EXECUTE;
begin
     if (xINSTRUCTION_EXECUTE[31:0] == "    ")
    numchars = 4'd1;
else if (xINSTRUCTION_EXECUTE[23:0] == "   ")
    numchars = 4'd2;
else if (xINSTRUCTION_EXECUTE[15:0] == "  ")
    numchars = 4'd3;
else if (xINSTRUCTION_EXECUTE[7:0]  == " ")
    numchars = 4'd4;
else    
    numchars = 4'd5;
end
endfunction