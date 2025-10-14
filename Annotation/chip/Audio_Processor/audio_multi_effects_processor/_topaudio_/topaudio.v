`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:41 09/01/2022 
// Design Name: 
// Module Name:    topaudio 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "./ganancia.v"
`include "./dac.v"
`include "./adc.v"
`include "./controlador.v"
`include "./fredivider.v"
`include "./overdrive.v"
`include "./Delay.v"
`include "./effect_controller.v"
`include "./rot_enc.v"
`include "./ECHO.v"
`include "./REVERB.v"

module topaudio(
	input clock,
	input rot_a,
	input rot_b,
	input swDIS,
	input swDEL,
	input swECHO,
	input swREVERB,
	input miso,
	output adconv,
	output ready,
	output sck,
	output mosi,
	output daccs,
	output dacclr,
	output spissb,
	output sf_ce0,
	output fpgainitb,
	output ampcs,
	output ampshdn,
	//
	output Egain,
	output Eadc,
	output Edac,
	output [0:11] effect_OUT,
	output [0:11] datosINTERNO
	//
	//output reg [7:0] led
);

wire clockslow; //fredivider1
wire enablegain, enableadc, enabledac; //controlador1
wire mosigain, sckgain; //gain1
wire [1:0] rotation;
wire [0:11] datosinterno; //adc1
wire [0:11] internoDIST;
wire [0:11] internoDELAY;
wire [0:11] internoECHO;
wire [0:11] internoREVERB;
wire [0:11] effect_out;

wire sckadc;
wire mosidac, sckdac; //dac1

assign mosi=mosidac | mosigain;
assign sck=(sckgain | sckadc | sckdac);

//
assign Egain = enablegain;
assign Eadc = enableadc;
assign Edac = enabledac;
assign effect_OUT = effect_out;
assign datosINTERNO = datosinterno;
//

//reg [26:0] counter = 0;

/*always@(posedge clock)
begin
	if(counter < 45000000)
		counter <= counter + 1;
	else
	begin
		led[0] <= datosinterno[4];
		led[1] <= datosinterno[5];
		led[2] <= datosinterno[6];
		led[3] <= datosinterno[7];
		led[4] <= datosinterno[8];
		led[5] <= datosinterno[9];
		led[6] <= datosinterno[10];
		led[7] <= datosinterno[11];
		counter <= 0;
	end
end*/

rot_enc rot_enc1 (
	.clk(clockslow), 
	.rot_A(rot_a), 
	.rot_B(rot_b), 
	.rlrot(rotation)
);

REVERB reverb1 (
	.clk(clockslow), 
	.DATA_IN(datosinterno),
	.DATA_OUT(internoREVERB)
	);


ECHO echo1 (
	.clk(clockslow), 
	.DATA_IN(datosinterno),
	.DATA_OUT(internoECHO)
	);

overdrive overdrive1 (
	.clk(clockslow),
	.rlrot(rotation),
	.DATA_IN(datosinterno), 
	.DATA_OUT(internoDIST)
);

Delay delay1 (
	.clk(clockslow), 
	.rlrot(rotation),
	.DATA_IN(datosinterno), 
	.DATA_OUT(internoDELAY)
);

effect_controller effe_cont (
.clk(clockslow), 
.in_DIS(internoDIST), 
.in_DELAY(internoDELAY), 
.in_ECHO(internoECHO),
.in_REVERB(internoREVERB),
.in_CLEAN(datosinterno),
.switch_DIS(swDIS), 
.switch_DELAY(swDEL), 
.switch_ECHO(swECHO),
.switch_REVERB(swREVERB),
.effect_out(effect_out)
);

fredivider fredivider1(
	.clk(clock),
	.clk_out(clockslow) //interno
);

controlador controlador1(
	.clock(clockslow),
	.enablegain(enablegain), //interno
	.enableadc(enableadc), //interno
	.enabledac(enabledac), //interno
	.spissb(spissb),
	.sf_ce0(sf_ce0),
	.fpgainitb(fpgainitb)
);

ganancia gain1(
	.clock(clockslow),
	.clockenable(enablegain),
	.mosi(mosigain), //interno
	.sck(sckgain), //interno
	.ampcs(ampcs),
	.ampshdn(ampshdn)
);

adc adc1(
	.clock(clockslow),
	.clockenable(enableadc),
	.miso(miso),
	.adconv(adconv),
	.ready(ready),
	.sck(sckadc), //interno
	.datos(datosinterno) //interno
);

dac dac1(
	.clock(clockslow), 
	.clockenable(enabledac),
	.datos(effect_out),
	.mosi(mosidac), //interno
	.daccs(daccs),
	.sck(sckdac), //interno
	.dacclr(dacclr)
);

endmodule
