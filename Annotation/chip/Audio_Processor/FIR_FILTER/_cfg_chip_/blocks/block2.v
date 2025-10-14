	always @(posedge fsm_c, posedge start) 
		if(start) begin
			mst <= ms_init;
			i2c_d <= 1'bz;
		end else
			case (mst)
				ms_init: begin
					mst <= ms_start;
					data[0] <= 16'h1e00; 
					data[1] <= 16'h0c00; 
					data[2] <= 16'h0a00; 
					data[3] <= 16'h0e53; 
					data[4] <= 16'h0814; 
					data[5] <= 16'h0579; 
					data[6] <= 16'h0117; 
					data[7] <= 16'h1000; 
					data[8] <= 16'h1201; 
					mout <= 0;
				end
				ms_start: 
					if(i2c_c) begin 
						i2c_d <= 0;
						mst <= ms_send;
						bout <= 0;
						wout <= 0;
						error <= 0;
						sout <= {addr, data[mout]};
					end
				ms_send:
					if(!i2c_c) 
						if(bout == 8) begin
							mst <= ms_ack;
							i2c_d <= 1'bz;
						end else begin
							i2c_d <= sout[0]?1'bz:0;
							sout <= sout << 1;
							bout <= bout + 1;
						end
				ms_ack: 
					if(i2c_d == 0) begin  
						mst <= (wout == 2)?ms_stop:ms_send;
						wout <= wout + 1;
						bout <= 0;
					end else begin 
						error <= 1;
						mst <= ms_stop;
					end
				ms_stop:
					if(i2c_c == 0) i2c_d <= 0;
					else begin
						i2c_d <= 1'bz;
						mst <= (error || (mout < mcount-1))?ms_start:ms_done;
						if(!error) mout <= mout + 1;
					end
				ms_done: i2c_d <= 1'bz;
			endcase
