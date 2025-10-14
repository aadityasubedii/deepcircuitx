`default_nettype none

module channel_4_note_sequencer #(
  parameter NOISE_TABLE_FILE = ""
) (
  input wire          i_clk,
  input wire          i_rst,
  input wire          i_tick_stb,
  input wire          i_note_stb,

  output wire [7:0]   o_top,
  output wire         o_top_valid,
  output wire [31:0]  o_phase_delta,
  output wire [8:0]   o_envelope
);

  `include "note_length_table.vh"

  reg [4:0] r_duration_count = 0;
  reg [4:0] r_note_index = 0;

  reg [1:0]  r_note = 0;
  reg [4:0]  r_note_len = 0;

  always @(posedge i_clk) begin
    if (i_rst) begin
      r_note_index <= 0;
      r_duration_count <= 0;
    end else if (i_note_stb) begin
      if (r_duration_count == r_note_len) begin
        r_duration_count <= 0;
        r_note_index <= r_note_index + 1;
        if (r_note_index == 5'd23) begin
          r_note_index <= 5'd0;
        end
      end else begin
        r_duration_count <= r_duration_count + 1;
      end
    end
  end
  wire r_new_note = i_note_stb & (r_duration_count == r_note_len);

  always @(*) begin
    case (r_note_index)
      5'd00: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd01: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd02: begin r_note = 2'd0;  r_note_len = note_len(30); end
      5'd03: begin r_note = 2'd0;  r_note_len = note_len(30); end

      5'd04: begin r_note = 2'd0;  r_note_len = note_len(22); end
      5'd05: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd06: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd07: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd08: begin r_note = 2'd1;  r_note_len = note_len(2); end

      5'd09: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd10: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd11: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd12: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd13: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd14: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd15: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd16: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd17: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd18: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd19: begin r_note = 2'd2;  r_note_len = note_len(2); end
      5'd20: begin r_note = 2'd3;  r_note_len = note_len(2); end

      5'd21: begin r_note = 2'd1;  r_note_len = note_len(2); end
      5'd22: begin r_note = 2'd3;  r_note_len = note_len(2); end
      5'd23: begin r_note = 2'd2;  r_note_len = note_len(2); end

      default: begin r_note = 2'd0;   r_note_len = note_len(30); end
    endcase
  end

  wire   [31:0]  r_phase_delta;
  rom_async #(
    .WIDTH(32),
    .DEPTH(4),
    .FILE(NOISE_TABLE_FILE)
  ) noise_table (
    .addr(r_note),
    .data(r_phase_delta)
  );
  assign o_phase_delta = r_phase_delta;

  reg [3:0] r_envelope_index = 0;
  always @(posedge i_clk) begin
    if (i_rst) begin
      r_envelope_index <= 0;
    end else if (r_new_note) begin
      r_envelope_index <= 0;
    end else if (i_tick_stb) begin
      if (r_envelope_index == 4'd9) begin
        r_envelope_index <= 4'd9;
      end else begin
        r_envelope_index <= r_envelope_index + 1;
      end
    end
  end

  reg [8:0] r_envelope = 0;
  always @(*) begin
    case (r_envelope_index)
      4'd00: r_envelope = 'd10*2;
      4'd01: r_envelope = 'd10*2;
      4'd02: r_envelope = 'd10*2;
      4'd03: r_envelope = 'd6*2;
      4'd04: r_envelope = 'd6*2;
      4'd05: r_envelope = 'd6*2;
      4'd06: r_envelope = 'd4*2;
      4'd07: r_envelope = 'd4*2;
      4'd08: r_envelope = 'd2*2;
      4'd09: r_envelope = 'd0;

      default: r_envelope = 0;
    endcase
  end

  assign o_envelope = r_envelope;

endmodule
