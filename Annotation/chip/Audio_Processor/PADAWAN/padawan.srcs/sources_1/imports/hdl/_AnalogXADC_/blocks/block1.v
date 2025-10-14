    always @(posedge(CLK100MHZ))
    begin
        if(ready == 1'b1)
        begin
            aux_data <= data_o[15:5];
        end
        CLK_AUDIO <= ready;  
    end