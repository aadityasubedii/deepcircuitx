always @( posedge i_clk ) begin
    if ( !i_core_stall )
	  begin
	  interrupt_d1 <= i_interrupt;
	  
	  
	  if ( interrupt_d1 != 3'd0 && i_interrupt_state )
	      begin
	      $fwrite( decompile_file,"%09d              interrupt ", `U_TB.clk_count );
	      case ( interrupt_d1 )
	          3'd1:    $fwrite( decompile_file,"data abort" );
	          3'd2:    $fwrite( decompile_file,"firq" );
	          3'd3:    $fwrite( decompile_file,"irq" );
	          3'd4:    $fwrite( decompile_file,"address exception" );
	          3'd5:    $fwrite( decompile_file,"instruction abort" );
	          default: $fwrite( decompile_file,"unknown type" );
	      endcase
	      $fwrite( decompile_file,", return addr " );
	      
	      case ( interrupt_d1 )
	          3'd1:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd16)));
	          3'd2:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd17)));
	          3'd3:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd18)));
	          3'd4:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd19)));
	          3'd5:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd19)));
	          3'd7:    $fwrite(decompile_file,"%08h\n",  pcf(get_reg_val(5'd20)));
	          default: ;
	      endcase
	      end
	end
end