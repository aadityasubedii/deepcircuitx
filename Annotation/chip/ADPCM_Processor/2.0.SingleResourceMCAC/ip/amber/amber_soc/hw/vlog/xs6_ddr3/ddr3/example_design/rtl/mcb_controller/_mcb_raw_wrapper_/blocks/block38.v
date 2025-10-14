        initial
        begin
           wait_200us_counter = 16'hFFFF;
           $display("The 200 us wait period required before CKE goes active has been skipped in Simulation\n");
        end       