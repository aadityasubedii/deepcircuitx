  always @(posedge clock) begin
    if (ready) state <= state+ 4'h1;

    case (state)
      4'h0: 
        begin
          command <= 24'h80_0000;
          command_valid <= 1'b1;
        end
      4'h1: 
        command <= 24'h80_0000;
      4'h3: 
        command <= { 8'h04, 3'b000, vol, 3'b000, vol };
      4'h5: 
        command <= 24'h18_0808;
      4'h6: 
        command <= { 8'h1A, 5'b00000, source, 5'b00000, source};
      4'h7: 
        command <= 24'h1C_0F0F;
      4'h9: 
        command <= 24'h0E_8048;
      4'hA: 
        command <= 24'h0A_0000;
      4'hB: 
        command <= 24'h20_8000;
      default:
        command <= 24'h80_0000;
    endcase 
  end 