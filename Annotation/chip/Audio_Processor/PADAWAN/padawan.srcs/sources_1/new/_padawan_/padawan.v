`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//            
//__/\\\\\\\\\\\\\_______/\\\\\\\\\_____/\\\\\\\\\\\\________/\\\\\\\\\_____/\\\______________/\\\_____/\\\\\\\\\_____/\\\\\_____/\\\_        
// _\/\\\/////////\\\___/\\\\\\\\\\\\\__\/\\\////////\\\____/\\\\\\\\\\\\\__\/\\\_____________\/\\\___/\\\\\\\\\\\\\__\/\\\\\\___\/\\\_       
//  _\/\\\_______\/\\\__/\\\/////////\\\_\/\\\______\//\\\__/\\\/////////\\\_\/\\\_____________\/\\\__/\\\/////////\\\_\/\\\/\\\__\/\\\_      
//   _\/\\\\\\\\\\\\\/__\/\\\_______\/\\\_\/\\\_______\/\\\_\/\\\_______\/\\\_\//\\\____/\\\____/\\\__\/\\\_______\/\\\_\/\\\//\\\_\/\\\_     
//    _\/\\\/////////____\/\\\\\\\\\\\\\\\_\/\\\_______\/\\\_\/\\\\\\\\\\\\\\\__\//\\\__/\\\\\__/\\\___\/\\\\\\\\\\\\\\\_\/\\\\//\\\\/\\\_    
//     _\/\\\_____________\/\\\/////////\\\_\/\\\_______\/\\\_\/\\\/////////\\\___\//\\\/\\\/\\\/\\\____\/\\\/////////\\\_\/\\\_\//\\\/\\\_   
//     _\/\\\_____________\/\\\_______\/\\\_\/\\\_______/\\\__\/\\\_______\/\\\____\//\\\\\\//\\\\\_____\/\\\_______\/\\\_\/\\\__\//\\\\\\_  
//      _\/\\\_____________\/\\\_______\/\\\_\/\\\\\\\\\\\\/___\/\\\_______\/\\\_____\//\\\__\//\\\______\/\\\_______\/\\\_\/\\\___\//\\\\\_ 
//       _\///______________\///________\///__\////////////_____\///________\///_______\///____\///_______\///________\///__\///_____\/////__
//           
//                            PADAWAN PROJECT: GROUP 18
//             
//                                   MEMBERS:
//            
//                      |      NAMES       |  STUDENT NO.  |
//                      ------------------------------------
//                      |    Liam Clark    |   CLRLIA002   |
//                      |  Andrew Olivier  |   OLVAND008   |
//                      | Keegan Crankshaw |   CRNKEE002   |
//             
///////////////////////////////////////////////////////////////////////////////////

//////////////////////////////// INITIALIZING CODE ////////////////////////////////
module padawan(
    input [15:0] sw,
    input CLK100MHZ,
    input vauxp3,
    input vauxn3,
    output [15:0] LED,
    output AUD_PWM,
    output AUD_SD
);

    wire [10:0] audio_data;
    wire CLK_AUDIO;

////////////////////////////// READ VALUES FROM ADC //////////////////////////////
    assign LED [15:5] = audio_data [10:0]; //Display aux values on ADC
    AnalogXADC xadc(
        .aux_data(audio_data),
        .CLK_AUDIO(CLK_AUDIO),
        .vauxp3(vauxp3),
        .vauxn3(vauxn3),
        .CLK100MHZ(CLK100MHZ)
    );
//////////////////////////////// IMPLEMENT FILTERS ////////////////////////////////

// Switch Masks
    parameter BTN_OVERDRIVE = 0;
    parameter BTN_CHORUS = 1;
    parameter BTN_TREMELO = 2;
// STATES FOR EFFECTS
    parameter START = 4'd0;
    parameter OVERDRIVE = 4'd1;
    parameter CHORUS = 4'd2;
    parameter TREMELO = 4'd3;
    parameter OUTPUT = 4'd4;
// PAST VALUES
    reg [10:0] p1 = 0;
    reg [10:0] p2 = 0;
    reg [10:0] p3 = 0;
    reg [10:0] p4 = 0;
    reg [10:0] p5 = 0;
    reg [10:0] p6 = 0;
    reg [10:0] p7 = 0;
    reg [10:0] p8 = 0;
    reg [10:0] p9 = 0;
    reg [10:0] p10 = 0;
    reg [10:0] p11 = 0;
    reg [10:0] p12 = 0;
    reg [10:0] p13 = 0;
    reg [10:0] p14 = 0;
    reg [10:0] p15 = 0;
    reg [10:0] p16 = 0;
    reg [10:0] p17 = 0;
    reg [10:0] p18 = 0;
    reg [10:0] p19 = 0;
    reg [10:0] p20 = 0;
    reg [10:0] p21 = 0;
    reg [10:0] p22 = 0;
    reg [10:0] p23 = 0;
    reg [10:0] p24 = 0;
    reg [10:0] p25 = 0;
    reg [10:0] p26 = 0;
    reg [10:0] p27 = 0;
    reg [10:0] p28 = 0;
    reg [10:0] p29 = 0;
    reg [10:0] p30 = 0;
    reg [10:0] p31 = 0;
    reg [10:0] p32 = 0;
// OVERDRIVE
    parameter CENTER_VAL = 11'b10000000000;
    reg [9:0] thresh = 9'b011111111;
    reg [5:0] drive_amount = 6'b00000;
// CHORUS

// TREMELO
    reg [14:0] tremelo_count = 0;
    reg [9:0] tremelo_amplitude = 0;
    reg tremelo_decrease = 0;
// OTHER
    reg [3:0] next_state = START;
    reg [10:0] audio_reg;
    reg [10:0] PWM;
    
    always @ (posedge CLK100MHZ)
    begin
        case(next_state)
//===================================== START =====================================
            START: begin
                audio_reg <= audio_data;
                p1 <= audio_reg;
                p2 <= p1;
                p3 <= p2;
                p4 <= p3;
                p5 <= p4;
                p6 <= p5;
                p7 <= p6;
                p8 <= p7;
                p9 <= p8;
                p10 <= p9;
                p11 <= p10;
                p12 <= p11;
                p13 <= p12;
                p14 <= p13;
                p15 <= p14;
                p16 <= p15;
                p17 <= p16;
                p18 <= p17;
                p19 <= p18;
                p20 <= p19;
                p21 <= p20;
                p22 <= p21;
                p23 <= p22;
                p24 <= p23;
                p25 <= p24;
                p26 <= p25;
                p27 <= p26;
                p28 <= p27;
                p29 <= p28;
                p30 <= p29;
                p31 <= p30;
                p32 <= p31;
                next_state <= OVERDRIVE;
            end
//=================================== OVERDRIVE ===================================
            OVERDRIVE: begin
                if (sw[BTN_OVERDRIVE]==1)
                begin
                    if (audio_reg > CENTER_VAL+thresh) audio_reg <= (CENTER_VAL+thresh)+drive_amount;
                    else if(audio_reg < CENTER_VAL-thresh) audio_reg <= (CENTER_VAL-thresh)-drive_amount;
                end
                next_state <= CHORUS;
            end
//==================================== CHORUS =====================================
            CHORUS: begin
                if (sw[BTN_CHORUS]==1)
                begin
                    audio_reg <= (audio_reg+p32)>>1; //Sounds Horrible :'(
                end
                next_state <= TREMELO;
            end
//=================================== TREMELO =====================================
            TREMELO: begin
                if (sw[BTN_TREMELO]==1)
                begin
                tremelo_count <= tremelo_count+1;
                if (tremelo_count == 32768) 
                    begin
                        if (tremelo_decrease == 1)
                            begin
                                tremelo_amplitude = tremelo_amplitude-1;
                                if (tremelo_amplitude == 0) tremelo_decrease = !tremelo_decrease;
                            end
                        else
                            begin
                                tremelo_amplitude = tremelo_amplitude+1;
                                if (tremelo_amplitude == 1024) tremelo_decrease = !tremelo_decrease;
                            end
                 end           
                 audio_reg <= (audio_reg*(1024+tremelo_amplitude)>>10);
                end
                next_state <= OUTPUT;
            end
//==================================== OUTPUT =====================================
            OUTPUT: begin
                PWM <= audio_reg;
                if (CLK_AUDIO == 1'b1) next_state <= START;
            end
//=================================== DEFAULT =====================================
            default: next_state <= START;
//=================================================================================
        endcase
    end


    assign AUD_SD = 1'b1;    
    pwm_module pwm(
        .clk(CLK100MHZ),
        .PWM_in(PWM),
        .PWM_out(AUD_PWM)
    );
    
endmodule