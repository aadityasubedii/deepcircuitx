    initial begin
        $dumpfile("dsp.vcd");
        $dumpvars(0, tb);
        #5000000 $finish;
    end