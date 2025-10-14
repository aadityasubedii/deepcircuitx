	DE1_SoC_QSYS u0 (
		.clk_clk                        (<connected-to-clk_clk>),                        //                     clk.clk
		.clk_sdram_clk                  (<connected-to-clk_sdram_clk>),                  //               clk_sdram.clk
		.data_in_export                 (<connected-to-data_in_export>),                 //                 data_in.export
		.data_out_export                (<connected-to-data_out_export>),                //                data_out.export
		.key_external_connection_export (<connected-to-key_external_connection_export>), // key_external_connection.export
		.pll_locked_export              (<connected-to-pll_locked_export>),              //              pll_locked.export
		.reset_reset_n                  (<connected-to-reset_reset_n>),                  //                   reset.reset_n
		.sdram_wire_addr                (<connected-to-sdram_wire_addr>),                //              sdram_wire.addr
		.sdram_wire_ba                  (<connected-to-sdram_wire_ba>),                  //                        .ba
		.sdram_wire_cas_n               (<connected-to-sdram_wire_cas_n>),               //                        .cas_n
		.sdram_wire_cke                 (<connected-to-sdram_wire_cke>),                 //                        .cke
		.sdram_wire_cs_n                (<connected-to-sdram_wire_cs_n>),                //                        .cs_n
		.sdram_wire_dq                  (<connected-to-sdram_wire_dq>),                  //                        .dq
		.sdram_wire_dqm                 (<connected-to-sdram_wire_dqm>),                 //                        .dqm
		.sdram_wire_ras_n               (<connected-to-sdram_wire_ras_n>),               //                        .ras_n
		.sdram_wire_we_n                (<connected-to-sdram_wire_we_n>),                //                        .we_n
		.sync_in_export                 (<connected-to-sync_in_export>),                 //                 sync_in.export
		.play_btn_in_export             (<connected-to-play_btn_in_export>),             //             play_btn_in.export
		.record_btn_in_export           (<connected-to-record_btn_in_export>)            //           record_btn_in.export
	);

