module decoder_2x4_tb;
    reg [1:0] A;
    wire [3:0] D;  
    decoder_2x4 UUT(.A(A), .D(D));
    initial begin
        A[1] = 1'b0; A[0] = 1'b0;
        #10 A[1] = 1'b0; A[0] = 1'b0;
        #10 A[1] = 1'b0; A[0] = 1'b1;
        #10 A[1] = 1'b1; A[0] = 1'b0;
        #10 A[1] = 1'b1; A[0] = 1'b1;
        #10 $finish;
    end
endmodule
