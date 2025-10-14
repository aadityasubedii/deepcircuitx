    function [15:0] twosc(input signed [15:0] a);

        begin
            return a[15] ? (1 + ~a) : a;
        end

    endfunction