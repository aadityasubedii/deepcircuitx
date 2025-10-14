    task addr_timing_check;
    input i;
    integer i;
    begin
        if (!ce_n && !adv_n_in && !oe_n && we_n && (by_n == {BY_BITS{1'b0}})) begin
            case (i)
                3: begin if ($realtime - tm_page_addr3 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr3 + tPC - $realtime); tm_page_addr3 <= $realtime; end
                2: begin if ($realtime - tm_page_addr2 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr2 + tPC - $realtime); tm_page_addr2 <= $realtime; end
                1: begin if ($realtime - tm_page_addr1 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr1 + tPC - $realtime); tm_page_addr1 <= $realtime; end
                0: begin if ($realtime - tm_page_addr0 < tPC) $display ("%t ERROR:   tPC violation on ADDR bit %d by %t", $realtime, i, tm_page_addr0 + tPC - $realtime); tm_page_addr0 <= $realtime; end
            endcase
        end
    end
    endtask