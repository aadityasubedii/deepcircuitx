    assign in_data = (src_addr == 0) ? mic_0 : 
                     ((src_addr == 1) ? mic_1 :  
                     ((src_addr == 2) ? mic_2 : 
                     mic_3));