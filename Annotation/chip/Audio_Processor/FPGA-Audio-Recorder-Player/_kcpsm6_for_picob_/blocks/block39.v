initial begin
if (scratch_pad_memory_size != 64 && scratch_pad_memory_size != 128 && scratch_pad_memory_size != 256) begin
#1;
$display("\n\nInvalid 'scratch_pad_memory_size'. Please set to 64, 128 or 256.\n\n");
$finish;
end
end