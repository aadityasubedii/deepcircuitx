always @ (bl_out)
  if(bl_out >2 && FAMILY == "VIRTEX6") begin
   $display("Error ! Not valid burst length");
   $stop;
   end
  