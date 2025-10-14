module audio #(parameter DATA_WIDTH = 24) (
    input clk,
    // Codec
    input BCLK,
    input ADCLRC,
    input DACLRC,
    input ADCDAT,
    output DACDAT,
    output XCK,

    //i2c

    output I2C_SCLK,
    output I2C_SDAT,

    input start_in,
    output wire[6:0] display1, display2, display3, display4
);

      /*     wire in_data_ready, out_data_ready, div_clk, audio_clk, locked; */
      wire i2c_clk, i2c_end, i2c_go;
      wire[23:0] i2c_data;
      wire[3:0] a, b, c, d;
          reg[(DATA_WIDTH-1):0] out_data;
      wire signed [(DATA_WIDTH-1):0] left_data, right_data, left_data_delay, right_data_delay;
      wire [5:0] counter;

	CLOCK_500 clk_500(
		.CLOCK(clk),
		.CLOCK_500(i2c_clk),
		.DATA(i2c_data),
		.END(i2c_end),
		.RESET(0),
		.GO(i2c_go)
	);
	
	i2c audio_i2c(
		.CLOCK(i2c_clk),
		.I2C_SCLK(I2C_SCLK),
		.I2C_SDAT(I2C_SDAT),
		.I2C_DATA(i2c_data),
		.GO(i2c_go),
		.END(i2c_end),
		.W_R(0),
		.RESET(1)	
	);
	 
	Clock_divider cd(
		.clock_in(clk),
		.clock_out(div_clk)
	);
	 
	audio_clk audio_clk_mod(
		.areset(0),
		.inclk0(clk),
		.c0(audio_clk),
		.locked(locked)
	);
	
	assign XCK = audio_clk;

	// AUDIO_IF audio(
	// 	.avs_s1_clk(audio_clk),
	// 	.avs_s1_reset(0),
	// 	.avs_s1_address(0),
	// 	.avs_s1_read(0),
	// 	.avs_s1_readdata(0),
	// 	.avs_s1_write(0),
	// 	.avs_s1_writedata(0),
	// 	.avs_s1_export_BCLK(BCLK),
	// 	.avs_s1_export_DACLRC(DACLRC),
	// 	.avs_s1_export_DACDAT(DACDAT),
	// 	.avs_s1_export_ADCLRC(ADCLRC),
	// 	.avs_s1_export_ADCDAT(ADCDAT),
	// 	.avs_s1_export_XCK(XCK)
	// );

	in_i2s #(.DATA_WIDTH(DATA_WIDTH)) codec_in(
		.BCLK(BCLK),
		.ADCDAT(ADCDAT),
		.ADCLRC(ADCLRC),
		.out_left_data(left_data),
		.out_right_data(right_data),
		.counter(counter)
	);
	    /* 	 */
        /* tremolo #(.DATA_WIDTH(DATA_WIDTH)) tremolo( */
        /*     .clk(ADCLRC), */
        /*     .audio_right_in(left_data), */
        /*     .audio_left_in(right_data), */
        /*     .audio_right_out(left_data_delay), */
        /*     .audio_left_out(right_data_delay) */
        /* ); */

    /* delay #(.DATA_WIDTH(DATA_WIDTH)) delay( */
    /*     .clk(clk), */
    /*     .write_clk(ADCLRC), */
    /*     .audio_right_in(left_data), */
    /*     .audio_left_in(right_data), */
    /*     .audio_right_out(left_data_delay), */
    /*     .audio_left_out(right_data_delay) */
    /* ); */

    /* vibrato #(.DATA_WIDTH(DATA_WIDTH)) vibrato( */
    /*     .clk(clk), */
    /*     .write_clk(ADCLRC), */
    /*     .audio_right_in(left_data), */
    /*     .audio_left_in(right_data), */
    /*     .audio_right_out(left_data_delay), */
    /*     .audio_left_out(right_data_delay) */
    /* ); */

    /* flanger #(.DATA_WIDTH(DATA_WIDTH)) flanger( */
    /*     .clk(clk), */
    /*     .write_clk(ADCLRC), */
    /*     .audio_right_in(left_data), */
    /*     .audio_left_in(right_data), */
    /*     .audio_right_out(left_data_delay), */
    /*     .audio_left_out(right_data_delay) */
    /* ); */

    /* chorus #(.DATA_WIDTH(DATA_WIDTH)) chorus( */
    /*     .clk(clk), */
    /*     .write_clk(ADCLRC), */
    /*     .audio_right_in(left_data), */
    /*     .audio_left_in(right_data), */
    /*     .audio_right_out(left_data_delay), */
    /*     .audio_left_out(right_data_delay) */
    /* ); */

    overdrive #(.DATA_WIDTH(DATA_WIDTH)) overdrive(
        .clk(clk),
        .audio_right_in(right_data),
        .audio_left_in(left_data),
        .audio_right_out(right_data_delay),
        .audio_left_out(left_data_delay)
    );

	out_i2s #(.DATA_WIDTH(DATA_WIDTH)) codec_out(
		.BCLK(BCLK),
		.DACDAT(DACDAT),
		.DACLRC(DACLRC),
		.left_data(left_data_delay),
		.right_data(right_data_delay)
	);
	
	dado_bcd valorDisplay5678(
		.dado(out_data),
		.zero(a),
		.um(b),
		.dois(c),
		.tres(d)
	);
	
	Display Display4(
		.a3(d[3]),
		.a2(d[2]),
		.a1(d[1]),
		.a0(d[0]),
		.a(display4[0]),
		.b(display4[1]),
		.c(display4[2]),
		.d(display4[3]),
		.e(display4[4]),
		.f(display4[5]),
		.g(display4[6])
	);
	
	Display Display3(
		.a3(c[3]),
		.a2(c[2]),
		.a1(c[1]),
		.a0(c[0]),
		.a(display3[0]),
		.b(display3[1]),
		.c(display3[2]),
		.d(display3[3]),
		.e(display3[4]),
		.f(display3[5]),
		.g(display3[6])
	);
	
	Display Display2(
		.a3(b[3]),
		.a2(b[2]),
		.a1(b[1]),
		.a0(b[0]),
		.a(display2[0]),
		.b(display2[1]),
		.c(display2[2]),
		.d(display2[3]),
		.e(display2[4]),
		.f(display2[5]),
		.g(display2[6])
	);
	
	Display Display1(
		.a3(a[3]), 
		.a2(a[2]),
		.a1(a[1]),
		.a0(a[0]),
		.a(display1[0]),
		.b(display1[1]),
		.c(display1[2]),
		.d(display1[3]),
		.e(display1[4]),
		.f(display1[5]),
		.g(display1[6])
	);
	
	always @(posedge div_clk) begin
		out_data <= right_data_delay[12:0];
	end

endmodule
