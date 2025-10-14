    assign enable = valid && !ready && (addr[31:16] == ADDR);

    wire write;
    assign write = | wstrb;
    assign we = enable && write; 