// Randsack digital top.
//
// SPDX-FileCopyrightText: (c) 2021 Harrison Pham <harrison@harrisonpham.com>
// SPDX-License-Identifier: Apache-2.0
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module digitalcore_macro (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif

  // Wishbone Slave ports (WB MI A)
  input wb_clk_i,
  input wb_rst_i,
  input wbs_stb_i,
  input wbs_cyc_i,
  input wbs_we_i,
  input [3:0] wbs_sel_i,
  input [31:0] wbs_dat_i,
  input [31:0] wbs_adr_i,
  output wbs_ack_o,
  output [31:0] wbs_dat_o,

  // Logic Analyzer Signals
  input  [127:0] la_data_in,
  output [127:0] la_data_out,
  input  [127:0] la_oenb,

  // IOs
  input  [`MPRJ_IO_PADS-1:0] io_in,
  output [`MPRJ_IO_PADS-1:0] io_out,
  output [`MPRJ_IO_PADS-1:0] io_oeb,

  // IRQ
  output [2:0] irq,

  // ring0 collapsering macro
  input ring0_clk,
  output ring0_start,
  output [27:0] ring0_trim_a,
  output [27:0] ring0_trim_b,
  output [2:0] ring0_clkmux,

  // ring1 collapsering macro
  input ring1_clk,
  output ring1_start,
  output [25:0] ring1_trim_a,
  output [2:0] ring1_clkmux
);

  // Filter wishbone accesses from Caravel.
  parameter DTOP_MASK    = 32'hff00_0000;
  parameter DTOP_ADDR    = 32'h3000_0000;

  // Peripherals.
  parameter GPIO0_ADDR_MASK   = 32'hffff_0000;
  parameter GPIO0_BASE_ADDR   = 32'h3080_0000;
  parameter PWM0_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM0_BASE_ADDR    = 32'h3081_0000;
  parameter PWM1_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM1_BASE_ADDR    = 32'h3081_0100;
  parameter PWM2_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM2_BASE_ADDR    = 32'h3081_0200;
  parameter PWM3_ADDR_MASK    = 32'hffff_ff00;
  parameter PWM3_BASE_ADDR    = 32'h3081_0300;
  parameter UART0_ADDR_MASK   = 32'hffff_0000;
  parameter UART0_BASE_ADDR   = 32'h3082_0000;
  parameter RING0_ADDR_MASK   = 32'hffff_ff00;
  parameter RING0_BASE_ADDR   = 32'h3083_0000;
  parameter RING1_ADDR_MASK   = 32'hffff_ff00;
  parameter RING1_BASE_ADDR   = 32'h3083_0100;

  // Filter addresses from Caravel since we want to be absolutely sure it is
  // selecting us before letting it access the arbiter.  This is mostly needed
  // because the wb_intercon.v implementation in Caravel doesn't corrently
  // filter the wb_cyc_i signal to slaves.
  wire wbs_addr_sel;
  assign wbs_addr_sel = (wbs_adr_i & DTOP_MASK) == DTOP_ADDR;

  wb_mux_8 interconnect (
    .wbm_adr_i(wbs_adr_i),
    .wbm_dat_i(wbs_dat_i),
    .wbm_dat_o(wbs_dat_o),
    .wbm_we_i(wbs_we_i & wbs_addr_sel),
    .wbm_sel_i(wbs_sel_i),
    .wbm_stb_i(wbs_stb_i & wbs_addr_sel),
    .wbm_ack_o(wbs_ack_o),
    .wbm_err_o(),
    .wbm_rty_o(),
    .wbm_cyc_i(wbs_cyc_i & wbs_addr_sel),

    .wbs0_adr_o(gpio_adr_i),
    .wbs0_dat_i(gpio_dat_o),
    .wbs0_dat_o(gpio_dat_i),
    .wbs0_we_o(gpio_we_i),
    .wbs0_sel_o(gpio_sel_i),
    .wbs0_stb_o(gpio_stb_i),
    .wbs0_ack_i(gpio_ack_o),
    .wbs0_err_i(1'b0),
    .wbs0_rty_i(1'b0),
    .wbs0_cyc_o(gpio_cyc_i),
    .wbs0_addr(GPIO0_BASE_ADDR),
    .wbs0_addr_msk(GPIO0_ADDR_MASK),

    .wbs1_adr_o(pwm_adr_i[0]),
    .wbs1_dat_i(pwm_dat_o[0]),
    .wbs1_dat_o(pwm_dat_i[0]),
    .wbs1_we_o(pwm_we_i[0]),
    .wbs1_sel_o(pwm_sel_i[0]),
    .wbs1_stb_o(pwm_stb_i[0]),
    .wbs1_ack_i(pwm_ack_o[0]),
    .wbs1_err_i(1'b0),
    .wbs1_rty_i(1'b0),
    .wbs1_cyc_o(pwm_cyc_i[0]),
    .wbs1_addr(PWM0_BASE_ADDR),
    .wbs1_addr_msk(PWM0_ADDR_MASK),

    .wbs2_adr_o(pwm_adr_i[1]),
    .wbs2_dat_i(pwm_dat_o[1]),
    .wbs2_dat_o(pwm_dat_i[1]),
    .wbs2_we_o(pwm_we_i[1]),
    .wbs2_sel_o(pwm_sel_i[1]),
    .wbs2_stb_o(pwm_stb_i[1]),
    .wbs2_ack_i(pwm_ack_o[1]),
    .wbs2_err_i(1'b0),
    .wbs2_rty_i(1'b0),
    .wbs2_cyc_o(pwm_cyc_i[1]),
    .wbs2_addr(PWM1_BASE_ADDR),
    .wbs2_addr_msk(PWM1_ADDR_MASK),

    .wbs3_adr_o(pwm_adr_i[2]),
    .wbs3_dat_i(pwm_dat_o[2]),
    .wbs3_dat_o(pwm_dat_i[2]),
    .wbs3_we_o(pwm_we_i[2]),
    .wbs3_sel_o(pwm_sel_i[2]),
    .wbs3_stb_o(pwm_stb_i[2]),
    .wbs3_ack_i(pwm_ack_o[2]),
    .wbs3_err_i(1'b0),
    .wbs3_rty_i(1'b0),
    .wbs3_cyc_o(pwm_cyc_i[2]),
    .wbs3_addr(PWM2_BASE_ADDR),
    .wbs3_addr_msk(PWM2_ADDR_MASK),

    .wbs4_adr_o(pwm_adr_i[3]),
    .wbs4_dat_i(pwm_dat_o[3]),
    .wbs4_dat_o(pwm_dat_i[3]),
    .wbs4_we_o(pwm_we_i[3]),
    .wbs4_sel_o(pwm_sel_i[3]),
    .wbs4_stb_o(pwm_stb_i[3]),
    .wbs4_ack_i(pwm_ack_o[3]),
    .wbs4_err_i(1'b0),
    .wbs4_rty_i(1'b0),
    .wbs4_cyc_o(pwm_cyc_i[3]),
    .wbs4_addr(PWM3_BASE_ADDR),
    .wbs4_addr_msk(PWM3_ADDR_MASK),

    .wbs5_adr_o(uart_adr_i),
    .wbs5_dat_i(uart_dat_o),
    .wbs5_dat_o(uart_dat_i),
    .wbs5_we_o(uart_we_i),
    .wbs5_sel_o(uart_sel_i),
    .wbs5_stb_o(uart_stb_i),
    .wbs5_ack_i(uart_ack_o),
    .wbs5_err_i(1'b0),
    .wbs5_rty_i(1'b0),
    .wbs5_cyc_o(uart_cyc_i),
    .wbs5_addr(UART0_BASE_ADDR),
    .wbs5_addr_msk(UART0_ADDR_MASK),

    .wbs6_adr_o(ring0_adr_i),
    .wbs6_dat_i(ring0_dat_o),
    .wbs6_dat_o(ring0_dat_i),
    .wbs6_we_o(ring0_we_i),
    .wbs6_sel_o(ring0_sel_i),
    .wbs6_stb_o(ring0_stb_i),
    .wbs6_ack_i(ring0_ack_o),
    .wbs6_err_i(1'b0),
    .wbs6_rty_i(1'b0),
    .wbs6_cyc_o(ring0_cyc_i),
    .wbs6_addr(RING0_BASE_ADDR),
    .wbs6_addr_msk(RING0_ADDR_MASK),

    .wbs7_adr_o(ring1_adr_i),
    .wbs7_dat_i(ring1_dat_o),
    .wbs7_dat_o(ring1_dat_i),
    .wbs7_we_o(ring1_we_i),
    .wbs7_sel_o(ring1_sel_i),
    .wbs7_stb_o(ring1_stb_i),
    .wbs7_ack_i(ring1_ack_o),
    .wbs7_err_i(1'b0),
    .wbs7_rty_i(1'b0),
    .wbs7_cyc_o(ring1_cyc_i),
    .wbs7_addr(RING1_BASE_ADDR),
    .wbs7_addr_msk(RING1_ADDR_MASK)
  );

  // GPIO signals.
  wire [31:0] gpio_adr_i;
  wire [31:0] gpio_dat_i;
  wire [3:0] gpio_sel_i;
  wire gpio_we_i;
  wire gpio_cyc_i;
  wire gpio_stb_i;
  wire gpio_ack_o;
  wire [31:0] gpio_dat_o;

  wire [31:0] gpio_in;
  wire [31:0] gpio_out;
  wire [31:0] gpio_oeb;

  gpio32_wb gpio0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_dat_i(gpio_dat_i),
    .wb_adr_i(gpio_adr_i),
    .wb_sel_i(gpio_sel_i),
    .wb_cyc_i(gpio_cyc_i),
    .wb_stb_i(gpio_stb_i),
    .wb_we_i(gpio_we_i),

    .wb_dat_o(gpio_dat_o),
    .wb_ack_o(gpio_ack_o),

    .gpio_in(gpio_in),
    .gpio_out(gpio_out),
    .gpio_oeb(gpio_oeb)
  );

  // PWM controllers.
  wire [31:0] pwm_adr_i[4];
  wire [31:0] pwm_dat_i[4];
  wire [3:0] pwm_sel_i[4];
  wire pwm_we_i[4];
  wire pwm_cyc_i[4];
  wire pwm_stb_i[4];
  wire pwm_ack_o[4];
  wire [31:0] pwm_dat_o[4];
  
  wire pwm_out[4];

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : pwms
      pwm_wb pwm (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),

        .wb_stb_i(pwm_stb_i[i]),
        .wb_cyc_i(pwm_cyc_i[i]),
        .wb_we_i(pwm_we_i[i]),
        .wb_sel_i(pwm_sel_i[i]),
        .wb_dat_i(pwm_dat_i[i]),
        .wb_adr_i(pwm_adr_i[i]),

        .wb_ack_o(pwm_ack_o[i]),
        .wb_dat_o(pwm_dat_o[i]),

        .pwm_out(pwm_out[i])
      );
    end
  endgenerate

  // UART signals.
  wire [31:0] uart_adr_i;
  wire [31:0] uart_dat_i;
  wire [3:0] uart_sel_i;
  wire uart_we_i;
  wire uart_cyc_i;
  wire uart_stb_i;
  wire uart_ack_o;
  wire [31:0] uart_dat_o;

  wire uart_enabled;
  wire uart_tx;
  wire uart_rx;

  simpleuart_div16_wb  #(
    .BASE_ADR(UART0_BASE_ADDR)
  ) uart0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_adr_i(uart_adr_i),
    .wb_dat_i(uart_dat_i),
    .wb_sel_i(uart_sel_i),
    .wb_we_i(uart_we_i),
    .wb_cyc_i(uart_cyc_i),

    .wb_stb_i(uart_stb_i),
    .wb_ack_o(uart_ack_o),
    .wb_dat_o(uart_dat_o),

    .uart_enabled(uart_enabled),
    .ser_tx(uart_tx),
    .ser_rx(uart_rx)
  );

  // RING0 signals.
  wire [31:0] ring0_adr_i;
  wire [31:0] ring0_dat_i;
  wire [3:0] ring0_sel_i;
  wire ring0_we_i;
  wire ring0_cyc_i;
  wire ring0_stb_i;
  wire ring0_ack_o;
  wire [31:0] ring0_dat_o;
  wire ring0_test_en;
  wire ring0_test_out;

  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(28)
  ) ring0 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring0_stb_i),
    .wb_cyc_i(ring0_cyc_i),
    .wb_we_i(ring0_we_i),
    .wb_sel_i(ring0_sel_i),
    .wb_dat_i(ring0_dat_i),
    .wb_adr_i(ring0_adr_i),

    .wb_ack_o(ring0_ack_o),
    .wb_dat_o(ring0_dat_o),

    .ring_clk(ring0_clk),
    .ring_start(ring0_start),
    .ring_trim_a(ring0_trim_a),
    .ring_trim_b(ring0_trim_b),
    .ring_clkmux(ring0_clkmux),

    .test_en(ring0_test_en),
    .test_out(ring0_test_out)
  );

  // RING1 signals.
  wire [31:0] ring1_adr_i;
  wire [31:0] ring1_dat_i;
  wire [3:0] ring1_sel_i;
  wire ring1_we_i;
  wire ring1_cyc_i;
  wire ring1_stb_i;
  wire ring1_ack_o;
  wire [31:0] ring1_dat_o;
  wire ring1_test_en;
  wire ring1_test_out;

  ring_control #(
    .CLKMUX_BITS(3),
    .TRIM_BITS(26)
  ) ring1 (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    .wb_stb_i(ring1_stb_i),
    .wb_cyc_i(ring1_cyc_i),
    .wb_we_i(ring1_we_i),
    .wb_sel_i(ring1_sel_i),
    .wb_dat_i(ring1_dat_i),
    .wb_adr_i(ring1_adr_i),

    .wb_ack_o(ring1_ack_o),
    .wb_dat_o(ring1_dat_o),

    .ring_clk(ring1_clk),
    .ring_start(ring1_start),
    .ring_trim_a(ring1_trim_a),
    .ring_trim_b(),
    .ring_clkmux(ring1_clkmux),

    .test_en(ring1_test_en),
    .test_out(ring1_test_out)
  );

  // Connect up external ports.
  assign gpio_in = io_in[37:6];
  assign uart_rx = io_in[35];

  assign io_out[5:0] = 6'b0;
  assign io_out[37:6] = gpio_out |
    {
      /*31 - io37=*/uart_tx & uart_enabled,
      /*30 - io36=*/1'b0,
      /*29 - io35=*/1'b0,
      /*28 - io34=*/1'b0,
      /*27 - io33=*/1'b0,
      /*26 - io32=*/ring0_test_out,
      /*25 - io31=*/ring1_test_out,
      /*24 - io30=*/1'b0,
      /*23 - io29=*/pwm_out[0],
      /*22 - io28=*/1'b0,
      /*21 - io27=*/pwm_out[1],
      /*20 - io26=*/1'b0,
      /*19 - io25=*/pwm_out[2],
      /*18 - io24=*/1'b0,
      /*17 - io23=*/pwm_out[3],
      17'b0
    };

  assign io_oeb[5:0] = 6'b0;
  assign io_oeb[37:6] = gpio_oeb &
    {
      /*io37=*/~uart_enabled,
      /*io36=*/1'b1,
      /*io35=*/1'b1,
      /*io34=*/1'b1,
      /*io33=*/1'b1,
      /*io32=*/~ring0_test_en,
      /*io31=*/~ring1_test_en,
      {25{1'b1}}
    };

  assign la_data_out = 128'b0;

  assign irq = 3'b0;

endmodule // module digitalcore_macro
