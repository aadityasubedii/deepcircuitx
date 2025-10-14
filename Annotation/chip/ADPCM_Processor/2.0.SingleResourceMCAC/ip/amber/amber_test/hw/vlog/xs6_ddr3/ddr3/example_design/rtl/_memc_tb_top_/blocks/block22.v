generate
   if (C_PORT_ENABLE[0] == 1) begin: port0_status 
      assign cmp_data       = p0_cmp_data[31:0];
      assign cmp_data_valid = p0_cmp_data_valid;
   end
   else if (C_PORT_ENABLE[1] == 1) begin: port1_status   
      assign cmp_data       = p1_cmp_data[31:0];
      assign cmp_data_valid = p1_cmp_data_valid;
   end
   else if (C_PORT_ENABLE[2] == 1) begin: port2_status   
      assign cmp_data       = p2_cmp_data[31:0];
      assign cmp_data_valid = p2_cmp_data_valid;
   end
   else if (C_PORT_ENABLE[3] == 1) begin: port3_status   
      assign cmp_data       = p3_cmp_data[31:0];
      assign cmp_data_valid = p3_cmp_data_valid;
   end
   else if (C_PORT_ENABLE[4] == 1) begin: port4_status   
      assign cmp_data       = p4_cmp_data[31:0];
      assign cmp_data_valid = p4_cmp_data_valid;
   end
   else if (C_PORT_ENABLE[5] == 1) begin: port5_status   
      assign cmp_data       = p5_cmp_data[31:0];
      assign cmp_data_valid = p5_cmp_data_valid;
   end
endgenerate   