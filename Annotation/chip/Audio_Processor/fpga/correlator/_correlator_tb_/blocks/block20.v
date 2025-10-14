    always @(posedge ck) begin
        if (en) begin
            if (start) begin
                raddr <= start_addr;
                ren <= 1;
                done <= 0;
                counter <= count;
            end else begin
                if (counter > 1) begin
                    counter <= counter - 1;
                    raddr <= raddr + 1;
                end else begin
                    if (ren)
                        done <= 1;
                    ren <= 0;
                    raddr <= 0;
                end
            end
        end
    end