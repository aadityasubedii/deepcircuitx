    initial begin

        @(posedge ck);
        @(posedge ck);

        gain_gain <= 16'hffff;

        in_0 <= 24'h111111;
        in_1 <= 24'h222222;
        in_2 <= 24'h444444;
        in_3 <= 24'h123456;
        gain_run();

        $display("%x", calc(in_0, gain_gain));

        
        
        
        

        gain_gain <= 16'hffff;

        in_0 <= 24'h111111;
        in_1 <= 24'h222222;
        in_2 <= 24'h444444;
        in_3 <= 24'h888888;
        gain_run();

    end