always @( posedge reset, posedge clk ) begin
	if (reset) begin
		tmp_address <= 'd0;
		fchars <= 'd0;
	end else begin
    		
		if ( get_1bit_signal(0) && !get_1bit_signal(3) ) begin
			$fwrite(decompile_file, "%09d              write   addr ", `U_TB.clk_count);
			tmp_address = get_32bit_signal(2);
			fwrite_hex_drop_zeros(decompile_file, {tmp_address [31:2], 2'd0} );
	
			$fwrite(decompile_file, ", data %08h, be %h", 
			    get_32bit_signal(3),    
			    get_4bit_signal (0));   
							   
			$fwrite(decompile_file, "\n");
		end
		
		if ( get_1bit_signal(4) && !get_1bit_signal(1) ) begin
			$fwrite(decompile_file, "%09d              read    addr ", `U_TB.clk_count);
			tmp_address = get_32bit_signal(5);
			fwrite_hex_drop_zeros(decompile_file, {tmp_address[31:2], 2'd0} );    
				   
			$fwrite(decompile_file, ", data %08h to ", get_32bit_signal(4));
			warmreg(get_4bit_signal(1)); 
							  
			$fwrite(decompile_file, "\n");
		end
		
		if ( execute_now ) begin
			
			if ( interrupt_d1 == 3'd0 || interrupt_d1 == 3'd7 ) begin
				$fwrite(decompile_file,"%09d  ", `U_TB.clk_count);

				
				if      ( execute_address < 32'h10)        $fwrite(decompile_file,"       %01x:  ", {execute_address[ 3:1], 1'd0});
				else if ( execute_address < 32'h100)       $fwrite(decompile_file,"      %02x:  ",  {execute_address[ 7:1], 1'd0}); 
				else if ( execute_address < 32'h1000)      $fwrite(decompile_file,"     %03x:  ",   {execute_address[11:1], 1'd0}); 
				else if ( execute_address < 32'h10000)     $fwrite(decompile_file,"    %04x:  ",    {execute_address[15:1], 1'd0});
				else if ( execute_address < 32'h100000)    $fwrite(decompile_file,"   %05x:  ",     {execute_address[19:1], 1'd0});
				else if ( execute_address < 32'h1000000)   $fwrite(decompile_file,"  %06x:  ",      {execute_address[23:1], 1'd0});
				else if ( execute_address < 32'h10000000)  $fwrite(decompile_file," %07x:  ",       {execute_address[27:1], 1'd0});
				else                                       $fwrite(decompile_file,"%8x:  ",         {execute_address[31:1], 1'd0});
				
				
				if (!i_instruction_execute) begin
					$fwrite(decompile_file,"-");
					if ( itype == SWI )
					  $display ("Cycle %09d  SWI not taken *************", `U_TB.clk_count);
					end
				else     
					$fwrite(decompile_file," ");
			    
				
				
				
				case (numchars( xINSTRUCTION_EXECUTE ))
				    4'd1: $fwrite(decompile_file,"%s", xINSTRUCTION_EXECUTE[39:32] );
				    4'd2: $fwrite(decompile_file,"%s", xINSTRUCTION_EXECUTE[39:24] );
				    4'd3: $fwrite(decompile_file,"%s", xINSTRUCTION_EXECUTE[39:16] );
				    4'd4: $fwrite(decompile_file,"%s", xINSTRUCTION_EXECUTE[39: 8] );
				default:  $fwrite(decompile_file,"%s", xINSTRUCTION_EXECUTE[39: 0] );
				endcase

				fchars = 8 - numchars(xINSTRUCTION_EXECUTE);
		  
				
				if (itype   == MTRANS )
				    begin
				    w_mtrans_type;           
				    fchars = fchars - 2;
				    end

				
				if ( ((itype == REGOP && !opcode_compare) || itype == MULT ) && s_bit == 1'b1 )
				    begin
				    $fwrite(decompile_file,"s");
				    fchars = fchars - 1;
				    end

				
				if ( itype == REGOP && opcode_compare && s_bit == 1'b1 && reg_d == 4'd15 )
				    begin
				    $fwrite(decompile_file,"p");
				    fchars = fchars - 1;
				    end

				
				if ( condition != AL )
				    begin
				    wcond;
				    fchars = fchars - 2;
				    end
						    
				
				case ( fchars )
				    4'd0: $fwrite(decompile_file,"");
				    4'd1: $fwrite(decompile_file," ");
				    4'd2: $fwrite(decompile_file,"  ");
				    4'd3: $fwrite(decompile_file,"   ");
				    4'd4: $fwrite(decompile_file,"    ");
				    4'd5: $fwrite(decompile_file,"     ");
				    4'd6: $fwrite(decompile_file,"      ");
				    4'd7: $fwrite(decompile_file,"       ");
				    4'd8: $fwrite(decompile_file,"        ");
				default:  $fwrite(decompile_file,"         ");
				endcase

				
				
				
				case ( itype )
				    REGOP:     regop_args;
				    TRANS:     trans_args;
				    MTRANS:    mtrans_args;
				    BRANCH:    branch_args;
				    MULT:      mult_args;
				    SWAP:      swap_args;
				    CODTRANS:  codtrans_args; 
				    COREGOP:   begin 
						   
						   $write("Coregop not implemented in decompiler yet\n"); 
						   end
				    CORTRANS:  cortrans_args; 
				    SWI:       $fwrite(decompile_file,"#0x%06h", execute_instruction[23:0]);
				    default: begin
						 `TB_ERROR_MESSAGE
						 $write("Unknown Instruction Type ERROR\n");
						 end                     
				endcase

				$fwrite( decompile_file,"\n" );
			end

			
			if ( i_instruction_execute && execute_undefined ) begin
				$fwrite( decompile_file,"%09d              interrupt undefined instruction", `U_TB.clk_count );
				$fwrite( decompile_file,", return addr " );
				$fwrite( decompile_file,"%08x\n",  pcf(get_reg_val(5'd21)-4'd4) );
			end

			
			if ( i_instruction_execute && itype == SWI ) begin
				$fwrite( decompile_file,"%09d              interrupt swi", `U_TB.clk_count );
				$fwrite( decompile_file,", return addr " );
				$fwrite( decompile_file,"%08x\n",  pcf(get_reg_val(5'd21)-4'd4) );
			end
		end
	end
end