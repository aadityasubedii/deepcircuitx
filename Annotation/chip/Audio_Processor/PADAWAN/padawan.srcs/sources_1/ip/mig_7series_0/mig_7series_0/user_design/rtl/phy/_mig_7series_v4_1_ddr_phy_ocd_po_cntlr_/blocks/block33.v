  wire signed [8:0] stg2_steps = stg3_r > stg3_init 
                                   ? -9'sd2 * $signed({3'b0, (stg3_r - stg3_init)})
                                   : 9'sd2 * $signed({3'b0, (stg3_init - stg3_r)});