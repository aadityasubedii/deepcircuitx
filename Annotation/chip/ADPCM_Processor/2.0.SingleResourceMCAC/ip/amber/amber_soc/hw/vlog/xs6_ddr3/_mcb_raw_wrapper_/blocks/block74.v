  always @(*)
  begin
    if ( C_PORT_CONFIG[119:96]  == "R32" && p2_cmd_en == 1'b1 
         && p2_cmd_instr[2] == 1'b0 && p2_cmd_instr[0] == 1'b0 )
          begin
           $display("ERROR - Invalid Command for read only port 2");
           $finish;
          end
  end