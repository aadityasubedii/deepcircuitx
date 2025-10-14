      always @ (slot_0_present or slot_1_present) begin
        slot_0_present_mc = slot_0_present;
        slot_1_present_mc = slot_1_present;
      end