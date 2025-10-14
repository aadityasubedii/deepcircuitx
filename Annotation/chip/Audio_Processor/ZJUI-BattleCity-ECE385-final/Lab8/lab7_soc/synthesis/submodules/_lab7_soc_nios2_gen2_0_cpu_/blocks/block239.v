  assign MonARegAddrInc = MonAReg[10 : 2]+1;
  assign MonARegAddrIncAccessingRAM = ~MonARegAddrInc[8];
  assign avalon_ram_wr = write & ~address[8] & debugaccess;
  assign ociram_addr = jtag_ram_access ? MonAReg[9 : 2] : address[7 : 0];
  assign ociram_wr_data = jtag_ram_access ? MonDReg[31 : 0] : writedata;
  assign ociram_byteenable = jtag_ram_access ? 4'b1111 : byteenable;
  assign ociram_wr_en = jtag_ram_access ? jtag_ram_wr : avalon_ram_wr;
  assign ociram_reset_req = reset_req & ~jtag_ram_access;