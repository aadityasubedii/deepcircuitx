assign Enable_Crc = ~StateFCS;

assign Data_Crc[0] = StateData[0]? TxData[3] : StateData[1]? TxData[7] : 1'b0;
assign Data_Crc[1] = StateData[0]? TxData[2] : StateData[1]? TxData[6] : 1'b0;
assign Data_Crc[2] = StateData[0]? TxData[1] : StateData[1]? TxData[5] : 1'b0;
assign Data_Crc[3] = StateData[0]? TxData[0] : StateData[1]? TxData[4] : 1'b0;