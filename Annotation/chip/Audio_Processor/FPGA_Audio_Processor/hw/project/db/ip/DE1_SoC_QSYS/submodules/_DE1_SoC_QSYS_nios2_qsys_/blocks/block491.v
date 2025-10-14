  assign cfgrom_readdata = (MonAReg[4 : 2] == 3'd0)? 32'h04020020 :
    (MonAReg[4 : 2] == 3'd1)? 32'h00001b1b :
    (MonAReg[4 : 2] == 3'd2)? 32'h00040000 :
    (MonAReg[4 : 2] == 3'd3)? 32'h00000100 :
    (MonAReg[4 : 2] == 3'd4)? 32'h20000000 :
    (MonAReg[4 : 2] == 3'd5)? 32'h04020000 :
    (MonAReg[4 : 2] == 3'd6)? 32'h00000000 :
    32'h00000000;