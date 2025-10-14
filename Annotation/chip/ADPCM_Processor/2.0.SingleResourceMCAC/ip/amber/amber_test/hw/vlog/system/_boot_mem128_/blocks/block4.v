`ifdef XILINX_FPGA

    xs6_sram_1024x128_byte_en

#(





`ifdef BOOT_MEM128_PARAMS_FILE
    `include `BOOT_MEM128_PARAMS_FILE
`else
    `ifdef BOOT_LOADER_ETHMAC
        `include "boot-loader-ethmac_memparams128.v"
    `else
        
        `include "boot-loader_memparams128.v"
    `endif
`endif

)
`endif 