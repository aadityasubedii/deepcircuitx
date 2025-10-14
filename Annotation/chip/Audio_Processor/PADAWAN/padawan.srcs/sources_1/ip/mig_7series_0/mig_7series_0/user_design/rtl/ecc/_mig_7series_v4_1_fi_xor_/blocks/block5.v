generate
begin
  genvar i;
  for (i = 0; i < DQS_WIDTH; i = i + 1) begin : assign_fi_xor_data