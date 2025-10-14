  always @ (smallest_right_edge or largest_left_edge)
    center_calc <= {1'b0, smallest_right_edge} + {1'b0,largest_left_edge};  
  