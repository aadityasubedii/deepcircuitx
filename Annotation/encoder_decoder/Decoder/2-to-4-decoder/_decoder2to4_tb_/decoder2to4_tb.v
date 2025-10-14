module decoder2to4_tb;
  reg a, b, en;
  wire i0, i1, i2, i3;

  decoder2to4 dut (
    .a(a),
    .b(b),
    .en(en),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3)
  );

  initial begin
    // Test case 1
    a = 0;
    b = 0;
    en = 0;
    #10; // Wait for 10 time units
    if (i0 || i1 || i2 || i3) $display("Test case 1 failed!");

    // Test case 2
    a = 0;
    b = 0;
    en = 1;
    #10;
    if (!i0 || i1 || i2 || i3) $display("Test case 2 failed!");

    // Test case 3
    a = 0;
    b = 1;
    en = 0;
    #10;
    if (i0 || !i1 || i2 || i3) $display("Test case 3 failed!");

    // Test case 4
    a = 0;
    b = 1;
    en = 1;
    #10;
    if (i0 || !i1 || i2 || i3) $display("Test case 4 failed!");

    // Test case 5
    a = 1;
    b = 0;
    en = 0;
    #10;
    if (i0 || i1 || !i2 || i3) $display("Test case 5 failed!");

    // Test case 6
    a = 1;
    b = 0;
    en = 1;
    #10;
    if (i0 || i1 || !i2 || i3) $display("Test case 6 failed!");

    // Test case 7
    a = 1;
    b = 1;
    en = 0;
    #10;
    if (i0 || i1 || i2 || !i3) $display("Test case 7 failed!");

    // Test case 8
    a = 1;
    b = 1;
    en = 1;
    #10;
    if (i0 || i1 || i2 || !i3) $display("Test case 8 failed!");

    $display("All test cases passed!");
    $finish;
  end
endmodule
