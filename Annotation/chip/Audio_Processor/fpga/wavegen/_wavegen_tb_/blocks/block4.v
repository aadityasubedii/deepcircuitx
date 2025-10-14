    initial begin
        $dumpfile("wavegen.vcd");
        $dumpvars(0, tb);
        #500000 $finish;
    end