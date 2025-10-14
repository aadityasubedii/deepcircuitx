module sine_stepper // #(.data_size(xx)) 
(
  input clock,
  input [1:0]frequency, //200, 400, 800, 1600
  output wire [5:0]step,
  output wire [15:0]wave
);
parameter two_hundred     = 0;
parameter four_hundred    = 1;
parameter eight_hundred   = 2;
parameter one_six_hundred = 3;

reg [21:0]clock_divide;
reg [5:0] step_counter;
always @(posedge clock)
begin
  case(frequency)
  two_hundred     : begin if(clock_divide >= 25000) begin clock_divide <= 0; step_counter<= step_counter + 1; end
                          else begin clock_divide <= clock_divide + 1; end
                    end
  four_hundred    : begin if(clock_divide >= 12500) begin clock_divide <= 0; step_counter<= step_counter + 1; end 
                          else begin clock_divide <= clock_divide + 1; end
                    end
  eight_hundred   : begin if(clock_divide >= 6250)  begin clock_divide <= 0; step_counter<= step_counter + 1; end 
                          else begin clock_divide <= clock_divide + 1; end
                    end
  one_six_hundred : begin if(clock_divide >= 3125)  begin clock_divide <= 0; step_counter<= step_counter + 1; end 
                          else begin clock_divide <= clock_divide + 1; end
                    end
  default: begin clock_divide <=0; step_counter <=0; end
  endcase
  
end


sine_LUT 
(
  .step_counter(step_counter),
  .wave(wave)
);
endmodule