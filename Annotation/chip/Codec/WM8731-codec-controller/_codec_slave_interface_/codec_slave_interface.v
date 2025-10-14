/********1*********2*********3*********4*********5*********6*********7*********8
*
* FILE      : uar_rs232_slave_interface.v
* FUNCTION  : rs232
* AUTHOR    :
*
*_______________________________________________________________________________
*
* REVISION HISTORY
*
* Name                 Date         Comments
* ------------------------------------------------------------------------------
* rcasanova         14/Mar/2013  Created
* ------------------------------------------------------------------------------
*_______________________________________________________________________________
* 
* FUNCTIONAL DESCRIPTION 
*
*_______________________________________________________________________________
* 
* (c) Copyright Universitat de Barcelona, 2013 
* All rights reserved. Copying or other reproduction of this 
* program except for archival purposes is prohibited.
*
*********1*********2*********3*********4*********5*********6*********7*********/
`include "global.v"

//`include "D:\\Dropbox\\codec\\global.v"
 
module codec_slave_interface(
    Clk                  ,
    Rst_n                ,
    slave_read           ,
    slave_write          ,
    slave_address        ,
    slave_readdata       ,
    slave_writedata      ,
    slave_chipselect     ,
    slave_waitrequest    ,
    slave_beginbursttransfer,
    slave_burstcount     ,
    slave_irq            ,
    adc_fifo_full        ,
    dac_fifo_full        ,
    i2c_idle             ,
    adc_fifo_out         ,
    i2c_packet           ,
    dac_fifo_in          ,
    wr_i2c               ,
    rd_adc_fifo          ,
    adc_fifo_empty       ,
    wr_dac_fifo          
    );

input           Clk                 ; // Clock
input           Rst_n               ; // Reset
 
input           slave_read          ; // Read request signal. Acvtive high.
input           slave_write         ; // Write request signal. Active high.
input   [2:0]   slave_address       ; // Bus address.
output  [31:0]  slave_readdata      ; // Read bus.
input   [31:0]  slave_writedata     ; // Write bus.
input           slave_chipselect    ; // Chip select. Read and write operations are allowd when it is asserted. 
                                      // Active high.
output          slave_waitrequest   ;
input           slave_beginbursttransfer; // Indicates burst transfer. Active high.
input   [7:0]   slave_burstcount    ; // Number of transfers in a burst;
output          slave_irq           ;


input           adc_fifo_full       ;
input           dac_fifo_full       ;
input           adc_fifo_empty      ;
input           i2c_idle            ;
input   [31:0]  adc_fifo_out        ;
output  [23:0]  i2c_packet          ;
output  [31:0]  dac_fifo_in         ;
output          wr_i2c              ;
output          rd_adc_fifo         ;
output          wr_dac_fifo         ;


wire            valid_write         ; // Write operations are allowd when slave_write and slave_chipselect are asserted.
wire            valid_read          ; // Read operations are allowd when slave_read and slave_chipselect are asserted.

wire            selI2CDATAAUDIO     ; // Indicates that I2C_DATA_AUDIO register is selected as a target for read/write operations.
wire            selSTATUSAUDIO      ; // Indicates that STATUS_AUDIO register is selected as a target for read/write operations.
wire            selDACAUDIO         ; // Indicates that DAC_ AUDIO register is selected as a target for read/write operations.
wire            selADCAUDIO         ; // Indicates that ADC_ AUDIOregister is selected as a target for read/write operations.



reg     [31:0]  I2C_command         ; // Register I2C_DATA_AUDIO
reg     [31:0]  status_audio        ; // Register STATUS_AUDIO
reg     [31:0]  dac_data            ; // Register DAC_AUDIO
reg     [31:0]  adc_data            ; // Register ADC_AUDIO

wire            wr_i2c              ;
wire            rd_adc_fifo         ;
wire            wr_dac_fifo         ;

reg 			wr_i2c_reg; 

reg             wr_dac_fiforeg      ;
reg             rd_adc_fiforeg      ;

reg             loadBurstCount      ;
reg             enableBCount        ;
reg     [1:0]   state               ;
reg     [1:0]   next_state          ;
reg     [7:0]   bCount              ;
wire            burstEnd            ;
 
// Write operations are allowd when slave_write and slave_chipselect are asserted.
// Read operations are allowd when slave_read and slave_chipselect are asserted.
assign valid_write  = slave_chipselect & slave_write;
assign valid_read   = slave_chipselect & slave_read;

//Internal decoder
assign selI2CDATAAUDIO   = (slave_address == `ADDR_I2C_DATA_AUDIO  ? 1'b1 : 1'b0);
assign selSTATUSAUDIO    = (slave_address == `ADDR_STATUS_AUDIO     ? 1'b1 : 1'b0);
assign selDACAUDIO       = (slave_address == `ADDR_DAC_AUDIO     ? 1'b1 : 1'b0);
assign selADCAUDIO       = (slave_address == `ADDR_ADC_AUDIO      ? 1'b1 : 1'b0);


//I2C_DATA_AUDIO

assign i2c_packet = I2C_command[23:0];
always @(posedge Clk or posedge Rst_n)
  if (Rst_n) I2C_command <= 32'h0; 
  else if (selI2CDATAAUDIO && valid_write) 
  begin
  I2C_command <= slave_writedata;
end

//STATUS_AUDIO

