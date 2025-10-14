assign idle_hit         = |data_hit_way;

assign write_hit        = request_hold &&  i_write_enable && idle_hit;