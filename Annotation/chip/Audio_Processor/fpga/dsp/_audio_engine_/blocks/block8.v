    function [31:0] sreg_rdt(input [2:0] s_addr);

        case (s_addr)
            0   :   sreg_rdt = control_reg;
            1   :   sreg_rdt = { 29'h0, bank_done, error, done };
            2   :   sreg_rdt = capture;
            3   :   sreg_rdt = 32'h0;
            4   :   sreg_rdt = { 24'h0, i2s_out_offset, i2s_in_offset };
        endcase

    endfunction