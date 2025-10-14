always @*
    begin
        crc_din = state_r == TX_0 ? mem[line_r+3][3:0] : 
                  state_r == TX_1 ? mem[line_r+3][7:4] :
                                   32'd0               ;
    end