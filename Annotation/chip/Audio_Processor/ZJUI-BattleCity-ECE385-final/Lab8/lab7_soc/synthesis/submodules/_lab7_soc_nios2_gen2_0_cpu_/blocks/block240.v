  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          jtag_rd <= 1'b0;
          jtag_rd_d1 <= 1'b0;
          jtag_ram_wr <= 1'b0;
          jtag_ram_rd <= 1'b0;
          jtag_ram_rd_d1 <= 1'b0;
          jtag_ram_access <= 1'b0;
          MonAReg <= 0;
          MonDReg <= 0;
          waitrequest <= 1'b1;
          avalon_ociram_readdata_ready <= 1'b0;
        end
      else 
        begin
          if (take_no_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              jtag_rd <= 1'b1;
              jtag_ram_rd <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else if (take_action_ocimem_a)
            begin
              MonAReg[10 : 2] <= { jdo[17],
                            jdo[33 : 26] };

              jtag_rd <= 1'b1;
              jtag_ram_rd <= ~jdo[17];
              jtag_ram_access <= ~jdo[17];
            end
          else if (take_action_ocimem_b)
            begin
              MonAReg[10 : 2] <= MonARegAddrInc;
              MonDReg <= jdo[34 : 3];
              jtag_ram_wr <= MonARegAddrIncAccessingRAM;
              jtag_ram_access <= MonARegAddrIncAccessingRAM;
            end
          else 
            begin
              jtag_rd <= 0;
              jtag_ram_wr <= 0;
              jtag_ram_rd <= 0;
              jtag_ram_access <= 0;
              if (jtag_rd_d1)
                  MonDReg <= jtag_ram_rd_d1 ? ociram_readdata : cfgrom_readdata;
            end
          jtag_rd_d1 <= jtag_rd;
          jtag_ram_rd_d1 <= jtag_ram_rd;
          if (~waitrequest)
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
          else if (write)
              waitrequest <= ~address[8] & jtag_ram_access;
          else if (read)
            begin
              avalon_ociram_readdata_ready <= ~(~address[8] & jtag_ram_access);
              waitrequest <= ~avalon_ociram_readdata_ready;
            end
          else 
            begin
              waitrequest <= 1'b1;
              avalon_ociram_readdata_ready <= 1'b0;
            end
        end
    end