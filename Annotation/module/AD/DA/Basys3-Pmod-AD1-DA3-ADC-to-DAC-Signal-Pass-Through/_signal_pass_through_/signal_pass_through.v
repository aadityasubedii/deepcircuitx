//This verilog module is designed for the basys 3 board with AD! and DA3 Pmods
//An analog signal is input to the AD1 ADC and recreated on the output of the DA3 DAC

`timescale 1ns / 1ps


module signal_pass_through(
    input clock,
    input reset,
    input get_data,
    input data_bit,
    output reg cs1,
    output sclk1,
    output sclk2,
    output  LED0,
    output  LED1,
    output  LED2,
    output  LED3,
    output  LED4,
    output  LED5,
    output  LED6,
    output  LED7,
    output  LED8,
    output  LED9,
    output  LED10,
    output  LED11,
    output  LED12,
    output  LED13,
    output  LED14,
    output  LED15,
    output reg cs0,
    output reg ldac,
    output reg din


    );
    
    sclk1 sclk_inst (
        .clock(clock),
        .reset(reset),
        .sclk1(sclk1)    
    ); 
    
    sclk1 sclk_inst2 (
        .clock(clock),
        .reset(reset),
        .sclk1(sclk2)    
    ); 
    

    //adc registers
    reg[15:0] data_reg;
    reg[15:0] count;
    reg[15:0] load_reg;
    reg[3:0] i;
    reg load;
    reg send;
    reg adc_ok;
    
    //dac registers
    reg[15:0] dac_reg;
    reg[15:0] data [3:0];
    reg[15:0] count1;
    reg [1:0] sel;
    reg[15:0] sw;
    reg[15:0] clear_dac;
    reg sent;
    
    
    initial begin
    //initialize adc registers
    load_reg = 16'b0000000000000000;
    data_reg = 16'b0000000000000000;
    count = 16'd19;
    load = 0;
    cs1 = 1; 
    i = 4'd0; 
    
    //initialize dac registers
    dac_reg = 16'b0000000000000000;
    count1 = 16'd18;
    din = 0;
    cs0 = 1;  
    sel = 0;
    clear_dac = 16'b0000000000000000;
    end
    
    assign LED0 = data_reg[0];
    assign LED1 = data_reg[1];
    assign LED2 = data_reg[2];
    assign LED3 = data_reg[3];
    assign LED4 = data_reg[4];
    assign LED5 = data_reg[5];
    assign LED6 = data_reg[6];
    assign LED7 = data_reg[7];
    assign LED8 = data_reg[8];
    assign LED9 = data_reg[9];
    assign LED10 = data_reg[10];
    assign LED11 = data_reg[11];
    assign LED12 = data_reg[12];
    assign LED13 = data_reg[13];
    assign LED14 = data_reg[14];
    assign LED15 = data_reg[15];
    
    always @ (*)begin
        dac_reg = load_reg;
    end
    
    always @ (negedge sclk1)begin
        if (get_data == 1 ) begin // adc gets analog voltage and saves 16bit value to load_reg
            if (count > 3) begin
                cs1 = 0;
                load = 0;
            end 
            if (count > 3) begin
                data_reg[count - 4] = data_bit;
            end
            if (count == 3)begin
                    cs1 = 1;
            end 
            
            if (count == 0)begin

                    load_reg = data_reg*(16'd18);//scale up 12bit adc reading (data_reg) for 16bit dac
                    load = 1;
                    data_reg = 16'b0000000000000000;
                    count = 16'd19;  
                end 
            count = count - 1; 
        end     
    end
    
    always @ (posedge sclk2)begin //dac takes load_reg and outputs analog voltage
            
        if (get_data == 1)begin //SW0 is ON

            
            if ( count1 > 0)begin
                cs0 = 0;
                ldac = 1; 
            end
            if (count1 == 2)begin
                cs0 = 1;
            end
                   
               
            if (count1 > 2) begin
                din = dac_reg[count1-3];
            end
            if (count1 <= 2) begin
                din = 16'd0;
            end           
            if (count1 == 1)begin
                ldac = 0;
                cs0 = 1;
            end
            if (count1 == 0)begin
                cs0 = 0;
                ldac = 1;
                count1 = 16'd18;
                sent = 1;  
            end 
            count1 = count1 - 1;
        end
        
        if (get_data == 0)begin // SW0 is OFF
            if ( count1 > 0)begin
                cs0 = 0;
                ldac = 1; 
            end
            if (count1 == 2)begin
                cs0 = 1;
            end
            if (count1 == 1)begin
                ldac = 0;
                cs0 = 1;
            end
            if (count1 == 0)begin
                cs0 = 0;
                ldac = 1;
                count1 = 16'd18;  
            end        
               
            if (count1 > 2) begin
                din = clear_dac[count1-3];
            end
            if (count1 <= 2) begin
                din = 16'd0;
            end           
            
            count1 = count1 - 1;
        end
    end
     
endmodule
