  always @(*) begin
    po_setup_ns = po_setup_r;
    if (rst) po_setup_ns = 2'b00;
    else if (setup_po) po_setup_ns = 2'b11;
    else if (|po_setup_r) po_setup_ns = po_setup_r - 2'b01;
  end