always @(posedge i_clk)
    begin
    full_out_r       <= full_out;
    full_carry_out_r <= full_carry_out;
    use_quick_r      <= !o_stall;
    end