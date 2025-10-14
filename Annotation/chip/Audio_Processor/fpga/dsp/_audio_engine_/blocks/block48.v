    parameter                ADDR = 8'h60;

    localparam ADDR_COEF   = ADDR;
    localparam ADDR_RESULT = ADDR + 8'h01;
    localparam ADDR_STATUS = ADDR + 8'h02;
    localparam ADDR_INPUT  = ADDR + 8'h04;
    localparam ADDR_DMA    = ADDR + 8'h05;