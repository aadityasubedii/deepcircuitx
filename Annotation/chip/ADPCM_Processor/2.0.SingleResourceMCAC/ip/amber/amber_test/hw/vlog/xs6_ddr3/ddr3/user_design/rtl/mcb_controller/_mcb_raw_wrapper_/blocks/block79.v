  always @(*)
  begin
    if ( C_PORT_CONFIG[55:32]  == "W32" && p4_cmd_en == 1'b1 
         && p4_cmd_instr[2] == 1'b0 && p4_cmd_instr[0] == 1'b1 )
          begin
           $display("ERROR - Invalid Command for write only port 4");
           $finish;
          end
  end