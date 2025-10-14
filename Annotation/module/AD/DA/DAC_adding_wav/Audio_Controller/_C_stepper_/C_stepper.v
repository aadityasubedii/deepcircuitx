module C_wave // #(.data_size(xx)) 
(
  input dac_lrclk,
  // output wire [5:0]step,
  output wire [15:0]wave
);

reg [11:0] step_counter;

always @(posedge dac_lrclk)
begin
  step_counter <= step_counter + 1;
end


C_LUT waveC
(
  .step_counter(step_counter),
  .wave(wave)
);
endmodule