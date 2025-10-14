    xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), 
                          .dclk_in(CLK100MHZ), 
                          .den_in(enable), 
                          .di_in(0), 
                          .dwe_in(0), 
                          .busy_out(),                    
                         
                          .vauxp3(vauxp3),
                          .vauxn3(vauxn3),
                          
                          .vn_in(0), 
                          .vp_in(0), 
                          .alarm_out(), 
                          .do_out(data_o), 
                          .eoc_out(enable),
                          .eos_out(),
                          .channel_out(),
                          .drdy_out(ready));