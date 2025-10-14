  always @(slot_0_present) begin
    slot_0_population = 2'b0;
    for (i=0; i<8; i=i+1)
      if (~slot_0_population[1])
        if (slot_0_present[i] == 1'b1) slot_0_population =
                                         slot_0_population + 2'b1;
  end