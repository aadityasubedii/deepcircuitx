module alu_controller (
	input compute_enable,
	input Clear,
	input Sclk,
	input sleep_flag,
	
	input [15:0] rj_data_L, coeff_data_L, xin_data_L,
	input [15:0] rj_data_R, coeff_data_R, xin_data_R,
	
	output [39:0] add_inp_L, add_inp_R,
	
	output reg [3:0] rj_addr_L,
	output reg [8:0] coeff_addr_L,
	output reg [7:0] xin_addr_L,
	
	output reg [3:0] rj_addr_R,
	output reg [8:0] coeff_addr_R,
	output reg [7:0] xin_addr_R,
	
	output reg rj_en_L, coeff_en_L, xin_en_L,
	output reg rj_en_R, coeff_en_R, xin_en_R,
	
	output reg add_sub_L, adder_en_L, shift_enable_L, load_L, clear_L, p2s_enable_L,
	output reg add_sub_R, adder_en_R, shift_enable_R, load_R, clear_R, p2s_enable_R
	);
	
	parameter initial_state = 2'b00, comp_state = 2'b01, sleep_state = 2'b10;
	
	reg [1:0] pr_state_L, next_state_L;
	reg [1:0] pr_state_R, next_state_R;
	
	reg [7:0] nL;
	reg [7:0] nL_R;
	reg enable_adder,enable_shifter;
	reg [7:0] k_L, k_R;
	
	reg xmem_overflow_L, start_comp_L, compute_status_L, out_done_L;
	reg xmem_overflow_R, start_comp_R, compute_status_R, out_done_R;
	
	//extending the data input to 40-bit including the sign
	assign add_inp_L = (xin_data_L[15]) ? {8'hFF, xin_data_L, 16'h0000} : {8'h00, xin_data_L, 16'h0000};
	assign add_inp_R = (xin_data_R[15]) ? {8'hFF, xin_data_R, 16'h0000} : {8'h00, xin_data_R, 16'h0000};
	
		
	always @(Clear, next_state_L)
	begin
		if (Clear == 1'b1)
			pr_state_L <= initial_state;
		else
			pr_state_L <= next_state_L;
	end
	
	always @(posedge Sclk)
	begin
		//next_state_L <= initial_state;
		case (pr_state_L)
			initial_state:
				begin
					xmem_overflow_L <= 1'b0;
					//out_done_L = 1'b0;
					if (Clear == 1'b1) //Clear signal from the main controller
						next_state_L <= initial_state;
					else if (compute_enable == 1'b1)//First computation after the reset
					begin
						next_state_L <= comp_state;
						nL <= 8'd0;//data sample index value
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
					end
					else
					begin
						next_state_L <= initial_state;
						nL <= nL;
						start_comp_L <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)//For each new computation
					begin
						nL <= nL + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (nL == 8'hFF)//if the data index reaches the last value
							xmem_overflow_L <= 1'b1;
						else
							xmem_overflow_L <= xmem_overflow_L;
					end
					else
					begin //continue the present computation
						start_comp_L <= 1'b0;
						xmem_overflow_L <= xmem_overflow_L;
						if (rj_addr_L == 4'hF && coeff_addr_L == 9'h1FF && k_L == rj_data_L) // end of the computation
							compute_status_L <= 1'b0;
						else
							compute_status_L <= compute_status_L; //if not ended, retain the computation status
					end
					
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (sleep_flag == 1'b1) //sleep flag received from the main controller
						next_state_L <= sleep_state;
					else
						next_state_L <= comp_state;
				end
			
			sleep_state:
				begin
					nL <= nL;
					xmem_overflow_L <= xmem_overflow_L;
					start_comp_L <= 1'b0;//stop computing in sleep status
					compute_status_L <= 1'b0;
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (sleep_flag == 1'b0)//awaken from sleep status
					begin
						nL <= nL + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (nL == 8'hFF)
							xmem_overflow_L <= 1'b1;
						else
							xmem_overflow_L <= xmem_overflow_L;
						next_state_L <= comp_state;
					end
					else
						next_state_L <= sleep_state;
				end
				
			default:	next_state_L <= initial_state;
		endcase
	end
	
	always @(posedge Sclk)
	begin
		if (out_done_L)
		begin
			p2s_enable_L = 1'b1;
			rj_addr_L = 4'd0;
			coeff_addr_L = 9'd0;
			k_L = 8'd0;
			out_done_L = 1'b0;
			clear_L = 1'b1;
		end
		else
			p2s_enable_L = 1'b0;
		if(xin_en_L)
		begin 
		  adder_en_L = 1'b1;
		  load_L = 1'b1; 
		end
		else 
		begin 
		  adder_en_L = 1'b0;
		  load_L = 1'b0; 
		end
		if(enable_shifter) shift_enable_L=1'b1;
		else shift_enable_L =1'b0;
		if (start_comp_L == 1'b1) //New computation starts here
		begin
			out_done_L = 1'b0;
			rj_addr_L = 4'd0;
			rj_en_L = 1'b1;
			coeff_addr_L = 9'd0;
			coeff_en_L = 1'b1;
			xin_en_L = 1'b0;
			xin_addr_L=1'b0;
			enable_adder=1'b0;
			//adder_en_L = 1'b0;
			enable_shifter = 1'b0;
			k_L = 8'd0;
			clear_L = 1'b1;
			//load_L = 1'b0;
		end
		else if (compute_status_L == 1'b1)//Continue the present computation
		begin
			if (k_L == rj_data_L)
			begin
				xin_en_L = 1'b1;
				enable_shifter = 1'b1;
				clear_L = 1'b0;
				enable_adder=1'b1;
				//load_L = 1'b1;
				//adder_en_L = 1'b1;
				k_L = 8'd0;
				if (rj_addr_L < 4'd15)
				begin
					rj_addr_L = rj_addr_L + 1'b1;
				end
				else
				begin
					rj_addr_L = 4'd0;
					out_done_L = 1'b1;
					coeff_addr_L = 9'd0;
				end
			end
			else
			begin //The actual computation happening here
				enable_shifter = 1'b0;
				clear_L = 1'b0;
				//load_L = 1'b0;
				xin_en_L = 1'b0;
				add_sub_L = coeff_data_L[8];
				
				if (nL >= coeff_data_L[7:0])
				begin
					xin_addr_L = nL - coeff_data_L[7:0];
					xin_en_L = 1'b1;
					enable_adder=1'b1;
					//adder_en_L = 1'b1;
					//load_L = 1'b1;
				end
				else if (nL < coeff_data_L[7:0] && xmem_overflow_L == 1'b1)
				begin
					xin_addr_L = nL + (9'd256 - coeff_data_L[7:0]);
					xin_en_L = 1'b1;
					enable_adder=1'b1;
					//adder_en_L = 1'b1;
					//load_L = 1'b1;
				end
				else
				begin
					xin_addr_L = xin_addr_L;
					enable_adder=1'b0;
					//adder_en_L = 1'b0;
				end

				if (coeff_addr_L < 9'h1FF)
					coeff_addr_L = coeff_addr_L + 1'b1;
				else
					coeff_addr_L = coeff_addr_L;
				
				k_L = k_L + 1'b1;
			end
		end
		else //no compute happening
		begin
			rj_addr_L = 4'd0;
			rj_en_L = 1'b0;
			coeff_addr_L = 9'd0;
			coeff_en_L = 1'b0;
			xin_en_L = 1'b0;
			enable_adder = 1'b0;
			//adder_en_L = 1'b0;
			enable_shifter = 1'b0;
			k_L = 8'd0;
			//load_L = 1'b0;
			clear_L = 1'b1;
		end
	end
	
	/*always @ (negedge p2s_enable_L)
	begin
			$display("%d : %X \n",nL,shifted_L);
	end*/
	
	
	// Right side FSM
	
	always @(Clear, next_state_R)
	begin
		if (Clear == 1'b1)
			pr_state_R <= initial_state;
		else
			pr_state_R <= next_state_R;
	end
	
	always @(posedge Sclk)
	begin
		//next_state_R <= initial_state;
		case (pr_state_R)
			initial_state:
				begin
					xmem_overflow_R <= 1'b0;
					//out_done_R = 1'b0;
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (compute_enable == 1'b1)
					begin
						next_state_R <= comp_state;
						nL_R <= 8'd0;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
					end
					else
					begin
						next_state_R <= initial_state;
						nL_R <= nL_R;
						start_comp_R <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)
					begin
						nL_R <= nL_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (nL_R == 8'hFF)
							xmem_overflow_R <= 1'b1;
						else
							xmem_overflow_R <= xmem_overflow_R;
					end
					else
					begin
						start_comp_R <= 1'b0;
						xmem_overflow_R <= xmem_overflow_R;
						if (rj_addr_R == 4'hF && coeff_addr_R == 9'h1FF && k_R == rj_data_R)
							compute_status_R <= 1'b0;
						else
							compute_status_R <= compute_status_R;
					end
					
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (sleep_flag == 1'b1)
						next_state_R <= sleep_state;
					else
						next_state_R <= comp_state;
				end
			
			sleep_state:
				begin
					nL_R <= nL_R;
					xmem_overflow_R <= xmem_overflow_R;
					start_comp_R <= 1'b0;
					compute_status_R <= 1'b0;
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (sleep_flag == 1'b0)
					begin
						nL_R <= nL_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (nL_R == 8'hFF)
							xmem_overflow_R <= 1'b1;
						else
							xmem_overflow_R <= xmem_overflow_R;
						next_state_R <= comp_state;
					end
					else
						next_state_R <= sleep_state;
				end
				
			default:   next_state_R <= initial_state;
		endcase
	end
	
	always @(posedge Sclk)
	begin
		if (out_done_R)
		begin
			p2s_enable_R = 1'b1;
			rj_addr_R = 4'd0;
			coeff_addr_R = 9'd0;
			k_R = 8'd0;
			out_done_R = 1'b0;
			clear_R = 1'b1;
		end
		else
			p2s_enable_R = 1'b0;
		
		
		if(enable_adder)
		begin
		  adder_en_R = 1'b1;
		  load_R = 1'b1; 
		end		
		else 
		begin 
		  adder_en_R = 1'b0;
		  load_R = 1'b0; 
		end		
		if(enable_shifter) shift_enable_R=1'b1;
		else shift_enable_R =1'b0;
		
		if (start_comp_R == 1'b1)
		begin
			out_done_R = 1'b0;
			rj_addr_R = 4'd0;
			rj_en_R = 1'b1;
			coeff_addr_R = 9'd0;
			coeff_en_R = 1'b1;
			xin_en_R = 1'b0;
			xin_addr_R=1'b0;
			enable_adder=1'b0;
			//adder_en_R = 1'b0;
			//shift_enable_R = 1'b0;
			enable_shifter = 1'b0;
			k_R = 8'd0;
			clear_R = 1'b1;
			//load_R = 1'b0;
		end
		else if (compute_status_R == 1'b1)
		begin
			if (k_R == rj_data_R)
			begin
				xin_en_R = 1'b0;
				shift_enable_R = 1'b1;
				clear_R = 1'b0;
				enable_adder=1'b1;
				//load_R = 1'b1;
				//adder_en_R = 1'b1;
				k_R = 8'd0;
				if (rj_addr_R < 5'd15)
				begin
					rj_addr_R = rj_addr_R + 1'b1;
				end
				else
				begin
					rj_addr_R = 4'd0;
					out_done_R = 1'b1;
					coeff_addr_R = 9'd0;
				end
			end
			else
			begin
				enable_shifter = 1'b0;
				//shift_enable_R = 1'b0;
				clear_R = 1'b0;
				//load_R = 1'b0;
				xin_en_R = 1'b0;
				add_sub_R = coeff_data_R[8];
				if (nL_R >= coeff_data_R[7:0] )
				begin
					xin_addr_R = nL_R - coeff_data_R[7:0];
					xin_en_R = 1'b1;
					enable_adder=1'b1;
					//adder_en_R = 1'b1;
					//load_R = 1'b1;
				end
				else if (nL_R < coeff_data_R[7:0] && xmem_overflow_R == 1'b1)
				begin
					xin_addr_R = nL_R + (9'd256 - coeff_data_R[7:0]);
					xin_en_R = 1'b1;
					enable_adder=1'b1;
					//adder_en_R = 1'b1;
					//load_R = 1'b1;
				end
				else
				begin
					xin_addr_R = xin_addr_R;
					enable_adder=1'b0;
					//adder_en_R = 1'b0;
				end
				
				if (coeff_addr_R < 9'h1FF)
					coeff_addr_R = coeff_addr_R + 1'b1;
				else
					coeff_addr_R = coeff_addr_R;
				
				k_R = k_R + 1'b1;
			end
		end
		else
		begin
			rj_addr_R = 4'd0;
			rj_en_R = 1'b0;
			coeff_addr_R = 9'd0;
			coeff_en_R = 1'b0;
			xin_en_R = 1'b0;
			enable_adder = 1'b0;
			//adder_en_R = 1'b0;
			enable_shifter = 1'b0;
			//shift_enable_R = 1'b0;
			k_R = 8'd0;
			//load_R = 1'b0;
			clear_R = 1'b1;
		end
	end
endmodule