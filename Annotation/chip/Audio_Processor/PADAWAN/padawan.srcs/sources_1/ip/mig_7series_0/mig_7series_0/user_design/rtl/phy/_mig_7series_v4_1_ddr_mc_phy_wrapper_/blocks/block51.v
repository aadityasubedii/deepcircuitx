  function [(2*CK_WIDTH*8)-1:0] generate_ddr_ck_map;
    input [143:0] ck_byte_map;
    integer g;
    begin
      generate_ddr_ck_map = 'b0 ;
      for(g = 0 ; g < CK_WIDTH ; g= g + 1) begin
        generate_ddr_ck_map[(g*2*8)+:8]  = (ck_byte_map[(g*8)+:4] == 4'd0) ? "A" :
                                           (ck_byte_map[(g*8)+:4] == 4'd1) ? "B" :
                                           (ck_byte_map[(g*8)+:4] == 4'd2) ? "C" : "D" ;
        generate_ddr_ck_map[(((g*2)+1)*8)+:8] = (ck_byte_map[((g*8)+4)+:4] == 4'd0) ? "0" :
                                                (ck_byte_map[((g*8)+4)+:4] == 4'd1) ? "1" :  "2" ; 
      end
    end
  endfunction