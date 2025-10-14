always @ (*)
begin
if (normal_operation_window)
   gated_pll_lock = pll_lock;
else
   gated_pll_lock = syn_uiclk_pll_lock;
end