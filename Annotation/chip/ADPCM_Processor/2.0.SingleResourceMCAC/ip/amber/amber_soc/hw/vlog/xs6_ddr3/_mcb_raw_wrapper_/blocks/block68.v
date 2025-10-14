  always @(*)
  begin
    if ( C_PORT_CONFIG[23:0]  == "R32" && p5_cmd_en == 1'b1 
         && p5_cmd_instr[2] == 1'b0  && p5_cmd_instr[0] == 1'b0 )
          begin
           $display("ERROR - Invalid Command for read only port 5");
           $finish;
          end
  end  