`endif 
    
    

    assign ack = result_ack | status_ack | dma_dbus_ack | coef_ack | input_ack;
    assign rdt = result_rdt | status_rdt | dma_dbus_rdt;
    assign ready = done;

    

    assign test[0] = sck;
    assign test[1] = ws;
    assign test[2] = sd_in0;
    assign test[3] = sd_in1;
    assign test[4] = ext_sck; 
    assign test[5] = ext_ws; 
    assign test[6] = i2s_external;