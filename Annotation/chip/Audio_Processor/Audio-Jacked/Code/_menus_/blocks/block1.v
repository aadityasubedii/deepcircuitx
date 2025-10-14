	always @(posedge clk)
	begin
		if (rst)
				glyph[13:8] <= 'd0;
		else
		case (menu)
		
		'd0: begin
				if((hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] <= 'd2 && vcnt[9:4] >= 'd0) ||			
				   (hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] >= 'd15 && vcnt[9:4] <= 'd17))			
					glyph[13:8] <= 'd0;		
				else if (vcnt[9:4] >= 'd3 && vcnt[9:4] <= 'd14 && 
						(hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd2 || hcnt[9:4] >= 'd28 && hcnt[9:4] <= 'd30))	
					glyph[13:8] <= 'd0;		
				else if ((vcnt[9:4] >= 'd3 && vcnt[9:4] <= 'd6 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27) ||	
						(vcnt[9:4] >= 'd8 && vcnt[9:4] <= 'd10 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27) ||  
						(vcnt[9:4] == 'd7 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd7))					
					glyph[13:8] <= 'd1;
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd8)
					glyph[13:8] <= 'd27;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd9)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd10)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd11)
					glyph[13:8] <= 'd30;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd12)
					glyph[13:8] <= 'd30;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd31;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd16)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd17)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd18)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd19)
					glyph[13:8] <= 'd14;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd20)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd21)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] == 'd22)
					glyph[13:8] <= 'd15;								
				else if (vcnt[9:4] == 'd7 && hcnt[9:4] >= 'd23 && hcnt[9:4] <= 'd27)
					glyph[13:8] <= 'd1;								
				else if ((vcnt[9:4] == 'd11 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd14) ||	
						 (vcnt[9:4] == 'd11 && hcnt[9:4] >= 'd16 && hcnt[9:4] <= 'd27))	
					glyph[13:8] <= 'd1;				
				else if (vcnt[9:4] == 'd11 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd38;								
				else if (vcnt[9:4] >= 'd12 && vcnt[9:4] <= 'd14 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27)	
					glyph[13:8] <= 'd1;
				else 
					glyph[13:8] <= 'd0;		
			end
		
		'd1: begin
				if((hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] <= 'd2 && vcnt[9:4] >= 'd0) ||			
				   (hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] >= 'd15 && vcnt[9:4] <= 'd17))			
					glyph[13:8] <= 'd0;		
				else if (vcnt[9:4] >= 'd3 && vcnt[9:4] <= 'd14 && 
						(hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd2 || hcnt[9:4] >= 'd28 && hcnt[9:4] <= 'd30))	
					glyph[13:8] <= 'd0;		
				else if ((vcnt[9:4] >= 'd3 && vcnt[9:4] <= 'd4 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27) ||	
						 (vcnt[9:4] >= 'd13 && vcnt[9:4] <= 'd14 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27) || 	
						 (vcnt[9:4] == 'd5 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd5))						
					glyph[13:8] <= 'd1;
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd6)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd7)
					glyph[13:8] <= 'd16; 								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd8)
					glyph[13:8] <= 'd14;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd9)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd10)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd11)
					glyph[13:8] <= 'd15;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd12)
					glyph[13:8] <= 'd20;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd25;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd18;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd16)
					glyph[13:8] <= 'd14;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd17)	
					glyph[13:8] <= 'd12; 								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd18)
					glyph[13:8] <= 'd25;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd19)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd20)
					glyph[13:8] <= 'd13;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd21)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd22)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd23)
					glyph[13:8] <= 'd12;								
				else if ((vcnt[9:4] == 'd5 && hcnt[9:4] >= 'd24 && hcnt[9:4] <= 'd27) ||	
						 (vcnt[9:4] == 'd6 && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd6))	
					glyph[13:8] <= 'd1;
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd7)
					glyph[13:8] <= 'd24;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd8)
					glyph[13:8] <= 'd12;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd9)
					glyph[13:8] <= 'd35;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd10)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd11)
					glyph[13:8] <= 'd26; 								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd12)
					glyph[13:8] <= 'd17;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd4;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd16)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd17)
					glyph[13:8] <= 'd30;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd18)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd19)
					glyph[13:8] <= 'd14;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd20)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd21)
					glyph[13:8] <= 'd25;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd22)
					glyph[13:8] <= 'd15;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] == 'd23)
					glyph[13:8] <= 'd30;								
				else if ((vcnt[9:4] == 'd6 && hcnt[9:4] >= 'd24 && hcnt[9:4] <= 'd27) ||	
						 ((vcnt[9:4] == 'd7 || vcnt[9:4] == 'd9) && hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd27) || 	
						 (vcnt[9:4] == 'd8 && ((hcnt[9:4] >= 'd3 && hcnt[9:4] <= 'd11) || (hcnt[9:4] >= 'd18 && hcnt[9:4] <= 'd27))) || 
						 ((vcnt[9:4] == 'd10 || vcnt[9:4] == 'd12) && 
						 (hcnt[9:4] == 'd3 || hcnt[9:4] == 'd27)))	
					glyph[13:8] <= 'd1;
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd12)
					glyph[13:8] <= 'd30;								
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd31;								
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd27;								
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd16)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd8 && hcnt[9:4] == 'd17)
					glyph[13:8] <= 'd39;								
				else if ((vcnt[9:4] == 'd10 || vcnt[9:4] == 'd12) && (hcnt[9:4] == 'd4 || hcnt[9:4] == 'd26))
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd10 && hcnt[9:4] >= 'd5 && hcnt[9:4] <= 'd25)
					glyph[13:8] <= 'd43;								
				else if (vcnt[9:4] == 'd12 && hcnt[9:4] >= 'd5 && hcnt[9:4] <= 'd25)
					glyph[13:8] <= 'd44;								
				else if (vcnt[9:4] == 'd11)  
				begin												
					if(i >= 'd0 && i <= 'd19)
						if (hcnt[9:4] >= 'd5 && hcnt[9:4] <= ('d5 + i))
							glyph[13:8] <= 'd41;				
						else if (hcnt[9:4] >= ('d6 + i) && hcnt[9:4] <= 'd25)
							glyph[13:8] <= 'd1;					
						else if (hcnt[9:4] == 'd4)
							glyph[13:8] <= 'd42;				
						else if (hcnt[9:4] == 'd26)
							glyph[13:8] <= 'd45;				
						else if (hcnt[9:4] == 'd3 || hcnt[9:4] == 'd27)
							glyph[13:8] <= 'd1;					
						else if((hcnt[9:4] >= 'd0 && hcnt <= 'd2) || (hcnt[9:4] >= 'd28 && hcnt[9:4] <= 'd30)) 
							glyph[13:8] <= 'd0;					
						else
							glyph[13:8] <= 'd0; 	
					else if (i == 'd20)
						if (hcnt[9:4] >= 'd5 && hcnt[9:4] <= 'd25)
							glyph[13:8] <= 'd41;				
						else if (hcnt[9:4] == 'd4)
							glyph[13:8] <= 'd42;				
						else if (hcnt[9:4] == 'd26)
							glyph[13:8] <= 'd45;				
						else if (hcnt[9:4] == 'd3 || hcnt[9:4] == 'd27)
							glyph[13:8] <= 'd1;					
						else if((hcnt[9:4] >= 'd0 && hcnt <= 'd2) || (hcnt[9:4] >= 'd28 && hcnt[9:4] <= 'd30))
							glyph[13:8] <= 'd0;					
						else
							glyph[13:8] <= 'd0; 	
					else
						glyph[13:8] <= 'd1;		
				end
				else
					glyph[13:8] <= 'd1;			
			end                                              
		                                                     
		'd2: begin
				if((hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] <= 'd1 && vcnt[9:4] >= 'd0) ||			
				   (hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd30 && vcnt[9:4] >= 'd16 && vcnt[9:4] <= 'd17))			
					glyph[13:8] <= 'd0;		
				else if (vcnt[9:4] >= 'd2 && vcnt[9:4] <= 'd15 && 
						((hcnt[9:4] >= 'd0 && hcnt[9:4] <= 'd1) || (hcnt[9:4] >= 'd29 && hcnt[9:4] <= 'd30)))	
					glyph[13:8] <= 'd0;
				else if (vcnt[9:4] == 'd5 && (hcnt[9:4] == 'd3 || (hcnt[9:4] >= 'd15 && hcnt[9:4] <= 'd28)))
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd2 && ((hcnt[9:4] >= 'd2 && hcnt[9:4] <= 'd13) || (hcnt[9:4] >= 'd26 && hcnt[9:4] <= 'd28))) 
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd2 && hcnt[9:4] >= 'd14 && hcnt[9:4] <= 'd25)
					glyph[13:8] <= 'd43;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd4)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd5)
					glyph[13:8] <= 'd27;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd6)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd7)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd8)
					glyph[13:8] <= 'd12;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd9)
					glyph[13:8] <= 'd31;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd10)
					glyph[13:8] <= 'd20;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd11)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd12)
					glyph[13:8] <= 'd25;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd30;								
				else if (vcnt[9:4] == 'd5 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd40;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd13)
					glyph[13:8] <= 'd42;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd14)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd15)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd16)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd17)
					glyph[13:8] <= 'd14;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd18)
					glyph[13:8] <= 'd26;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd19)
					glyph[13:8] <= 'd29;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd20)
					glyph[13:8] <= 'd15;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd21)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd22)
					glyph[13:8] <= 'd25;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd23)
					glyph[13:8] <= 'd16;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd24)
					glyph[13:8] <= 'd34;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd25)
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd3 && hcnt[9:4] == 'd26)
					glyph[13:8] <= 'd45;								
				else if (vcnt[9:4] == 'd4 && ((hcnt[9:4] >= 'd2 && hcnt[9:4] <= 'd13) || (hcnt[9:4] >= 'd26 && hcnt[9:4] <= 'd28)))
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd4 && hcnt[9:4] >= 'd14 && hcnt[9:4] <= 'd25)
					glyph[13:8] <= 'd44;								
				else if (vcnt[9:4] == 'd6 && hcnt[9:4] >= 'd2 && hcnt[9:4] <= 'd28)
					glyph[13:8] <= 'd1;
				else if (vcnt[9:4] == 'd7 && ((hcnt[9:4] >= 'd2 && hcnt[9:4] <= 3) || 
											  (hcnt[9:4] >= 'd8 && hcnt[9:4] <= 9) ||
											  (hcnt[9:4] >= 'd14 && hcnt[9:4] <= 15) ||
											  (hcnt[9:4] >= 'd20 && hcnt[9:4] <= 21) ||
											  (hcnt[9:4] >= 'd26 && hcnt[9:4] <= 'd28)))
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] == 'd7 && ((hcnt[9:4] >= 'd4 && hcnt[9:4] <= 'd7) || 
											   (hcnt[9:4] >= 'd10 && hcnt[9:4] <= 'd13) || 
											   (hcnt[9:4] >= 'd16 && hcnt[9:4] <= 'd19) ||
											   (hcnt[9:4] >= 'd22 && hcnt[9:4] <= 'd25)))
					glyph[13:8] <= 'd43;								
				else if ((vcnt[9:4] >= 'd8 && vcnt[9:4] <= 'd12) && ((hcnt[9:4] == 'd2) ||
																	 (hcnt[9:4] >= 'd27 && hcnt[9:4] <= 'd28) ))
					glyph[13:8] <= 'd1;								
				else if (vcnt[9:4] >= 'd8 && vcnt[9:4] <= 'd12 && (hcnt[9:4] == 'd3 || hcnt[9:4] == 'd9 || hcnt[9:4] == 'd15 || hcnt[9:4] == 'd21)) 
					glyph[13:8] <= 'd42;								
				else if (vcnt[9:4] >= 'd8 && vcnt[9:4] <= 'd12 && (hcnt[9:4] == 'd8 || hcnt[9:4] == 'd14 || hcnt[9:4] == 'd20 || hcnt[9:4] == 'd26))
					glyph[13:8] <= 'd45;								
					
				
				
				
				else if ((vcnt[9:4] == 'd8 || vcnt[9:4] == 'd9 || vcnt[9:4] == 'd11 || vcnt[9:4] == 'd12) && (hcnt[9:4] >= 'd4 && hcnt[9:4] <= 'd7))
							if (filter == 'd1)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1;
				else if ((vcnt[9:4] == 'd8 || vcnt[9:4] == 'd9 || vcnt[9:4] == 'd11 || vcnt[9:4] == 'd12) && (hcnt[9:4] >= 'd10 && hcnt[9:4] <= 'd13))
							if (filter == 'd2)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1;
				else if ((vcnt[9:4] == 'd8 || vcnt[9:4] == 'd9 || vcnt[9:4] == 'd11 || vcnt[9:4] == 'd12) && (hcnt[9:4] >= 'd16 && hcnt[9:4] <= 'd19))
							if (filter == 'd3)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1;
				else if ((vcnt[9:4] == 'd8 || vcnt[9:4] == 'd9 || vcnt[9:4] == 'd11 || vcnt[9:4] == 'd12) && (hcnt[9:4] >= 'd22 && hcnt[9:4] <= 'd25))
							if (filter == 'd4)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1; 			
				
				
				
				
				
				else if (vcnt[9:4] == 'd10 && (hcnt[9:4] == 'd4 || hcnt[9:4] == 'd6 || hcnt[9:4] == 'd7)) 
							if (filter == 'd1)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1;
				else if (vcnt[9:4] == 'd10 && (hcnt[9:4] == 'd10 || hcnt[9:4] == 'd12 || hcnt[9:4] == 'd13)) 
							if (filter == 'd2)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1;
				else if (vcnt[9:4] == 'd10 && (hcnt[9:4] == 'd16 || hcnt[9:4] == 'd18 || hcnt[9:4] == 'd19)) 
							if (filter == 'd3)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1; 
				else if (vcnt[9:4] == 'd10 && (hcnt[9:4] == 'd22 || hcnt[9:4] == 'd24 || hcnt[9:4] == 'd25)) 
							if (filter == 'd4)
								glyph [13:8] <= 'd0;
							else glyph [13:8] <= 'd1; 
				
	
							
				else if (vcnt[9:4] == 'd10 && hcnt[9:4] == 'd5)		
					glyph[13:8] <= 'd3;						
				else if (vcnt[9:4] == 'd10 && hcnt[9:4] == 'd11)
					glyph[13:8] <= 'd4;						
				else if (vcnt[9:4] == 'd10 && hcnt[9:4] == 'd17)
					glyph[13:8] <= 'd5;						
				else if (vcnt[9:4] == 'd10 && hcnt[9:4] == 'd23)
					glyph[13:8] <= 'd6;						
				else if (vcnt[9:4] == 'd13 && ((hcnt[9:4] >= 'd4 && hcnt[9:4] <= 'd7) || 
											   (hcnt[9:4] >= 'd10 && hcnt[9:4] <= 'd13) || 
											   (hcnt[9:4] >= 'd16 && hcnt[9:4] <= 'd19) ||
											   (hcnt[9:4] >= 'd22 && hcnt[9:4] <= 'd25)))
					glyph[13:8] <= 'd44;						
				else if (vcnt[9:4] == 'd13 && ((hcnt[9:4] >= 'd2 && hcnt[9:4] <= 3) || 
											  (hcnt[9:4] >= 'd8 && hcnt[9:4] <= 9) ||
											  (hcnt[9:4] >= 'd14 && hcnt[9:4] <= 15) ||
											  (hcnt[9:4] >= 'd20 && hcnt[9:4] <= 21) ||
											  (hcnt[9:4] >= 'd26 && hcnt[9:4] <= 'd28)))
					glyph[13:8] <= 'd1; 						
				else if (vcnt[9:4] >= 'd14 && vcnt[9:4] <= 'd15 && hcnt[9:4] >= 'd2 && hcnt[9:4] <= 'd28)
					glyph[13:8] <= 'd1;						
				else
					glyph[13:8] <= 'd1; 						
			end                                              
		                                                     
		                                                     
	default:	glyph[13:8] <= 'd0;                              
	endcase                                                  
				                                             
	                                                         
	                                                         
	end                                                      