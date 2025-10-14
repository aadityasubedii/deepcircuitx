    
assign data_wdata       = write_hit && c_state == CS_IDLE ? write_hit_wdata : read_miss_wdata;