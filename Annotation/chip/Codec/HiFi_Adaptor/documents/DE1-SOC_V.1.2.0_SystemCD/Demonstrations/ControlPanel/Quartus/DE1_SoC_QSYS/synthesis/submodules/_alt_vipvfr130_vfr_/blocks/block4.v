alt_vipvfr130_vfr_controller #(
  .CONTROL_PACKET_RESOLUTION_REQUIREDWIDTH(CONTROL_PACKET_RESOLUTION_REQUIREDWIDTH),
  .CONTROL_PACKET_INTERLACED_REQUIREDWIDTH(CONTROL_PACKET_INTERLACED_REQUIREDWIDTH),
  .PACKET_ADDRESS_WIDTH(32),
  .PACKET_SAMPLES_WIDTH(32),
  .PACKET_WORDS_WIDTH(32))
  controller(
		.clock(clock),
		.reset(reset),
    
    .master_address(master_address_FROM_controller_TO_prc),
    .master_write(master_write_FROM_controller_TO_prc),
    .master_writedata(master_writedata_FROM_controller_TO_prc),
		.master_interrupt_recieve(slave_irq_FROM_prc_TO_controller),
    
    .go_bit(go_bit_FROM_slave_TO_controller),
    .running(status_bit_zero_FROM_controller_TO_slave),
    .frame_complete(irq_FROM_controller_TO_slave),    
    .next_bank(next_bank_FROM_slave_TO_controller),
    
    .ctrl_packet_width_bank0(ctrl_packet_width_bank0_bits_FROM_slave_TO_controller),
    .ctrl_packet_height_bank0(ctrl_packet_height_bank0_bits_FROM_slave_TO_controller),
    .ctrl_packet_interlaced_bank0(ctrl_packet_interlaced_bank0_bits_FROM_slave_TO_controller),
    
    .vid_packet_base_address_bank0(vid_packet_base_address_bank0_bits_FROM_slave_TO_controller),
    .vid_packet_samples_bank0(vid_packet_samples_bank0_bits_FROM_slave_TO_controller),
    .vid_packet_words_bank0(vid_packet_words_bank0_bits_FROM_slave_TO_controller),
    
    .ctrl_packet_width_bank1(ctrl_packet_width_bank1_bits_FROM_slave_TO_controller),
    .ctrl_packet_height_bank1(ctrl_packet_height_bank1_bits_FROM_slave_TO_controller),
    .ctrl_packet_interlaced_bank1(ctrl_packet_interlaced_bank1_bits_FROM_slave_TO_controller),
    
    .vid_packet_base_address_bank1(vid_packet_base_address_bank1_bits_FROM_slave_TO_controller),
    .vid_packet_samples_bank1(vid_packet_samples_bank1_bits_FROM_slave_TO_controller),
    .vid_packet_words_bank1(vid_packet_words_bank1_bits_FROM_slave_TO_controller),
    
    .width_of_next_vid_packet(width_FROM_controller_TO_encoder),
    .height_of_next_vid_packet(height_FROM_controller_TO_encoder),
    .interlaced_of_next_vid_packet(interlaced_FROM_controller_TO_encoder),
    .do_control_packet(do_control_packet_FROM_controller_TO_encoder)
  );