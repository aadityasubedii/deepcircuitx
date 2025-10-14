    always @(posedge clk or posedge reset) begin
        if (reset) begin
            o_serial_ready <= 1'b1;
        end else if (o_serial_valid && o_serial_ready) begin
            $write("Outlet: is_left = %d / audio = %08h\n",  o_serial_is_left, o_serial_audio);
            outlet_count += 2;
        end
    end