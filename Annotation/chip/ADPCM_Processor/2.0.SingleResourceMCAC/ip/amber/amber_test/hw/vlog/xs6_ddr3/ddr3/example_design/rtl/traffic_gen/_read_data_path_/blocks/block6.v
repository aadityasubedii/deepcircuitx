    for ( i = 0; i < DQ_ERROR_WIDTH; i = i+1) begin: gen_dq_error_map
        assign dq_lane_error[i] = (error_byte_r1[i] | error_byte_r1[i+DQ_ERROR_WIDTH] |
                              error_byte_r1[i+ (NUM_DQ_PINS*2/8)] | 
                              error_byte_r1[i+ (NUM_DQ_PINS*3/8)]);
                              
        assign cumlative_dq_lane_error_c[i] =  cumlative_dq_lane_error_r[i] | dq_lane_error_r1[i];
    end                         