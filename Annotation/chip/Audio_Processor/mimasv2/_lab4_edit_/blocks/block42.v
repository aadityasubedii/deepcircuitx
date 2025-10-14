   always @ (posedge clock) begin
      if (ready) begin
	    
			case (filtnum[3:0])
				4'h0:  to_ac97_data <= from_ac97_data;
				4'h1:  to_ac97_data <= filtered[17:10]; 
				4'h2:  to_ac97_data <= filtered[17:10]; 
				4'h3:  to_ac97_data <= filtered[17:10]; 
				4'h4:  to_ac97_data <= tone[19:12];
				4'h5:  to_ac97_data <= tone_2[19:12];
				4'h6:  to_ac97_data <= delayed[17:10];   
				4'h7:  to_ac97_data <= delayed[17:10];   
				4'h8:  to_ac97_data <= delayed[17:10];   
				4'h9:  to_ac97_data <= mult[15:8];				
				default: to_ac97_data <= from_ac97_data;
			endcase
	 
      end
   end