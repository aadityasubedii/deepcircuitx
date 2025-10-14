initial 
    begin
        
        clk = 0;
        reset_n = 0;
        #20 
        reset_n = 1;
        $display ($time ,"Starting Simulation of Lab 1.");
        #20000 
        reset_n = 0;
       
        #25000
            
        reset_n = 1; 
        
       
        #35000
            $display ($time ,"Work Done");

    end