    function integer get_rtt_nom;
    input [2:0] rtt;
    begin
        case (rtt)
            1: get_rtt_nom = RZQ/4;
            2: get_rtt_nom = RZQ/2;
            3: get_rtt_nom = RZQ/6;
            4: get_rtt_nom = RZQ/12;
            5: get_rtt_nom = RZQ/8;
            default : get_rtt_nom = 0;
        endcase
    end
    endfunction