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