module audio_engine (
    input wire ck,

    
    input wire wb_rst,
    input wire wb_dbus_cyc,
    output wire ack,
    input wire wb_dbus_we,
    
    input wire [3:0] wb_dbus_sel,
    input wire [31:0] wb_dbus_adr,
    
    input wire [31:0] wb_dbus_dat,
    output wire [31:0] rdt,

    
    output reg dma_cyc,
    output reg dma_we,
    output reg [3:0] dma_sel,
    output reg [31:0] dma_adr,
    output reg [31:0] dma_dat,
    
    input wire dma_ack,
    input wire [31:0] dma_rdt,
    
    
    output wire dma_done,
    output wire dma_match,

    
    output wire sck,    
    output wire ws,     
    output wire sd_out0, 
    output wire sd_out1, 
    input wire sd_in0,  
    input wire sd_in1,  
    input wire sd_in2,  
    input wire sd_in3,  

    input wire ext_sck, 
    input wire ext_ws,  

    output wire ready,
    output wire [7:0] test
);