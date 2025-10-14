`timescale 1ns/100ps

`include "global.v"
//`include "D:\\Dropbox\\codec\\global.v"

module master_bus_fm(
    Clk,
    slave_read           ,
    slave_write          ,
    slave_address        ,
    slave_readdata       ,
    slave_writedata      ,
    slave_chipselect     ,
    slave_waitrequest    ,
    slave_beginbursttransfer,
    slave_burstcount     ,
    slave_irq
    );

input           Clk                 ; // Clock

output          slave_read          ; // Read request signal. Acvtive high.
output          slave_write         ; // Write request signal. Active high.
output  [2:0]   slave_address       ; // Bus address.
input   [31:0]  slave_readdata      ; // Read bus.
output  [31:0]  slave_writedata     ; // Write bus.
output          slave_chipselect    ; // Chip select. Read and write operations are allowd when it is asserted. 
                                      // Active high.
input           slave_waitrequest   ;
output          slave_beginbursttransfer; // Indicates burst transfer. Active high.
output  [7:0]   slave_burstcount    ; // Number of transfers in a burst;
input           slave_irq           ;

reg             slave_read          ; // Read request signal. Acvtive high.
reg             slave_write         ; // Write request signal. Active high.
reg     [2:0]   slave_address       ; // Bus address.
reg     [31:0]  slave_writedata     ; // Write bus.
reg             slave_chipselect    ; // Chip select. Read and write operations are allowd when it is asserted. 
                                      // Active high.
reg             slave_beginbursttransfer; // Indicates burst transfer. Active high.
reg     [7:0]   slave_burstcount    ; // Number of transfers in a burst;

reg     [31:0]  readData;

reg     [7:0]   dataArray [0:255]  ;

integer i;
                                                                            
task simpleWrite;

input [31:0] dataToWrite;
input [2:0]  addressToWrite;

  begin
    @(posedge Clk)
    #2 slave_writedata = dataToWrite;
       slave_address   = addressToWrite;
       slave_write     = 1'b1;
       slave_chipselect= 1'b1;
    #1
    while(slave_waitrequest)
     begin
       @(posedge Clk)
       #2;
     end  
    @(posedge Clk)
    #2
     slave_write     = 1'b0; 
     slave_chipselect= 1'b0;
  end  
  
endtask

task simpleRead;

input [2:0]  addressToWrite;

  begin
    @(posedge Clk)
    #2 slave_address   = addressToWrite;
       slave_read      = 1'b1;
       slave_chipselect= 1'b1;
    while(slave_waitrequest)
     begin
       @(posedge Clk)
       #2;
     end
    @(posedge Clk)
    #2 readData        = slave_readdata;
       slave_read      = 1'b0; 
       slave_chipselect= 1'b0;
  end  
  
endtask

task seti2cpacket;

input [23:0] i2cpacket;
reg   [31:0] dataToWrite;

  begin
    
    simpleRead(`ADDR_I2C_DATA_AUDIO);
    //I2C_command of (I2C_DATA_AUDIO) are set to 0 in order to rewrite that value 
    //without modifying the other bits of the register.
    dataToWrite = readData & 32'hFF000000;
    //The desired baudRate value is written into I2C_DATA_AUDIO) 
    //without modifying the other bits of the register.
    dataToWrite = dataToWrite | i2cpacket;
    simpleWrite(dataToWrite, `ADDR_I2C_DATA_AUDIO);
    $display("Master: i2cpacket set to %h", i2cpacket);
  end
  
endtask


task setDACaudio;

input [31:0] dac_data;
reg   [31:0] dataToWrite;
  begin
    dataToWrite = dac_data;
    simpleWrite(dataToWrite, `ADDR_DAC_AUDIO);
    //$display("Master: DAC audio set to %h", dac_data);
  end
endtask

task llegiradcfifoout;

  begin
    simpleRead(`ADDR_ADC_AUDIO);
    //$display("Master: read ADC audio %h", readData);
  end
endtask

