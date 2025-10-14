generate
if ( PO_DATA_CTL == "FALSE" ) begin : if_empty_null
    assign if_empty = 0;
    assign if_a_empty = 0;
    assign if_full = 0;
    assign if_a_full = 0;
end
else begin : if_empty_gen
    assign if_empty   = empty_post_fifo;
    assign if_a_empty = if_a_empty_;
    assign if_full    = if_full_;
    assign if_a_full  = if_a_full_;
end
endgenerate