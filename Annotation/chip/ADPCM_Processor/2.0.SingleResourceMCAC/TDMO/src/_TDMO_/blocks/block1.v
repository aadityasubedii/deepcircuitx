always@ (posedge sys_clk, posedge reset) begin

	if (reset) begin
		data_reg[0]  <= 8'h00; data_reg[1]  <= 8'h00; data_reg[2]  <= 8'h00; data_reg[3]  <= 8'h00;	
		data_reg[4]  <= 8'h00; data_reg[5]  <= 8'h00; data_reg[6]  <= 8'h00; data_reg[7]  <= 8'h00;
		data_reg[8]  <= 8'h00; data_reg[9]  <= 8'h00; data_reg[10] <= 8'h00; data_reg[11] <= 8'h00;
		data_reg[12] <= 8'h00; data_reg[13] <= 8'h00; data_reg[14] <= 8'h00; data_reg[15] <= 8'h00;
		data_reg[16] <= 8'h00; data_reg[17] <= 8'h00; data_reg[18] <= 8'h00; data_reg[19] <= 8'h00;
		data_reg[20] <= 8'h00; data_reg[21] <= 8'h00; data_reg[22] <= 8'h00; data_reg[23] <= 8'h00;
		data_reg[24] <= 8'h00; data_reg[25] <= 8'h00; data_reg[26] <= 8'h00; data_reg[27] <= 8'h00;
		data_reg[28] <= 8'h00; data_reg[29] <= 8'h00; data_reg[30] <= 8'h00; data_reg[31] <= 8'h00;
		data_buf_1 <= 8'h00;	
		data_buf_2 <= 8'h00;
		data_out_buf <= 8'h00;
		ch0_reg_1 <= 8'h00;
		ch0_reg_2 <= 8'h00;
		o_wb_dat <= 32'h00000000;
		start_read <= 1'b0;
	end else begin
		data_out_buf <= data_buf_2;		

		data_buf_2[0] <= data_buf_1[7];	
		data_buf_2[1] <= data_buf_1[6];
		data_buf_2[3] <= data_buf_1[5];
		data_buf_2[2] <= data_buf_1[4];
		data_buf_2[6] <= data_buf_1[3];
		data_buf_2[7] <= data_buf_1[2];
		data_buf_2[5] <= data_buf_1[1];
		data_buf_2[4] <= data_buf_1[0];

		data_buf_1 <= data_reg[next_ch];	

		ch0_reg_2[0] <= ch0_reg_1[7];		
		ch0_reg_2[1] <= ch0_reg_1[6];
		ch0_reg_2[3] <= ch0_reg_1[5];
		ch0_reg_2[2] <= ch0_reg_1[4];
		ch0_reg_2[6] <= ch0_reg_1[3];
		ch0_reg_2[7] <= ch0_reg_1[2];
		ch0_reg_2[5] <= ch0_reg_1[1];
		ch0_reg_2[4] <= ch0_reg_1[0];

		ch0_reg_1 <= data_reg[0];		

		if (i_wb_stb & i_wb_cyc & i_wb_we) begin	
			case (i_wb_adr[15:0])			
				TDMO_CH0:	data_reg[0]  <= i_wb_dat[7:0];
				TDMO_CH1:	data_reg[1]  <= i_wb_dat[7:0];
				TDMO_CH2:	data_reg[2]  <= i_wb_dat[7:0];
				TDMO_CH3:	data_reg[3]  <= i_wb_dat[7:0];
				TDMO_CH4:	data_reg[4]  <= i_wb_dat[7:0];
				TDMO_CH5:	data_reg[5]  <= i_wb_dat[7:0];
				TDMO_CH6:	data_reg[6]  <= i_wb_dat[7:0];
				TDMO_CH7:	data_reg[7]  <= i_wb_dat[7:0];
				TDMO_CH8:	data_reg[8]  <= i_wb_dat[7:0];
				TDMO_CH9:	data_reg[9]  <= i_wb_dat[7:0];
				TDMO_CH10:	data_reg[10] <= i_wb_dat[7:0];
				TDMO_CH11:	data_reg[11] <= i_wb_dat[7:0];
				TDMO_CH12:	data_reg[12] <= i_wb_dat[7:0];
				TDMO_CH13:	data_reg[13] <= i_wb_dat[7:0];
				TDMO_CH14:	data_reg[14] <= i_wb_dat[7:0];
				TDMO_CH15:	data_reg[15] <= i_wb_dat[7:0];
				TDMO_CH16:	data_reg[16] <= i_wb_dat[7:0];
				TDMO_CH17:	data_reg[17] <= i_wb_dat[7:0];
				TDMO_CH18:	data_reg[18] <= i_wb_dat[7:0];
				TDMO_CH19:	data_reg[19] <= i_wb_dat[7:0];
				TDMO_CH20:	data_reg[20] <= i_wb_dat[7:0];
				TDMO_CH21:	data_reg[21] <= i_wb_dat[7:0];
				TDMO_CH22:	data_reg[22] <= i_wb_dat[7:0];
				TDMO_CH23:	data_reg[23] <= i_wb_dat[7:0];
				TDMO_CH24:	data_reg[24] <= i_wb_dat[7:0];
				TDMO_CH25:	data_reg[25] <= i_wb_dat[7:0];
				TDMO_CH26:	data_reg[26] <= i_wb_dat[7:0];
				TDMO_CH27:	data_reg[27] <= i_wb_dat[7:0];
				TDMO_CH28:	data_reg[28] <= i_wb_dat[7:0];
				TDMO_CH29:	data_reg[29] <= i_wb_dat[7:0];
				TDMO_CH30:	data_reg[30] <= i_wb_dat[7:0];
				TDMO_CH31:	data_reg[31] <= i_wb_dat[7:0];
				default:	data_reg[0]  <= i_wb_dat[7:0];
			endcase
		end else if (i_wb_stb & i_wb_cyc & (~i_wb_we)) begin 
			start_read <= 1'b1;
			case (i_wb_adr[15:0])
				TDMO_CH0:	o_wb_dat[7:0] <= data_reg[0];
				TDMO_CH1:	o_wb_dat[7:0] <= data_reg[1];
				TDMO_CH2:	o_wb_dat[7:0] <= data_reg[2];
				TDMO_CH3:	o_wb_dat[7:0] <= data_reg[3];
				TDMO_CH4:	o_wb_dat[7:0] <= data_reg[4];
				TDMO_CH5:	o_wb_dat[7:0] <= data_reg[5];
				TDMO_CH6:	o_wb_dat[7:0] <= data_reg[6];
				TDMO_CH7:	o_wb_dat[7:0] <= data_reg[7];
				TDMO_CH8:	o_wb_dat[7:0] <= data_reg[8];
				TDMO_CH9:	o_wb_dat[7:0] <= data_reg[9];
				TDMO_CH10:	o_wb_dat[7:0] <= data_reg[10];
				TDMO_CH11:	o_wb_dat[7:0] <= data_reg[11];
				TDMO_CH12:	o_wb_dat[7:0] <= data_reg[12];
				TDMO_CH13:	o_wb_dat[7:0] <= data_reg[13];
				TDMO_CH14:	o_wb_dat[7:0] <= data_reg[14];
				TDMO_CH15:	o_wb_dat[7:0] <= data_reg[15];
				TDMO_CH16:	o_wb_dat[7:0] <= data_reg[16];
				TDMO_CH17:	o_wb_dat[7:0] <= data_reg[17];
				TDMO_CH18:	o_wb_dat[7:0] <= data_reg[18];
				TDMO_CH19:	o_wb_dat[7:0] <= data_reg[19];
				TDMO_CH20:	o_wb_dat[7:0] <= data_reg[20];
				TDMO_CH21:	o_wb_dat[7:0] <= data_reg[21];
				TDMO_CH22:	o_wb_dat[7:0] <= data_reg[22];
				TDMO_CH23:	o_wb_dat[7:0] <= data_reg[23];
				TDMO_CH24:	o_wb_dat[7:0] <= data_reg[24];
				TDMO_CH25:	o_wb_dat[7:0] <= data_reg[25];
				TDMO_CH26:	o_wb_dat[7:0] <= data_reg[26];
				TDMO_CH27:	o_wb_dat[7:0] <= data_reg[27];
				TDMO_CH28:	o_wb_dat[7:0] <= data_reg[28];
				TDMO_CH29:	o_wb_dat[7:0] <= data_reg[29];
				TDMO_CH30:	o_wb_dat[7:0] <= data_reg[30];
				TDMO_CH31:	o_wb_dat[7:0] <= data_reg[31];
				default:	o_wb_dat[7:0] <= data_reg[0];
			endcase
		end else begin
			start_read <= 1'b0;
		end
	end
end