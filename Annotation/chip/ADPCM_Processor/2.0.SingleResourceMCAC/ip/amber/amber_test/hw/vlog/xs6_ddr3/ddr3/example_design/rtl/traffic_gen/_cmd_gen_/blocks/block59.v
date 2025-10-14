always @ (posedge clk_i)
begin
     run_traffic_r <= #TCQ run_traffic_i;
     if (  run_traffic_i &&   ~run_traffic_r )
          run_traffic_pulse <= #TCQ 1'b1;
     else
          run_traffic_pulse <= #TCQ 1'b0;
end     