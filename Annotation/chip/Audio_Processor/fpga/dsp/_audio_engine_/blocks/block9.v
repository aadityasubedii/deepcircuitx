    wire [31:0] control_reg;
    assign control_reg =  { 
        { (32-(FRAME_W+2)){ 1'b0 } }, 
        control_reg_frame, 
        i2s_external, 
        allow_audio_writes 
    };