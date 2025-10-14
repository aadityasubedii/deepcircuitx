  generate

    if(TEMP_MON_CONTROL == "EXTERNAL") begin : user_supplied_temperature

      assign device_temp_lcl = device_temp_i;

    end else begin : xadc_supplied_temperature

      
      localparam nTEMPSAMP = cdiv(tTEMPSAMPLE, XADC_CLK_PERIOD);
      localparam nTEMPSAMP_CLKS = nTEMPSAMP;
      localparam nTEMPSAMP_CLKS_M6 = nTEMPSAMP - 6;
      localparam nTEMPSAMP_CNTR_WIDTH = clogb2(nTEMPSAMP_CLKS);

      
      localparam INIT_IDLE                                = 2'b00;
      localparam REQUEST_READ_TEMP                        = 2'b01;
      localparam WAIT_FOR_READ                            = 2'b10;
      localparam READ                                     = 2'b11;

      
      reg [nTEMPSAMP_CNTR_WIDTH-1:0]  sample_timer = {nTEMPSAMP_CNTR_WIDTH{1'b0}};
      reg                             sample_timer_en     = 1'b0;
      reg                             sample_timer_clr    = 1'b0;
      reg                             sample_en           = 1'b0;

      
      reg [2:0]                       tempmon_state       = INIT_IDLE;
      reg [2:0]                       tempmon_next_state  = INIT_IDLE;

      
      reg                             xadc_den            = 1'b0;
      wire                            xadc_drdy;
      wire  [15:0]                    xadc_do;
      reg                             xadc_drdy_r         = 1'b0;
      reg   [15:0]                    xadc_do_r           = 1'b0;

      
      reg   [11:0]                    temperature         = 12'b0;

      
      (* ASYNC_REG = "TRUE" *)  reg rst_r1;
      (* ASYNC_REG = "TRUE" *)  reg rst_r2;
                                                  
      