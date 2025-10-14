module PS2_Demo
(
	// Inputs
	CLOCK_50,
	reset,
	SW,

	// Bidirectionals
	PS2_CLK,
	PS2_DAT,

	// Outputs
  go,
  code1,
  code2,
  code3,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	LEDG,
	LEDR
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/

// Inputs
input				CLOCK_50;
input		reset;
input		[17:0]SW;

// Bidirectionals
inout				PS2_CLK;
inout				PS2_DAT;

// Outputs
output 		go;
output reg[7:0]code1, code2, code3;
output		[6:0]	HEX0;
output		[6:0]	HEX1;
output		[6:0]	HEX2;
output		[6:0]	HEX3;
output		[6:0]	HEX4;
output		[6:0]	HEX5;
// output		[6:0]	HEX6;
// output		[6:0]	HEX7;
output 		[7:0] LEDG;
output		[17:0]LEDR;

// assign LEDR = SW;
/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire		[7:0]	ps2_key_data;
wire				ps2_key_pressed;
wire				change;
// Internal Registers
reg     [7:0]	last_data_received;
reg     [7:0] new_keycode;
reg     [7:0] scan_code;
reg     [3:0] text_to_output;
reg     ps2_key_released, readable;
// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


always @(posedge CLOCK_50) //posedge CLOCK_50,
begin
  new_keycode <= ps2_key_data;
  last_data_received <= new_keycode;
  if(change)
  begin
    if(last_data_received == 8'hF0)
    begin
      scan_code = new_keycode;
      LEDG = 1;
      ps2_key_released = 1;
    end
    else
    begin
      LEDG = 8'hFF;
      ps2_key_released = 0;
    end
  end
  else
  begin
    ps2_key_released = 0;
  end
end


assign change = (last_data_received != new_keycode)? 1:0;

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


parameter enter = 8'h5A;
parameter a     = 8'h1C;
parameter b     = 8'h32;
parameter c     = 8'h21;
parameter e     = 8'h24;
parameter o     = 8'h44;
parameter n     = 8'h31;
parameter t     = 8'h2C;

parameter off_display = 8'h0;
parameter a_display = 8'h1C;
parameter b_display = 8'h32;
parameter c_display = 8'h21;
parameter e_display = 8'h24;
parameter o_display = 8'h44;
parameter n_display = 8'h31;
parameter t_display = 8'h2C;

parameter wait_Enter = 3'b0, alpha_1 = 3'b01, alpha_2 = 3'b10, alpha_3 = 3'b11, enter_pressed = 3'b100;
reg [2:0]state, n_state;

reg clear, display, complete_key_in;
reg [2:0]counter;
reg [8:0]text;

reg [7:0] code_out1, code_out2, code_out3;
// wire reset = !KEY[0];

always@(posedge ps2_key_released, posedge reset)
	if(reset)
		state <= alpha_1;
	else
		state <= n_state;
    
assign LEDR[0] =  ps2_key_pressed;
assign LEDR[1] =  ps2_key_released;
assign go = complete_key_in;

always@(scan_code)
begin
	case(state)
  wait_Enter: if(scan_code != enter) n_state = alpha_1; else n_state = enter_pressed;
  alpha_1   :begin
                if(scan_code != enter) n_state = alpha_2; else n_state = enter_pressed;
             end
  alpha_2   :begin
                if(scan_code != enter) n_state = alpha_3; else n_state = enter_pressed;
             end
  alpha_3   :begin
                if(scan_code != enter) n_state = wait_Enter; else n_state = enter_pressed;
             end
  enter_pressed: n_state = alpha_1;
  default :     n_state = wait_Enter;
  endcase
end
assign LEDR[17:15] = state;

always@(state)
begin
  case(state)
  wait_Enter: begin code1 = off_display; code2 = off_display; code3 = off_display; 
                    complete_key_in = 0;
                    end
  alpha_1   : begin code3 = scan_code; code_out3 = scan_code;
                    code2 = off_display; code_out2 = code_out2;
                    code1 = off_display; code_out1 = code_out1;
                    complete_key_in = 0; end
  alpha_2   : begin code3 = off_display;  code_out2= scan_code;  
                        code2 = scan_code; code_out1 = code_out1;  
                        code1 = off_display; code_out3 = code_out3;
                        complete_key_in = 0; end
  alpha_3   : begin code3 = off_display; code_out1= scan_code;   
                    code2 = off_display;  code_out2 = code_out2;
                    code1 = scan_code; code_out3 = code_out3;
                    complete_key_in = 0; end
  enter_pressed:  begin complete_key_in = 1; 
                        code1 = code_out1;
                        code2 = code_out2;
                        code3 = code_out3;
                        end
  endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

PS2_Controller PS2 (
	// Inputs
	.CLOCK_50			(CLOCK_50),
	.reset				(reset),

	// Bidirectionals
	.PS2_CLK			(PS2_CLK),
 	.PS2_DAT			(PS2_DAT),

	// Outputs
	.received_data		(ps2_key_data),
	.received_data_en	(ps2_key_pressed)
);

alphabet_to_seven_segments seg0 (
	.number(code1),

	.seven_seg_display(HEX0)
);

alphabet_to_seven_segments seg1 (
	.number(code2),

	.seven_seg_display(HEX1)
);

alphabet_to_seven_segments seg2 (
	.number(code3),

	.seven_seg_display(HEX2)
);

alphabet_to_seven_segments seg3 (
	.number(scan_code),

	.seven_seg_display(HEX3)
);

Go_to_seven_segments Go_to_seven_segments
(
  .go(complete_key_in),
  .seven_seg_display(HEX5),
  .seven_seg_display1(HEX4)
);
endmodule



