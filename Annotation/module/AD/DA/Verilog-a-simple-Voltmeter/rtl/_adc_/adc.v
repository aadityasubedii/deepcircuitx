module adc (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire [7:0] ad_data,
    output reg ad_clk,
    output reg [15:0] volt,
    output reg sign
);

    parameter CNT_MEDIAN_MAX = 11'd1024;

    wire [27:0] data_n;
    wire [27:0] data_p;

    reg [1:0] cnt_sys_clk;
    reg clk_sample;
    reg [10:0] cnt_median;
    reg median_en;
    reg [18:0] data_sum_m;
    reg [7:0] data_median;
    reg [27:0] volt_reg;
    reg sign_reg;

    // count 0 to 1
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_sys_clk <= 2'd0;
        else if (cnt_sys_clk == 2'd1)
            cnt_sys_clk <= 2'd0;
        else
            cnt_sys_clk <= cnt_sys_clk + 1'b1;
    end

    // clk_sample
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            clk_sample <= 1'b0;
        else if (cnt_sys_clk == 2'd1)
            clk_sample <= ~clk_sample;
    end

    // count 0 to 1024
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_median <= 11'd0;
        else if (median_en == 1'b0)
            cnt_median <= cnt_median + 1'b1;
    end

    // data_sum_m
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            data_sum_m <= 19'd0;
        else if ((cnt_median == CNT_MEDIAN_MAX) || (cnt_median == CNT_MEDIAN_MAX + 1'b1))
            data_sum_m <= 19'd0;
        else 
            data_sum_m <= data_sum_m + ad_data;
    end

    // data_median
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            data_median <= 8'd0;
        else if (cnt_median == CNT_MEDIAN_MAX)
            data_median <= data_sum_m / CNT_MEDIAN_MAX;
    end    

    // median_en
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            median_en <= 1'b0;
        else if (cnt_median == CNT_MEDIAN_MAX)
            median_en <= 1'b1;
    end

    // data_n
    assign data_n = (median_en == 1'b1) ? 8192_0000 / ((data_median + 1) * 2) : 0;
    
    // data_p
    assign data_p = (median_en == 1'b1) ? 8192_0000 / ((255 - data_median + 1) * 2) : 0;

    // volt_reg
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            volt_reg <= 28'd0;
        else if (median_en == 1'b1)
            if (ad_data == data_median)
                volt_reg <= 28'd0;
            else if (ad_data < data_median)
                volt_reg <= (data_n * (data_median - ad_data)) >> 13;
            else if (ad_data > data_median)
                volt_reg <= (data_p * (ad_data - data_median)) >> 13;
        else
            volt_reg <= 28'd0;
    end

    // output volt
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            volt <= 16'd0;
        else
            volt <= volt_reg;
    end

    // sign_reg
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            sign_reg <= 1'b0;
        else if (median_en == 1'b1)
            if (ad_data < data_median)
                sign_reg <= 1'b1;
            else
                sign_reg <= 1'b0;
        else
            sign_reg <= 1'b0;
    end

    // output sign
    always @(posedge clk_sample or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            sign <= 1'b0;
        else 
            sign <= sign_reg;
    end

    // output ad_clk
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            ad_clk <= 1'b0;
        else
            ad_clk <= ~clk_sample;
    end

endmodule