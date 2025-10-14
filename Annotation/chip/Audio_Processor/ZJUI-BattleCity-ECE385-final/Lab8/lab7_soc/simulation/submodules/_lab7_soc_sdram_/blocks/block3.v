initial
  begin
    $write("\n");
    $write("This reference design requires a vendor simulation model.\n");
    $write("To simulate accesses to SDRAM, you must:\n");
    $write("	 - Download the vendor model\n");
    $write("	 - Install the model in the system_sim directory\n");
    $write("	 - `include the vendor model in the the top-level system file,\n");
    $write("	 - Instantiate sdram simulation models and wire them to testbench signals\n");
    $write("	 - Be aware that you may have to disable some timing checks in the vendor model\n");
    $write("		   (because this simulation is zero-delay based)\n");
    $write("\n");
  end