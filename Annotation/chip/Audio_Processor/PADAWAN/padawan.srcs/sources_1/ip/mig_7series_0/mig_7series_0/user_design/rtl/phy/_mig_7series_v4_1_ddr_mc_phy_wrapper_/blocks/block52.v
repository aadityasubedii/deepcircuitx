  function [71:0] generate_bytelanes_ddr_ck;
    input [143:0] ck_byte_map;
    integer v ;
    begin
      generate_bytelanes_ddr_ck = 'b0 ;
      for (v = 0; v < CK_WIDTH; v = v + 1) begin
        if ((CK_BYTE_MAP[((v*8)+4)+:4]) == 2)
          generate_bytelanes_ddr_ck[48+(4*v)+1*(CK_BYTE_MAP[(v*8)+:4])] = 1'b1;
        else if ((CK_BYTE_MAP[((v*8)+4)+:4]) == 1)
          generate_bytelanes_ddr_ck[24+(4*v)+1*(CK_BYTE_MAP[(v*8)+:4])] = 1'b1;
        else
          generate_bytelanes_ddr_ck[4*v+1*(CK_BYTE_MAP[(v*8)+:4])] = 1'b1;
      end
    end
  endfunction