  always @(posedge clock)
    if (reset) begin
      count <= 0;
      new <= noisy;
      clean <= noisy;
    end
    else if (noisy != new) begin
      
      new <= noisy;
      count <= 0;
    end
    else if (count == 270000)
      
      clean <= new;
    else
      
      count <= count+1'b1;

endmodule