    function [15:0] mic_source(input [(CHAN_W-1):0] chan);
 
        begin
            mic_source = get_source(chan,
                mic_0[MIC_HI:MIC_LO],
                mic_1[MIC_HI:MIC_LO],
                mic_2[MIC_HI:MIC_LO],
                mic_3[MIC_HI:MIC_LO],
                mic_4[MIC_HI:MIC_LO],
                mic_5[MIC_HI:MIC_LO],
                mic_6[MIC_HI:MIC_LO],
                mic_7[MIC_HI:MIC_LO]
            );
        end

    endfunction