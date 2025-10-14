`timescale 1ns / 1ns
module dac_c_tb;
    //global clock
    reg            clk         ;
    reg            rst_n       ;

    //user interface
    reg [15:0]din;
    reg       din_vld;

    wire      cs;
    wire      sclk;
    wire      sdi;
    wire      ldac;

    wire      rst;

    //????????ns???????????
    parameter CYCLE    = 20;

    //???????????3?????????
    parameter RST_TIME = 10 ;

    //????????

    rst rst_u(
    //global clock
    . clk(clk),
    . rst_n(rst_n),

    //user interface
    . rst(rst)
);
    dac_c dac_c_u(
    //global clock
    . clk(clk),
    . rst_n(rst),

    //user interface
    . din(din),
    . din_vld(din_vld),
    . rdy(rdy),

    . cs(cs),
    . sclk(sclk),
    . sdi(sdi),
    . ldac(ldac)
);

    wire rdreq = rdy;

    
    always  @(posedge clk or negedge rst_n)begin
        if(!rst)begin
            din_vld <= 0;
        end
        else begin
            din_vld <= rdreq;
        end
    end


    //??????50M
    initial clk = 1;
    always #(CYCLE/2) clk=~clk;
    

    //??????
    initial begin
        rst_n = 1;
        #2;
        rst_n = 0;
        #(CYCLE*RST_TIME);
        rst_n = 1;
    end

    //??????
    initial begin
        din = 16'b1100_0101_1111_0010;
        #(CYCLE*10000);
        

    end
endmodule