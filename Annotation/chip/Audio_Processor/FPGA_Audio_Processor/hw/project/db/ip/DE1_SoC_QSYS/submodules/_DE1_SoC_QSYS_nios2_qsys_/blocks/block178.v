  assign E_mem_byte_en = ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b00})? 4'b0001 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b01})? 4'b0010 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b10})? 4'b0100 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b00, 2'b11})? 4'b1000 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b00})? 4'b0011 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b01})? 4'b0011 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b10})? 4'b1100 :
    ({D_iw_memsz, E_mem_baddr[1 : 0]} == {2'b01, 2'b11})? 4'b1100 :
    4'b1111;