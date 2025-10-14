	always @ (posedge tick)
	begin
				case(state)
					IDLE: if(trigger == 1'b1) state<= LIGHT0;
					LIGHT0: if(tick == 1'b1) state <= LIGHT1;
					LIGHT1: if(tick == 1'b1) state <= LIGHT2;
					LIGHT2: if(tick == 1'b1) state <= LIGHT3;
					LIGHT3: if(tick == 1'b1) state <= LIGHT4;
					LIGHT4: if(tick == 1'b1) state <= LIGHT5;
					LIGHT5: if(tick == 1'b1) state <= LIGHT6;
					LIGHT6: if(tick == 1'b1) state <= LIGHT7;
					LIGHT7: if(tick == 1'b1) state <= LIGHT8;
					LIGHT8: if(tick == 1'b1) state <= LIGHT9;
					LIGHT9: if(time_out == 1'b1) state <= REACTION;
					REACTION: if(count_over == 1'b1) state <= IDLE;
					default: ;
				endcase
	end