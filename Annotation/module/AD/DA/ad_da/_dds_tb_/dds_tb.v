`timescale 1ns / 1ns
module example_tb;
    //global clock
    reg            clk         ;
    reg            rst_n       ;

    //user interface
    reg  [31:0] FwordA;
    reg  [11:0] PwordA;
    wire [13:0] dataA;
    reg  [31:0] FwordB;
    reg  [11:0] PwordB;
    wire [13:0] dataB;
    

    //时钟周期，单位为ns，可在此修改时钟周期。
    parameter CYCLE    = 20;

    //复位时间，此时表示复位3个时钟周期的时间。
    parameter RST_TIME = 3 ;

    //待测试的模块例化
    dds dds_A(
    //global clock
    . clk(clk),
    . rst_n(rst_n),

    //user interface
    . Fword(FwordA),
    . Pword(PwordA),

    . data(dataA)     
    );
    dds dds_B(
    //global clock
    . clk(clk),
    . rst_n(rst_n),

    //user interface
    . Fword(FwordB),
    . Pword(PwordB),

    . data(dataB)     
    );


    //生成本地时钟50M
    initial begin
        clk = 1;
        forever
        #(CYCLE/2)
        clk=~clk;
    end 

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
        FwordA = 65536*8;//2^18
        PwordA = 0;
        FwordB = 65536*8;//2^18
        PwordB = 2048;
        #(CYCLE*10000);
        FwordA = 65536*16;
        PwordA = 1024;
        #(CYCLE*10000);
        FwordA = 65536*2;
        #(CYCLE*1000000);
    end

endmodule