    function integer get_rtt_wr;
    input [1:0] rtt;
    begin
        get_rtt_wr = RZQ/{rtt[0], rtt[1], 1'b0};
    end
    endfunction