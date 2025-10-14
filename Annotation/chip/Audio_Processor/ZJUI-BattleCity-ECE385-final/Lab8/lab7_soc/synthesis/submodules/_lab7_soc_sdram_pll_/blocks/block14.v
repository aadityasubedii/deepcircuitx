(* ALTERA_ATTRIBUTE = {"SUPPRESS_DA_RULE_INTERNAL=C104;SUPPRESS_DA_RULE_INTERNAL=R101"} *)
module  lab7_soc_sdram_pll_altpll_lqa2
	( 
	areset,
	clk,
	inclk,
	locked) ;
	input   areset;
	output   [4:0]  clk;
	input   [1:0]  inclk;
	output   locked;
`ifndef ALTERA_RESERVED_QIS

`endif
	tri0   areset;
	tri0   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS

`endif

	reg	pll_lock_sync;
	wire  [4:0]   wire_pll7_clk;
	wire  wire_pll7_fbout;
	wire  wire_pll7_locked;

	