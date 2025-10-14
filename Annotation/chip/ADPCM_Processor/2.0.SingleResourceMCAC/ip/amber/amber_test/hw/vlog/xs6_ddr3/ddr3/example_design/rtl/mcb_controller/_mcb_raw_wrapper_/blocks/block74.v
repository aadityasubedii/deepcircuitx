  always @(*)
  begin
    if ( C_PORT_CONFIG[87:64]  == "R32" && p3_cmd_en == 1'b1 
         && p3_cmd_instr[2] == 1'b0  && p3_cmd_instr[0] == 1'b0 )
          begin
           $display("ERROR - Invalid Command for read only port 3");
           $finish;
          end
  end