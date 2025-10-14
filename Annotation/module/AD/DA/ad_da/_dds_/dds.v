/*
总周期：4096
*/
module dds (
    //global clock
    input  clk,
    input  rst_n,

    //user interface
    input [31:0] Fword,
    input [11:0] Pword,

    output[ 13:0] data     
);
    reg  [31:0] Fword_f;
    reg  [11:0] Pword_f;
    reg  [31:0] phase_add;

    wire [11:0] rom_addr;
    rom rom_u(
        .clka(clk),
        .addra(rom_addr),
        .douta(data)
    );

    //频率控制字
    always  @(posedge clk)begin
        Fword_f <= Fword;
    end

    //相位控制字
    always  @(posedge clk)begin
        Pword_f <= Pword;
    end

    //相位累加器:调频
    always  @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            phase_add <= 0;
        end
        else begin
            phase_add <= phase_add + Fword_f;
        end
    end

    //相位调制器：调相
    assign rom_addr = phase_add[31:20] + Pword_f;

    
endmodule