IRDA_RECEIVE_Terasic IRDA_RECEIVE_Terasic_inst(
					.iCLK(clk),         
					.iRST_n(reset_n),       
					
					.iIRDA(ir),        
					
				   .oDATA_REAY(data_ready),	  
					.oDATA(writedata)         
					);