always @ (instr_mode_i)
  if(instr_mode_i  >2 && FAMILY == "VIRTEX6") begin
   $display("Error ! Not valid instruction mode");
   $stop;
   end