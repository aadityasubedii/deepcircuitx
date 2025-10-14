    assign gain_in_data = (gain_addr == 0) ? in_0 : 
                         ((gain_addr == 1) ? in_1 :  
                         ((gain_addr == 2) ? in_2 : 
                         in_3));