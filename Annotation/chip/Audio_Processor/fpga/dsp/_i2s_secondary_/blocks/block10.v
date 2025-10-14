    always @(posedge ck) begin

        if (ck_in) begin 
            prescale <= 0;
            match <= prescale - 3;
        end else begin
            if (prescale != S_MAX) begin
                prescale <= prescale + 1;
            end
        end

    end