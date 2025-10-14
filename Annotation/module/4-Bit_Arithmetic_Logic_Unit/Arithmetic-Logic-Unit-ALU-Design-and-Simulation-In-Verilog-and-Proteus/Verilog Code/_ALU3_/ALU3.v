module ALU3(A, B, ALU_Sel, CarryIn, ALU_Result, CarryOut);
    input [3:0] A,B;  // ALU 4-bit Inputs
    input [3:0] ALU_Sel;// ALU Selection
    input CarryIn; 
    output reg CarryOut; // Carry Out Flag
    output reg [3:0] ALU_Result;
    reg [4:0] tmp;
    
    always @(A, B, ALU_Sel, CarryIn)
    begin
	   CarryOut = 0;
       case(ALU_Sel)
        4'b0000: // Addition
           begin
           ALU_Result = A + B ;
           tmp = {1'b0,A} + {1'b0,B};
		   CarryOut = tmp[4]; // Carryout flag 
		   end
        4'b0001: // Subtraction
           begin
           ALU_Result = A - B ;
           tmp = {1'b0,A} - {1'b0,B};
		   CarryOut = tmp[4]; // Carryout flag 
		   end 
        4'b0010: // Addition with carry in
           begin
           ALU_Result = A + B + CarryIn;
           tmp = {1'b0,A} + {1'b0,B} + CarryIn ;
		   CarryOut = tmp[4]; // Carryout flag 
		   end
        4'b0011: // Subtraction with borrow in
           begin
           ALU_Result = A - B - CarryIn;
           tmp = {1'b0,A} - {1'b0,B} - CarryIn ;
		   CarryOut = tmp[4]; // Carryout flag 
		   end  
        4'b0100: //  Logical and 
           ALU_Result = A & B;
        4'b0101: //  Logical or
           ALU_Result = A | B;
        4'b0110: //  Logical xor 
           ALU_Result = A ^ B;
        4'b0111: //  Logical nor
           ALU_Result = ~(A | B);
        4'b1000: // Logical nand 
           ALU_Result = ~(A & B);
        4'b1001: // Logical xnor
           ALU_Result = ~(A ^ B);        
        4'b1010: // Lesser comparison
           ALU_Result = (A<B)?4'd1:4'd0 ;   
        4'b1011: // Greater comparison
           ALU_Result = (A>B)?4'd1:4'd0 ;
        4'b1100: // Equal comparison   
            ALU_Result = (A==B)?4'd1:4'd0 ;
        default: ALU_Result = A + B ; 
        
       endcase
    end

endmodule
