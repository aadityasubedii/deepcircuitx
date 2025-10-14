`timescale 1ns/1ns
/*模块说明
cs在采集状态下是低电平，其他时候是高电平，满足。

rvs会在转化完成后由芯片拉高一拍，不用操心。

mosi和miso是并串，串并转换，时序图对齐，已经对齐。

*/
module adc (
    //global clock
    input clk,
    input rst_n,

    //user interface
    output reg [15:0] dout,

//---------------------------------------------------------------------
    input         rvs,
    input         miso,
    output reg    cs,
    output reg    mosi,

    output sclk
);
//reg地址
//---------------------------------------------------------------------

    parameter nops = {{32{1'b0}}},
              reah = {5'b11001,2'b00, {25{1'b0}}};          //读取高16位,单次读取
  //---------------------------------------------------------------------
    parameter t_acq = 100;

    reg [10:0] cnt;
    wire add_cnt;
    wire end_cnt;
    reg [10:0] cnt1;
    wire add_cnt1;
    wire end_cnt1;
    reg flag_add;

assign sclk = cs ? 1'b0 : !clk;
// 状态机
//---------------------------------------------------------------------
    reg [1:0] state_c, state_n;
    wire rst_to_acq_start ;
    wire acq_to_cov_start ;
    wire cov_to_acq_start ;

    localparam  rst = 1;
    localparam  acq = 2;
    localparam  cov = 3;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state_c <= rst ;
        else
            state_c <= state_n;
    end

    always @(*) begin
        case(state_c)
            rst :begin
                if(rst_to_acq_start)
                    state_n = acq ;
                else
                    state_n = state_c ;
            end
            acq :begin
                if(acq_to_cov_start)
                    state_n = cov ;
                else
                    state_n = state_c ;
            end
            cov :begin
                if(cov_to_acq_start)
                    state_n = acq ;
                else
                    state_n = state_c ;
            end
            default : state_n = rst ;
        endcase
    end

assign rst_to_acq_start = state_c==rst && (rst_n);
assign acq_to_cov_start = state_c==acq && (end_cnt);
assign cov_to_acq_start = state_c==cov && (rvs);



//计数器cnt:用于记录固定的采集时长和采集到的数据
//---------------------------------------------------------------------
    always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt <= 0;
      end
    else if(add_cnt)begin
      if(end_cnt)
         cnt <= 0;
      else
         cnt <= cnt + 1;
      end      
    end

assign add_cnt = state_c == acq;
assign end_cnt = add_cnt && cnt == t_acq-1;

//计数器cnt1:用于记录要输出的命令。
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

assign add_cnt1 = flag_add;
assign end_cnt1 = add_cnt1 && cnt1 == 32-1;

//加一条件
always  @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        flag_add <= 0;
    end
    else if(rst_to_acq_start || cov_to_acq_start)begin
        flag_add <= 1;
    end
    else if(end_cnt1)begin 
        flag_add <= 0;
    end
end


//cs
always  @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cs <= 1;
    end
    else if(rst_to_acq_start || cov_to_acq_start)begin
        cs <= 0;
    end
    else if(acq_to_cov_start)begin
        cs <= 1;
    end       
end



//按sclk时序接受采集到的数据
always  @(posedge sclk or negedge rst_n)begin
    if(!rst_n)begin
        dout <= 0;
    end
    else if(add_cnt && cnt < 16)begin
        dout[15-cnt] <= miso;
    end
end




//将并行命令转换为spi的串行输出：mosi 先发高位
    always  @(*)begin
        if(flag_add )begin
            mosi <= reah[31-cnt1];
        end
        else begin
            mosi <= 1'b0;
        end
    end




    
endmodule