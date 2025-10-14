    initial begin
        $dumpfile("correlator.vcd");
        $dumpvars(0, tb);
        #500000 $finish;
    end