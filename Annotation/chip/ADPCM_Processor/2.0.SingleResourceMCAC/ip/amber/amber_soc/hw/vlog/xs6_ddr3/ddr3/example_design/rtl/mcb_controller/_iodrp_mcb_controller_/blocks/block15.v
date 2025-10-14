   always @ (state) begin
      case (state)
  READY     :state_ascii<="READY";
  DECIDE      :state_ascii<="DECIDE";
  ADDR_PHASE    :state_ascii<="ADDR_PHASE";
  ADDR_TO_DATA_GAP  :state_ascii<="ADDR_TO_DATA_GAP";
  ADDR_TO_DATA_GAP2 :state_ascii<="ADDR_TO_DATA_GAP2";
  ADDR_TO_DATA_GAP3 :state_ascii<="ADDR_TO_DATA_GAP3";
  DATA_PHASE    :state_ascii<="DATA_PHASE";
  ALMOST_READY    :state_ascii<="ALMOST_READY";
  ALMOST_READY2   :state_ascii<="ALMOST_READY2";
  ALMOST_READY3   :state_ascii<="ALMOST_READY3";
      endcase 
   end