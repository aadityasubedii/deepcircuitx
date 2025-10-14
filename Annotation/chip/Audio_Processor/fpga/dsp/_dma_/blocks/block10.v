    function [31:0] rdt(input [2:0] rd_addr);

        begin

            case (rd_addr)
                0   :   rdt = { 8'h0, reg_addr };
                1   :   rdt = { 16'h0, reg_step };
                2   :   rdt = { 16'h0, reg_cycles };
                3   :   rdt = { 16'h0, reg_blocks };
                6   :   rdt = status;
                7   :   rdt = { 8'h0, reg_match };
            endcase

        end

    endfunction