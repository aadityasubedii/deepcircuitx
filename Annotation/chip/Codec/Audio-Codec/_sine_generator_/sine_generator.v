module sine_generator(
    input clk,
    input [23:0] fcw,
    output wire[15:0] sine
);
    wire[9:0] addr;
    reg[23:0] accumulator;

    assign addr = accumulator[23:14];

    sine_rom sine_rom(
        .addr(addr),
        .clk(clk),
        .q(sine)
    );

    always @ (posedge clk) begin
        accumulator = accumulator + fcw;
    end

endmodule