task waitFifoADCNoFull;
  
  reg   full;
  
  begin
  full = 0;
  
  while (full)
   begin
     simpleRead(`ADDR_STATUS_AUDIO);
     full = readData[2];
     $display("\\  ADC FIFO full flag: %d",full);
   end
   $display("\\  ADC FIFO no full");
  end
endtask


/*
task enableRxDUT;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {11'h7FF, 1'h0, 20'hFFFFF};
  dataToWrite = dataToWrite | {11'h0, 1'h1, 20'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);  
  $display("\\  DUT: Rx channel enabled!");
  
  end
endtask

task disableRxDUT;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {11'h7FF, 1'h0, 20'hFFFFF};
  dataToWrite = dataToWrite | {11'h0, 1'h0, 20'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);
   
  $display("\\  DUT: Rx channel disabled!");
  end
endtask

task enableTxDUT;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {10'h3FF, 1'h0, 21'h1FFFFF};
  dataToWrite = dataToWrite | {10'h0, 1'h1, 21'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);    
  $display("\\  DUT: Tx channel enabled!");
  end
endtask

task disableTxDUT;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {10'h3FF, 1'h0, 21'h1FFFFF};
  dataToWrite = dataToWrite | {1'h0, 1'h0, 21'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);
    
  $display("\\  DUT: Tx channel disabled!");
  end
endtask

task enableRxIrq;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {9'h1FF, 1'h0, 22'h3FFFFF};
  dataToWrite = dataToWrite | {9'h0, 1'h1, 22'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);      
  $display("\\  DUT: Rx IRQ enabled!");
  end
endtask

task disableRxIrq;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {9'h1FF, 1'h0, 22'h3FFFFF};
  dataToWrite = dataToWrite | {9'h0, 1'h0, 22'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);    
  $display("\\  DUT: Rx IRQ disabled!");
  end
endtask

task enableTxIrq;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {8'hFF, 1'h0, 23'h7FFFFF};
  dataToWrite = dataToWrite | {8'h0, 1'h1, 23'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);     
  $display("\\  DUT: Tx IRQ enabled!");
  end
endtask

task disableTxIrq;
  
  reg   [31:0] dataToWrite;
  
  begin
  simpleRead(`ADDR_UAR_COM_CONFIG);
  dataToWrite = readData & {8'hFF, 1'h0, 23'h7FFFFF};
  dataToWrite = dataToWrite | {8'h0, 1'h0, 23'h0};
  simpleWrite(dataToWrite, `ADDR_UAR_COM_CONFIG);      
  $display("\\  DUT: Tx IRQ disabled!");
  end
endtask

task waitFifoTxEmpty;
  
  reg   empty;
  
  begin
  empty = 0;
  while (!empty)
   begin
     simpleRead(`ADDR_UAR_FIFO_TX);
     empty = readData[1];
   end
   $display("\\  Tx FIFO empty");
  end
endtask

task waitFifoRxNoEmpty;
  
  reg   empty;
  
  begin
  empty = 1;
  while (empty)
   begin
     simpleRead(`ADDR_UAR_FIFO_RX);
     empty = readData[1];
   end
   $display("\\  Rx FIFO no empty");
  end
endtask

task burstWrite;

input [7:0]  numberOfTransfers;
input [2:0]  addressToWrite;
reg          additionalClockCycle;
  begin
    additionalClockCycle = 1'b0;
    @(posedge Clk)
    #2 slave_writedata = dataArray[0];
       slave_address   = addressToWrite;
       slave_write     = 1'b1;
       slave_chipselect= 1'b1;
       slave_beginbursttransfer = 1'b1;
       slave_burstcount = numberOfTransfers;  
    for (i = 0; i < numberOfTransfers; i = i +1)
    begin
     slave_writedata = dataArray[i];
     @(posedge Clk)
     #2 slave_beginbursttransfer = 1'b0;
     slave_write     = 1'b1; 
     while(slave_waitrequest)
      begin
        @(posedge Clk)
        #2 additionalClockCycle = 1'b1;
      end
     if (additionalClockCycle) begin 
       //Additional clock cycle in case of slave_writerequest.
                                @(posedge Clk)
                                #2;
                               end 
       
    end 
     @(posedge Clk)
     #2 slave_write     = 1'b0;
     slave_chipselect= 1'b0;    
  end  
endtask

*/

task burstRead;

input [7:0]  numberOfTransfers;
input [2:0]  addressToWrite;
reg          additionalClockCycle;
  begin
    additionalClockCycle = 1'b0;
    @(posedge Clk)
    #2 slave_address   = addressToWrite;
       slave_read      = 1'b1;
       slave_chipselect= 1'b1;
       slave_beginbursttransfer = 1'b1;
       slave_burstcount = numberOfTransfers;  
    for (i = 0; i < numberOfTransfers; i = i +1)
    begin
     @(posedge Clk)
     #2 slave_beginbursttransfer = 1'b0;
     slave_read     = 1'b1; 
     while(slave_waitrequest)
      begin
        @(posedge Clk)
        #2 additionalClockCycle = 1'b1;
      end
     if (additionalClockCycle) begin 
       //Additional clock cycle in case of slave_writerequest.
                                @(posedge Clk)
                                #2;
                               end 
      dataArray[i] = slave_readdata; 
    end 
     @(posedge Clk)
     #2 slave_read     = 1'b0;
     slave_chipselect= 1'b0;    
  end   
endtask



initial
 begin
   slave_read       <= 1'b0;
   slave_write      <= 1'b0;
   slave_address    <= 3'h0;
   slave_writedata  <= 32'h0;
   slave_chipselect <= 1'b0;
   slave_beginbursttransfer <= 1'b0;
   slave_burstcount <= 8'h0;  
   readData         <= 32'h0;
   for (i = 0; i < 256; i = i + 1)
    dataArray [i] = 8'h0;
 end
 
endmodule
