module codec_avalon(
    clk                  ,
    reset                ,
    slave_read           ,
    slave_write          ,
    slave_address        ,
    slave_readdata       ,
    slave_writedata      ,
    slave_chipselect     ,
    slave_waitrequest    ,
    slave_beginbursttransfer,
    slave_burstcount     ,
    slave_irq            ,
    i2c_sclk             , 
    i2c_sdat             ,
    adcdat               ,
		m_clk                ,
		b_clk                ,
		dac_lr_clk           ,
		adc_lr_clk           , 
		dacdat               
    );
    
input           clk                 ; // Clock
input           reset               ; // Reset    
input           slave_read          ; // Read request signal. Acvtive high.
input           slave_write         ; // Write request signal. Active high.
input   [2:0]   slave_address       ; // Bus address.
output  [31:0]  slave_readdata      ; // Read bus.
input   [31:0]  slave_writedata     ; // Write bus.
input           slave_chipselect    ; // Chip select. Read and write operations are allowd when it is asserted. 
                                      // Active high.
output          slave_waitrequest   ;
input           slave_beginbursttransfer; // Indicates burst transfer. Active high.
input   [7:0]   slave_burstcount    ; // Number of transfers in a burst;
output          slave_irq           ;


inout           i2c_sdat            ;
input           adcdat              ;
output          i2c_sclk, m_clk, b_clk, dac_lr_clk, adc_lr_clk,	dacdat;       

wire    [23:0]  i2c_packet          ;
wire    [31:0]  adc_fifo_out        ;
wire    [31:0]  dac_fifo_in         ;
wire            i2c_idle            ;
wire            adc_fifo_full       ;
wire            dac_fifo_full       ;
wire            adc_fifo_empty      ;
wire            wr_i2c              ;
wire            rd_adc_fifo         ;
wire            wr_dac_fifo         ;

    codec_slave_interface I_codec_slave_interface(
    .Clk                  (clk),
    .Rst_n                (reset),
    .slave_read           (slave_read),
    .slave_write          (slave_write),
    .slave_address        (slave_address),
    .slave_readdata       (slave_readdata),
    .slave_writedata      (slave_writedata),
    .slave_chipselect     (slave_chipselect),
    .slave_waitrequest    (slave_waitrequest),
    .slave_beginbursttransfer (slave_beginbursttransfer),
    .slave_burstcount     (slave_burstcount),
    .slave_irq            (slave_irq),
    .adc_fifo_full        (adc_fifo_full),
    .dac_fifo_full        (dac_fifo_full),
    .i2c_idle             (i2c_idle),
    .adc_fifo_out         (adc_fifo_out),
    .i2c_packet           (i2c_packet),
    .dac_fifo_in          (dac_fifo_in),
    .adc_fifo_empty       (adc_fifo_empty),
    .wr_i2c               (wr_i2c),
    .wr_dac_fifo          (wr_dac_fifo),
    .rd_adc_fifo          (rd_adc_fifo)
    );
    
controlador I_controlador(
    .clk                  (clk),
    .reset                (reset),
    .i2c_sclk             (i2c_sclk),
    .i2c_sdat             (i2c_sdat),
    .adcdat               (adcdat),
	  .m_clk                (m_clk),
	  .b_clk                (b_clk), 
	  .dac_lr_clk           (dac_lr_clk), 
	  .adc_lr_clk           (adc_lr_clk), 
		.dacdat               (dacdat),
		.i2c_packet           (i2c_packet),
		.wr_i2c               (wr_i2c),
		.i2c_idle             (i2c_idle),
		.adc_fifo_out         (adc_fifo_out),
		.rd_adc_fifo          (rd_adc_fifo),
		.adc_fifo_empty       (adc_fifo_empty),
		.dac_fifo_in          (dac_fifo_in),
		.wr_dac_fifo          (wr_dac_fifo),
		.dac_fifo_full        (dac_fifo_full),
		.adc_fifo_full        (adc_fifo_full)   
		);
 
endmodule    