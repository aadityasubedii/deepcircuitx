  function [ECC_WIDTH-1:0] next_combo (input [ECC_WIDTH-1:0] i);
    integer index;
    integer dump_index;
    reg seen0;
    reg trig1;

    reg [ECC_WIDTH-1:0] ones;
    begin
      seen0 = 1'b0;
      trig1 = 1'b0;
      ones = 0;
      for (index=0; index<ECC_WIDTH; index=index+1)
        begin
          
          
          if (trig1) next_combo[index] = i[index];
          else begin
            next_combo[index] = 1'b0;
            ones = ones + i[index];
            if (i[index] && seen0) begin
              trig1 = 1'b1;
              for (dump_index=index-1; dump_index>=0;dump_index=dump_index-1)
                if (dump_index>=index-ones) next_combo[dump_index] = 1'b1;  
            end               
            seen0 = ~i[index];
          end 
        end            
    end 
  endfunction 