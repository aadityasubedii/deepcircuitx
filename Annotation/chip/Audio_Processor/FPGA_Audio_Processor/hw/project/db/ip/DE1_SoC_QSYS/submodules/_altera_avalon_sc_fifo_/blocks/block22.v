    generate if (USE_FILL_LEVEL) begin : gen_blk16
        wire [31:0] depth32;
        assign depth32 = DEPTH;

        if (USE_STORE_FORWARD) begin

            reg [ADDR_WIDTH : 0] curr_packet_len_less_one;
            
            
            
            
            
            