always @(posedge reset, posedge clk) begin
	if (reset) begin

	end else begin
	    if ( wb_read_ack || wb_start_write )
		  begin
		  `TB_DEBUG_MESSAGE

		  if ( wb_start_write )
		      $write("Write 0x%08x to   ", i_wb_dat);
		  else
		      $write("Read  0x%08x from ", o_wb_dat);

		  case ( i_wb_adr[15:0] )
		      AMBER_IC_IRQ0_STATUS:
		          $write(" Interrupt Controller module IRQ0 Status");
		      AMBER_IC_IRQ0_RAWSTAT:
		          $write(" Interrupt Controller module IRQ0 Raw Status");
		      AMBER_IC_IRQ0_ENABLESET:
		          $write(" Interrupt Controller module IRQ0 Enable Set");
		      AMBER_IC_IRQ0_ENABLECLR:
		          $write(" Interrupt Controller module IRQ0 Enable Clear");
		      AMBER_IC_FIRQ0_STATUS:
		          $write(" Interrupt Controller module FIRQ0 Status");
		      AMBER_IC_FIRQ0_RAWSTAT:
		          $write(" Interrupt Controller module FIRQ0 Raw Status");
		      AMBER_IC_FIRQ0_ENABLESET:
		          $write(" Interrupt Controller module FIRQ0 Enable set");
		      AMBER_IC_FIRQ0_ENABLECLR:
		          $write(" Interrupt Controller module FIRQ0 Enable Clear");
		      AMBER_IC_INT_SOFTSET_0:
		          $write(" Interrupt Controller module SoftInt 0 Set");
		      AMBER_IC_INT_SOFTCLEAR_0:
		          $write(" Interrupt Controller module SoftInt 0 Clear");
		      AMBER_IC_IRQ1_STATUS:
		          $write(" Interrupt Controller module IRQ1 Status");
		      AMBER_IC_IRQ1_RAWSTAT:
		          $write(" Interrupt Controller module IRQ1 Raw Status");
		      AMBER_IC_IRQ1_ENABLESET:
		          $write(" Interrupt Controller module IRQ1 Enable Set");
		      AMBER_IC_IRQ1_ENABLECLR:
		          $write(" Interrupt Controller module IRQ1 Enable Clear");
		      AMBER_IC_FIRQ1_STATUS:
		          $write(" Interrupt Controller module FIRQ1 Status");
		      AMBER_IC_FIRQ1_RAWSTAT:
		          $write(" Interrupt Controller module FIRQ1 Raw Status");
		      AMBER_IC_FIRQ1_ENABLESET:
		          $write(" Interrupt Controller module FIRQ1 Enable set");
		      AMBER_IC_FIRQ1_ENABLECLR:
		          $write(" Interrupt Controller module FIRQ1 Enable Clear");
		      AMBER_IC_INT_SOFTSET_1:
		          $write(" Interrupt Controller module SoftInt 1 Set");
		      AMBER_IC_INT_SOFTCLEAR_1:
		          $write(" Interrupt Controller module SoftInt 1 Clear");

		      default:
		          begin
		          $write(" unknown Amber IC Register region");
		          $write(", Address 0x%08h\n", i_wb_adr);
		          `TB_ERROR_MESSAGE
		          end
		  endcase

		  $write(", Address 0x%08h\n", i_wb_adr);
		  end
	end
end