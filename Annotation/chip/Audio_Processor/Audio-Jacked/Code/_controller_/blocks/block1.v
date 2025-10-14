always @(*)
      begin
			
			mem_en <= 0;
			alusrcb <= 0;
			jump <=	1; branch <= 0; jump_reg <= 1;
			alu_shift_slct <= 1;
			memwrite <= 0;
			regwrite <= 0;
			reg_dst <= 0;
			inst_write <= 0;
			pc_enable <=0;
			memtoreg  <=0;
			data_update <= 0;
			mem_select_ctrl <= 2'b0;
			flag_update <= 0;
			cond_ctrl <= 0;
			decode_state <= 0;
			io_rd <= 0;
			case(state)
				`INSTUP:	begin	
									mem_en <= 1;	 end
				`FETCH: 	begin	mem_en <= 1;
									inst_write <= 1; 		end
				`DECODE: 	begin	decode_state <= 1;
									mem_select_ctrl <= 2'b11;
									if(op != `SPECIAL)  begin
									$display("op = %d", op);
									flag_update <= 1;
									end
									else if ((ext != `Jcond) && (ext != `Scond) && (ext != `JAL)) begin
									$display("ext = %d", ext);
									flag_update <= 1; end	end		
				`IMMEX: 	begin	alusrcb <= 1;
									flag_update <= 1;
									data_update <= 1;
									regwrite <= 1; end			
				`IMMWR:		begin	
									pc_enable <= 1;  		end
				`STYPEDECODE:begin	mem_select_ctrl <= 2'b01;	 	end  
				`BTYPEEX:	begin	pc_enable <= 1;
							if (code_met)
							begin	branch <= 1;
									pc_enable <= 1;
									mem_en <= 1;			end end
				`BTYPEWR:	begin	mem_en <= 1;
									pc_enable <= 1;			end
				`LIORD:		begin	mem_en <= 1;
									mem_select_ctrl <= 2'b10;
									memtoreg <= 2'b01;
									data_update <= 1;
									regwrite <= 1; 
									
									end
				`LIOWR:		begin	
									pc_enable <= 1;
									mem_en <= 1;			end	
				`SI:		begin	mem_en <= 1;
									memwrite <= 1;
									pc_enable <= 1;
									mem_select_ctrl <= 2'b10;
									io_rd <= 1; end
				`LBRD:		begin	mem_en <= 1;
									mem_select_ctrl <= 2'b01;
									data_update <= 1;
									regwrite <= 1; 
									
									
									end
				`LBWR:		begin	
									memtoreg <= 2'b01;
									pc_enable <= 1;
									data_update <= 1;
									
									mem_en <= 1;			end							
				`SBWR:		begin	mem_en <= 1;
									memwrite <= 1;
									mem_select_ctrl <= 2'b01;
									io_rd <= 1;	end
				`SBSTL:		begin	pc_enable <= 1;
									mem_en <= 1;			end
				`CHECKCOND:begin	cond_ctrl <= 1;
									if(~code_met)
										pc_enable <= 1;		end
				`JEX:		begin	jump_reg <= 0;
									pc_enable <= 1;			end			
				`JALEX1:	begin	memtoreg <= 2'b10;
									regwrite <= 1;
									reg_dst <= 1;			end
				`JALEX2:	begin	jump <= 0;
									pc_enable <= 1;			end
				`JIMMEX:	begin	jump <= 0;
									pc_enable <= 1;			end
				`JIMMEX2:	begin	mem_en <= 1;
									pc_enable <= 1;
												end
				`RTYPEEX:	begin	data_update <= 1;
									flag_update <= 1;
									regwrite <= 1;  end
				`RTYPEWR:	begin	
									pc_enable <= 1; 		end
				`SHIFTEX:	begin	data_update <= 1;
									alu_shift_slct <= 0;
									regwrite <= 1;  end
				`SHIFTWR:	begin	
									pc_enable <= 1;	 		end
				`SWRITE:	begin	memtoreg <= 2'b11;
									regwrite <= 1;
									pc_enable <= 1;			end
				`WRSTALL:	begin	mem_en <= 1;
									memwrite <= 1;
									mem_select_ctrl <= 2'b01;
									io_rd <= 1;			end
				`RDSTALL:	begin	memtoreg <= 2'b01; 
									regwrite <= 1; 
									mem_en <= 1;
									mem_select_ctrl <= 2'b01;
									data_update <= 1;
									io_rd <= 1;		end
				
         endcase
      end