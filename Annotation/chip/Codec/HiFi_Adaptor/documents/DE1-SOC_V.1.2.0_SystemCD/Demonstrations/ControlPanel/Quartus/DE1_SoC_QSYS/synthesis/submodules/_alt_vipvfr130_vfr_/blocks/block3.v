alt_vipvfr130_common_avalon_mm_slave
  #(
    
    .AV_ADDRESS_WIDTH (SLAVE_ADDRESS_REQUIREDWIDTH),
    
    .AV_DATA_WIDTH (SLAVE_DATA_REQUIREDWIDTH),
    
    .NO_OUTPUTS (1),    
    
    
    .NO_INTERRUPTS (1),
    
    
    
    
    .NO_REGISTERS (NO_REGISTERS),
    .ALLOW_INTERNAL_WRITE (0))
slave
  (
  	.rst (reset),
    .clk (clock),
    
    
    .av_address (slave_address),
    .av_read (slave_read),
    .av_readdata (slave_readdata),
    .av_write (slave_write),
    .av_writedata (slave_writedata),
    .av_irq (slave_irq),
    
    
    .enable (go_bit_FROM_slave_TO_controller),
    .clear_enable (1'b0), 
    .triggers (triggers),
    .registers (registers),
    .registers_in (registers_in),
    .registers_write (registers_write),
    .interrupts (irq_FROM_controller_TO_slave),
    .stopped (status_bit_zero_FROM_controller_TO_slave)
  );   