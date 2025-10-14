    initial begin
        $dumpfile("dsp.vcd");
        $dumpvars(0, tb);
        #500000 $finish;
    end