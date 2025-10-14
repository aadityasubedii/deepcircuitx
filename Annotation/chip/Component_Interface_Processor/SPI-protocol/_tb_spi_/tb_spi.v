`include "spi_ctlr.v"
module tb;
parameter MAX_TXS				= 8;
parameter S_IDLE				= 3'b000;
parameter S_ADDR				= 3'b001;
parameter S_IDLE_BW_ADDR_DATA	= 3'b010;
parameter S_DATA				= 3'b011;
parameter S_IDLE_BW_TXS			= 3'b100;
parameter ADDR_WIDTH = 8;
parameter DATA_WIDTH = 8;

reg pclk_i, prst_i, pwrite_i, penable_i;
reg [ADDR_WIDTH-1:0] paddr_i;
reg [DATA_WIDTH-1:0] pwdata_i;
wire [DATA_WIDTH-1:0] prdata_o;
wire pready_o;
wire pslverr_o;
reg sclk_ref_i;
wire sclk;
wire mosi;
reg miso;
wire [3:0] cs;
integer i;

spi_ctlr dut(
pclk_i, prst_i, paddr_i, pwdata_i, prdata_o, pwrite_i, penable_i, pready_o, pslverr_o,
sclk_ref_i, sclk, mosi, miso, cs
);

// we have two clk one is sclk second is pclk then we need two initial begin end for that
initial begin
	pclk_i = 0;
	forever #5 pclk_i =  ~pclk_i;
end

initial begin
	sclk_ref_i = 0;
	forever #1 sclk_ref_i =  ~sclk_ref_i;
end

initial begin
	prst_i = 1;
	paddr_i = 0;
	pwdata_i = 0;
	pwrite_i = 0;
	penable_i = 0;
	miso = 1;
	repeat(2) @(posedge pclk_i);
	prst_i  = 0;
	//program addr registers
	for (i = 0; i < MAX_TXS; i=i+1) begin
		reg_write(i, 8'hD3+i);    //if range is 0 to 7 then addr_reg 
	end
	//program data registers
	for (i = 0; i < MAX_TXS; i=i+1) begin
		reg_write(8'h10+i, 8'h46+i);   // its range 10+ i means 10 t0 17 because i is 7
	end
	//ctrl
	reg_write(8'h20, {3'h2, 1'b1});   // 3 transfer
	#300;
	reg_write(8'h20, {3'h3, 1'b1});   //3+1= 4 tranfer
	#300;
	reg_write(8'h20, {3'h0, 1'b1});    // 1 transfer check at waveform
	#1000;
	$finish;
end

task reg_write(input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] data);
begin
	@(posedge pclk_i);
	paddr_i = addr;
	pwdata_i = data;
	pwrite_i = 1;
	penable_i = 1;
	wait (pready_o == 1);
	@(posedge pclk_i);
	pwrite_i = 0;
	penable_i = 0;
	paddr_i = 0;
	pwdata_i = 0;
end
endtask
endmodule
