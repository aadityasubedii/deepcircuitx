  always @(*) begin
    po_wait_ns = po_wait_r;
    if (rst) po_wait_ns = {POW_WIDTH{1'b0}};
    else if (po_en_stg23_r) po_wait_ns = PO_WAIT[POW_WIDTH-1:0] - ONE[POW_WIDTH-1:0];
    else if (po_wait_r != {POW_WIDTH{1'b0}}) po_wait_ns = po_wait_r - ONE[POW_WIDTH-1:0];	   
  end