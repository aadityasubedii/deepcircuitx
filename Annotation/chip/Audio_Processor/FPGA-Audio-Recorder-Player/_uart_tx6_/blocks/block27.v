generate
for (i = 0 ; i <= 7 ; i = i+1)
begin : data_width_loop

(* HBLKNM = "uart_tx6_5" *)
SRL16E #(
	.INIT   (16'h0000))
storage_srl (   
	.D  	(data_in[i]),
        .CE 	(buffer_write),
        .CLK	(clk),
        .A0 	(pointer[0]),
        .A1 	(pointer[1]),
        .A2 	(pointer[2]),
        .A3 	(pointer[3]),
        .Q  	(store_data[i]));

(* HBLKNM = "uart_tx6_5" *)
FD storage_flop(  
	.D	(store_data[i]),
        .Q	(data[i]),
        .C	(clk));

end 
endgenerate