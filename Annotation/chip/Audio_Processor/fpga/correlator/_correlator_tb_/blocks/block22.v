module corr_fetch
    #(parameter ADDR_W=8, parameter COUNT_W=4)
   (input wire ck,
    input wire en,
    input wire start,
    input wire [(COUNT_W-1):0] count,
    input wire [(ADDR_W-1):0] start_addr,
    output reg [(ADDR_W-1):0] raddr,
    output reg ren,
    output reg done
);