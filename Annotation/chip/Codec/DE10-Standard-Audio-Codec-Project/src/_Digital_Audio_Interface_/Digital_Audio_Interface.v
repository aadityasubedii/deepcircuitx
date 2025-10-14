module Digital_Audio_Interface(
    input reset_n,
    output AUD_DACDAT,
    output AUD_DACLRCK,
    output AUD_BCLK

);

audio_memory	audio_memory_inst (
	.address ( address ),
	.clock ( clkin ),
	.q (memOut )
);

wire [15:0] memOut;
reg [17:0] address;
wire [32:0] dataOut;
reg [7:0] clock_counter;
reg DACLRCK_DAT;
reg DataAcquisition;
reg [19:0] Q;

always @(negedge AUD_BCLK)
begin
    if (DataAcquisition == 1 && Q == 240254)
        Q <= 0;
    else if (Q != 240254)
        Q <= Q + 1;
    else
        Q <= 0;
end

always @(negedge AUD_BCLK or negedge reset_n)

    if (reset_n == 0)
    begin
        address = 0;
        clock_counter <= 0;
        DACLRCK_DAT = 0;
        DataAcquisition = 0;
    end

    else if (clock_counter == 250)
    begin
        clock_counter <= 1;
        DACLRCK_DAT = 1;
        address = Q;
        DataAcquisition = 1;

    end
    else if (clock_counter == 1 && DataAcquisition == 1)
    begin
        DACLRCK_DAT = 0;
        clock_counter <= clock_counter + 1;
        dataOut[31:16] = memOut;
        dataOut[15:0] = memOut;
    end
    else
    begin
        clock_counter <= clock_counter + 1;
    end

    assign AUD_DACDAT = dataOut;


endmodule