assign resolution_valid_nxt = active_sample_count_nxt[0] & total_sample_count_nxt[0] &
                              active_line_count_f0_nxt[0] & total_line_count_f0_nxt[0] &
                              ((active_line_count_f1_nxt[0] & total_line_count_f1_nxt[0]) | ~interlaced) &
                              interlaced_valid;