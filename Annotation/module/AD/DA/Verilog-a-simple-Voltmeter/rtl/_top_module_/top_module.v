module top_module (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire [7:0] ad_data,
    output wire [5:0] sel,
    output wire [7:0] seg,
    output wire ad_clk
);
    
    wire [15:0] volt_data;
    wire sign_adc_seg;

    adc adc_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .ad_data(ad_data),
        .ad_clk(ad_clk),
        .volt(volt_data),
        .sign(sign_adc_seg)
    );

    seg_dynamic seg_dynamic_inst (
        .seg_en(1'b1),
        .data(volt_data),
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .point(6'b001000),
        .sign(sign_adc_seg),
        .sel(sel),
        .seg(seg)
    );

    
endmodule