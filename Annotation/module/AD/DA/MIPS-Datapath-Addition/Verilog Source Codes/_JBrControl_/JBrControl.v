module jBrControl(outPC, enable, PC4, memOut, reg1, jmpAddr, nis0, nis1, nis2, n, z, v);
input [31:0] memOut, PC4, reg1;
input[25:0] jmpAddr;
input nis0, nis1, nis2, n, z, v;
output [31:0] outPC;
output enable;

reg [31:0] outPC;
reg enable;
wire [2:0] nis_check;

assign nis_check = {nis2, nis1, nis0};

always @ (*)
begin
	case(nis_check)
		3'b000: // no instruction go to next program counter
			begin
			outPC = PC4;
			enable = 0;
			end
		3'b001: // bmv instruction is active
			begin
			outPC = v ? memOut : PC4;
			enable = 1;
			end
		3'b010: // bz instruction is active
			begin
			outPC= z ? jmpAddr : PC4;
			enable = 1;
			end
		3'b100: // jsp instruction is active
			begin
			outPC = memOut;
			enable = 1;
			end
		3'b101: // balrn instruction is active
			begin
			outPC = n ? reg1 : PC4;
			enable = 1;
			end
        	3'b110: // jmadd instruction is active
			begin
			outPC = memOut;
			enable = 1;
			end
		default: outPC = PC4;
	endcase
end
endmodule