always @(posedge Clk or posedge Rst_n)
  if (Rst_n) status_audio <= 32'h0;
  else status_audio <= {28'h0, adc_fifo_empty, adc_fifo_full, dac_fifo_full, i2c_idle};
  
//DAC_ AUDIO

assign dac_fifo_in = dac_data;

always @(posedge Clk or posedge Rst_n)
  if (Rst_n) dac_data <= 32'h0;
  else if (selDACAUDIO && valid_write)
  begin
  dac_data <= slave_writedata;
  end
 
       
//ADC_ AUDIO

always @(posedge Clk or posedge Rst_n)
  if (Rst_n) adc_data <= 32'h0;
  else 
  begin
  adc_data <= adc_fifo_out;
  end


//Read
assign slave_readdata = (!valid_read  ? 32'h0      :
                         selI2CDATAAUDIO ? I2C_command  :
                         selSTATUSAUDIO  ? status_audio     :
                         selDACAUDIO    ? dac_data     :
                         selADCAUDIO    ? adc_data     : 32'h0);
                         
                         
//assign wr_i2c      = valid_write & selI2CDATAAUDIO & i2c_idle;     //Habilita l'escriptura al i2c quan el i2c esta idle.
assign rd_adc_fifo = valid_read  & selADCAUDIO & !adc_fifo_empty;  //Habilita la lectura quan la FIFOadc no esta buida (sino no hi ha res a llegir).
//assign wr_dac_fifo = valid_write & selDACAUDIO & !dac_fifo_full;   //Habilita l'escriptura de la FIFOdac quan la fifo no esta plena.

assign slave_waitrequest = (valid_write & selI2CDATAAUDIO & !i2c_idle) | (valid_read  & selADCAUDIO & adc_fifo_empty) | (valid_write & selDACAUDIO & dac_fifo_full);
assign slave_irq = 1;


//Delay
always @(posedge Clk or posedge Rst_n)
if (Rst_n) wr_i2c_reg = 1'b0;
else wr_i2c_reg = valid_write & selI2CDATAAUDIO & i2c_idle;

assign wr_i2c = wr_i2c_reg;

always @(posedge Clk or posedge Rst_n)
  if (Rst_n) wr_dac_fiforeg = 1'b0;
  else wr_dac_fiforeg = valid_write & selDACAUDIO & !dac_fifo_full;

assign wr_dac_fifo = wr_dac_fiforeg;

/*
always @(posedge Clk or posedge Rst_n)
  if (Rst_n) rd_adc_fiforeg = 1'b0;
  else rd_adc_fiforeg = valid_read  & selADCAUDIO & !adc_fifo_empty;

assign rd_adc_fifo = rd_adc_fiforeg;
*/

/*

//IRQs
//Positive edge detector. Asserted 1 clock when a data is received. 
assign RxIrq = RxDone & !RxDoneReg;

always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) RxDoneReg <= 1'b0;
  else RxDoneReg <= RxDone;

always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) RxIrqCapture <= 1'b0;
  else if (selIrq && valid_write) RxIrqCapture <= 1'b0; //RxIrqCapture is desserted when UAR_FIFO_RX register is read.
     else if (RxIrq) RxIrqCapture <= 1'b1; //RxIrqCapture is asserted when a data is received. 



//Positive edge detector. Asserted 1 clock when a data is transmitted. 
assign TxIrq = TxDone & !TxDoneReg;

always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) TxDoneReg <= 1'b0;
  else TxDoneReg <= TxDone;

always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) TxIrqCapture <= 1'b0;
  else if (selIrq && valid_write) TxIrqCapture <= 1'b0; //RxIrqCapture is desserted when UAR_FIFO_TX register is read.
     else if (TxIrq) TxIrqCapture <= 1'b1; //TxIrqCapture is asserted when a data is transmitted. 






//IRQ signal. 
//RX and TX interrupts are enabled or disabled with a mask (RxIrqMask and TxIrqMask).
assign slave_irq = (RxIrqMask & RxIrqCapture) | (TxIrqMask & TxIrqCapture);        

*/

//Circuits for burst transfers.

//Counter to known the number of pending transfers (bCount).
//With loadBurstCount the counter is initialized. Slave_busrtcount is provided by the master.
always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) bCount <= 8'h00;
  else if (loadBurstCount) bCount <= slave_burstcount;
       else if (enableBCount) bCount <= bCount - 8'h1;    

assign burstEnd = (bCount == 8'h1);

//Rage Against State machine to control burst transfers.
always @(posedge Clk or posedge Rst_n)
  if (!Rst_n) state <= 2'h0;
  else state <= next_state;

always @(state or slave_beginbursttransfer or slave_write or slave_read)
 case(state)
  2'h0: if (slave_beginbursttransfer == 1'h0) next_state = 2'h0;
        else case ({slave_write, slave_read})
              2'b01: next_state = 2'h1; //Read burst transfer.
              2'b10: next_state = 2'h2; //Write burst transfer.
            default: next_state = 2'h0;
             endcase 
  2'h1: if (burstEnd) next_state = 2'h0;
        else next_state = 2'h1;
  2'h2: if (burstEnd) next_state = 2'h0;
        else next_state = 2'h2;  
  default: next_state = 2'h0;    
 endcase  

always @(state or slave_beginbursttransfer or slave_write or slave_read or slave_waitrequest)
 begin
 loadBurstCount = 1'b0;
 enableBCount = 1'b0;
 case(state)
  2'h0: if (slave_beginbursttransfer) loadBurstCount = 1'b1;
        else loadBurstCount = 1'b0;  
  2'h1: if (slave_waitrequest == 0 && slave_read) enableBCount = 1'b1;
        else enableBCount = 1'b0;
  2'h2: if (slave_waitrequest == 0 && slave_write) enableBCount = 1'b1;
        else enableBCount = 1'b0; 
 endcase  
 end


endmodule
