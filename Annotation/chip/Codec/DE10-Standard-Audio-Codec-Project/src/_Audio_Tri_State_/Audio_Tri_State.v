module Audio_Tri_State(
    inout AUD_SDAT,
    output returned_ack_n,
    input I2C_data_to_send,
    input ACK_cycle
);
    assign returned_ack_n = AUD_SDAT; // only read this during the ACK_cycle 
    assign AUD_SDAT = ACK_cycle ? 1'bZ : I2C_data_to_send;
endmodule