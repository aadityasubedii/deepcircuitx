always @*
        begin
        if ( test_status_set || testfail )
            begin
            if ( test_status_reg == 32'd17 && !testfail )
                begin
                display_registers;
                $display("++++++++++++++++++++");
                $write("Passed %s %0d ticks\n", `AMBER_TEST_NAME, `U_TB.clk_count);
                $display("++++++++++++++++++++");
                $fwrite(`U_TB.log_file,"Passed %s %0d ticks\n", `AMBER_TEST_NAME, `U_TB.clk_count);
                $finish;
                end
            else
                begin
                display_registers;
                if ( testfail )
                    begin
                    $display("++++++++++++++++++++");
                    $write("Failed %s\n", `AMBER_TEST_NAME);
                    $display("++++++++++++++++++++");
                    $fwrite(`U_TB.log_file,"Failed %s\n", `AMBER_TEST_NAME);
                    $finish;
                    end
                else
                    begin
                    $display("++++++++++++++++++++");
                    if (test_status_reg >= 32'h8000)
                        $write("Failed %s - with error 0x%08x\n", `AMBER_TEST_NAME, test_status_reg);
                    else
                        $write("Failed %s - with error on line %1d\n", `AMBER_TEST_NAME, test_status_reg);
                    $display("++++++++++++++++++++");
                    if (test_status_reg >= 32'h8000)
                        $fwrite(`U_TB.log_file,"Failed %s - with error 0x%08h\n", `AMBER_TEST_NAME, test_status_reg);
                    else
                        $fwrite(`U_TB.log_file,"Failed %s - with error on line %1d\n", `AMBER_TEST_NAME, test_status_reg);
                    $finish;
                    end
                end
            end
        end