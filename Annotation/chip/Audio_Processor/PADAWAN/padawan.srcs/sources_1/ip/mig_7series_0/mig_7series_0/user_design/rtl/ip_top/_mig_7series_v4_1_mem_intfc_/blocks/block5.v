  generate
    if (nSLOTS == 1) begin: gen_single_slot_odt
      always @ (slot_0_present or slot_1_present) begin
        slot_0_present_mc = slot_0_present;