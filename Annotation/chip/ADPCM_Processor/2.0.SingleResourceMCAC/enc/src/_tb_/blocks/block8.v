dumpvcd u_dumpvcd();




`ifdef AMBER_A25_CORE
    `include "a25_localparams.vh"
    `include "a25_functions.vh"
`else
    `include "a23_localparams.vh"
    `include "a23_functions.vh"
`endif

reg             testfail;
wire            test_status_set;
wire [31:0]     test_status_reg;
