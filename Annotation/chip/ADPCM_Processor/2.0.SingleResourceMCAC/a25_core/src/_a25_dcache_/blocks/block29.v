        assign data_wenable_way[i] = (source_sel[C_FILL] && select_way[i]) || 
                                     (write_hit && data_hit_way[i] && c_state == CS_IDLE) ||
                                     (consecutive_write && data_hit_way_r[i]);