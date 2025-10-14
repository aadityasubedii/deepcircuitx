alt_vipvfr131_common_avalon_mm_slave
  #(.AV_ADDRESS_WIDTH (SLAVE_ADDRESS_REQUIREDWIDTH),
    .AV_DATA_WIDTH (SLAVE_DATA_REQUIREDWIDTH),
    .NO_OUTPUTS (1),
    .NO_INTERRUPTS (NO_INTERRUPTS),
    .NO_REGISTERS (NO_REGISTERS),
    .ALLOW_INTERNAL_WRITE (0))
avalon_mm_control_slave
  (
  	.rst (reset),
    .clk (clock),
    
    
    .av_address (control_av_address),
    .av_read (control_av_read),
    .av_readdata (control_av_readdata),
    .av_write (control_av_write),
    .av_writedata (control_av_writedata),
    .av_irq (control_av_irq),
    
    
    .enable (enable),
    .clear_enable (clear_enable), 
    .triggers (triggers),
    .registers (registers),
    .registers_in (registers_in),
    .registers_write (registers_write),
    .interrupts (interrupts),
    .stopped (stopped));	