`timescale 1ns/1ns
/*模块说明
dac转换模块，频率最大为20M，现采用3分频12.5M
*/
module dac_c (
    //global clock
    input         clk,
    input         rst_n,

    //user interface
    input  [15:0] din,
    input         din_vld,
    output        rdy,

    output reg    cs,
    output        sclk,
    output reg    sdi,
    output reg    ldac 
);
reg flag_add;
// 分频器:end_cnt_div后是下降沿
//---------------------------------------------------------------------
    parameter div = 3;//分频系数
    reg [div-1:0]cnt_div;
    wire add_cnt_div;
    wire end_cnt_div;
    wire clk_neg = end_cnt_div;
    wire clk_pos = cnt_div[0]==1 && cnt_div[1]==1 && cnt_div[2]==0;

    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt_div <= 0;
          end
        else if(add_cnt_div)begin
          if(end_cnt_div)
             cnt_div <= 0;
          else
             cnt_div <= cnt_div + 1;
          end      
    end
  
    assign add_cnt_div = flag_add;
    assign end_cnt_div = add_cnt_div && cnt_div == {div{1'b1}};

assign sclk = !cs ? cnt_div[div-1] : 0;

    reg [4:0]cnt0;
    wire add_cnt0;
    wire end_cnt0;
    reg [1:0]cnt1;
    wire add_cnt1;
    wire end_cnt1;
    reg [4:0] x;

    
   reg [16:0] din_tmp;
   wire sdi_en = flag_add || din_vld;
   assign rdy = ~sdi_en ;

    //加一条件
    always  @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            flag_add <= 0;
        end
        else if(din_vld)begin
            flag_add <= 1;
        end
        else if(end_cnt1)begin
            flag_add <= 0;
        end
    end

    //计数器
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt0 <= 0;
        end
        else if(add_cnt0)begin
           if(end_cnt0)
              cnt0 <= 0;
           else
              cnt0 <= cnt0 + 1;
         end      
    end
    
    assign add_cnt0 = sdi_en && (clk_neg || din_vld);
    assign end_cnt0 = add_cnt0 && cnt0 == x-1;

    //计数器1
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt1 <= 0;
        end
        else if(add_cnt1)begin
           if(end_cnt1)
              cnt1 <= 0;
           else
              cnt1 <= cnt1 + 1;
         end      
    end
    
    assign add_cnt1 = end_cnt0;
    assign end_cnt1 = add_cnt1 && cnt1 == 2-1;

    //变量选择器
    always  @(*)begin
       case(cnt1)
          0:      begin    x=17;      end
          1:      begin    x=1 ;      end
       endcase
    end
    

    //cs
    always  @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cs <= 1;
        end
        else if(din_vld)begin
            cs <= 0;
        end
        else if(cnt1 == 0 && end_cnt0) begin
            cs <= 1;
        end
    end

    //暂存输入的16位数据，数据传输完成后归零,多一个0是因为分频时钟需要补一个上升沿才能把第0个数据采到
    //
    always @(*)begin
        if(!rst_n)begin
           din_tmp <= 0;
        end
        else if(din_vld)begin
            din_tmp = {din,1'b0};
        end
    end
    //sdi 
    always  @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            sdi <= 0;
        end
        else if(clk_neg || din_vld)begin
            sdi <= din_tmp[16-cnt0];
        end
    end

    //ldac
    always  @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            ldac <= 1;
        end
        else if(end_cnt0 && cnt1 == 0)begin
            ldac <= 0;
        end
        else begin
            ldac <= 1;
        end
    end
    

    
endmodule
