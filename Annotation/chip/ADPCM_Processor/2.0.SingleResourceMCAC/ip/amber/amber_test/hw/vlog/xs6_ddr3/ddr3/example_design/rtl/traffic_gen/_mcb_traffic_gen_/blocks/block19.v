generate
if (SIMULATION == "TRUE") begin: cmd_check
reg fifo_error;
wire [31:0] xfer_addr;
wire cmd_fifo_rd;

assign cmd_fifo_wr =  flow2cmd_rdy & cmd2flow_valid;
