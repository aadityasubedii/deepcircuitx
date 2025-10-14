`ifdef XILINX_FPGA
    xs6_sram_4096x32_byte_en
#(





`ifdef BOOT_MEM32_PARAMS_FILE
    `include `BOOT_MEM32_PARAMS_FILE
`else
    `ifdef BOOT_LOADER_ETHMAC
        `include "boot-loader-ethmac_memparams32.v"
    `else
        
        `include "boot-loader_memparams32.v"
    `endif
`endif

)
`endif 