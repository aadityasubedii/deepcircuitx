  assign F_vinst = F_valid ? F_inst : {9{8'h2d}};
  assign D_vinst = D_valid ? D_inst : {9{8'h2d}};
  assign R_vinst = R_valid ? D_inst : {9{8'h2d}};
  assign E_vinst = E_valid ? D_inst : {9{8'h2d}};
  assign W_vinst = W_valid ? D_inst : {9{8'h2d}};