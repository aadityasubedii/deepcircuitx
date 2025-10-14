    function [15:0] get_source(input [2:0] chan,
        input [15:0] s0,
        input [15:0] s1,
        input [15:0] s2,
        input [15:0] s3,
        input [15:0] s4,
        input [15:0] s5,
        input [15:0] s6,
        input [15:0] s7
    );
 
        begin
            case (chan)
                0   :   get_source = s0;
                1   :   get_source = s1;
                2   :   get_source = s2;
                3   :   get_source = s3;
                4   :   get_source = s4;
                5   :   get_source = s5;
                6   :   get_source = s6;
                7   :   get_source = s7;
            endcase
        end

    endfunction