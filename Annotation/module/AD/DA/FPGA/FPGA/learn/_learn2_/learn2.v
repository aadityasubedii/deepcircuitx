module learn2 (
    input CLK_50M,
    input RST_N,
    output LED1
);

reg [26:0] time_cnt;
reg [26:0] time_cnt_n;
reg        led_reg;
reg        led_reg_n;

parameter SET_TIME_1S = 27'd50000000;

always @(posedge CLK_50M or negedge RST_N)
begin
    if (!RST_N)
        time_cnt <= 27'h0;
    else
        time_cnt <= time_cnt_n;
end

always @(*)
begin
    if(time_cnt == SET_TIME_1S)
        time_cnt_n = 27'h0;
    else
        time_cnt_n = time_cnt + 27'h1;
end

always @(posedge CLK_50M or negedge RST_N)
begin
    if (!RST_N)
        led_reg <= 1'b0;
    else
        led_reg <= led_reg_n;
end

always @(*)
begin
    if(time_cnt == SET_TIME_1S)
        led_reg_n = ~led_reg;
    else
        led_reg_n = led_reg;
end

assign LED1 = led_reg;

endmodule