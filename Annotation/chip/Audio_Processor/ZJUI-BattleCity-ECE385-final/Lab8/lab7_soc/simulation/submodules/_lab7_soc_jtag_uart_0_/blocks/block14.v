reg     [ 31: 0] bytes_left;
wire             fifo_EF;
reg              fifo_rd_d;
wire    [  7: 0] fifo_rdata;
wire             new_rom;
wire    [ 31: 0] num_bytes;
wire    [  6: 0] rfifo_entries;
wire             rfifo_full;
wire    [  5: 0] rfifo_used;
