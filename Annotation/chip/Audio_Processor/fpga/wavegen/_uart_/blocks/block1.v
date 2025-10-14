    assign tx = shift[0];
    assign ready = count == 0;
    assign baud = baud_counter >= 50;