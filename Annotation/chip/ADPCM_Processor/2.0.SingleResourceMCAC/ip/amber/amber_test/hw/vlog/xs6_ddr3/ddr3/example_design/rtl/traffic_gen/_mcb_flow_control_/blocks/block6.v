assign  cmd_wr     = ((cmd_i == WR  | cmd_i == WRP) & cmd_valid_i )  ? 1'b1 : 1'b0;
assign  cmd_rd     = ((cmd_i == RD | cmd_i == RDP) & cmd_valid_i) ? 1'b1 : 1'b0;
assign  cmd_others = ((cmd_i[2] == 1'b1)& cmd_valid_i && (FAMILY == "SPARTAN6")) ? 1'b1 : 1'b0;