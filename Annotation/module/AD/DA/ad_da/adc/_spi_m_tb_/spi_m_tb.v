`timescale 1ns / 1ns
module spi_m_tb;
    //global clock
    reg            clk         ;
    reg            rst_n       ;

//---------------------------------------------------------------------
    //user interface
    reg cs_key;
    reg cs_key_s;
    reg read_flag;
    wire [32:0] read_data;
    reg writ_flag;
    reg [31:0] writ_data;

    reg read_flag_s;
    reg writ_flag_s;

    wire rdy;
//---------------------------------------------------------------------

    reg  miso;
    wire sclk;
    wire sc_n;
    wire mosi;
  
    //时钟周期，单位为ns，可在此修改时钟周期。
    parameter CYCLE    = 10;

    //复位时间，此时表示复位3个时钟周期的时间。
    parameter RST_TIME = 3 ;

    always  @(posedge clk)begin
        cs_key_s    <= cs_key;
        read_flag_s <= read_flag;
        writ_flag_s <= writ_flag;
    end

    //待测试的模块例化
    spi_m spi_m_u(
    //global clock
    . clk(clk),
    . rst_n(rst_n),

    //user interface
    . cs_key(cs_key_s),

    . read_flag(read_flag_s),
    . writ_flag(writ_flag_s),

    . writ_data(writ_data),
    . read_data(read_data),
    . rdy(rdy),

    //与从ADC连接的信号
    . sclk(sclk),
    . miso(miso),
    . cs(sc_n),
    . mosi(mosi)
);


    //生成本地时钟50M
    initial clk = 1;
    always #(CYCLE/2) clk=~clk;
    

    //产生复位信号
    initial begin
        rst_n = 1;
        #2;
        rst_n = 0;
        #(CYCLE*RST_TIME);
        rst_n = 1;
    end


    //产生输入信号
    initial begin
        #1;
        cs_key    = 0;
        read_flag = 0;
        writ_flag = 0;
        writ_data = 32'b10101010101010101010101010101000;
        #(CYCLE*10);
        writ_flag = 1;
        cs_key    = 1;
        #(CYCLE*1);
        writ_flag = 0;
        cs_key    = 0;
        #(CYCLE*100);
        cs_key    = 1;
        #(CYCLE*1);
        cs_key    = 0;
        #(CYCLE*10000);

    
    end
    

endmodule