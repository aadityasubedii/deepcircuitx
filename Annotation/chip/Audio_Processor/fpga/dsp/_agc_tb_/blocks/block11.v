    function [23:0] get_mic(input [1:0] addr);
        begin
            case (addr)
                0   :   get_mic = mic_0;
                1   :   get_mic = mic_1;
                2   :   get_mic = mic_2;
                3   :   get_mic = mic_3;
            endcase
        end
    endfunction