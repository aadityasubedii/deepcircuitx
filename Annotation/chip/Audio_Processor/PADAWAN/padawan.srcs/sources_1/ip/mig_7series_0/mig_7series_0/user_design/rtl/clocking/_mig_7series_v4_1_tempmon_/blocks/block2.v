      XADC_inst (
        
        .ALM(),                     
        .OT(),                      
        
        .DO(xadc_do),               
        .DRDY(xadc_drdy),           
        
        .BUSY(),                    
        .CHANNEL(),                 
        .EOC(),                     
        .EOS(),                     
        .JTAGBUSY(),                
        .JTAGLOCKED(),              
        .JTAGMODIFIED(),            
        .MUXADDR(),                 
        
        .VAUXN(16'b0),              
        .VAUXP(16'b0),              
        
        .CONVST(1'b0),              
        .CONVSTCLK(1'b0),           
        .RESET(1'b0),               
        
        .VN(1'b0),                  
        .VP(1'b0),                  
        
        .DADDR(7'b0),               
        .DCLK(xadc_clk),            
        .DEN(xadc_den),             
        .DI(16'b0),                 
        .DWE(1'b0)                  
      );