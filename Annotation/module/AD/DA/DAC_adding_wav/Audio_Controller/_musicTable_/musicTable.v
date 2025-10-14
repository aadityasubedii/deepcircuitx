/******************************************************************************
 *                                                                            *
 * Module:       ascii_code_table                                             *
 * Description:                                                               *
 *      This module converts numbers for alphabet display.                    *
 *                                                                            *
 ******************************************************************************/

module sound_wave (
	// Inputs
  clock,
	alphabet,
  go,
	// Outputs
	sound
);
/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
	// Inputs
  input clock;
	input [7:0]alphabet;
  input go;
	// Outputs
	output [15:0]sound;

reg [1:0] frequency;
wire [15:0] wave;
parameter a     = 8'h1C;
parameter b     = 8'h32;
parameter c     = 8'h21;
parameter e     = 8'h24;
parameter o     = 8'h44;
parameter n     = 8'h31;
parameter t     = 8'h2C;

parameter two_hundred     = 0;
parameter four_hundred    = 1;
parameter eight_hundred   = 2;
parameter one_six_hundred = 3;

parameter a_frequency = two_hundred;
parameter b_frequency = four_hundred;
parameter c_frequency = eight_hundred;
parameter t_frequency = one_six_hundred;

assign sound = go? wave: 0;

always@(alphabet)
begin
  case(alphabet)
  a: frequency = a_frequency;
  b: frequency = b_frequency;
  c: frequency = c_frequency;
  t: frequency = t_frequency;
  default: frequency = a_frequency;
  endcase
end

sine_stepper // #(.data_size(xx)) 
(
  .clock(clock),
  .frequency(frequency), //200, 400, 800, 1600
  .step(step),
  .wave(wave)
);
endmodule