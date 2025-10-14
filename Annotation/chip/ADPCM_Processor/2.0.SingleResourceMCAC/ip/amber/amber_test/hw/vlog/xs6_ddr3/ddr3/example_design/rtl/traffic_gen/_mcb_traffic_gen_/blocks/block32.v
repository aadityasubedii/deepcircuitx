  initial begin
    if((MEM_BURST_LEN !== 4) && (MEM_BURST_LEN !== 8)) begin
      $display("Current Traffic Generator logic does not support OTF (On The Fly) Burst Mode!");
      $display("If memory is set to OTF (On The Fly) , Traffic Generator only generates BL8 traffic");
      
    end
  end